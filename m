Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B67CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC72214E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIrGajLR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC72214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOXiMyYuzD56A7PcmY6d3ozdTPIQGl6Rm/DV+nPt6PM=; b=pIrGajLRIKTwhW
	1Bu7LhRn3ea9uNcTpjT8Yq5btRKvy/AtVebOpyytX+uMMyialY80I+MhMc+ifO3k+Uw/t3nMCYoku
	3UrTtUPYDvRPnSQ6Ro1M+2WLiO92BQBlafFHdvmOq7NM12syrYO4yExCiiCfZkgIIbTZSMwaiR1Zt
	GlaeVv0VQDZvLW+MCUPbRsh4LejFKjFm+rqLH8RahiR9wZ/OhY+/yi8BbwzCeg/PKqKVK55qBVVEp
	SpQ4a8d1+JM8S7662SoBNKxFINsXmdna9tPQMog3eSvNEz2In8jdaXp24dXAUUoyi89de3U/RdKq8
	LInhdOmlK6vJuRb6cGNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP81Z-000388-Su; Mon, 28 Oct 2019 16:37:45 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xG-0006uT-QA; Mon, 28 Oct 2019 16:33:20 +0000
Received: by mail-ot1-f65.google.com with SMTP id r14so2410211otn.5;
 Mon, 28 Oct 2019 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nW63jMBvuV1jC5LkGgClq/3WYdWidZxNV+2Nh/Z21ew=;
 b=gldLjJLPYciNDCr5Dzx99nuKVcl09LppImYAOrdp5Orur/u2X9GKZHajsxdrjewbko
 zqzZZS1MlX29vKPny8pivW38vni089L0m/Vtigw0SZ0ulbhqUx1QEXR+z6Fw/4cuxzOV
 KvsRryjlGDW/oJdKPn3sa3C6LRw8sT6eNvd6n3aJJUiO5y9VweDY+HSbPI7sYTh6msZo
 9+0wxRu5MmV/MjwBPchBjMiEVDjWFg/+5OwM1qX4WfnyVdpcyfnX8BMM1jkXtKkJZIpZ
 3m+X4GInUrq9zK48FBho6OHelMFpfd/9X4JfzsWIcR4aKszcF2Adpn2F/f2AJKzuU7ea
 SSNg==
X-Gm-Message-State: APjAAAU3j9m0aEBDJ9mB9hzrl8zHmhq/zhPmpRzW+UZA+/C5+n43ghKK
 iNkDsTSjF1NK0/xgsAhffA==
X-Google-Smtp-Source: APXvYqxhr3QGGC8pHRguZ0KGcav4CFccx7LcyeEsqrM8IAog45S1MROIl6X64sUTv9Rs+FE/3FigSg==
X-Received: by 2002:a05:6830:1695:: with SMTP id
 k21mr11501497otr.339.1572280396672; 
 Mon, 28 Oct 2019 09:33:16 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:16 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 08/25] PCI: mediatek: Use pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:39 -0500
Message-Id: <20191028163256.8004-9-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093319_170450_706DBC62 
X-CRM114-Status: GOOD (  14.33  )
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

Convert Mediatek host bridge to use the common
pci_parse_request_of_pci_ranges().

Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Use resource_list_get_entry_of_type
---
 drivers/pci/controller/pcie-mediatek.c | 43 ++++++++------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 626a7c352dfd..d9206a3cd56b 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -216,7 +216,6 @@ struct mtk_pcie {
 	void __iomem *base;
 	struct clk *free_ck;
 
-	struct resource mem;
 	struct list_head ports;
 	const struct mtk_pcie_soc *soc;
 	unsigned int busnr;
@@ -661,11 +660,19 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 {
 	struct mtk_pcie *pcie = port->pcie;
-	struct resource *mem = &pcie->mem;
+	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	struct resource *mem = NULL;
+	struct resource_entry *entry;
 	const struct mtk_pcie_soc *soc = port->pcie->soc;
 	u32 val;
 	int err;
 
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (entry)
+		mem = entry->res;
+	if (!mem)
+		return -EINVAL;
+
 	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
 	if (pcie->base) {
 		val = readl(pcie->base + PCIE_SYS_CFG_V2);
@@ -1023,39 +1030,15 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
 	struct mtk_pcie_port *port, *tmp;
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
 	struct list_head *windows = &host->windows;
-	struct resource_entry *win, *tmp_win;
-	resource_size_t io_base;
+	struct resource *bus;
 	int err;
 
-	err = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
-						    windows, &io_base);
+	err = pci_parse_request_of_pci_ranges(dev, windows,
+					      &bus);
 	if (err)
 		return err;
 
-	err = devm_request_pci_bus_resources(dev, windows);
-	if (err < 0)
-		return err;
-
-	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry_safe(win, tmp_win, windows) {
-		switch (resource_type(win->res)) {
-		case IORESOURCE_IO:
-			err = devm_pci_remap_iospace(dev, win->res, io_base);
-			if (err) {
-				dev_warn(dev, "error %d: failed to map resource %pR\n",
-					 err, win->res);
-				resource_list_destroy_entry(win);
-			}
-			break;
-		case IORESOURCE_MEM:
-			memcpy(&pcie->mem, win->res, sizeof(*win->res));
-			pcie->mem.name = "non-prefetchable";
-			break;
-		case IORESOURCE_BUS:
-			pcie->busnr = win->res->start;
-			break;
-		}
-	}
+	pcie->busnr = bus->start;
 
 	for_each_available_child_of_node(node, child) {
 		int slot;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
