Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBDEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MXqsOkhjFuY2Grn2iZBJcyKrb1FL77xJWqS6mmmDrKU=; b=qE8Gc0I1TSmeRX
	3U4rWX1pdnfdKl6CcGXvzyL5ZJYTH8y4VbPgZyFqJnxLqIr3SRpma+7zJya0IWSQoernPUqaQgzU3
	aKaRgHNT0FheIh0lYXGx098ZPq1QMBEsepj8TpHLy6WDpC9wKwS0i479IGBomykrwZ74U0oEQpWuc
	041EjNBEtBeugQfNmNAN2rfu8bsJIIRKDah52i2p0lbCwsy0qjQWH8TDsDYMJHdQhbhZtIpdj5e7z
	fDH+nU+43HZA7BJnEXWMOIiDlY0S6srF0OTYiXWJhgyS8vhFlk4v/CcNL6vYEmDeKwWFR72xAj4C3
	BW5/1YfFj3IqJ42ZUkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no3mE-00EfPu-JY; Mon, 09 May 2022 13:50:18 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no3m3-00EfKi-7s
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 13:50:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8886:2b92:63eb:2922])
 by laurent.telenet-ops.be with bizsmtp
 id Udq42700Z0moLbn01dq4qc; Mon, 09 May 2022 15:50:05 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1no3m0-003XnN-BL; Mon, 09 May 2022 15:50:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1no3lz-003NJ8-QS; Mon, 09 May 2022 15:50:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mtd: nand: MTD_NAND_ECC_MEDIATEK should depend on
 ARCH_MEDIATEK
Date: Mon,  9 May 2022 15:50:02 +0200
Message-Id: <bb9568e825d4bc7506870b03836baa91bcc4b725.1652104136.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_065007_535624_E60FB631 
X-CRM114-Status: GOOD (  11.39  )
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

The MediaTek Hardware ECC Engine is only present on MediaTek MT27xx and
MT76xx SoCs.  The driver for this engine is a dependency for the
MediaTek NAND controller (MTD_NAND_MTK) and the MediaTek SPI NAND Flash
Interface (SPI_MTK_SNFI) drivers, both of which already depend on
ARCH_MEDIATEK.

Hence add a dependency on ARCH_MEDIATEK to the Hardware ECC Engine
driver, too, to prevent asking the user about this driver when
configuring a kernel without MediaTek SoC support.

Fixes: 4fd62f15afa0d0da ("mtd: nand: make mtk_ecc.c a separated module")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/nand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 2f3e02ab72ede6fa..5b0c2c95f10cb8ca 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -56,6 +56,7 @@ config MTD_NAND_ECC_MXIC
 config MTD_NAND_ECC_MEDIATEK
 	tristate "Mediatek hardware ECC engine"
 	depends on HAS_IOMEM
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select MTD_NAND_ECC
 	help
 	  This enables support for the hardware ECC engine from Mediatek.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
