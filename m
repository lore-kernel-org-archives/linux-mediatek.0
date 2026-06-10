Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B01CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=; b=o5UwMS7fgU83I3by2goAY4CvN2
	ZC6l+pA3RmMJnbb9pNa8SqMtwy5ZJX6tSE9B1lzeiIrdjjvWGXSDDVfkH7Arz4wsxMmm9cqu4YiJu
	N5NUulODkgAYgjfTk+R2nI2w5vNeGliOscxPR4UxAgTXfo7vZvj9whbPx/vU3WqajQFBAfk5xZ7YN
	yvo22jkQxSAruyh+TtPNI+SzNHV9Uvk5W6ze79uNidKtezjzCIanCBR+jyUUbEzN87gfpRYHzDSwS
	MOKQXd7fHnAGzMahzjoZyeEzxP5c+mcCWMbnYZ8Ujby1WA+MtBZdbzHSaWzEBjiCRxUszk1OQ/Non
	1fNXx8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3K-00000007Mv3-37hP;
	Wed, 10 Jun 2026 10:20:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3I-00000007MsY-1hrv
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0c35980fdso66057485ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086852; x=1781691652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=aHLNtRLzQUGbPG6sHIILz29e8MIVVuoF4iLrdPhvj7GDtCuCKAaI95MB0riAHUV3xc
         FM9Fj6P+MzfQGoU94SyDUKCj517070dmo3F6EhUBLdWFHwvY/ufkQxQJohNQKU3xAztC
         XI0i6GSQ25cbxSis8D0g7X/DFXIW5VPatYZSx4pGwBL7Edg0tkDZNFJdXYKvRfWx3DKg
         Z4dgt6BIUi5stSO92HKjJ5Dm47oz5WX+rCz2cYC+yoXGnyok9ZCwUo1sdRprFKHJ34Us
         Lte0YVe4Lh6Nz8A/+EGgE92ag9kePdaujI0Lgvca98T2zMnYqwLxXlVHmiE4CEGQY6/Y
         5VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086852; x=1781691652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=Vh2zYWxS87M9NG5eH96gOKIzXCiZ71JFAurXQ2R/ma1pe9ItOMczj1S48tG6FlBjZP
         xEclJlRGqMarM5Lp96CqYz3q7qIO/2WPtEqB0Hzs6PeuArmBhjder7qlLbD+xFuSaIvd
         K24DV1w67SCpoecf+fZXGblXQlS1M4Yz2pqx6ia/siqTxIhd9LbIB8CzBm+3OZUrp7gk
         0xsS89ipCAW8zpWQYbzbgeJHLg9xBDLLsQO+/0IX9le40/Gx2ly4PqG/K4GRsXT7vFll
         7hyuz+1LLKyiIg2Tn4KQxnBix1/9GbVo3sAHiCux2F0+3u/htmpYNz9zLBIkjPneIOIG
         t82Q==
X-Forwarded-Encrypted: i=1; AFNElJ+TRwgZPRG+gv0F7jz88vWlPQIH2tUNVkZOm/1pXJ6YZxQzVwJis0Twz31ZpRpWRf5/Z/d3dci5UScJuOB39w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Na9OQzQsLT2Ph1QG+aZ5iTQ9eN1dxoMlsfRgRFcEbTj+/7Cg
	E7GCnpa4yL2csZYcUKmb76RDKRYIJq4X7vjCAUmScPWTd3YCRlV7/ayp
X-Gm-Gg: Acq92OFqabJRkdd3Mcqf5cb7yX36FSsA4DS6wUstIGlqWGk6oP3S6/mX22PuKbnS1pU
	PJCD4dLC9MByVndIb6jb35Qbozjex30l+lKcWGTbUcTxqcir+7NmacSLz6helo5U0clcNDFUxDJ
	CwUyaDTjwRY1mI1JArdApdGvsz327Ocma8Yxcne4TzZacX30E53LjFtrFekvLR6cTKTQOK82Fvr
	nhV/eMpbqfpNSxLP5Py4MFbrZQC2brj43qmmKl8xRk1koKpZGjSWDNavUDGA+wGgabYQSsUp/Rr
	utaQOLFUFygqYuaozzhKQDAeoATCrNiUNP9PFWSkcJZD5jeaGk+RtTM0gCxwHatu4SJXnE3ttmN
	bOrBgLWgtsCw4EJOjYjyuV8kuaH1BLxhe9hLfJfEraUDXcVKSyRXWadHw4y0ozANkwOp6B1qt3P
	IP1ZmyzejF8VcQX0Und3Ou8Lvw3Ujs2QSOx3xsLz4+7i0x2VcPKB5twTNCau7b4o9wMVPG
X-Received: by 2002:a17:903:2411:b0:2bf:379b:53f4 with SMTP id d9443c01a7336-2c1e849511fmr304782305ad.19.1781086851765;
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
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
Subject: [PATCH 03/10] ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:14 +0700
Message-ID: <20260610102021.83273-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032052_474237_D1A117BA 
X-CRM114-Status: UNSURE (   9.81  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 9e86e7079718..aced8e7e920c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -201,7 +201,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 	enum mt8186_afe_gpio sel;
 	int ret = -EINVAL;
 
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 
 	switch (dai) {
 	case MT8186_DAI_ADDA:
@@ -209,7 +209,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 			ret = mt8186_afe_gpio_adda_ul(dev, enable);
 		else
 			ret = mt8186_afe_gpio_adda_dl(dev, enable);
-		goto unlock;
+		return ret;
 	case MT8186_DAI_I2S_0:
 		sel = enable ? MT8186_AFE_GPIO_I2S0_ON : MT8186_AFE_GPIO_I2S0_OFF;
 		break;
@@ -230,13 +230,8 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		break;
 	default:
 		dev_dbg(dev, "%s(), invalid dai %d\n", __func__, dai);
-		goto unlock;
+		return ret;
 	}
 
-	ret = mt8186_afe_gpio_select(dev, sel);
-
-unlock:
-	mutex_unlock(&gpio_request_mutex);
-
-	return ret;
+	return mt8186_afe_gpio_select(dev, sel);
 }
-- 
2.43.0


