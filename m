Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA552C982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LClDxrITmybPw/RDvdGi/ZCnnnT6FM/8jbV0TZBMMY=; b=pxnUpqEYAnLGcqvr6zQCYeUzuv
	AgsO31z3HoMxFvYeENwgWNbfrbVrvoKjBTr+53mwGlUPwx9J1duYYTVqo6/hOX+qDra3uQISKhVKQ
	hBITyL2H/xBsivF7I3sJ/vP7pO8HcXF0vgRxzGY6R54/FvWvSflRZy/RB0Cf/yykpG26qyuqkjLyi
	0KA3aWcrjOrfcFPclf+V+lI25fgbIZo+H5sAxjlQ/x/YW/YqdMl1hxer+0QosEEQdRLCk6J/662pQ
	wICJsUzlv/7eIf/Nvgn1h3Hqi4MrNA4JkwCnwSNHYIj3R1E3RD0jTsWgl4njV+F1JFCPEE/eIJ4XA
	hQCu9FHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yq9-0000000Ebnd-3Owy;
	Fri, 18 Sep 2026 13:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypp-0000000EbS5-2Kj9
	for linux-mediatek@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8LClDxrITmybPw/RDvdGi/ZCnnnT6FM/8jbV0TZBMMY=; b=pMy8NU46xSEyDH4DbpdiHd5VhL
	8qQBdrViDjkA6PlACPcUTheaYVhOOBKEyKuoLdGgwUv9/VvDoJsdi1Fk4QCj8mC+jFXufmxKGG3WP
	Jl+/BokIcsWD5IEWngarVAbheNIeHrLRR9ycYKaCEF3k/3vjEVSdGXXBkQkhpOjpvQ/zqjIwsFXA8
	sEdtt9lRgNC2OZiA0i0FuVPQcgXDDnuAkVJ0PWebRkWxJsVIpyntQwIcu0/3e2J3oJxQrs+BJkBlv
	torquu0amnrw9cumaZHLUwdqE3m+TFByV1aLPeOMVqLk/oYonlbgTq5yvrtENwnuOvZCMYAG/JGI7
	v5z4iVBw==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Ypl-0000000A9Qy-13ln
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:41:00 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso801306a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738855; x=1790343655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LClDxrITmybPw/RDvdGi/ZCnnnT6FM/8jbV0TZBMMY=;
        b=Ccsj8KUaQ/NZ2qDh0UFpVLB97RGzASgLYzqt2xq6FtbRp5bBiKO9vhgdhlLuyhib10
         2GjeEd3UIVwN7EKSB2FDTfivnloZrRPVSn6FvWjT/ByiMxSUmamM7A86RX2rhf99fy+z
         8yavTyIAF9I65YQ4Ow7uq8SgO6pHEBObdLpdE2Zkkgl8NNLYG++iLvO+SDRPAUR/k013
         eTT01APf5fU63PkFaZ56SFY1zq3hP1jR1XDUwuKd52bM7n8NBlONNw/rrRcg3XiWcfVv
         la6Zwa7bhKdlS35BcZ6wYXxWgbb4XMHMdV0cOyNkonTztj5R7suiKJy6P7lDTbyczj8s
         cd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738855; x=1790343655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LClDxrITmybPw/RDvdGi/ZCnnnT6FM/8jbV0TZBMMY=;
        b=0W1o2nq6xEd7bJzIWNBMSqJfqKacMn7Gw9OWNwoDiVIQQVdX9M/dAvj/P6Q8YvWIIe
         Q2J+s6XsgvoYzRpsbLcvyNNQ7o7AURXLvAHViH5bQhdaNhs95o6d3Q+X2SMSX4zXnjYH
         2vSrL207fFX9GtAjtznTAfuKuIyILH9k3NUj8AJ+E9lxvq+DhIVFPqWlpYG4UiRaSdkn
         B0Mc5nTiQAtd8YO/WWixDkqHr314k2uHJxYL8B+JRITWZFUfMXmG/+80X1mtpfdCwgOo
         JriqzBGrMbH7SXZpYGDT5aJyjpV6ae+1yxaV9u/vi0Y7cbYpgHd0A27LYj/1/MhaMWo/
         BrFw==
X-Forwarded-Encrypted: i=1; AKwUvByE6jjYkJl1Lsx7cFxBQiIkJLtPjOhkTUjd985npEC/MuNaWaVikU12m4X1K+Mu4k5rqCOKhNcQnySl99r78A==@lists.infradead.org
X-Gm-Message-State: AFuF++kXevH5DNoXpbTNoUXpdQZ6fWeMjNbVDr7xtzRXEjdajZ3Zbwej
	1hDtLUwRuuEWB20hQ0j7ytwS19qoOU9CQc619vh5klFU1TUmICB/IEat
X-Gm-Gg: AYBFou0u5UUe2n9TtPs6SkJhS1IhpmFd0I2u+UASVCy5kT9sEhP7w0nAAlo3KRYZNIx
	sQQO8thnm4wvCdNy7YEmB9hLkVHnVlSqT6cmD3PqKMlBI6HjHmrbOUTN76PLykNvNPSpcNt+ZPX
	cuuYaPmG56e0SB78DnD5hS+nm50zxnErAURTLqW9vUnuXGxM2z8EClNzCdYDbfJVHKRSSAia/P0
	B7hn6cSgwNpC0IDjS6ljjU6rBELXNxmBJMlmZvPWFMyk55OlQN44kggKoQJX5A2tAkxEE53LbHU
	SbKaUDNPtN4cphOjCk/xE58gGP6c/v9n+jXdYvfJ1Lu6p7vNErF5cxIV7oe5B7blIJZU4T/n2gd
	ONToGv/cxUY+r2J6k+Nnw/zvqnmp2fIqHolw0yYYLKFNvtQI/lY5/xhy0VNu653aNFr9u7TMWpI
	EIHwIMDa/NPN8PrtRjGtHtm9DpCPk1Jvq17to4NJDTATvGiiLUR9dUmWPT1MowPPs7wQ8oaicTs
	31cHYOHIyfsGXNIOugSudm2xKZYqIIKkwhKgCPL/hPcx5SWHh6MFwatq5YuiqUNi0A0dyFUkJe2
	2ZJXCqWyAmtpOg==
X-Received: by 2002:a17:90b:53c4:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e54d1ea4dmr6218148a91.12.1789738855077;
        Fri, 18 Sep 2026 06:40:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 15/15] ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF calibration
Date: Fri, 18 Sep 2026 20:39:11 +0700
Message-ID: <20260918133912.133799-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_144057_380959_9107EF33 
X-CRM114-Status: GOOD (  11.83  )
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

mt8192_mt6359_mtkaif_calibration() ignored the return values of
pm_runtime_get_sync() and mt8192_afe_gpio_request(), which could
leave PM runtime references or GPIO state unbalanced on failure.

Switch to pm_runtime_resume_and_get(), check each GPIO request,
and unwind on error.

Fixes: 18b13ff23fab ("ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 37 +++++++++++++------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index c86348691641..b010726e9b57 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -163,12 +163,23 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
 	int counter;
 	int mtkaif_calib_ok;
+	int ret = 0;
 
-	pm_runtime_get_sync(afe->dev);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 1);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 0);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret < 0)
+		return ret;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+	if (ret)
+		goto err_pm_put;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+	if (ret)
+		goto err_disable_adda_1;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 1);
+	if (ret)
+		goto err_disable_adda_0;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 0);
+	if (ret)
+		goto err_disable_adda_ch34_1;
 
 	mt6359_mtkaif_calibration_enable(cmpnt_codec);
 
@@ -289,10 +300,14 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 
 	mt6359_mtkaif_calibration_disable(cmpnt_codec);
 
-	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
-	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 1);
 	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 0);
+err_disable_adda_ch34_1:
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 1);
+err_disable_adda_0:
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+err_disable_adda_1:
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+err_pm_put:
 	pm_runtime_put(afe->dev);
 
 	dev_dbg(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
@@ -301,7 +316,7 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		afe_priv->mtkaif_chosen_phase[1],
 		afe_priv->mtkaif_chosen_phase[2]);
 
-	return 0;
+	return ret;
 }
 
 static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
@@ -319,9 +334,7 @@ static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	afe_priv->mtkaif_protocol = MTKAIF_PROTOCOL_2_CLK_P2;
 
 	/* mtkaif calibration */
-	mt8192_mt6359_mtkaif_calibration(rtd);
-
-	return 0;
+	return mt8192_mt6359_mtkaif_calibration(rtd);
 }
 
 static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.43.0


