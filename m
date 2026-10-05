Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C7CCA5FFD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=; b=BJZVxdenMoz/gyorre8J4W6cJ8
	u3s5BYGBx/LRjyYFMMPENFZP+Lbo13UJ8l0+XzaRVxoP0i9LKQA5Hf0Gu8QsD3YsAkMGbeHmc1jwa
	Zrh8XcVuW53vOQjdMUURSgfs6jWzY74UsAlbSbZgmrZdrO/r3oSjGP44E0hLeVCHsgWA49b0aJcRO
	WDmSSj4anlQqi8suVA83tPRSNyLuqRTnMvoYKU93rkuOECLSVeol0U6ZGkDBX1BIGfn4yNubSFKMQ
	Ars4oRHhZ2Yk33lgAusEj9FIqP9gxGGVrnQKdY2IWVAfqAuc8sh05W5kdcrmtD0UJRVyzs/Bt9afW
	Gf6m+FTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUP-0000000GHkj-19yQ;
	Mon, 05 Oct 2026 11:04:13 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUK-0000000GHdb-3V6T
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:10 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so446535a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198248; x=1791803048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=jw70/kB0VbTtIxwtMTkZPxkM0XQGWiii8epXRusAHZQFf49hTJTckhG8UQ3MMhXBKt
         3x21KfTO7oFB5VkLsYSh7yMtx35wxdwkZIxVFGZn1UZoeN2er2EZAyzJokglfIRu4C1i
         FoXTkkJ4TLS+vGEV+q5OUYHtbjp627vQQ/YGIjwMgZrmBBZha8RQy/nsrQMI5Dl1jOZa
         07o0ww+1mmGw+ssygt5fsXmL91mxz6mo9LGYJLIrDN/DT6CF+uOBxiX2cjwJj6Xgk73S
         7dLqo9IDE4CJmtUwfMsRRF5ccQl534hjomJdFn/gVhqzaewCQaZ8o4laetPSGXAGS0iS
         TFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198248; x=1791803048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=adJDqTusHCpW0roKlPbNpyBmeYDrNfpzSAjzZYRL8jTh1Zwr85ZWcnPnX8PTq7TbjS
         Xl/gAM91Ocq1li0kf0E3xbChOjOXJvrwdakrpoS83I8YotbZwDq01J7ubHJi/ad2N9ww
         RbZkQCkHoPGzzpbNN4uye1FF38A+RE+PaF1Fdse8Bc9Rsty9KIz0lyMalpZE9/yYRBzd
         ZdUEcqSPTHT2MgTD2Or6bcbr+IKtAA3nCXNwaTyoSdKg6EO8UlF1fNPVCKekZ9GnbfPz
         yC3zGZH29ufkmW3+sAM5t5lqlAgGAgEO6Bm4jYjBuzcWmISTfek1Mh+AO3jQULq8H0dK
         n0aA==
X-Forwarded-Encrypted: i=1; AKwUvBxljrY8DBLbSc2Ba5Ov+6vX/X0NdbW3u2Aao0Btx8OG1sCBQHOlojV8vQDYrttuc2MCn1uYSd6szKCKp7VUxw==@lists.infradead.org
X-Gm-Message-State: AFuF++mANwhOnI7mWT2cqSDPOohVsF8uebkbXZsTg/ybW/sKi7ObbBy3
	yQjOnUQ741FgXTOaR25G2FL8R9gp2dGDWTML8AxDtzXc6IWMovyaM41o
X-Gm-Gg: AYBFou3FtF13WXiaWGPEIhVbJXUkWl8wNISXmhnBNaM48Ypj94+9xqFLNikLXs8nhgL
	mkZkL/d7qqRw3KP2MU7Z9DnpOpdMs0itAwim77eG0kHZwa8wWZgJD+WopnBkJaRZQDfdv0sH7oJ
	9TMjaH4JxS3F/zwIHLV3aszUGjT0GqwPo40ZF5RZgHLsSYiiyFn/QnywZr6J3a700/VX3K7PJRC
	C8xC6W/LHsOER+IW7vdsLat/fqKyDFWhIFOZoaTbkyoolVT3pe3zL3szgobLyvKexAqkTAOx9M/
	r58AsTB/MrbVOHRjcQF9oLIjF04YZvoo2N3wKIddPYTeTRNPMz0byqVHOlKlPoeOcalYj9qhvLn
	b8C5bDp3RDJRTkANlmXr5dyycUymxn0LVuYjIaKjt1DinofHu+poWtN3Upfph3dWGO9eQmSbM1I
	9h7CEh3zB3xvcNz9d7JVqPhs3DJCDQhVhAxoRnjz847EzX/5YxsQwYF3+Xa9GJ7NiVdEl0V7SS4
	MSq8i/iJxxgiR5ySbtNxs4kk453YGL/lOgv9OtHnVCfJuv40ZS9oJEb7Y17U/fce6YO3XSp39+D
	WMnXqCV/9qbx5A==
X-Received: by 2002:a05:6a21:9089:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e0d6b554ccmr6744719637.19.1791198247726;
        Mon, 05 Oct 2026 04:04:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Mon,  5 Oct 2026 18:02:54 +0700
Message-ID: <20261005110257.50145-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040408_916133_2EB9EE28 
X-CRM114-Status: GOOD (  13.93  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


