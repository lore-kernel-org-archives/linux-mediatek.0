Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26211C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 15:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE996115A
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 15:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDE996115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RtDlglieg6+/KH+wBNc6tWdCDVqBn+pFBn/PzTVoE9E=; b=Z8w8uFleNDO2vD
	JfRMvxx5dxd+8b5fuZUbg5NTL2ysEow5+F1J4frfbbiILrthcyWevB4NdbpLhC40vDABvbxZPFhv/
	XBl9jaAxzH8w4Np+SpVrE5H43hZprJfI4PfwmO6VE+LzC7qdZbQ0wW+3w/4Ax7pbgTxcBjgwKHyK6
	DVPEUJ+qCK1ckC2kmTuM0b/gif1mcv5xn5zxFIQWPVRH1J2Ja5mQCC3jAJapbRR2Vi5mNJxvNdiqB
	Dac56Pr9Q4ma2rSSSDfnbkaWLqVVMeMbtYO9CLWWcLFOsrUQ8zMorjzKU1AdXtdS6qoCvHVlHwzt8
	hfUy5B9TV9i8Nv1JeKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWKMa-000iJv-1q; Fri, 01 Oct 2021 15:22:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWKMN-000iFx-6p; Fri, 01 Oct 2021 15:22:04 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:dd31:3048:d332:54e2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E35C21F457D1;
 Fri,  1 Oct 2021 16:21:59 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: broonie@kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 linux-spi@vger.kernel.org, enric.balletbo@collabora.com, dafna3@gmail.com,
 Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] spi: mediatek: skip delays if they are 0
Date: Fri,  1 Oct 2021 17:21:53 +0200
Message-Id: <20211001152153.4604-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_082203_424898_C2D8BA00 
X-CRM114-Status: GOOD (  13.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the function 'mtk_spi_set_hw_cs_timing'
the 'setup', 'hold' and 'inactive' delays are configured.
In case those values are 0 it causes errors on mt8173:

cros-ec-i2c-tunnel 1100a000.spi:ec@0:i2c-tunnel0:
	Error transferring EC i2c message -71
cros-ec-spi spi0.0: EC failed to respond in time.

This patch fixes that issues by setting only the values
that are not 0.

Fixes: 04e6bb0d6bb1 ("spi: modify set_cs_timing parameter")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
Changes since v1: v1 was a revert of the commits
04e6bb0d6bb1 ("spi: modify set_cs_timing parameter")
5c842e51ac63 ("spi: mediatek: fix build warnning in set cs timing")

this version fixes the erros instead of reverting

 drivers/spi/spi-mt65xx.c | 64 ++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 386e8c84be0a..a15de10ee286 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -233,36 +233,44 @@ static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
 		return delay;
 	inactive = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
 
-	setup    = setup ? setup : 1;
-	hold     = hold ? hold : 1;
-	inactive = inactive ? inactive : 1;
-
-	reg_val = readl(mdata->base + SPI_CFG0_REG);
-	if (mdata->dev_comp->enhance_timing) {
-		hold = min_t(u32, hold, 0x10000);
-		setup = min_t(u32, setup, 0x10000);
-		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((hold - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-		reg_val |= (((setup - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-	} else {
-		hold = min_t(u32, hold, 0x100);
-		setup = min_t(u32, setup, 0x100);
-		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
-		reg_val |= (((setup - 1) & 0xff)
-			    << SPI_CFG0_CS_SETUP_OFFSET);
+	if (hold || setup) {
+		reg_val = readl(mdata->base + SPI_CFG0_REG);
+		if (mdata->dev_comp->enhance_timing) {
+			if (hold) {
+				hold = min_t(u32, hold, 0x10000);
+				reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+				reg_val |= (((hold - 1) & 0xffff)
+					<< SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+			}
+			if (setup) {
+				setup = min_t(u32, setup, 0x10000);
+				reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+				reg_val |= (((setup - 1) & 0xffff)
+					<< SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+			}
+		} else {
+			if (hold) {
+				hold = min_t(u32, hold, 0x100);
+				reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
+				reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
+			}
+			if (setup) {
+				setup = min_t(u32, setup, 0x100);
+				reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
+				reg_val |= (((setup - 1) & 0xff)
+					<< SPI_CFG0_CS_SETUP_OFFSET);
+			}
+		}
+		writel(reg_val, mdata->base + SPI_CFG0_REG);
 	}
-	writel(reg_val, mdata->base + SPI_CFG0_REG);
 
-	inactive = min_t(u32, inactive, 0x100);
-	reg_val = readl(mdata->base + SPI_CFG1_REG);
-	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
-	reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
-	writel(reg_val, mdata->base + SPI_CFG1_REG);
+	if (inactive) {
+		inactive = min_t(u32, inactive, 0x100);
+		reg_val = readl(mdata->base + SPI_CFG1_REG);
+		reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
+		reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
+		writel(reg_val, mdata->base + SPI_CFG1_REG);
+	}
 
 	return 0;
 }
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
