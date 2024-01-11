Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B79C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSziIE/ybAwAPJBQ3qsR9gVJSk9ocThVzINUn/igBl0=; b=QgtqSp0lPaw9XFi5Jd/GxCeTpL
	iCgmpdLeZvpBurjMG1dujVFLH+x2pD8s9qwObiMb9xUyJ63QluBE9QaA7NBcHRQ/8pA+fDJr+DVVH
	r1mY9od7syopStrHlGXn+oZvQbJtSTcGBXvTu7dyttYPoLSggQ4PgWhQFF3rYLnZk5k1MPsVN1lAd
	1KBLzHhEKDchTY4xH3LURjbkBEqbFcY1n63u5imu2PhR9dm0yHoKldvclUWSGZNkRODu6lO0VrlVY
	XwcinkESW+pkTRJ8r5Ruhb7MTd+HMJwebnMyzpJ1Icwd3KlAiNKFhtY2CspC7d4veJZFuo8/jRWOM
	Ex5Mq5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgY-00H6E4-2l;
	Thu, 11 Jan 2024 10:53:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgH-00H5wn-0M;
	Thu, 11 Jan 2024 10:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970379;
	bh=INSFLjKGWUsq8D7Gv8F3E/m7g3Zw056cbg7I8BkqRIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OumW6osQ54b6FN4QQ5pFj7u91fs0CI6pFd0zZ+wlCvnEn8f3OWOs8vW2JcClOCh2j
	 poZAzt8E2OIhTSxn+C3TyiMlBjvTzOVJv4pUepYve7s1dvMaCxJd9BdSc10mIi+B6B
	 cxCnVYBMpwTcPwxodsHKcKrBOICZ6SevL8dySA5jiZlwu08PnLVq7O8Lqm6s6hlfin
	 S5WP+d/I/rwkRxQSiLcYgbTHqC14ncBil6IkuuSozoNsPG41F6tp2GaolSXnNTKiFd
	 Xrg785MqlGJ5kEfFv/QfcNdcZuA+Wv46lp3kSj50YaTukvS0ffctf7xYZ+kEFHUMIo
	 8fTIVjiX9lVXw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D541F3781FCB;
	Thu, 11 Jan 2024 10:52:58 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/7] ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
Date: Thu, 11 Jan 2024 11:52:47 +0100
Message-ID: <20240111105247.117766-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025301_312713_71694F09 
X-CRM114-Status: GOOD (  13.64  )
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

As we're calling devm_pm_runtime_enable() in the probe function of this
driver we don't need to disable it on remove as that's devm managed:
drop the .remove_new() callback entirely.

While at it, also add the sentinel comment to the last of_device_id
entry.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 620d7ade1992..de848d872ce6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3193,16 +3193,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8195_afe_runtime_suspend(&pdev->dev);
-}
-
 static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
-	{.compatible = "mediatek,mt8195-audio", },
-	{},
+	{ .compatible = "mediatek,mt8195-audio" },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt8195_afe_pcm_dt_match);
 
@@ -3218,7 +3211,6 @@ static struct platform_driver mt8195_afe_pcm_driver = {
 		   .pm = &mt8195_afe_pm_ops,
 	},
 	.probe = mt8195_afe_pcm_dev_probe,
-	.remove_new = mt8195_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8195_afe_pcm_driver);
-- 
2.43.0


