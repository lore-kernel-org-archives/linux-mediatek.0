Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE95FC5DF66
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=; b=C2NycYOEM/wEsOMPdGy3WMTFu8
	2E3A437lQMMNkILLS83sNXNywL0Eq8bQOXqQ4ztWBba3jleRBOUvfZLrSqU4GouUIx8YHcKZ8fxhH
	HCv9OTGDbYY8IcgbSmCYKgtgZhz55iDqoE8NRbSxGBpRzXi9XqhU6PViRe7oGSBDMFbTFWawjLX4E
	02VjJkcrRkrUZfaYZmlKFFB+j4kY9IVioCKb7uSkjMAh545nqWI/oxu6swMneIr2sl8qJ/1k/oBeW
	qbyXOvqRw7jaf4GxlxzPx0OjW9Q+P72Yw7QxKTu9y0e/FTw26pmz90KoawxpbkPc+Y7SMlXxdI1lm
	TULwdlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuue-00000005xan-1U9a;
	Mon, 17 Aug 2026 10:49:52 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuua-00000005xZg-2irG
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3888660a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963787; x=1787568587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=;
        b=ULkU6hqMD33g9vwLtsMfyXOQtHaJI/ERB5m8CN5xXIBaX5P1K0YG+vAfJFR0YwPfR3
         czXaJiG95PWw4O/6QdZQxn+6+D5wUq2zyeBa0cI9kPUuOoidUqZ6NpT+hU+9L6/4Hvf/
         dXx0XKKbIOXNZzrHZiHeXRK0aD/wRedNrAXCStQvmhsF2aAKx7fTwggzfgVyRMSme7xN
         n3GMS9iZXsJhIvxT8gSmLJpxO/8sk3HW5GHnQ3BcI3Pe7BkOEw0LGY2idg9lORxj7quh
         YyxkRkq0VtW/B2ZfWLV5Ba6/hvD5xA7/tN0PREroY2ZVaICdih344GovbhPFbDgo51OY
         O7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963787; x=1787568587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=;
        b=ng7qaateFPduo9IV+PoRuFZ6vnZNOLFI29MvqgWAh5sLfHVSbamWg1emrcmPcD+Vtf
         Mktcb5BOpFPg8dIG2c/7OpTIOfw5HLLg663kCbi8lNpnTAgfBInvaPI9Gzu3QZBUNn/z
         YhIx0nUP65cWoqgyQpHLPhzrZ0Ysn5ywuX7PKrwcujM+FZ4mcWIuGt+fbIwnp4dsNdjF
         UpbcANZN08Q3AmcbfGRpIpc9ytZs6pYUuVB0tcsTfoPbb7DSOUXSRQtZ27zokXyAiMto
         eDajSTFkIb4bREmpk3dZF+O2t7Z6Wta8K2gNW3zVNkIr7CR8OZSx5bUfuyrfhBvBO6HJ
         ba2A==
X-Forwarded-Encrypted: i=1; AHgh+RqkzYjKufmdseWVQ6YiGAGYBO+Z/A/72VY9VG+9CroWhTTWz+f5X2Sri9rNjVCIZ555sYJzmX46igBoVKZgHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzyROLKfwPVrlgBFWbFjH2cXk3+QdIZ5z7wJMreaxY2GP7Cd9I
	lwlLSF57IDP+gAB2T09bbhTJzF/4A6Msk4vc0K8WSqLCuikYhbZsli3B
X-Gm-Gg: AR+sD12rlc+U4yRJHY41Q+fL9trhL45Mld2XW36qNfKQpU6zjj0nmqgbAw6OVQ1x7Ou
	yGLH50Gjg0hF8HFMoLR5Hl1wNBXkQ3DJ4fwnj2Lc4F0yaGIrx2REHA7LVx+e0PQj4Rcu11VCeVP
	pHcGEKhxvdjBwM4WrBKDKig+YSK+MFL49DhA3ySmZZs7xnE/s5ri+GfC9+dD9i9BQuV20uiZ6L8
	/AfpfXsFIcfLfdGhdbkpUuzSvg/JUrUh9UIujXa5EcpmELURTNMqJe9zyxgd/Jj/rSIP2OZn58q
	o2cFTdyMd21fEheYl/Rlb5Hdx1oFUXQi81hzAJq7lYv+45AX/MGalGtbLbVxrsqPAoBGdIRL595
	7sopWjULXHn7eW+72fmL+ipDLenjU64EDK1/QVg7WHd0uV+ey4G/+u0gL5eS2l9eLza2b32MkYM
	WVfVRZHyPBmLMtDx6LPXb3c20HVoC6fIDU87yplSoOLUJ+Z7D1+XR4l9sKI16WCEaCckZnDqSS7
	6zzJz4N4WoBwKs12G6KCI2WRK2uOEWkOytGCvlB6rr7WOSsiaTUP2sF+7VbapfcYsjKk5tj4FW+
	mzU/
X-Received: by 2002:a17:90b:39b0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3933b500d17mr23620416a91.0.1786963787161;
        Mon, 17 Aug 2026 03:49:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional() for audio_mrgif_pd
Date: Mon, 17 Aug 2026 17:49:27 +0700
Message-ID: <20260817104929.63152-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034948_697249_FECB6D7F 
X-CRM114-Status: GOOD (  10.90  )
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

The audio_mrgif_pd clock is optional as some platforms may support the
BT path while others do not. Use devm_clk_get_optional() to reflect
this.

Propagate other errors to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index d217f9320ad2..18f0f27bd8c0 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -89,13 +89,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 	}
 
 	/* Some platforms may support BT path */
-	afe_priv->mrgif_ck = devm_clk_get(afe->dev, "audio_mrgif_pd");
-	if (IS_ERR(afe_priv->mrgif_ck)) {
-		if (PTR_ERR(afe_priv->mrgif_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		afe_priv->mrgif_ck = NULL;
-	}
+	afe_priv->mrgif_ck = devm_clk_get_optional(afe->dev, "audio_mrgif_pd");
+	if (IS_ERR(afe_priv->mrgif_ck))
+		return PTR_ERR(afe_priv->mrgif_ck);
 
 	/*
 	 * Optional HDMI audio clocks. Platforms that do not wire up the
-- 
2.43.0


