Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AFECA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3120220717
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXBUV5eP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3120220717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+6u9VdgxGBO4aJAZ4H9Ezlsb6pWJpf6fL6L5GRFxGI=; b=lXBUV5eP+cASXY
	bxXy1HSN5lv0O6F+GLNDiTKBPQPnpr6e2iDxI3aGv4kDYlbHb9fMxzgw2JlpKO2EqwR58JlUk5aSf
	kl+ZkWVhQpWx69yRnc8oBWwDOszYbvsNFCPj/49B4I3yemUTZy6mpmk0qBraQh6bGc7lRdIjvYfoM
	zMLfCAnH7ylDc+1S2rj8rYEp8lcbLc4yXGu7/EOcUyqppk2DHGQAdZ3m52E/3p+jyxJ98HNvpWbpA
	OXIyZKvWTk7orz1T8vWTdK5NkTuNRqeyrKERoS+lIcRm2IlulMLW84FlA645mP1QKW7/67GyQWlrB
	42mlC2+2tam6akOjb3XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP83P-00054i-3K; Mon, 28 Oct 2019 16:39:39 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xY-0007A5-IR; Mon, 28 Oct 2019 16:33:38 +0000
Received: by mail-oi1-f193.google.com with SMTP id j7so6416153oib.3;
 Mon, 28 Oct 2019 09:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+Nu5yrVJjsG4TTQSGHiVlpfm5ZyTifg0RmA51gaOc0=;
 b=SZg5qyA4W/imnTTQupYMCO0p4bjAD4nJLqIWSYLOxEFTftOM4eXfjXqoatYIXiGCa8
 3ylMPaCvFOkI3fwZPsiM7UySJO3Xl0l8NwyFQOGCsjMnZOm34ti295CeGcJHBlP7Yoht
 VHPfuFxLDC1pG6Bi/VTNsJEhwemW8RUiBmusDeDdWpMPTU/yLTzU0ifoExpseNFSnKRB
 7VZ0kHm5l3aF0M9UKsefuSiLOLqXavyaSlgHX4CwQI9qDkMYl1ynkwTFN1A9FJDDw3jt
 hBlBbQ57PJpqpkU6sSIArAPBQMgJ+6B9kME26zJlv/Pl6xP0PHLT+LGEgabiM7PeafR1
 p9Nw==
X-Gm-Message-State: APjAAAVvczyzzoSXhrX42O00zkeE+iG9PToxibE2is2tsRgM08ElKzcX
 5u0W735br1sz0sO+x6eHWw==
X-Google-Smtp-Source: APXvYqxZLTR5wVAhoLt1SmTt4eoDfXlOKWV5o+tkbeIOsDVOrc+wq0rFYNtuDO1eJW+OcmohkZZkqQ==
X-Received: by 2002:aca:5015:: with SMTP id e21mr140283oib.174.1572280415373; 
 Mon, 28 Oct 2019 09:33:35 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 14/25] PCI: xilinx: Use pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:45 -0500
Message-Id: <20191028163256.8004-15-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093336_695725_01A14641 
X-CRM114-Status: GOOD (  14.41  )
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

Convert the Xilinx host bridge to use the common
pci_parse_request_of_pci_ranges().

There's no need to assign the resources to a temporary list first. Just
use bridge->windows directly and remove all the temporary list handling.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-xilinx.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 5bf3af3b28e6..257702288787 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -619,8 +619,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 	struct pci_bus *bus, *child;
 	struct pci_host_bridge *bridge;
 	int err;
-	resource_size_t iobase = 0;
-	LIST_HEAD(res);
 
 	if (!dev->of_node)
 		return -ENODEV;
@@ -647,19 +645,12 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &res,
-						    &iobase);
+	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
 	if (err) {
 		dev_err(dev, "Getting bridge resources failed\n");
 		return err;
 	}
 
-	err = devm_request_pci_bus_resources(dev, &res);
-	if (err)
-		goto error;
-
-
-	list_splice_init(&res, &bridge->windows);
 	bridge->dev.parent = dev;
 	bridge->sysdata = port;
 	bridge->busnr = 0;
@@ -673,7 +664,7 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 #endif
 	err = pci_scan_root_bus_bridge(bridge);
 	if (err < 0)
-		goto error;
+		return err;
 
 	bus = bridge->bus;
 
@@ -682,10 +673,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 		pcie_bus_configure_settings(child);
 	pci_bus_add_devices(bus);
 	return 0;
-
-error:
-	pci_free_resource_list(&res);
-	return err;
 }
 
 static const struct of_device_id xilinx_pcie_of_match[] = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
