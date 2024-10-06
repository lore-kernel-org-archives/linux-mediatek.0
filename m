Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E292CFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v8RbTndRs8Mr2poqllCCMfJYqEYtpr6QKfUt0AvEB+I=; b=Utt8vAuthJHFb8tMUgzWikyUzZ
	e8+lv3PbU4NDquMeF3LbVbQJkKACh0nQwoxRDQ+w8KbDxLTD1KdSHPd1cJJGXLJeaYAU1fyJO3yGe
	0JJXj5QwuZ6l+1fbcEt4ysd70B+nWK9Roap/THk+qDRakgbU7SvTZzLmlMtMk+IlT2/poTGg6bfyL
	4IDN2lUAxZOHtRWKaM0wcdsbooYw+EySqJ6ee2aucyVG+Zx8+kQ12mFghxxgZItYB+xVS4FKYorHe
	U0UbescSFfTGjOOvWpggWeZLWiPgilJSxmiCIjBywiMa/iH0j72cAklVOUpxlFjBal95ER9XGb1Lq
	I8aOUUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxR6M-000000004Yl-04lE;
	Sun, 06 Oct 2024 13:15:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxR53-000000004Qo-3qc2;
	Sun, 06 Oct 2024 13:13:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2463458a12.0;
        Sun, 06 Oct 2024 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728220429; x=1728825229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RbTndRs8Mr2poqllCCMfJYqEYtpr6QKfUt0AvEB+I=;
        b=LrJ86SVyfNQBf+ExSY15MD9yHDBOsFEDFvhvfrkftAawoc6TTwd5Fq/IbCKsVkp/z3
         XIa2pRXEZUIjRTSWVirb3b4Q978hAd5/kboAbIYH4marthB2vqCi1bkv0PcWCHZvMsO1
         0FMwtO5bBN9QKGBAVPcogqMfR402PC97InclyyxcKwGZnNHFwut/67Cr93JV6zVY4RsQ
         dkNy9TNmDpe/7ACCSoArGDFZBJ+xuftx/UxJqefgVJWjvinfQ+Yw0cwPcNh7/j7wXUrI
         MjQDj5DrWjkJKnZ+1AtSf1FOhZ1SrflZlYiH52OIaM8h8GXe/PlCjsoDo1KzcMAFufSp
         dD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728220429; x=1728825229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8RbTndRs8Mr2poqllCCMfJYqEYtpr6QKfUt0AvEB+I=;
        b=ddAjKPhuZlPld5GBFUIxOTPZvd0PSUm7LoNpEGE/ut5eNWwC7GPpnSVotAhJvk3UQz
         /w8Ho3HZ4+b9mNo9TQ+U9G3aCbsdM0CzCmCYbFkeU6oziQIm+C0BBgfvYJELZ1qQKkNr
         M6og7RSJKKdlT+0B3v0XJD0/rrh6XNgATaAGUjK9wkH7BFl9ElkTAEyGLs4mI5GpkIjT
         vvDBaOxjMjdYV6GsZ3QWzEl6lTRFz5xqEHOMH2E1KzvIMf/6d2C4rAagGPgzLt/NXqiy
         9a83NPrdmG5yu54PWxaG+y1ybSpRyf+V0PaGgLIIECdvbL4qJYVkWuGkyXfZb4HlyQQ5
         lc0w==
X-Forwarded-Encrypted: i=1; AJvYcCU4mcOgHcfaX+fEQCdiTLrAeeuf3eKl0+yCCAZArQCvQHTMH54WAXqEhUmcMYuGDs5dJy9CvLaNzN0NE/M88Nk=@lists.infradead.org, AJvYcCVYty9V67hZa1owX0s1aywnEZUmRf6i8HWGmwofm32KJfvayQEvk2Od+rrYX6TcHWFAVAL1WrRWRXHe0wo0m5XE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf2iwUiaBHFe8pSPoc5pIEP9hrlOZJuPKaKeno9oiJuFSVx68q
	/S9tJkhhTn3urjRJWTYVloF8xC5d/faHIb+HUpbSef0Ry862KYWg
X-Google-Smtp-Source: AGHT+IH7TNSZveAqC65bkebWCC7FHOuBiFSYW53Nym3R2L/efZPBhA72yqf+9hYNzgHlNZhCGxlkeQ==
X-Received: by 2002:a17:90a:ce96:b0:2d8:f515:3169 with SMTP id 98e67ed59e1d1-2e1e620ea68mr9386754a91.6.1728220428835;
        Sun, 06 Oct 2024 06:13:48 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:230:2966:38a7:3af4:46b4:a902])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e83ca284sm5117215a91.11.2024.10.06.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 06:13:48 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: pavel@ucw.cz,
	lee@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	SurajSonawane2415 <surajsonawane0215@gmail.com>
Subject: [PATCH] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
Date: Sun,  6 Oct 2024 18:43:37 +0530
Message-Id: <20241006131337.48442-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_061349_981803_EBA4758A 
X-CRM114-Status: GOOD (  10.71  )
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

Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
to resolve the following warning:
drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
error: uninitialized symbol 'ret'.
Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
access.

Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 10a0b5b45..87805c21e 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
 	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
 	struct mt6370_priv *priv = led->priv;
 	struct mc_subled *subled;
-	int i, ret;
+	int i, ret = 0;
 
 	mutex_lock(&led->priv->lock);
 
-- 
2.34.1


