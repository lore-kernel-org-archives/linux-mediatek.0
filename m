Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9972DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 01:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUBAwlXt+azX3/3o/tVW5LLv6ZWpDw4ILPEVJphx8do=; b=10zzr8HTksQnil
	dcJJTy9Z6JTFJTqgds3ckUH09ok67DR8aX3G33+1zpcm6TWvxPyD6Lnirim/RD3xtkbHJ3tvvs1Xz
	WBHR6pUf9L+UleQTj0EQde4FIWcjDMpXP+kLlQvS0vC4cfGSqoiuzP3DpncFRfeGx5EJzdlygli3U
	UlW0VZs1q+KPcg51qp76yr5tAZWDInxc6mME8A+v3SdFe2AuUJudcCwPI95/tEWcCsa2GXhu7Xh66
	CFyXy9tGn9QGgAAfEpoHD5VsCimakHi9JdO9Ksur9+Oz//jxsP8QNJ5C3VK2Eh9UwV+3kJL45hudc
	cPre+QS6WDMQMv20wbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0CfG-00BdpF-Oe; Thu, 23 Dec 2021 01:13:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Cdx-00BdF4-8l; Thu, 23 Dec 2021 01:11:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7DD82CE1F07;
 Thu, 23 Dec 2021 01:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6728C36AE5;
 Thu, 23 Dec 2021 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221899;
 bh=yk13MRO3FM7shpr7LfUCSVTd5vxWDh8QBr8p3FTIj6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p86PrC/3UkOgCOBz8Trt8CCDybc9gaN8i4CKAT6mgCNoa4W5sP31nSCO2wtXdwrwC
 DG+7sw+rKG5902vb07CknOC1eT9zSe7T/nvDchjKfaZhnI8H99RnGZ+2tRz21zJv2D
 b1FpEnnC6HHCOv4ULeXMv77z7w2plKA533FSEiZctUCPwObd2OZ0zct7/igbYQt468
 CHnLVPVoZ3uk9Qp+ogbAj7ktPnIWnuJsFIPb8lJn4RzFc46O04DgUcqjBqsWH6Vdmh
 GWIc5rlM+wYrN+mNobXcZ+YXkYfFA8biFX1dyMTJ0krQQbaJ/xoMPfkCEcG/6HTqh/
 1j1iEvCDxYU0Q==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 16/23] PCI: mt7621: Make pci_ops static
Date: Wed, 22 Dec 2021 19:10:47 -0600
Message-Id: <20211223011054.1227810-17-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_171141_516611_847DF21C 
X-CRM114-Status: GOOD (  12.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bjorn Helgaas <bhelgaas@google.com>

mt7621_pci_ops is used only in this file.  Make it static.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pci/controller/pcie-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index b60dfb45ef7b..4138c0e83513 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 	return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
 }
 
-struct pci_ops mt7621_pci_ops = {
+static struct pci_ops mt7621_pci_ops = {
 	.map_bus	= mt7621_pcie_map_bus,
 	.read		= pci_generic_config_read,
 	.write		= pci_generic_config_write,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
