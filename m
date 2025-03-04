Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E74C021B8
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 23:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EPeksZy34hyGJ+FIUeDImaRetrIsVUOFg7F4ZA5JRU=; b=AT6+y/QZjjsR2Dw/S4vkMNEjvJ
	P6yyaIF58aj/tPVIYtf+SKClP8m4RNUEGt5Ti6Yl04Q6yQ7AkppNsLc8qc6jdSV311Uyf/2Uyj8Y/
	aquFmV8IfqoCKkOX2FeZxbXosR3dPnkRbBy/GTk3YWqJM5nD5HmQxyTuHNXmSQhZ2C4q8aKXpsHeO
	s22y8vT4BLYn059HkFxiZaTp75/Cm/FqsXICYbfH2cGKGUxtnsGVDvAcv3uROcYZcmEFI8KCi3Cxw
	bCT3IOt6BxxmssZeWe5mkHkDS+d1VUGOtuO8MVOYj0oVvbuIRz23EbdbosIIerDnrTLxB9K5d/y0N
	LH3TgtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcAu-00000006ZlZ-2lR2;
	Tue, 04 Mar 2025 23:59:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZvr-00000006JH0-0B18;
	Tue, 04 Mar 2025 21:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741124165;
	bh=4t2C0qmVrIi7VnVoEP9H5R8wRYngP71UR0o3cUyGxgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MDz0Q76TMWKkRWrrpRzxdHczLynV8ph1OAxaOKkmKJ4tpeaYridqAPIV5OYCtn/b4
	 3iZmjiJ0XU7JT4xC+gae3mji1D4vfWS9Zbk2FgUMCm5juiTLvfj5PUW+XV2QzJUyb3
	 sBFZA9sX86olBLl48TyjpfOwKoyOtfJXXMdeh5yuiS/3U4OQrUr0OuhV28dkg3TO+6
	 hY1UtOo6Bph37vjUM2TI2ktYiFNChu4GEcbzupHIx+gSY9cLhqJC/7OyBZJIL93YbO
	 c39P0GQvC7jwAXuk5apibQaXcuBC8S1vXeJ9wjGPsG3Fy2s5G1fSdusm3swcXYW1rF
	 4dAxvQlWRotvw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93B0217E088C;
	Tue,  4 Mar 2025 22:36:01 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 18:35:37 -0300
Subject: [PATCH v2 2/3] ASoC: mediatek: common: Handle mediatek,accdet
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt8188-accdet-v2-2-27f496c4aede@collabora.com>
References: <20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com>
In-Reply-To: <20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_133607_229991_87CC07BF 
X-CRM114-Status: GOOD (  13.86  )
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

Handle the optional mediatek,accdet property. When present, retrieve the
sound component from its phandle, so the machine sound driver can use it
to register the audio jack and initialize the MT6359 ACCDET for jack
detection.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/common/mtk-soc-card.h         |  1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soc-card.h b/sound/soc/mediatek/common/mtk-soc-card.h
index 3f6e24dd22df13ddb3aef1625a77d2e29e46fccf..a1d2794ac1f717997fb47023d5951a9ac4897788 100644
--- a/sound/soc/mediatek/common/mtk-soc-card.h
+++ b/sound/soc/mediatek/common/mtk-soc-card.h
@@ -16,6 +16,7 @@ struct mtk_soc_card_data {
 	const struct mtk_sof_priv *sof_priv;
 	struct list_head sof_dai_link_list;
 	struct mtk_platform_card_data *card_data;
+	struct snd_soc_component *accdet;
 	void *mach_priv;
 };
 
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index f4314dddc46075d554b4e3f3aae8bcb5498f8ab5..4e1c546a994f5e6b7068f70ac8dc2af7e87d141a 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <sound/soc.h>
 
 #include "mtk-dsp-sof-common.h"
@@ -192,7 +193,9 @@ EXPORT_SYMBOL_GPL(mtk_soundcard_common_capture_ops);
 
 int mtk_soundcard_common_probe(struct platform_device *pdev)
 {
-	struct device_node *platform_node, *adsp_node;
+	struct device_node *platform_node, *adsp_node, *accdet_node;
+	struct snd_soc_component *accdet_comp;
+	struct platform_device *accdet_pdev;
 	const struct mtk_soundcard_pdata *pdata;
 	struct mtk_soc_card_data *soc_card_data;
 	struct snd_soc_dai_link *orig_dai_link, *dai_link;
@@ -250,6 +253,16 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 
 	soc_card_data->card_data->jacks = jacks;
 
+	accdet_node = of_parse_phandle(pdev->dev.of_node, "mediatek,accdet", 0);
+	if (!IS_ERR(accdet_node)) {
+		accdet_pdev = of_find_device_by_node(accdet_node);
+		if (!IS_ERR(accdet_pdev)) {
+			accdet_comp = snd_soc_lookup_component(&accdet_pdev->dev, NULL);
+			if (!IS_ERR(accdet_comp))
+				soc_card_data->accdet = accdet_comp;
+		}
+	}
+
 	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
 	if (!platform_node)
 		return dev_err_probe(&pdev->dev, -EINVAL,

-- 
2.48.1


