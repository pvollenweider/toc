package org.jahia.modules;

import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.Node;
import javax.jcr.PropertyIterator;

/**
 * Created by pol on 13/09/16.
 */
public class TocFilter extends AbstractFilter {
    private static final Logger logger = LoggerFactory.getLogger(TocFilter.class);
    @Override
    public String execute(String previousOut, RenderContext renderContext, Resource resource, RenderChain chain) throws Exception {
        final JCRNodeWrapper node = resource.getNode();
        final PropertyIterator references = node.getWeakReferences("j:bindedComponent");
        while (references.hasNext()) {
            final Node summary = references.nextProperty().getParent();
            if (summary.isNodeType("jnt:toc")) {
                logger.debug("Add toc div for " + summary.getPath());
                return String.format("<div id=\"toc_%s\">%s</div>", summary.getIdentifier(), previousOut);
            }
        }
        return super.execute(previousOut, renderContext, resource, chain);
    }
}
