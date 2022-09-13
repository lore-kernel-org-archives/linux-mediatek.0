Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E4C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYH/vW2OLehIujzgRg7XAJRKCDfixu1/Z5j/bwipGnI=; b=VRmDlRiWXfFm30IGe2L/oujZBd
	fEeNXFphK1nTSsmN6cbT1TSosrULNKC0cKXAyNerdeEIo/zYXiiNRev4zDpdFnAWbfV3Ub+8+eqTu
	pHtJa2BoihX9alPa6zF4sXyJD+bnnIki05L8vu6I7c12vmkaiPTE9vPwwZENVuWFB4dm4MX+YGp8Y
	rKzk7qwK3nuCnuveimOYiockb1/+B3CjnHAcYwVBqyH8HDwtpuNmLRU198K4yFuR7BTz35Xr3Dj3n
	tGxEZnx159cO+MWYaYRQCkQN7a8Vfm1QsBIwHFmTvnCmf2IEnRzQ5la844IukJjwtqhvOHU8W9GZu
	XJec1B4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Ua-00BBZW-Vi; Tue, 13 Sep 2022 14:02:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6UL-00BBAu-On; Tue, 13 Sep 2022 14:02:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0ADB46602016;
	Tue, 13 Sep 2022 15:02:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663077727;
	bh=fiGIiNykQrjpzh1k5qa71sltsz5JgetWMFsEzWdQqUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QIP/l+02X2HOzkBv4sasLj1bbI5kuH2esQsBfcnTt7BM2GYmaIgiwnV7h1Zi7i7+c
	 2NSq3boPtXFBxSxyxiKZQOYc/fprhlVw3qSZ2+1L0fnctMFEmYkSGP+YOwm6/ciLQB
	 E/33CLOzJ4mY7BgZS7Cx2KwwZD4ZIXd8H6J5zFz2a+x3zHi61M+j4WKbt50VQioLbN
	 U2A9gLs50gbNA2CoyPG5sTw6zIUO+CmJ9pRsBsXAXTv4T/zZ0By8D8I93moxQf4VbY
	 uCbL+XM+JPqBxLfCW5PPtdbEZnA61WNHdmGVtjZYIzszz0CdtwzBS/rtQT+S8lPEWf
	 Wrr9vIks6FAPA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	jason-jh.lin@mediatek.com,
	rex-bc.chen@mediatek.com,
	moudy.ho@mediatek.com,
	allen-kh.cheng@mediatek.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] soc: mediatek: mutex: Add support for MT6795 Helio X10 display mutex
Date: Tue, 13 Sep 2022 16:01:21 +0200
Message-Id: <20220913140121.403637-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
References: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070210_053782_636F9E5A 
X-CRM114-Status: GOOD (  10.14  )
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

MT6795 has the same mutex mod/sof register layout as MT2712 and MT8173,
but supports only four SOF, as it has two DSI and one DPI.
Support is added by reusing most of the MT8173 data, with the addition
of a mt6795-specific SOF array (and devicetree compatible, of course).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index e82421386335..eb021e347753 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -433,6 +433,13 @@ static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
 };
 
+static const unsigned int mt6795_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
+	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
+	[MUTEX_SOF_DPI0] = MUTEX_SOF_DPI0,
+};
+
 static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -487,6 +494,13 @@ static const struct mtk_mutex_data mt2712_mutex_driver_data = {
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt6795_mutex_driver_data = {
+	.mutex_mod = mt8173_mutex_mod,
+	.mutex_sof = mt6795_mutex_sof,
+	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
+};
+
 static const struct mtk_mutex_data mt8167_mutex_driver_data = {
 	.mutex_mod = mt8167_mutex_mod,
 	.mutex_sof = mt8167_mutex_sof,
@@ -865,6 +879,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt2701_mutex_driver_data},
 	{ .compatible = "mediatek,mt2712-disp-mutex",
 	  .data = &mt2712_mutex_driver_data},
+	{ .compatible = "mediatek,mt6795-disp-mutex",
+	  .data = &mt6795_mutex_driver_data},
 	{ .compatible = "mediatek,mt8167-disp-mutex",
 	  .data = &mt8167_mutex_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-mutex",
-- 
2.37.2


