Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCC7CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zOXvmFuuH0jODTzR/ZE2Ew7+EIOkuE5wzgpjoneczA=; b=FYtNxoFZ8MCN1zqyd7E2cELg/t
	cOAFZYQXbhB58M/oC88iGHibsBE46Ra6AvAYfU9a/r+mofciNOkq5qCjWK37VlbtJCngEaZJJ5rZi
	UKPkTKgO0JKLxrpSak86Gtg0b0cEWW0zd02JUh8eb0YBVEdCis5aPOJ9IfE5nGjQrc6th9ZMbh6hI
	jWCZj9sK/9rPRQSpeb0nCuA/K+ILL2PRt6yhNmSk+Cct4p7BipblrRbpGVORl0SMVhER5oJ5f/O7n
	KB3O4rOmmu78ueG/h+roOQKiaRkwfe8ZFR8ke3ohrFB84++nbPsJC3QYT7dJRluIU//6J61gqRvhc
	XXIyRHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9l3-00000001hLv-0inE;
	Tue, 09 Apr 2024 11:35:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9jh-00000001gOv-2bjO;
	Tue, 09 Apr 2024 11:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662436;
	bh=ClgWR4mgcTFs9Nig5y7IuRN0DOliEM0btt6YY0gL/ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1UxKrCwZGfiST8d6KpGhuEB/Zlp/tAykO+Moio6Qm3s5OQYTSOv4a/ysFlL2dosFk
	 KXgWRlU2V5ll1DWKZrEbFrev4cjH9ZbAzFotBNA6jWLfq1ypemKOAyfpUobXoGhXPc
	 +ZbauqgXqZkgLvqAb9bQfY2v7418TZEHyDR+V8U+wL/kGpzL825PQooD48GcqBAUlp
	 PRAXOzUxoBXUJP0xR1gAr00lkgVgY4gJRTYoI5i+qkKIQLhBaCsDnlP4nSDvYNJZq4
	 JH3BKG6P9m6tpmPtRSoOk3BhYPuUSoueS09F2059J50/sQWlQoq1sz8lLsESC9JT8K
	 V8C6wWCllhY9Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 50E72378212D;
	Tue,  9 Apr 2024 11:33:54 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 11/18] ASoC: mediatek: Add common mtk_afe_component_probe callback
Date: Tue,  9 Apr 2024 13:33:03 +0200
Message-ID: <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_043358_043495_DFA4E2CC 
X-CRM114-Status: GOOD (  11.08  )
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

Multiple MediaTek AFE PCM component drivers are using their own .probe()
callback, but most of those are simply duplicated functions as they are
doing exactly the same thing over and over.

Add a common probe callback for this component to reduce duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 32edcb6d5219..9b72b2a7ae91 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -126,10 +126,28 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
+static int mtk_afe_component_probe(struct snd_soc_component *component)
+{
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	snd_soc_component_init_regmap(component, afe->regmap);
+
+	/* If the list was never initialized there are no sub-DAIs */
+	if (afe->sub_dais.next && afe->sub_dais.prev) {
+		ret = mtk_afe_add_sub_dai_control(component);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
+	.probe		= mtk_afe_component_probe,
 };
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_platform);
 
-- 
2.44.0


