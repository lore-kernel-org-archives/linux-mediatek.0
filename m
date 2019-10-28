Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC71CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:41:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F7D20717
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="etE2RlRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F7D20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9ZOZ0ZazMs0rl7FAxguQfVmHkaxBNQzetLOYZ9ytlc=; b=etE2RlRgrR8LoG
	itsKcexkO336qNQ6oFLGb2W3KTHNqKNcssVl8iINePr2BuoMNSOV7CgZd+vje/iCKfuVLeK00k5t3
	c7u0/KNej86UjL5Hs2lZIRLTRQ8A4SR2HLLb32hgU8RoF8ETLx2k/Gb77HYozHJpH7p2fgQZoQbhu
	GAxgolkqfDtYQzzjK3BGSgHmB7Ib+Va0lZICNbWshvv4Y6zNjUFt3Pkd+Lh4+2Mn/aQ+UYEFtckuw
	juGk6Y/gTUeyXzFR8EPeKe+ZkWAto+iBUS9PukCq9gLjK1noNX0p6xcsPRiHIyUoPz+BXz65BgiaU
	hN3gij7+dchRpcJbcPSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP85K-0008A3-O2; Mon, 28 Oct 2019 16:41:38 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xn-0007RV-DC; Mon, 28 Oct 2019 16:33:53 +0000
Received: by mail-ot1-f65.google.com with SMTP id 53so7176957otv.4;
 Mon, 28 Oct 2019 09:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QU/9wyXAj8Hn9lmmawqTA3HdfmHqtIC+dVHktjAk5bo=;
 b=TZLmjKEMoEcfhBt/Ye1htL3pJJNapUwPcNTH31x1SGb8CrDeqVjKy/3IdGtJwrTLFB
 vTzLRtMQ8iIBwDOlD5wuCogX7pUqHpEKVAGuIvAFn9a9pNq3fGBwVimbbbpiefz3jtoK
 bI2tduzZ8lSpNWogHzMwWQ0Gh42PIEINGRgHmUqyGh5JBDUGV+Aqu2Ci8U46FejLQZ8S
 jamM1dFoGtUpC1VWGVoF+o3MA0uKefrI6LCpVwrRPO8Sxv4OvHCZxMI9u+FM1XYk6+Ve
 /1l789Jujyiz5cKc0VUQLMpIoockFqwQxfIrtkczJ8uJxc5EnXzGcFQnh9WIW6ix4lOM
 SzfA==
X-Gm-Message-State: APjAAAWsgjSxgPEPJXpjtV0foRDhk8a5ozEfw+rxYVt7j/q07NT+Y8Y8
 6B3jU3wWFvEPiiXqkF7+DQ==
X-Google-Smtp-Source: APXvYqzX2Hu9uOY3jcrsLEYHaEbafPvhljS7PBlsyooLht3SWyOGTn98jF9BU/3i/RKiepgEwvPcpw==
X-Received: by 2002:a9d:334:: with SMTP id 49mr13870685otv.15.1572280429878;
 Mon, 28 Oct 2019 09:33:49 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 20/25] PCI: ftpci100: Use inbound resources for setup
Date: Mon, 28 Oct 2019 11:32:51 -0500
Message-Id: <20191028163256.8004-21-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093351_494407_62A1B245 
X-CRM114-Status: GOOD (  14.32  )
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
'dma_ranges' resource list, convert Faraday ftpci100 host bridge to use
the resource list to setup the inbound addresses.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-ftpci100.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index 66288b94e92d..1b67564de7af 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -375,12 +375,11 @@ static int faraday_pci_setup_cascaded_irq(struct faraday_pci *p)
 	return 0;
 }
 
-static int faraday_pci_parse_map_dma_ranges(struct faraday_pci *p,
-					    struct device_node *np)
+static int faraday_pci_parse_map_dma_ranges(struct faraday_pci *p)
 {
-	struct of_pci_range range;
-	struct of_pci_range_parser parser;
 	struct device *dev = p->dev;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(p);
+	struct resource_entry *entry;
 	u32 confreg[3] = {
 		FARADAY_PCI_MEM1_BASE_SIZE,
 		FARADAY_PCI_MEM2_BASE_SIZE,
@@ -389,19 +388,13 @@ static int faraday_pci_parse_map_dma_ranges(struct faraday_pci *p,
 	int i = 0;
 	u32 val;
 
-	if (of_pci_dma_range_parser_init(&parser, np)) {
-		dev_err(dev, "missing dma-ranges property\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Get the dma-ranges from the device tree
-	 */
-	for_each_of_pci_range(&parser, &range) {
-		u64 end = range.pci_addr + range.size - 1;
+	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
+		u64 pci_addr = entry->res->start - entry->offset;
+		u64 end = entry->res->end - entry->offset;
 		int ret;
 
-		ret = faraday_res_to_memcfg(range.pci_addr, range.size, &val);
+		ret = faraday_res_to_memcfg(pci_addr,
+					    resource_size(entry->res), &val);
 		if (ret) {
 			dev_err(dev,
 				"DMA range %d: illegal MEM resource size\n", i);
@@ -409,7 +402,7 @@ static int faraday_pci_parse_map_dma_ranges(struct faraday_pci *p,
 		}
 
 		dev_info(dev, "DMA MEM%d BASE: 0x%016llx -> 0x%016llx config %08x\n",
-			 i + 1, range.pci_addr, end, val);
+			 i + 1, pci_addr, end, val);
 		if (i <= 2) {
 			faraday_raw_pci_write_config(p, 0, 0, confreg[i],
 						     4, val);
@@ -539,7 +532,7 @@ static int faraday_pci_probe(struct platform_device *pdev)
 			cur_bus_speed = PCI_SPEED_66MHz;
 	}
 
-	ret = faraday_pci_parse_map_dma_ranges(p, dev->of_node);
+	ret = faraday_pci_parse_map_dma_ranges(p);
 	if (ret)
 		return ret;
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
