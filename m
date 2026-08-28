Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D328C61DC6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=; b=Cc2xozQOoTTuoXo2U/u6HkKEI1
	tfr4JJuQWueNWYGvUQr4XVlLOgDsbOQD7mzVZ/YxhawEp+oEfvuZYtIXuEYfQcnt9P5mKE1lEDJuS
	JRD080IcA38bMAmO1nGy/PFFJ+D3W/ftsPun7JrE5d2Hk9SuPHrLaWN5ataoGqN9JDSGo09QdVYjn
	GhH7FazSqjcX6pVUAB7Rf95TL8tAp61rcmaxgqhULRO9OjWMShFx3nOLLv42lXo9xAWgr3NrnlYI1
	2hRLTMmb90gDmoRMFOxHZ5cmFgkl9+QzbGr1P9giCINXVOIbV2EU7p5FQnPWW11jypigpETGWm5dl
	mGjC8KEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsh9-00000005QQD-47hE;
	Fri, 28 Aug 2026 09:16:20 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsh3-00000005QKT-07AC
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:15 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8548db7428aso639147b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908572; x=1788513372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=ZXD1kdMFTC4TnU7pkODE55eHsL+UW9XLMCHpBF9O5OkvArk9XrIYfEljit65oBuAGD
         mCPfSC7Dcs2o8ujurJMrmxh4upvvRTCyrsGrMJNsETn82tLxcghLetyICntPhziNT0uK
         bJbhvuwOtPYd9jXp4P1CP2JOJXmqIb5lfE8StBODSX2sKl4hX5pvwCXDPACx6KnHCnxz
         WzCUdiyLoPFAnnSXqroj6IX6l8k0XGt6jJxzqTSl4akIyp11dz0yN7AjLDFKj0nCcDFX
         0T8mHh4oykiSbkcadlodQuqroN2t2DRsDtHO+H06h8Z07NqZLnhM4lg9ks3RyCmqsAGw
         a/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908572; x=1788513372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=DAgbNLBpKxpIyR2udfaKW0FOysqB3nNLDJZXKmiFqBX2qLVMcgvR0iMEHXcFVWdEBo
         o1DR6smXS14HyPLIlyKq1FA7WmcoxYorr0kYH6lBe6HoRnMJp708R7laaWnP58oatIzk
         M4qZycwl9g8oe6M5bIVDt+zITUBs771wudjrdeR1oHvvlWDt/k/mXZlMLzv8d8DfeQqs
         kZmJ70o4iSLLKf++aM7utnQeXDs2qLWtZwcnkecqMgyMXQg5TDCcXuB4c4cgaWfTWf8q
         hUlPwjwrA/IztHOzu92e2xL/1Es2uKvE9ZePyhAjlFkzlWMlHSU3cuhIRqa04FiRSKIW
         C7qg==
X-Forwarded-Encrypted: i=1; AHgh+RoN5GEBiTtTJAgNEPQ9SBIMD7EIYJyPm31HIB7VP9C0JwpXMZYxYqjars5zJoLwHaOeiaaIZQjZEUvuqkl7uA==@lists.infradead.org
X-Gm-Message-State: AFuF++nEv3ylWxZ8PYs8Gd5rUYO7gSc7bikBzAXLODE1lFJXmfN79iOy
	hE2JPbpjGAQE0eyMx9hwzTSFK4LAB72wdtN5cPEcYu+TV/DqHM3oX/HM
X-Gm-Gg: AR+sD13U1SWf71oezsHl0yyrxIBTF6PH4AKOlMj3NvvfVgUq7fkaRJwYwkud2u55yB2
	ES24vvcHvN/QiMlGHS9myH9GlVoprxj7sajBO/yGab+K3Mr/xFH6i3laUXzgatiP5wyHtUUG2DS
	mDfUW3ztALF00bHHcF2d/psuC6VXoBGlTbTjS8LMiCQ/6Vwdnv600+CjXkImdHLdbknbiZRrrkl
	il4XMgig2PaubWqu9KzQYXyu3P1Z2VF7mjSd0Os/ZfWkcIqgbGnWK3juIWqPDyVTPNOTX8LqEBT
	HT/QRj7viBBY1Q2czNef4Qf9qHdpgmlYk09Qa1xSq9wRuiUcHZcM5bgLHhEGL4mYoa1mknd7umP
	t0y6HhpQEbgNPl5fNxRpYPsG+4Z8vzWkvrynlafWAFen/Xmdu1fHrPC5aD7KpfPi+vKqKui475B
	rHsFMA/Zhoa4to3m8v5+DcfmMNhvGfdMeHvqT0M8grAA2T1LGcZjAK3rbF1pjDuwU5LQN14KwSe
	8JQ7AhctFPz0OU1prOxNs8r3c4UbijvjlLWWaUy6z5S/Bfa7Ej2AfdNAIj5WY3+wcrM+rhbwSqP
	jyAz
X-Received: by 2002:a05:6a00:1143:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-85626f06db3mr10697213b3a.2.1787908572039;
        Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Fri, 28 Aug 2026 16:15:27 +0700
Message-ID: <20260828091532.600047-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021613_829657_07D81F56 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index a517aa67abf6..b3e938088a7b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -296,7 +296,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -323,24 +323,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0


