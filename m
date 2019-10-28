Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C054CCA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D5A20717
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZofR9mF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91D5A20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaNtdG9ed5f1RptqAopfdEOgdjvFO5YJhRoCVC66HxU=; b=ZofR9mF449HRwe
	n9fcikD04OfAWXzWC8DjO3983TcWlaYPPsan1NAjU7mY6YjxVADSphUmUdgZ+sXImijltNSFbdlxd
	SOWJt12lO10pGHtCa76D8qN8xW89GfR+vG/wiDCdhvngh4rEgoKlTWKebxMxJPk8HlnrtPd7x/DmQ
	rlmNTUKJLzJkHhTYAxdjTarsr5EUvrxf11Dl/UVBjjBRlo8tdg6ckpsN9DE3vi3Y6Lf/i+QvM4503
	geSSNElUQtxYn0g0+JHpyizgUzXtd4nHHvZ1VblbHVBMm5IUmu8sOYOZX3QecS9f1MSAPIXtl6Jsy
	+ZQG4+K3ZQVKYr4Mv0QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP835-0004hb-B2; Mon, 28 Oct 2019 16:39:19 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xW-000774-NT; Mon, 28 Oct 2019 16:33:36 +0000
Received: by mail-ot1-f65.google.com with SMTP id t8so1058103otl.6;
 Mon, 28 Oct 2019 09:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CisDLS5VrA+U+bZNmYu5E2eTsV9z7wFBG7PuQ0y9mkk=;
 b=AcxSkJKCyfqjHXY+lf8zAUrU2vXzmo0i2SW6L8v3bgvtmHxFeQuGjA9ZycPVwmI2mB
 Cf0kna+L+4QqmNsoE3eYEGRR182tjWk0ov5wtp+jSMixs4nirmNVsyxDL7r0pR753Uqh
 tA8CSBUTFA4NsKlMPwgdLRC3RGgfIEsOcslSTZcE+2KXP9wEzbhGVuMY+PFGrkGvYiuy
 nx39X8EiANlGglaVJT35N2X1aJPTc7cctjvAQHiVckxtyac8qTQSqR3tdksL/vVD/ZYl
 bISo2rUpxeXIJ0/idsH+xpJYjncviRJrEsAqTGHO/ijPWcIvChdF25k/zF775eg5kGpn
 p+eA==
X-Gm-Message-State: APjAAAVNq13qu0OJK4/hNh128T8BIs3PnTZM50KSWLLaCG2xEGJxP0jO
 RybpLGFI3VS343g1uwuTHA==
X-Google-Smtp-Source: APXvYqwper22ZlXJg5DpAImWRJ7XDe4KFfYVSvi7Voqzg2ZZ1EXILmDbsGSK9WJ1OuRTtjJ3T24mQQ==
X-Received: by 2002:a9d:6c57:: with SMTP id g23mr463092otq.149.1572280413138; 
 Mon, 28 Oct 2019 09:33:33 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 13/25] PCI: xgene: Use pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:44 -0500
Message-Id: <20191028163256.8004-14-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093334_909438_0DCADD41 
X-CRM114-Status: GOOD (  15.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the xgene host bridge to use the common
pci_parse_request_of_pci_ranges().

There's no need to assign the resources to a temporary list first. Just
use bridge->windows directly and remove all the temporary list handling.

Cc: Toan Le <toan@os.amperecomputing.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-xgene.c | 39 +++++++++---------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index ffda3e8b4742..7d0f0395a479 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -405,15 +405,13 @@ static void xgene_pcie_setup_cfg_reg(struct xgene_pcie_port *port)
 	xgene_pcie_writel(port, CFGCTL, EN_REG);
 }
 
-static int xgene_pcie_map_ranges(struct xgene_pcie_port *port,
-				 struct list_head *res,
-				 resource_size_t io_base)
+static int xgene_pcie_map_ranges(struct xgene_pcie_port *port)
 {
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(port);
 	struct resource_entry *window;
 	struct device *dev = port->dev;
-	int ret;
 
-	resource_list_for_each_entry(window, res) {
+	resource_list_for_each_entry(window, &bridge->windows) {
 		struct resource *res = window->res;
 		u64 restype = resource_type(res);
 
@@ -421,11 +419,9 @@ static int xgene_pcie_map_ranges(struct xgene_pcie_port *port,
 
 		switch (restype) {
 		case IORESOURCE_IO:
-			xgene_pcie_setup_ob_reg(port, res, OMR3BARL, io_base,
+			xgene_pcie_setup_ob_reg(port, res, OMR3BARL,
+						pci_pio_to_address(res->start),
 						res->start - window->offset);
-			ret = devm_pci_remap_iospace(dev, res, io_base);
-			if (ret < 0)
-				return ret;
 			break;
 		case IORESOURCE_MEM:
 			if (res->flags & IORESOURCE_PREFETCH)
@@ -567,8 +563,7 @@ static void xgene_pcie_clear_config(struct xgene_pcie_port *port)
 		xgene_pcie_writel(port, i, 0);
 }
 
-static int xgene_pcie_setup(struct xgene_pcie_port *port, struct list_head *res,
-			    resource_size_t io_base)
+static int xgene_pcie_setup(struct xgene_pcie_port *port)
 {
 	struct device *dev = port->dev;
 	u32 val, lanes = 0, speed = 0;
@@ -580,7 +575,7 @@ static int xgene_pcie_setup(struct xgene_pcie_port *port, struct list_head *res,
 	val = (XGENE_PCIE_DEVICEID << 16) | XGENE_PCIE_VENDORID;
 	xgene_pcie_writel(port, BRIDGE_CFG_0, val);
 
-	ret = xgene_pcie_map_ranges(port, res, io_base);
+	ret = xgene_pcie_map_ranges(port);
 	if (ret)
 		return ret;
 
@@ -607,11 +602,9 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
 	struct xgene_pcie_port *port;
-	resource_size_t iobase = 0;
 	struct pci_bus *bus, *child;
 	struct pci_host_bridge *bridge;
 	int ret;
-	LIST_HEAD(res);
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*port));
 	if (!bridge)
@@ -634,20 +627,14 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &res,
-						    &iobase);
+	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
 	if (ret)
 		return ret;
 
-	ret = devm_request_pci_bus_resources(dev, &res);
-	if (ret)
-		goto error;
-
-	ret = xgene_pcie_setup(port, &res, iobase);
+	ret = xgene_pcie_setup(port);
 	if (ret)
-		goto error;
+		return ret;
 
-	list_splice_init(&res, &bridge->windows);
 	bridge->dev.parent = dev;
 	bridge->sysdata = port;
 	bridge->busnr = 0;
@@ -657,7 +644,7 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	ret = pci_scan_root_bus_bridge(bridge);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	bus = bridge->bus;
 
@@ -666,10 +653,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 		pcie_bus_configure_settings(child);
 	pci_bus_add_devices(bus);
 	return 0;
-
-error:
-	pci_free_resource_list(&res);
-	return ret;
 }
 
 static const struct of_device_id xgene_pcie_match_table[] = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
