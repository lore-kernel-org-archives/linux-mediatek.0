Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C155CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=; b=Sk3jbWE31QFXucVXDaJ6ve+gHc
	Tg34hWb3m13xdCXTShl532xqmUZ2Ib0kKd68Ds9XqeHg7UUvBph0Czx78PuttqR+8SIOE4ZNkfIHF
	hQklSB1YMmoU8MHGzKZrM/ZvLd9ru5Fst0f7XJ5gUM9nHBwwcICNYRKRxtnp76qwuLy1duq3tTGuR
	VlDa2JfSaTr/k1cpjfj+yLZnwq1ZwQnWRio609btn1qYuYe5qmhujMcaducLXj4Zd/DtOCZGJe3Jz
	R6Yfn8dP7oBBHPvyOk5hhVkxAaOqOnS62/EamjJarkzTsz7k/qrkcoGqAPZr5oER7XXs9wsbWu5CK
	BXlSMUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3n-00000007NSN-2O8A;
	Wed, 10 Jun 2026 10:21:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3k-00000007NNl-0XQw
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c168baac83so31073055ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086879; x=1781691679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=;
        b=T+xZu7dx77LbSVkY5mezXCoEQI8t6JyZIQS5fwHHeqRaKJ0xkLXrb1ZcQhYBh6UIVC
         pieG466KlPCWUaXC9CHLiWbWfeDqBcUJQBfow2Tb681WiuMYZHK5NIznTpO8EaH/miQu
         qwSWEbSZffX1CZG4nrIZKqNjNgFrTBosaZziQvck+i7JQaq579/HNZ6x5RZmaD44zJds
         TaZlXRJ+rC34/xwr59kKcnxj8e4k6NPVvbmC1pSFn5rGQUqdmlrL56iZO5vFR1T6t7A+
         KTBdqTialsaiUxWOAs3dUWrVOlID2rxI48LX3tXYLuRjGB7u2tKlT1wtlxDqMDFLwyq4
         yWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086879; x=1781691679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=;
        b=McHVtvAUSyFJL1VqALUyVzLyqoDa8OxkEO/qWqKYosEcw+kRmzvAA0Q/FxveKw9jko
         zoYTSukAphpTBV/kLwjrE4XZLHLRrrZDCRmZF0HNnx9Uf3AcpjOgXWc0KGlzI698dVwJ
         73YXelLaWtL+HJhHBIRSmctMvlHFJToGE1+6Z1ZIShC//WjA61r9CxdP7o54J1EnxVmk
         PmChG0uzNC0ambvgbZ9ocmmZSmdlr5ekXtEJ2XO6MMlheW0pkwO0L1YDjYmJ0rRjlxXI
         Y76SqTQFxhqe6ef3RV1Pz11L9w9uUYBccd2X8cE4Rt2YwWOr9OK9W9h528Uh/loiCAc5
         rL1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9hDHXf9InShJ6o7XnDs81vX3T7Gvdfr1AA255JC0248rMGmfRx2YdPzgiWbIW7GHic+pU/0i0fdsV0wPJKBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwynNIvJbqY7dJ45E2vFCggfrY+ftODj9En0LbPXAXKKaFaA5bN
	Zu27BAStgN5N9TXEdzq7PbekzCHOulVKJ51Ymd/Gsczb1DF0J6dV2WBa
X-Gm-Gg: Acq92OEm5hkObIEC6y4xVfdcHY9Az7zAVLnZ0Zrw9NhHMOnrRSqxDmH93V1V6+1VDox
	z5788JlWGux3IN5md3sBYfxyDu7O7E0wYObAwaqwkAAeYjbOu1LPnRO9amysHYEhDwn0mH2Pr7V
	/I9JJ0PdsKF7e2xXE47qN5jiD9Xp+tmKZslo1O2EJ7W+SIG3YpI1TQK6DKiSLVsdh+eWlLP0awE
	cUtrbXH/u3wypl2VrvDIm8ioG3iHksjGHMLW9WbayzcbaB0Gok0nbbO2P6H/wgnQ1j5yjJ2RgoQ
	LJ4p9bbY5FrzItjC0Hs2ZhFKxf5ZoW1Usg6B/26NeGP+v60mNVa+ePfqTXBXBpwPWAqN2uSQEkJ
	CnqT9y5hyacMbTb60opeR5TQhSNLjXTnMpjG2i43VQIHiNaBu5Y3tXaTolwAEvpz+wawyBovse1
	gM3ILGW+nq39B/1nO8dTBVLw+8GskgKV390V/sdZB8YtTcHQ6lYDL03+cq2BPXficAF+Zw
X-Received: by 2002:a17:902:da4b:b0:2c1:f262:494d with SMTP id d9443c01a7336-2c1f2624a70mr252269075ad.19.1781086879138;
        Wed, 10 Jun 2026 03:21:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/10] ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:20 +0700
Message-ID: <20260610102021.83273-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032120_182798_EAC1A0BF 
X-CRM114-Status: GOOD (  10.85  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
index a04c24bbfcff..d8eda9e17eb8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -63,10 +63,9 @@ static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
 
 int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
 {
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	adda_afe_on_ref_cnt++;
 	if (adda_afe_on_ref_cnt == 1)
@@ -74,17 +73,14 @@ int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
 				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
 				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
 int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
 {
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	adda_afe_on_ref_cnt--;
 	if (adda_afe_on_ref_cnt == 0)
@@ -96,8 +92,6 @@ int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
 		dev_warn(afe->dev, "Abnormal adda_on ref count. Force it to 0\n");
 	}
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
-- 
2.43.0


