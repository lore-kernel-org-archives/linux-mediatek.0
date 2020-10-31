Return-Path: <SRS0=R22q=EG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07FC388F7
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 14:04:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34DA220723
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 14:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5VuoTH5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="bVQemA23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34DA220723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGkJ9luaPMgXpynLPI63qZOJtgc8zG+PwtPI3sEGu+E=; b=o5VuoTH5dLO5prd98ebwqUXySm
	X4meV+mX6uXN5bjDXj1ZMGLhxBnq7evjmWtNaNc6Emz9VcJaKZV3Fd9cROYuXohPqjhJggn6TeNqd
	YJrW/eb6hVA9+r+yIErRBg9sO2+ZGi+0OGcyBoWgwxZ2Q6y43CyWrvS89ICCRyN140LGufeIefM9b
	oJsk4Efyj3Frm4oeZb4tcTdAB7QrZoONjVz1R7oMH1tZPv5Jl5SgnmaTTwJYi2BSodoTK+TOTgpCx
	U9EVLGmckbunkNK7qEZGej9grziBfCohBt/XuPf7b1PAhYd52h0wlHnkiy2G++rlVAT3/DH6BoCaB
	DT7NAlng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYrUA-0008K9-6i; Sat, 31 Oct 2020 14:04:02 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYrU6-0008JT-Ny
 for linux-mediatek@lists.infradead.org; Sat, 31 Oct 2020 14:04:00 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout3.routing.net (Postfix) with ESMTP id 7AA7D60131;
 Sat, 31 Oct 2020 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1604153030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nnqpdwBRoGTj+JO7bkuaUY6oKrUxMavYYaV/d3fKDdQ=;
 b=bVQemA238/wVSfo5rW9auRUYepbmAnKBqLrz9KJUXnluHpXQv3wtzei+B9qRorOmKRxj8B
 C3e13ePdrdgOfaDFXlI2RPzevDEsoiN3L2pG8pCQAuiBmH1uBXPnRo2rbG8u1yHCBG5/9B
 AMQAt6gYbCUhbPxmX1I9Uae1C1Z7/EE=
Received: from localhost.localdomain (fttx-pool-217.61.156.230.bambit.de
 [217.61.156.230])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id E134D360085;
 Sat, 31 Oct 2020 14:03:43 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pci: mediatek: fix warning in msi.h
Date: Sat, 31 Oct 2020 15:03:30 +0100
Message-Id: <20201031140330.83768-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_100359_325452_2D7C7A4C 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

5.10 shows these warnings on bootup while enabling pcie
at least on bananapi-r2:

[    6.161730] WARNING: CPU: 2 PID: 73 at include/linux/msi.h:213 pci_msi_setup_
msi_irqs.constprop.0+0x78/0x80
....
[    6.724607] WARNING: CPU: 2 PID: 73 at include/linux/msi.h:219 free_msi_irqs+

fix this by selecting PCI_MSI_ARCH_FALLBACKS for MTK PCIe driver

Fixes: 077ee78e3928 ("PCI/MSI: Make arch_.*_msi_irq[s] fallbacks selectable")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/pci/controller/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 64e2f5e379aa..8345de010186 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -238,6 +238,7 @@ config PCIE_MEDIATEK
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI_IRQ_DOMAIN
+	select PCI_MSI_ARCH_FALLBACKS
 	help
 	  Say Y here if you want to enable PCIe controller support on
 	  MediaTek SoCs.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
