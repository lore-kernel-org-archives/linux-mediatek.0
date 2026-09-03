Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB4AC61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=; b=JVjrZKiCtvVUtvN1PVrycnjGle
	iWXx9hMGPU6RTqMhmhMC0Rc+7lDiG5qnMD+hceG7LAXcwPbeFaqOz/W1oSmJ03Jaxh8UK++1v0LFV
	/RMoon0/fbOW0kJoP5YmSNhBtGDLM+sxNsF3iChB5BzJktSSNzw+jXFYHA2yW6CdqCCBw8wezo+UD
	dHc8Wussz1TZV2HDB0G9AzVnx/IO0Ji1IUTbM/K9Tr4Ej/RwasPTvTIvzSRDko3gbPuPka4IR+oyG
	UnEkkHA7l1DoIuDuBKxoMYr7Ak7j8PnZD6vJKOK78JbHM4dmmN3oOLoF6K+3vmP2xp9dPZnYIjPpf
	1sB4+zFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkY-0000000GN4C-0Pcr;
	Thu, 03 Sep 2026 05:12:34 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkW-0000000GN1h-1Mag
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:33 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so598467a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412351; x=1789017151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=ASxTis7lB8R/OLtfv0HrmSuXgg1BKyzQoO3sp/uqavczj3pIjnUFta56GsH57+NrrC
         /rdeCLLtyFb0IdsZNDhlG1X8wQJTpEPVLSsH246GNj069NomGCY3Z+V7A36ektwVai0U
         htfkbYDh9lBmEZOdveP4ZHw8j/99U/QDViWva3xDQ26OUvwU7aKDHAggvSHLPskAJov1
         ACOnUC2I7xHeqZ26WbwpKp65OaP2V6cWg1vFfQ0F8YF830QmVX0CkeKdawaD6W0V9PvF
         vbfQfLqzij0OqrtXVohPdwznESveiKMliJ8oaLP2NcmUexZIbg79OlP7ZXfRvh1BQtP9
         E31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412351; x=1789017151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=XHheI3HOzMlniO+tNrJYugNqYZKBwxgRk7Kuk+tu4qkqWvoBbjlM8zVWtcYmQoEBIt
         +A/27xjFlHEqDrOpb7kwYD3ovEZezMSBlewS/1SfK6dd9YIUlfFHcz7RoZWbfWRUC6qM
         zLXI81y9iygToWIAoVied9BtcgMhHDzc2U5YRSgLS9TNyuSzMao+cLCsWoCg7Vl45wXV
         VOxb5XWV+/5Zo6Dj3OmTdxglVprQ9dgjZKJfvZ68djJuIO6G8AvoH8LVrexZioBkwzEV
         KLF1FLad4n8QAArrXok1pleo9GdreEkIXGpEaXkbmtl++lPBm+fe4nrcFwqZAOrPv99D
         Y5sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTwwuDNpsNL66yf6P/5Uk7eU3mQfPlSB1CxDYpeSHzSvirwp3B/e7CQ63mhPbHHcIcbLfDnPSe7pM/uS0EnA==@lists.infradead.org
X-Gm-Message-State: AFuF++mP3qssOf4J/9u5hifJBvTEw/Mqk8WMi1wwjLjf91FlEOV0tMv+
	yyBnC3tNloQ+LEp3qXa/Sf0uTy30AfL1819KKitH98+vis3KjCEuk+zW
X-Gm-Gg: AYBFou3fYQlToU27TFhbUGS9e7JJW676Q8WlB+I10kJE6nDE8VqE7P2z4LI/I9bPMhx
	3QzNv7fGxPmVmNd+kwJVqQ1IehChrxPXbHGtJbPLlGaymEt2KQI0dRk+rsQClq77++cV/VPrEyy
	DY8OuMW+77FIZ3IkM2ZilOZDrYaepVbgJalf1jTH39sXB6WGX8vS/W9ZZ7vL6FcFCoyK/vbXZxq
	/r2wFbuWT9LI/fT/kZKDIT+22MDwIIGbuGhhSOqp2ga8cWoscqV+XdRQ6PWoRzPsg9K7NrhrOg2
	SRAdfRL9uybXiq+lW2iSlNCAjhDqTiljI3xRSt5pOXVbcMBctW8Khos1KNgCf78LDKj4vEjgedF
	F55S33zvkocJrcGmZhAPt42CBxwb7vH9EdamqYRV2+tOS8VehJIw6hU868f3FeWH1oO44EEndTG
	nDtTZbgnsXEC4iHAp/ZZgiGb+lixJhTH4HaOj/0XI8rQX3BKkt1aVRAEdDqxoK4ak85396BBIec
	9Xh+9DiGQ20+Ghb2MOZsxde1cNBh1NNtCHt5/FGmjoB65d3G/xYGu3zmP7sMMiAiXo5Mo3M6Fw+
	uw45
X-Received: by 2002:a17:90b:5288:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39aee123ff5mr15589958a91.21.1788412351417;
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu,  3 Sep 2026 12:11:47 +0700
Message-ID: <20260903051150.178057-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221232_367990_C4A75080 
X-CRM114-Status: GOOD (  10.41  )
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 77a0cbc8ee24..62b008b7caca 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -520,7 +520,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -537,16 +537,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


