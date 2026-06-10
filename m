Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6FACD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=; b=ItcsqITuHsQ9Kb8zJEP8hYZPeo
	oZ4kieYcW42957aMkce6DvMuO8HSj3FjDYaMueUJXRwqZ2AwvVLdLMmOk0ySdSm8LcAZpM2UFwiq/
	WIhZvkpOHU8AuYUt0a9BJ8AVD4oUT6bn5BEw8ZMoPjmdWR9LcyXHBmOGkjl0udVkahbQwXDOYNAK9
	NAjBoFUglIsAxW275Xc5+5mwhmAHfif3rXgCqgIRIzri42i5P7Pj/nT6LexzSQ4FBsTnU9UwjAK/f
	E1FFVoxMtLS0mO6RcYWA7u3AYabH7cPUWw9+yHnVIuvFE+XlckwSIQU4Bmt01IgY/TPH2k1TS/fPj
	plTQi6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3q-00000007NXC-2pwG;
	Wed, 10 Jun 2026 10:21:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3n-00000007NSs-42m5
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so44038785ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086883; x=1781691683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=;
        b=AAwQ2j1V09BIzyfpxHIujdqY3R4saPrJSlIeEaDrQ1D/LsQ+6SJHGAW/mZmAkObYaz
         pxB8CoNDHwAnjCHANZmYQdQtW7WB5IfSyGyYVW7lKpolo0C9mhrEqrV+n4oW4dWK1t+A
         8bFh0uTlNetWLJYo+DAEAITs9zVbnCh4Nd+nsiEdfa/0YODLOoEkg1IgoZnOminhI8YN
         AJzUueGC88FxpjgB2e2SWv1C4WwkjhLMjJqzneD/WwtwtXwkGCmakWrIQZqywaYUGsAX
         YD+9QyUzTJHlfZpXX4AEq8yHkL/dgBHwVNrn/hr2/P1MLbkrAW816c8+oKggC8ufPdNa
         ynQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086883; x=1781691683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=;
        b=pogDvYiK3aiq5NmBTW7L/e5PWHMhpy+ArPQDV8F0FXV/dn17gzDAezs7jfLjYL1/j2
         bjoKADVP6nPeMOwkF8NqN+VLPljsz8hvpHnmjTW8KVqIgQJPa0FOxBPi6JpvFZj9EQiL
         i/x/uq/bkAZjXwZkemg0NTD97g/4IbJDLfuyrNktMiUwJiM6uhy2kPdBVMdhWOrf5Ag0
         visRwiylrSBTXH/cw7ltJiOF48hfEBXPzbDU/6+7VO5rTKW2L83dLdMN90dfj2T/dBFx
         913bA1ptrsWdTvU12wUeppodL5QSqT0wwrQ4W+6Ww1pZ7snoCWVhDmG+rWpEr7WH2RFn
         4lPw==
X-Forwarded-Encrypted: i=1; AFNElJ+5pmaAxgECOnkcEm2LY1wxYeMbhghom2D3FQuyU75eICnAvzR0tPY+ijDnB2CDvVUAr8sdSyLOO0NUQ8MFhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvnU/UW1hMTWeZAJWYr+4KwtQ+EQspSg6d0lbkmu3u3Tx8bXDS
	sXZf+vsnkbOUmpenEr9xrMtORyeZeT2/HYNQa9A01PzUfb5oLmQKR2BmxYKGPA==
X-Gm-Gg: Acq92OEKUJ1FHOeeqe6oNoaV3cNHW+kiXsgl2AduAMkaaX+JtJCtmYlPKzX/KlzlIGS
	bm6/NsUQuofScdnjZblNazLiM/OGRwAXqYRzq/T0aale5yV3DfPjMopw3CS9e++hGe5gzEdG9jY
	go5RTd2tLJpWmZZx+WhsC4u2lZYtWa/DdsqhxbAQ+inw8+RCVMqdpk2om9kYNwUoWxBzokK7Wvv
	e3khC3C0V2TheYtTNVLfv4hmHbY5RebEv9Zy5lcl+4mc7tv1itVqlvuvndo3MlVNZhGDWwsJH6d
	Cd5JYCYxcXKWY5Qy+I7gUvT9mDStb71zblGOcpPFwRk5TyBwNqcr41lPEWvKfSjLcgng6a4ztuI
	w5kOMN23IFVHiQMHlBZdGQK4s88Z4q8VFp0lRFx+4/aIK9ZiXmHkAHTdAA3RuCx+hyR5JWRPQBJ
	mNF6jiAH3hAX5Ows3sk24jOnmv9LgZHHnKISq6jJiWOPiN7P2aRoVUSi9t2TlkUVyYgJl1
X-Received: by 2002:a17:902:ef50:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2a1c99a9bmr82532235ad.28.1781086883340;
        Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
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
Subject: [PATCH 10/10] ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:21 +0700
Message-ID: <20260610102021.83273-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032124_055178_F5A5D670 
X-CRM114-Status: GOOD (  10.70  )
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
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index cb9beb172ed5..a058973662b3 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -463,7 +463,6 @@ static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
 void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 {
 	int i;
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_afe_i2s_priv *i2s_data = NULL;
 
@@ -475,7 +474,7 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 	if (!i2s_data)
 		return;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	if (enable) {
 		i2s_data->i2s_out_on_ref_cnt++;
@@ -490,8 +489,6 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 		else if (i2s_data->i2s_out_on_ref_cnt < 0)
 			i2s_data->i2s_out_on_ref_cnt = 0;
 	}
-
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
 }
 
 static void mt8365_dai_set_enable(struct mtk_base_afe *afe,
-- 
2.43.0


