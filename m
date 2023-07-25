Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB654C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0vmKBL7pPBmAxt1W8SAMtzXtkXFwd/9twysIwFGbTQ=; b=DygHwC8yOTa/KBxP+AQHWuBV30
	9J1O6UGJyEdHjz25jSnj9LlDl1SOZljYybpEsTWBxp69wVM70dDrwKNAG+CrbPWmrdulm7gHCq8fB
	2VnJ+zoXD+FDsxL3S2+IODkhzqoB04k+jX3BxHbp2LqWTmEz7ktv8kp13dkPSGAiTe1/YwdQGI77T
	t9AJ6/ZTt8DaOcCR5bcC3VeQuxqaVw6KW6y9tNEqjA8jeN9FVNFAk5T7b817ZRabtKRq4IaZsTC8k
	/36TL36OrUE5HjA7jjJsIcVKTlGgsz6kJlWf1DHeNr45Q21eBakwShxs0ZEPaKskIQHogb3Ilig4G
	A7+jynjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCY1-006bx3-20;
	Tue, 25 Jul 2023 07:33:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXO-006bSo-0Q;
	Tue, 25 Jul 2023 07:32:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27AD3660710A;
	Tue, 25 Jul 2023 08:32:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270372;
	bh=Vg0YvjBSlDmlFYU7tKBjTOro4lXlpZBRQaqsrOefZqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=coyHXIVWXIh/K9CpyuVpTlwkv8VJUao/RH/sELQqdBv76wvrulSNb6p0s6nZuM+gd
	 VGIHPVCSVLERIZUsKwi7nqIRmCF7J3tL9uVOKnAkxJINB6tSHL1y2+bO9j2UicvZKd
	 6VgKHTHy+SHXgLbdXJTxV1jtsTWt+rXzwk+VeXrFEsZcKMa0rwP4JqsAQqV7JaR5vg
	 TvWpHq+COQThSnEN7i2H1f5UL4XacBLZes5HMC81oXngPbk/4OnhESLXMVCETAAdj1
	 M/UOeYLbGJfpHcpsknLt+L/NG19PK6z3eQszu4VC3Rsug1BLc+wx64P/lsGsC627JD
	 yXf3z1XKWCtWg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	ehristev@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v7 07/11] drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
Date: Tue, 25 Jul 2023 09:32:30 +0200
Message-ID: <20230725073234.55892-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003254_335965_7641057E 
X-CRM114-Status: GOOD (  13.18  )
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

If a controller (usually, eDP!) does not support audio, or audio is not
enabled because the endpoint has no audio support, it's useless to lock
a mutex only to unlock it right after because there's no .plugged_cb().

Check if the audio is supported and enabled before locking the mutex in
mtk_dp_update_plugged_status(): if not, we simply return immediately.

While at it, since the update_plugged_status_lock mutex would not be
used if the controller doesn't support audio at all, initialize it
only if `audio_supported` is true.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 83e55f8dc84a..c1d1a882f1db 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1948,6 +1948,9 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 
 static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
 {
+	if (!mtk_dp->data->audio_supported || !mtk_dp->audio_enable)
+		return;
+
 	mutex_lock(&mtk_dp->update_plugged_status_lock);
 	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
 		mtk_dp->plugged_cb(mtk_dp->codec_dev,
@@ -2520,11 +2523,11 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to request mediatek dptx irq\n");
 
-	mutex_init(&mtk_dp->update_plugged_status_lock);
-
 	platform_set_drvdata(pdev, mtk_dp);
 
 	if (mtk_dp->data->audio_supported) {
+		mutex_init(&mtk_dp->update_plugged_status_lock);
+
 		ret = mtk_dp_register_audio_driver(dev);
 		if (ret) {
 			dev_err(dev, "Failed to register audio driver: %d\n",
-- 
2.41.0


