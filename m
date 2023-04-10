Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA6FC76196
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNo3VUeVBCvTr93etMC8xb2Qm5HnTquhpskeDbfLiFg=; b=iwDC8PlBy2wdV/Oa7VUOJ1VjAP
	xaa6Wrp/x1tkdipmNpJoUZZMRLEATrfWuM773lm4Sd8/4G8dZpbQ+RXpHWxOnKsWNUYRO/cpstUhV
	CWKlU7f9yJD5gLo0vZ0dvg+X/OoBYtcVgwLGPa19zLUmE5KZJOBUxocNNDOWjZrhDdG/77jf2a3Dg
	OY97pJKAutQQD5Pl6uwz6UFxJxAVc0EEibt2xv6nminBCmtF99TaXgUOOcdLPlGBM8XvN3NT+R049
	PWiHVLMeK6yawBosuO3vej3Kvr7KMu1AAeJqDUgtIgp8VwIXeYQggvAoMCF5reMLRKyXlc65NYjqV
	dQlRAEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pluFA-00FWOh-0C;
	Mon, 10 Apr 2023 16:19:48 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pluF7-00FWNi-24;
	Mon, 10 Apr 2023 16:19:46 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pluF6-0004w1-0T;
	Mon, 10 Apr 2023 18:19:44 +0200
Date: Mon, 10 Apr 2023 17:19:38 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH v3 2/2] i2c: mediatek: add support for MT7981 SoC
Message-ID: <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
References: <cover.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680857025.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_091945_677055_A831783C 
X-CRM114-Status: GOOD (  11.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the I2C units found in the MediaTek MT7981 and MT7988
SoCs. Just like other recent MediaTek I2C units that also uses v3
register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
0x94 instead of 0x4).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 59eaefe999b11..a43c4d77739ab 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -431,6 +431,18 @@ static const struct mtk_i2c_compatible mt8168_compat = {
 	.max_dma_support = 33,
 };
 
+static const struct mtk_i2c_compatible mt7981_compat = {
+	.regs = mt_i2c_regs_v3,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 1,
+	.max_dma_support = 33
+};
+
 static const struct mtk_i2c_compatible mt7986_compat = {
 	.quirks = &mt7622_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
@@ -516,6 +528,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
+	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
 	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
 	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
-- 
2.40.0


