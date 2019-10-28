Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D45CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1601120717
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IC0AiiUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1601120717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFhGnRKVOCQZ0CWc2i2O6k3FISc8Y10wAqNr5CAaSgQ=; b=IC0AiiUUZa2Xsi
	nKafCzkMujnpv8nn+O6wbCQyYkjgpaJNBA5nE9DGEaoAqRBn6IJeSX7w/67ixaZG1cCAVU+mYb3Xe
	hq4xAa+PhG2o3mZPSGK61SYzCQvT5W0D3LphgwcENfGwl7HLIZb8zfBxkKz95MY5LpOxCR3kAeZJB
	wCrdyf16TRHKlJ1vK1S/ZD1PC2lZdbGLkeyvJ+vE1Dq43+fFDARWXYwOo/6Gd6qSnV+3w5yOfgXZq
	u81QgI6OWuyOpMVbRbXVbFScNjOZpPIu11FBpcITFzvDoseSiDSOvEMurba2dFxGMjtoIgy2ITmy1
	67LlLjnM1ySuYzZxsFvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP870-0001E5-62; Mon, 28 Oct 2019 16:43:22 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xt-0007WU-Al; Mon, 28 Oct 2019 16:33:59 +0000
Received: by mail-ot1-f66.google.com with SMTP id z6so7189906otb.2;
 Mon, 28 Oct 2019 09:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUL+m3NhP58NWVgq+Qieb9x0OfdgTK/3u8ZTlPRNpf8=;
 b=I8lOeih1D99492LRTu2IsP8K+T6/gWCmeYehp1eJX9ofMdLsjySEwCZDwVHJTW4KPx
 2suXf6d4XaGArsbOmiI5m4d17assofYxONGx5r+3ElUS6yUkXIiZ4QNnLeAIDM4aj3hq
 PTuzsNuNCD9qNViGtjO3pX8yZqpTbSx6UtBUQijWqYovZChVkBX8OVjUNc3o4iL4bLLY
 P3MzSA3/LY1N0G7RplUzgfLQd+TKBBHPsQn5Ynn63mnvMXybFJrYcx+CwCi63BmWlEp4
 2W00mDSpOOGp279KyjZf1ErBFe89aVZueT7bcJ9RPmmT8Vh7IT9s7UWNt2mrMMAZD9Up
 4nrg==
X-Gm-Message-State: APjAAAWPvRNQKaCJB8Y7cQ5n0NJWtOIVofGpXkP92KCQecQayb2kQqm8
 Fc3Cr57m4rkyzQgx8Z21vg==
X-Google-Smtp-Source: APXvYqyPxtg2swpf530JxdQcsdiawBZNYu+uT+14bkBsB8TaDWNTfBY9ewk7vPf38ETbIHCmQW7g2w==
X-Received: by 2002:a9d:1c9c:: with SMTP id l28mr8888143ota.10.1572280435975; 
 Mon, 28 Oct 2019 09:33:55 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:55 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 23/25] PCI: iproc: Use inbound resources for setup
Date: Mon, 28 Oct 2019 11:32:54 -0500
Message-Id: <20191028163256.8004-24-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093357_434435_93EB7A33 
X-CRM114-Status: GOOD (  16.01  )
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
'dma_ranges' resource list, convert Broadcom iProc host bridge to use
the resource list to setup the inbound addresses.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix iproc_pcie_paxb_v2_msi_steer() to use resource_entry
---
 drivers/pci/controller/pcie-iproc.c | 77 +++++++----------------------
 1 file changed, 17 insertions(+), 60 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 223335ee791a..f4d78e66846e 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1122,15 +1122,16 @@ static int iproc_pcie_ib_write(struct iproc_pcie *pcie, int region_idx,
 }
 
 static int iproc_pcie_setup_ib(struct iproc_pcie *pcie,
-			       struct of_pci_range *range,
+			       struct resource_entry *entry,
 			       enum iproc_pcie_ib_map_type type)
 {
 	struct device *dev = pcie->dev;
 	struct iproc_pcie_ib *ib = &pcie->ib;
 	int ret;
 	unsigned int region_idx, size_idx;
-	u64 axi_addr = range->cpu_addr, pci_addr = range->pci_addr;
-	resource_size_t size = range->size;
+	u64 axi_addr = entry->res->start;
+	u64 pci_addr = entry->res->start - entry->offset;
+	resource_size_t size = resource_size(entry->res);
 
 	/* iterate through all IARR mapping regions */
 	for (region_idx = 0; region_idx < ib->nr_regions; region_idx++) {
@@ -1182,66 +1183,19 @@ static int iproc_pcie_setup_ib(struct iproc_pcie *pcie,
 	return ret;
 }
 
-static int iproc_pcie_add_dma_range(struct device *dev,
-				    struct list_head *resources,
-				    struct of_pci_range *range)
-{
-	struct resource *res;
-	struct resource_entry *entry, *tmp;
-	struct list_head *head = resources;
-
-	res = devm_kzalloc(dev, sizeof(struct resource), GFP_KERNEL);
-	if (!res)
-		return -ENOMEM;
-
-	resource_list_for_each_entry(tmp, resources) {
-		if (tmp->res->start < range->cpu_addr)
-			head = &tmp->node;
-	}
-
-	res->start = range->cpu_addr;
-	res->end = res->start + range->size - 1;
-
-	entry = resource_list_create_entry(res, 0);
-	if (!entry)
-		return -ENOMEM;
-
-	entry->offset = res->start - range->cpu_addr;
-	resource_list_add(entry, head);
-
-	return 0;
-}
-
 static int iproc_pcie_map_dma_ranges(struct iproc_pcie *pcie)
 {
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
-	struct of_pci_range range;
-	struct of_pci_range_parser parser;
-	int ret;
-	LIST_HEAD(resources);
-
-	/* Get the dma-ranges from DT */
-	ret = of_pci_dma_range_parser_init(&parser, pcie->dev->of_node);
-	if (ret)
-		return ret;
+	struct resource_entry *entry;
+	int ret = 0;
 
-	for_each_of_pci_range(&parser, &range) {
-		ret = iproc_pcie_add_dma_range(pcie->dev,
-					       &resources,
-					       &range);
-		if (ret)
-			goto out;
+	resource_list_for_each_entry(entry, &host->dma_ranges) {
 		/* Each range entry corresponds to an inbound mapping region */
-		ret = iproc_pcie_setup_ib(pcie, &range, IPROC_PCIE_IB_MAP_MEM);
+		ret = iproc_pcie_setup_ib(pcie, entry, IPROC_PCIE_IB_MAP_MEM);
 		if (ret)
-			goto out;
+			break;
 	}
 
-	list_splice_init(&resources, &host->dma_ranges);
-
-	return 0;
-out:
-	pci_free_resource_list(&resources);
 	return ret;
 }
 
@@ -1276,13 +1230,16 @@ static int iproce_pcie_get_msi(struct iproc_pcie *pcie,
 static int iproc_pcie_paxb_v2_msi_steer(struct iproc_pcie *pcie, u64 msi_addr)
 {
 	int ret;
-	struct of_pci_range range;
+	struct resource_entry entry;
+
+	memset(&entry, 0, sizeof(entry));
+	entry.res = &entry.__res;
 
-	memset(&range, 0, sizeof(range));
-	range.size = SZ_32K;
-	range.pci_addr = range.cpu_addr = msi_addr & ~(range.size - 1);
+	msi_addr &= ~(SZ_32K - 1);
+	entry.res->start = msi_addr;
+	entry.res->end = msi_addr + SZ_32K - 1;
 
-	ret = iproc_pcie_setup_ib(pcie, &range, IPROC_PCIE_IB_MAP_IO);
+	ret = iproc_pcie_setup_ib(pcie, &entry, IPROC_PCIE_IB_MAP_IO);
 	return ret;
 }
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
