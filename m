Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC612CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=; b=Biuj3tBZ4RG8CFZGoqRYA5MtyC
	Vw3OQSF49HqVhCGOGO8YYdnSkn92CX6KgDytjL+WL1a20RrWeKgfi1QCfVtyvWAWSua98nhvQFtwP
	jz2buQEnYoX6l3xPoNiJA6EiibU3XffQci7aBiZBtXoNu3AigX8ekXQvavL84LkFbYfQAW/1NZsD6
	un641OT3UudgpIw9LoY4sy9hy4rBIy+IYRioeDHK0Zq42GwK/baSOqaLHXhbiNnxSFVgtBxvDe39h
	g/5XTmrDUDuNXHw5+FuM1D2frXUNlByvkjIQxkDUjy782tG4V4c7v33FxsA+ruRyAIAMZNRjQMKSn
	+O6oiAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3C-00000007MnG-07Uc;
	Wed, 10 Jun 2026 10:20:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG39-00000007MlZ-3KkO
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bf1cda2b17so48787725ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086843; x=1781691643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=FyqTF3zF6FuQLcVx8k4ZEh7MtoAu7vM8sQeIqhCKJyxyeC0uu/odY5JCOMwI7VfPyk
         1pppjL8WPCybv6FUq92Q8YE4WzE8ALjYPJi460M4WVWJo0kUahr/Qn9yvs/5yn7XsyfT
         HuM7eT7cMqO4dWTwI0GhfSGr6BPBdo6oAeRssfFRL+k0TCeGmu9Y0ggP7b8UHAyvqPtM
         Z2sNKg/MUSKnXolFYmbida2//yevvoFdzfkBIrfUBB14IQXN0tCpfW+Udw4bTaJ1anM6
         uZv8+q8sD10zAScftlp+cW3AWn6T3YMnCkEWGieIAJtYhr9c19T03flsfXQHCfb0Gt6h
         I3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086843; x=1781691643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=lt+XuUb1S2VeJKeqDjbDfKwBGRNXZcueVr/nKo9GhUyaecCQodKTkEE4IxtZA8Gq7N
         EPtzGGAeKvwRXVXLdIUe18Kd/cR1CA2sTTvHq51M9u14rnzfw5R4wo74dp2QbtZydjEg
         UQSDeM6+HuPy7RHVnorrcOimSOpptKK2mEn5c/JilVVrNoKRNGFWCVMHoGu6rECJ6L8Z
         XpRcNEgGSsEUkLTkX/BB9w2jZnRJvmc0ap47RNI0DDulbIILDn3SBknAJXRisDCY+Rbg
         M/9+RaV2WH57Er3TMCVv/QgEdIGTQnk/Lhmgz42bt8j9JfaVg97V00spMoBZVyCTQ4D/
         q2LA==
X-Forwarded-Encrypted: i=1; AFNElJ9m0MZlHCotkfKYqhXnYcOfsfJ8+AVXYHYBDKSL7qWJIVIPe7y8jhEZeAPBn63vCgJiSaxxO6yKvluzfFMXMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNgbZ5/0JaLndYsvVnhhWeZ3SFsJcyEvdOnNVuIa5qPbt87vjD
	qYAAKTsE8TImQt+RTZnjtpyFhoBSO/7gYBGSO1A5ccFVpp6T2OXW0ZWj
X-Gm-Gg: Acq92OGzIEk3OiAvqwtnRqQnzuuDuBk+Mh8+NLXk7cFdjbrRFlTnAmdPES8uqAn7D7o
	9HRvQGHvGLkhptCU5U/9fshNNdOPDONlaxbxy2T8gu0ME6Rkhff9Ofaq2q1nvcvMjRBaRb8FEpy
	L8urAZ6lMezpJEwj03k1ICiUxemfbZOgpK8yKh3XG+gBXwc0g8qOZ0C7bAGLGC5aRidUaEykh1L
	NmELhHV6bQ8vnSLhn2arvFVIKP/ANkNnaofG+AuldOPHRGdg84xngHHOn+pxY+lmj1wy4ye00sF
	DfJQxC0pJdVV+f35u/N6gXwkQw/6y3umBr5O//Lhvf4FOBUUkJi9dakCoEcHqqUCbP0ephxhBiH
	UckRzhdZ3pZjnmv6pHRYD330Pkfmhx1+iuGrD2YrCcloRO8cmV+TCChBMAA+h7jis/hyOOHxTW5
	fkw7GqK3gVflnM5Adu8WTnH38lW9IGma+r70oS0h2Up33IcA3bVZtgHs/IUPDiYtGhKw5A
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr220303605ad.7.1781086842787;
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
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
Subject: [PATCH 01/10] ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:12 +0700
Message-ID: <20260610102021.83273-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032043_830154_EB214A89 
X-CRM114-Status: GOOD (  11.57  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..2a20fa5dba49 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -292,28 +292,24 @@ int mtk_dynamic_irq_acquire(struct mtk_base_afe *afe)
 {
 	int i;
 
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	for (i = 0; i < afe->irqs_size; ++i) {
 		if (afe->irqs[i].irq_occupyed == 0) {
 			afe->irqs[i].irq_occupyed = 1;
-			mutex_unlock(&afe->irq_alloc_lock);
 			return i;
 		}
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return afe->irqs_size;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_acquire);
 
 int mtk_dynamic_irq_release(struct mtk_base_afe *afe, int irq_id)
 {
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	if (irq_id >= 0 && irq_id < afe->irqs_size) {
 		afe->irqs[irq_id].irq_occupyed = 0;
-		mutex_unlock(&afe->irq_alloc_lock);
 		return 0;
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_release);
-- 
2.43.0


