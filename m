From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] PCI: mediatek: Add controller support for MT2712 and
 MT7622
Date: Fri, 25 Aug 2017 15:27:43 +0300
Message-ID: <20170825113431.q7lpvmljar43xzpg@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello Ryder Lee,

The patch 6a48aa410571: "PCI: mediatek: Add controller support for
MT2712 and MT7622" from Aug 10, 2017, leads to the following static
checker warning:

	drivers/pci/host/pcie-mediatek.c:453 mtk_pcie_init_irq_domain()
	warn: passing zero to 'PTR_ERR'

	drivers/pci/host/pcie-mediatek.c:460 mtk_pcie_init_irq_domain()
	warn: passing zero to 'PTR_ERR'

drivers/pci/host/pcie-mediatek.c
   443  static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
   444                                      struct device_node *node)
   445  {
   446          struct device *dev = port->pcie->dev;
   447          struct device_node *pcie_intc_node;
   448  
   449          /* Setup INTx */
   450          pcie_intc_node = of_get_next_child(node, NULL);
   451          if (!pcie_intc_node) {
   452                  dev_err(dev, "no PCIe Intc node found\n");
   453                  return PTR_ERR(pcie_intc_node);
                               ^^^^^^^^^^^^^^^^^^^^^^^
This is a complicated way of returning 0, but I'm not sure what we
should actually be returning here.

   454          }
   455  
   456          port->irq_domain = irq_domain_add_linear(pcie_intc_node, INTX_NUM,
   457                                                   &intx_domain_ops, port);
   458          if (!port->irq_domain) {
   459                  dev_err(dev, "failed to get INTx IRQ domain\n");
   460                  return PTR_ERR(port->irq_domain);
                               ^^^^^^^^^^^^^^^^^^^^^^^^
Also zero.

   461          }
   462  
   463          return 0;
   464  }

regards,
dan carpenter
