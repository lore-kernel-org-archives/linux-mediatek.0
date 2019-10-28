Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556D3CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A8220717
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AuchOwy5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14A8220717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LTIBDOaZ2VQW/hSpQsi4sNBBj96fnuyfqakj1q6Jfk=; b=AuchOwy5IQxOwc
	7qs0mUJZqPK+6UMDORAA6FwV0eBUI2D22gs7YwQWdp+EMbyP4BP6HHmcW2EjYVNSl1Z9cKIcgFntY
	zFUGsWMynxFPncbXM87EsOWMNlshPSN9YauUVKZxbjPtN/bFTOkF7vz/9IbiM4TiTZsu0qG3kp3dL
	JDuaIp7PgrynTQtVqylBlpIaQ0p5odKa6lAdgu5WDD0JTLkhMt+LBLPI5kd3tiwD+jZ9k6QnkVsvt
	teroQ62HK15h3ac5FlLwA7HF8UVoAB7UNnSE+pO/iOOr8CpOkDUUifN51krBWel0utTdeEZsX92ia
	wMAB0QVnfzQuUKbJvsVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP84T-0007G7-1W; Mon, 28 Oct 2019 16:40:45 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xe-0007Gu-NZ; Mon, 28 Oct 2019 16:33:44 +0000
Received: by mail-oi1-f196.google.com with SMTP id 83so6433667oii.1;
 Mon, 28 Oct 2019 09:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXFj97mkbGwNy9HcITgsXlHzoihDJWyxuLbZMG3bMrk=;
 b=tyLxVYk7Yuq6JyIAgTkUanULlaK+HkCVhUJ/ARb1P+syN3jnPBsblb0g300QEIyrec
 XAENfm/lmbVP/f6OV4Uq1zxy4UBOTptZ+M2RYJZGiAhZgTMSo/+39aHPAJjzDpoWKWHr
 jUKqpQRZU4tyfsAEZMs696P858DphmCDUy5iXTpSHYtQGSEXuEz3Vtz1Giys3p0b5+RK
 a76QTnhUnCmKmZhKUK2rLFS5SfMNj45m4ty8MTegW/5TYGAXDl27pLDHUE6RJvRvdB/z
 prjMzroF8y5oRNPFspszOqfeJetQhhAEkAfK068P656xReS3brQ5q/czJepaK+5IwzCz
 4lOA==
X-Gm-Message-State: APjAAAXGFok//uhE1bZFTUQlEjs3OpmQdDHpGB0WIl+hBaWsBA72F4Kj
 RbS/DnF1GjNQ5Mdz+awIcA==
X-Google-Smtp-Source: APXvYqyAyPrUKbfPJy6jun7gPAIEO0JEPIYDjbds2nS284G2YkNImID/wTHAeVHyFp19AQ13lX76hg==
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr149284oia.138.1572280421584; 
 Mon, 28 Oct 2019 09:33:41 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:40 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 17/25] PCI: versatile: Remove usage of PHYS_OFFSET
Date: Mon, 28 Oct 2019 11:32:48 -0500
Message-Id: <20191028163256.8004-18-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093343_338359_9E279C17 
X-CRM114-Status: GOOD (  14.25  )
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

PHYS_OFFSET is not universally defined on all arches and using it prevents
enabling COMPILE_TEST. PAGE_OFFSET and __pa() are always available, so use
them to get the physical start of memory address.

This should have probably used 'dma-ranges' to get the address, but we
don't want to force a DT update to do that. At least in QEMU, the SMAP
registers have no effect (or perhaps the only value that is handled is 0).

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-versatile.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index 18697f2ea345..eae1b859990b 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -99,7 +99,7 @@ static int versatile_pci_probe(struct platform_device *pdev)
 	resource_list_for_each_entry(entry, &bridge->windows) {
 		if (resource_type(entry->res) == IORESOURCE_MEM) {
 			writel(entry->res->start >> 28, PCI_IMAP(mem));
-			writel(PHYS_OFFSET >> 28, PCI_SMAP(mem));
+			writel(__pa(PAGE_OFFSET) >> 28, PCI_SMAP(mem));
 			mem++;
 		}
 	}
@@ -136,9 +136,9 @@ static int versatile_pci_probe(struct platform_device *pdev)
 	/*
 	 * Configure the PCI inbound memory windows to be 1:1 mapped to SDRAM
 	 */
-	writel(PHYS_OFFSET, local_pci_cfg_base + PCI_BASE_ADDRESS_0);
-	writel(PHYS_OFFSET, local_pci_cfg_base + PCI_BASE_ADDRESS_1);
-	writel(PHYS_OFFSET, local_pci_cfg_base + PCI_BASE_ADDRESS_2);
+	writel(__pa(PAGE_OFFSET), local_pci_cfg_base + PCI_BASE_ADDRESS_0);
+	writel(__pa(PAGE_OFFSET), local_pci_cfg_base + PCI_BASE_ADDRESS_1);
+	writel(__pa(PAGE_OFFSET), local_pci_cfg_base + PCI_BASE_ADDRESS_2);
 
 	/*
 	 * For many years the kernel and QEMU were symbiotically buggy
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
