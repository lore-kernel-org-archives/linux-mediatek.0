Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B2C5DF86
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=; b=UOPdYLePhSVtc8YS5Jgzfk4e36
	+O8MNQsULcBci6N6vwutUQ0MCrlEwpZzQPndZMSikAOcZ4EUYUfbPWwQgMmLR7od0YfJIARydedHQ
	b0QAa08SbU6HllJ/B8GQcuypyaZApMacPBqCR1garoVx+DTuXMTnnr/guwIxdoAqo3RAhrEMP82wy
	FScvAZfL63yATGJrv/z+p/kilhDnOKQsppVbbT61vYDP5p5OH03A/oo4xGHa9Ffc/wtiSGje516Tt
	ZGOz5teueSJifEyS9h9+9yyA3lnzDp7yjdhWxknmBLoMBK7Sc8X8ShNHVYO4YbwYvG1fMKtfTfnW3
	TmCCrYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdNx-00000009Viu-2Qw1;
	Wed, 19 Aug 2026 10:19:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdNu-00000009Vhd-2pkN
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:04 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3900e39d935so917121a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134742; x=1787739542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=;
        b=puYXl4RcHg5yXOhRqtucBMhw4gJr/N9EdSg88Ury2rFkGM0WXFab64eEZ3Tqt4i1ND
         6BRXVS0o+mzNRnpiO0AxQQWHsDc+DhjbfNFGeJQTn7+GhV52aBKZs50pu/EPB34OoGm0
         Ia4VzBXJBC0gFEcDS5WnjyugK+ICfgibJrZAYt7oVXvxrgTrDpYcDSVgSGKak2y6gMbq
         GKsAeHeXarc6YwHTYHoYb1XYDURNWLVQgmymG4juroFyD80y+/WIzcfx2RnmEwvWzXiD
         C6H3hFSa1mUkIbsx3OGlTH4cIIxw5ulanYj4MFr3hdf0+dOW7aVTn+DaBQ36ShseCJqF
         /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134742; x=1787739542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=;
        b=enyuazBJM6vtkmP0iE9LKf7ald5hr6StrrIibgOgYV1Sg21NLzJKLptVPB+ALVOyBn
         LsqCxfzbJIvNZBPTtoLoLNN9vvDilmzwWgYNLr/Ddss+Tlr07/uCnpJJza+/5piy/lm8
         lFGcxiu79KTqPh7MRWRJ6Zo9bn3T6VJXUWCnAR0h8NGJJhHyQj7HuQmMdtAuQLxioC6r
         iu/HwOULRsnbpm2HafjIQxRY8nR/s6ya446LNjDjiTZffhJQJa7m0xU0SYGQffmei06Y
         YWxfKg4fbAIv37tjc3n3D7tRroNhIXu6QSN1xsQ1E3oC51wnaT2g6vTnUgWE/Qi1oZtE
         WPcA==
X-Forwarded-Encrypted: i=1; AHgh+Rqhu1FH5jlxcv5hT1waiUEei4skk3jre+q2VHP3f4tzOz70RcoUQ2wKqWvjbCALkimfyjzfyT8ldSD46bsgrQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mP8VEMthL0yM163yX2SPEeO6Y6I0g/p9ULdPfQBjej9RE8y70N
	sqaD79B+wmqbUy9H3Z/K3X48a2VpWEgX4jwCJ8r2nhI6FGoN8kmYOcQe
X-Gm-Gg: AR+sD13GwubKl7e6jrgFLoantyPxxQTMZUnmDzraOMJpO8GcAYLtHqEXd4Tyb/TCW4e
	tL6PX98Pte3z6ana7vXhNScADzPlI9FmlQtiruh8T98X1acD9yZETL3T3L7Yqs52wFi3Fj+3QPM
	YyKDgvKAU/mJPratvP76nmrOHp6aSMd8uH0B8m3GP/k4p4gdCLxGkxXBGyi641OqxMMPzwn3Z7G
	8pgYH923UrIlxueYu2JTJOOX2bmIaN5nrEPOucYwlrF4hLxn3g85LenDh0oVfJsiKvpJH8e4r3a
	hrGMT83vhOYZtpImysKw7vyQJ0unLMQfr003icWyzwCJR64TSuWbPMRwUq2X8cuX9rB+5bLns7F
	XVrOUEwfxJ0/4NjjloGhPxkpzqEma6XS5wNZU+6ILNz0HTtVPFq5+QWvQXk4gApYXGBZ/zHS9x7
	v1fAwEyVkFt+hQRQd8DypwqFbV99Fm98yOoYBlQhNloI9C92BLdDHal+v0EZfjYXmE7lrn9013L
	Z2fJNVrFjaiQdAoNI78+d54pkVCidoBmJJT6nASh+x4Z2fx70SJQR9Piv5awns9C9fSb9lJEVBP
	DIi75v+AFJRQIMg=
X-Received: by 2002:a17:90b:2b4f:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39580f0d585mr7158158a91.6.1787134741640;
        Wed, 19 Aug 2026 03:19:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:01 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Wed, 19 Aug 2026 17:18:46 +0700
Message-ID: <20260819101849.68010-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031902_722409_7DAD6BFF 
X-CRM114-Status: GOOD (  11.66  )
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

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0


