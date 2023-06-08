Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D313EC7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THDsO0ciiVSnCPhWhsfc+w9gDpKOq8lEubGk5K9G/Eg=; b=Su+BjhrykH3/HNa7dgVovPUDwB
	g0vUwCze5CFgJ3IPOnbnMSZ9Y9uEDENi1eecoTBL80+5BNfo4SvNToX8dlQx2EZY82Ci6mhXfXeVS
	tbxmlsAbX4bOj6H8t6lRE4MYTncWoOwPw5fTQgp6U3VdNcyPbFDWdZPsbNfUfvWzMH/FPF/suTulL
	BxJ4efp6Bm2pbKia23sIoAbino8MEFjM4uM9oGyoTKyYUydebPRubcDvKIcSulU6EATbf42wX+W0a
	xznbknuq6cjWyPvdngZUoH+SLajlwIAOo89+XW8LgtECUZnDmGtxAQ+S7+4Wl3M1amdPd0v5gsiNP
	8XA93+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BJ3-008a1p-0e;
	Thu, 08 Jun 2023 08:47:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BIy-008ZwG-3B;
	Thu, 08 Jun 2023 08:47:42 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8072D6606F17;
	Thu,  8 Jun 2023 09:47:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214058;
	bh=v2RbZsJIF8OTePPv81vl/VBbI91A/spCjRghtDBNM7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gf18HmSx3F3dEulzyCcItyoErGryylnFIIreRlee5hstTnWvpZqirZdfVHhz8G197
	 kdkwZRySUDM8IkybCap5MZL0Tw6+iL3ERDCi0TIWFnPUkYszkTBXH09G8kFlBGr/Oh
	 gnr8RWhiYZtZ48wF1iRKRzcE0wE6JVyiWWbqEBDOPpbT5Rf7+hQJucVaVXJwPKQwni
	 hfPGvtjB3+QZkV0dTsL6I4bsAXw4kMonXZZbX4BSBPdvrPQBsTPOLE80/QfAPcM5uR
	 L7vnSMA3Fh4ZH9Vok4qVDmVI2Iv2tIjabo/pBR7gEx5bhxnmPLfl7L6G4Hfxacfdz3
	 +e+X/z2uFLSWA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: clean up a return in codec_init
Date: Thu,  8 Jun 2023 10:47:24 +0200
Message-Id: <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_014741_171821_C6E9D053 
X-CRM114-Status: GOOD (  11.56  )
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

From: Dan Carpenter <dan.carpenter@linaro.org>

This code triggers a Smatch static checker warning and does sort of
look like an error path.

sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'

However, returning 0 is intentional.  Make that explicit.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 643a7a12a96b..b2735496d140 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return 0;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.40.1


