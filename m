Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8297DCA9EC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593F5214E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AktDNmwT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593F5214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Und5rW520u4bmoC3T6rHinY3/CaRe/cJIBBXIF+GUs=; b=AktDNmwTuxp0hH
	ANX/8Crp5WRvyc5kIEa5EX+qYvH6iB52hNBbuq3cdDE2cMMqrcrQe4i7kiRppW4nOz1exyT5LvNbp
	nhB9qQXo6boVDS427YGQjk0CNTyImnVrBcYwLYn0FIDIV/kPQBemUzqanOHGFEysr5AptY55JxueY
	NC/UoxGgdRxRezaYiKzHAOLOiqc9E7E+OU6tRAqgyiI3kpSzTLnGzAmINAIwi/wMLlyLHbHIrmF7D
	MyoGAaqRbDnLxnLTkse14AdTspQSvWwCkw5GDuJegIm/qmCh2WAeuZnob8zpApbWT+BQWnru9KmLg
	a+SAVimBHBQwYeuSBG2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP86j-0000wO-MS; Mon, 28 Oct 2019 16:43:05 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xo-0007TC-QN; Mon, 28 Oct 2019 16:33:57 +0000
Received: by mail-oi1-f195.google.com with SMTP id s71so6392323oih.11;
 Mon, 28 Oct 2019 09:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dn1tmxzjQTI9PAUk6uuXXt7CY5FAAIGihQa/Sw5ORA=;
 b=MhK2r8tOXhSxW4hN0oVJiE1FTt7NG2Fti/S8vlOplv2O64FgrS1htmk9Q+nsU50n0F
 rzuERABP6jePgR9p2YomRp6VofLbNETMHTk7bvsVXY2QleYCaYG4u1u9TnTyFeQIYBTu
 10A6c02C6RFGPG1gcvqDwp66aH/SPrrSiwHu2L1NYC/XzgOkeuH0F6njO3/ztjYEeSXH
 +tKRiB7Asm53kpu/oNfPbcFxdytggBWifz3VTCRrktrC5rVUMUHzoBcZr0bl98msiFT0
 WjjvdmM87lIZYOrecMEqKaTrJEpm7o0QaCd/pMkdGjWogl/RVJUtmf85jicv1y/XztXB
 lLAw==
X-Gm-Message-State: APjAAAUEwl+W/fKdvtaHpTR93lFEoVHv5FDGoqGtKLof2TQFKryIwmGS
 j8iugRrFXpEYwcofB7BI9g==
X-Google-Smtp-Source: APXvYqy2aOv/BWjh/fOFyROYXfZgl0g1EuXwphc9ldC9o3rRodxdVklAkX2S/p8TYhXvkJEGpP50Kg==
X-Received: by 2002:aca:fdc3:: with SMTP id b186mr156065oii.92.1572280431823; 
 Mon, 28 Oct 2019 09:33:51 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 21/25] PCI: v3-semi: Use inbound resources for setup
Date: Mon, 28 Oct 2019 11:32:52 -0500
Message-Id: <20191028163256.8004-22-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093354_641090_24D705F6 
X-CRM114-Status: GOOD (  15.38  )
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

Now that the helpers provide the inbound resources in the host bridge
'dma_ranges' resource list, convert the v3-semi host bridge to use
the resource list to setup the inbound addresses.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-v3-semi.c | 38 ++++++++++++----------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index 2209c7671115..bd05221f5a22 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -598,28 +598,30 @@ static int v3_pci_setup_resource(struct v3_pci *v3,
 }
 
 static int v3_get_dma_range_config(struct v3_pci *v3,
-				   struct of_pci_range *range,
+				   struct resource_entry *entry,
 				   u32 *pci_base, u32 *pci_map)
 {
 	struct device *dev = v3->dev;
-	u64 cpu_end = range->cpu_addr + range->size - 1;
-	u64 pci_end = range->pci_addr + range->size - 1;
+	u64 cpu_addr = entry->res->start;
+	u64 cpu_end = entry->res->end;
+	u64 pci_end = cpu_end - entry->offset;
+	u64 pci_addr = entry->res->start - entry->offset;
 	u32 val;
 
-	if (range->pci_addr & ~V3_PCI_BASE_M_ADR_BASE) {
+	if (pci_addr & ~V3_PCI_BASE_M_ADR_BASE) {
 		dev_err(dev, "illegal range, only PCI bits 31..20 allowed\n");
 		return -EINVAL;
 	}
-	val = ((u32)range->pci_addr) & V3_PCI_BASE_M_ADR_BASE;
+	val = ((u32)pci_addr) & V3_PCI_BASE_M_ADR_BASE;
 	*pci_base = val;
 
-	if (range->cpu_addr & ~V3_PCI_MAP_M_MAP_ADR) {
+	if (cpu_addr & ~V3_PCI_MAP_M_MAP_ADR) {
 		dev_err(dev, "illegal range, only CPU bits 31..20 allowed\n");
 		return -EINVAL;
 	}
-	val = ((u32)range->cpu_addr) & V3_PCI_MAP_M_MAP_ADR;
+	val = ((u32)cpu_addr) & V3_PCI_MAP_M_MAP_ADR;
 
-	switch (range->size) {
+	switch (resource_size(entry->res)) {
 	case SZ_1M:
 		val |= V3_LB_BASE_ADR_SIZE_1MB;
 		break;
@@ -667,8 +669,8 @@ static int v3_get_dma_range_config(struct v3_pci *v3,
 	dev_dbg(dev,
 		"DMA MEM CPU: 0x%016llx -> 0x%016llx => "
 		"PCI: 0x%016llx -> 0x%016llx base %08x map %08x\n",
-		range->cpu_addr, cpu_end,
-		range->pci_addr, pci_end,
+		cpu_addr, cpu_end,
+		pci_addr, pci_end,
 		*pci_base, *pci_map);
 
 	return 0;
@@ -677,24 +679,16 @@ static int v3_get_dma_range_config(struct v3_pci *v3,
 static int v3_pci_parse_map_dma_ranges(struct v3_pci *v3,
 				       struct device_node *np)
 {
-	struct of_pci_range range;
-	struct of_pci_range_parser parser;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(v3);
 	struct device *dev = v3->dev;
+	struct resource_entry *entry;
 	int i = 0;
 
-	if (of_pci_dma_range_parser_init(&parser, np)) {
-		dev_err(dev, "missing dma-ranges property\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Get the dma-ranges from the device tree
-	 */
-	for_each_of_pci_range(&parser, &range) {
+	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
 		int ret;
 		u32 pci_base, pci_map;
 
-		ret = v3_get_dma_range_config(v3, &range, &pci_base, &pci_map);
+		ret = v3_get_dma_range_config(v3, entry, &pci_base, &pci_map);
 		if (ret)
 			return ret;
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
