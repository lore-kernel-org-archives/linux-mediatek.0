Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1472CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=; b=Ft8OsqHx0dojHYlKUcv9MdiQ+o
	uwcnVoLZArShW3WfLRSaQ8zdxm/ugm2cgGAOgjuZEDhYAc6X1ZCh06hEcRS7NVRMEa73kLprF1kml
	mws2MX2M3N8/wua8+NLECCwDNJg90UR9yRgmz6LEviq6hnRWGD8CuEDkw0JMx+QwtRkZUtk2F7ifo
	2JB39ATM/Z22YkIKkDR7PTuWnmTH4tVd9zo7WHuUivfVtaPloVQ98ddX09uc2GkMhyDTbpmJ4mO/c
	KjEQdrGcrz2Fju8O7uXH9PBc9KcQyeUzxvFvBDTBED7Fhww5sXpNhgFG2EauFoS8sFfalKgKzXR80
	nzwjxA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR56-00000002Q6Y-2BY0;
	Tue, 29 Sep 2026 06:12:48 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4x-00000002Q2p-3zSc
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:41 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1661164a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662359; x=1791267159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=gUqKqqYROPWu4qLBDOY9b6XtboKaFFCl5uTqLZpRz7vWl30WpEOahjd5njWxwsiqFK
         DrfYrNfgjWWNFcJVPB6sKxcC0ZMAjXt3Lc0x6HH3/FoKJ15T0h9yHnUP5IEx/elhUpBZ
         mEU7956oYDDZI7GCHoNIgKscDPguR0YGMDA1qUOIMyaZ+x3kiDPTMqrawe8adQ3yWIuf
         G3VxAuFV8mQPuYFccaJWT6DkQ/WDmEVLVwRxBxgTSqa60uTRtlUChOpJCaMfuhbs3/uT
         6S3mO4io6FD6OpPycV2yu7HejQVkC6xJZ5GJsfmD1yiwGtbkUyPrDX3wAe4oQEhSpJM9
         vQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662359; x=1791267159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=Wet2XxzYpNgDFoFEer31C/cYZI2zKzCcYTm22iUZCkbIDYiPgXd/HP4h13oVom8iyb
         SbGex2YLDJbJjoJJa6012VubOeD1TWlvhiH8g+9AarB1W34mzWYaELjueXr1A0jQYLoK
         ywobrttF7WYbE8pD6RP7RCg1DAkCRel0klfd+vlThNp4QqsZOrov/qOi5xruDhHSGs45
         KyG+7BdD9+/gP6OEgWfQmqt5EdNa8iS47lXeI4+VuHZEcx/t/S+zDtBXADdmBifliQUh
         ZqflGk1XssRRKFd9FcW0p/siEldn7ynk0TcniLFMDsf9ONgkCxSz6NIDYMcx6+AZoD99
         z98w==
X-Forwarded-Encrypted: i=1; AKwUvByV84h25r/ttI1AYSx4RDFYS/ZfoY4GunxjS6483wq7ZW5AXIDpnrqO0+DmuOkSL2DzBjSJDyzGvfAQZhjfZg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKPgiVr/waS0YG9W+To5KNnxkupIQh1tpThkESz8w/x8UQOz+ga
	HNHIHmXHQnAqzrJAz2IpqRSFfzDPinr4pllfIkYYOYoGVsHKhu6hNw6t
X-Gm-Gg: AYBFou2du425obrPXMkR/aveTAJNktA7TCw5ahe7aRJxVc3agkMjm20eDBOSZvbqL0l
	yON4/h2XcFagBkR6OJI3weyTtbokFC+rWDDMj1JPfV/hWM+6PFj+HmuWjgOWl6WIOEuZxRDbNlk
	Tvo1YlbcuGHXsc3OZoei67HdWQ+CFMAZVuWrleOYChto/eG9udOth1Spnfq1m7eZZZ85AT5M896
	sar8/oJHXKN/+mYEMF6oilRqSgY1KoThlxoZvPSKsqFMY6EOarPZyEyhCJs0EU/FAbWfSnu9+bt
	3QAbCfbHKuLdelhipUhjq/EfyF90qx5lDs75nJw2cSFTeBFZQJFGP9sEeIgim/MRfiBCjpOQiXt
	u1aGyCx5OtI50CUpq8xl0JYUT/bgZ/Y9WQDJ0WI/L5qUoUlQL8EQtOp3p5kLyqruk2VmzS2JUS2
	g6zs5lHlkOcmlkhYeqH8QQQ1hs0po4VcJWVYYZxHKyM8iunpeev8tQ84YnC9F8klfSIK+bFH9yD
	8kM7Ru7Gv+n7rfF2vgukvFm62t37bY+0vYR4uZnRtynByejIASRRJgExYrL/SkVbBLFzDVgb9kr
	mdfZhwynsmT+rw==
X-Received: by 2002:a17:90b:2b45:b0:3a0:8a03:2a2d with SMTP id 98e67ed59e1d1-3a098d35687mr13123807a91.29.1790662359209;
        Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/10] ASoC: mediatek: mt8196: propagate I2S clock errors
Date: Tue, 29 Sep 2026 13:11:20 +0700
Message-ID: <20260929061121.124001-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231239_993328_BACE171C 
X-CRM114-Status: GOOD (  12.86  )
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

Propagate errors from APLL and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: 65a195132669 ("ASoC: mediatek: mt8196: support I2S in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
index ef5cde0ba829..adebf75629be 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
@@ -985,27 +985,30 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8196_apll1_enable(afe);
+			ret = mt8196_apll1_enable(afe);
 		else
-			mt8196_apll2_enable(afe);
+			ret = mt8196_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
 			mt8196_apll1_disable(afe);
 		else
 			mt8196_apll2_disable(afe);
+		ret = 0;
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
@@ -1015,6 +1018,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
@@ -1025,17 +1029,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


