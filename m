Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3FCC44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=; b=n3pD81XIRQ1YP5puyfWP22bfqC
	AMBj5uPAl++WLk7eHIyIbFep1V8xPbGLgBC24NGBrvtD/l5nvq96LzpJvKH4LgVsZqZggXBPKh4HG
	8poUdtC+q0tef3lwgmdW+doF+ryrcegwNdkaBvMl2+sE9UA351rJK6soB9RAhG2HSdnk6CKRxgImB
	hluXeu9OLSShLhT0eglQer78q9wRBZHZuO5JSs+wkayUQfgbowywC4WhZWACBglF43V87zfVBxnjZ
	Ut3NQ18CgvsZcZvRHgYIKqmdxdJyCZpDpRMNA1X6FWXV6jx5ZzVqMegSv818nYZVtbZPgvPkhNN5Y
	yIWmM4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9Q-0000000HHlW-2Kp5;
	Wed, 08 Jul 2026 14:21:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9F-0000000HHcd-1n2V
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cca0c5799eso6336765ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520473; x=1784125273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=PoOZvZ/oZl1Xi+DB50JMJEjFxQAKdk55GfPlyXJsXndPKsJ+XlyONmdFe+FFZDUrYs
         o8rNrD2up2q4DqSa0rpn9Q690S2dh8j+w6W1Ptw/B4sx4Z/Yp0CMWrBU/QySBDVCbq6C
         /L5PthRGH8jIZdmNL3YUMmOfjhfgiS5q6bwajhi8IlVrnuK22IiOaOrEwjhhd7z0RICY
         kiUx6HWhQsP60ZSrhRrEC/bVn3eyGiOulGLmkFrjFhP4E/EimEgT2hWS//zDVbvuiH0E
         BwVwLGeccnF9n0Deg8PjUMvlu7UFUXQDG0p2pIygS2zNyGiPmnlPKFFBKkuBR2aGhdxs
         fpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520473; x=1784125273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=X79T4OmDo3r7fQNbQPTXSzScyNUSJo5BzdCDkgSgWPtygd6tFUZ0uxj8xiBhpq6ozC
         k34J1MAwMvWeW6U4P769rjsQPWo0FOfngiAZdGP9mkgDq6QPTodbGAOwuWo08PbzS5Wk
         SS1yCzenJSkh9msptbkIrpA48ZhzX+1fQvSLf66OOemTnaUQWN3hUIWbInsQcfBiHn5E
         t3mRW+yaPnrgRqK4zklLc/UVh1K23PV1m5HtfOn2AyqV77LgZORamnsz0caiEG5/+1mj
         njDlXoDAoIBnYBkKPFM2UoZ1fs6+OJ6+GvK5+CmmQ1f79mXhtwiCSy8ymXmBqoOEmeAT
         VY+g==
X-Forwarded-Encrypted: i=1; AHgh+Rrm1BI7aklp+CxgwdIjfszMXtV1VfixC+h+TXJnzPfCuzgyTnjS4IIn5haNvyfoZELc1movn/vRiWO64WlpNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAvmvoIqAsPK6i+jB2ell6+J556Vyrf34LPiqn2B5pfx+xsU1S
	m5QpYVm7DBwphvenK8A8r7dvN7EncHISrefvdFlJ/qcqNexYFSzCVOsw
X-Gm-Gg: AfdE7cmxnkRBohSiJdU41qTKfFQGnEf/BrzrIVhbl+4Ljg9FMcE52Lsb6p8rH/ruGY2
	aj0sOIFDnQkidX+m+tAt/wbvGAa4sh+Fmvw+0tVySYkq5FfgOe9vlnV2jSReS3zDal/rYjlq4q5
	U2nRVecxHAXP3YR5akEKdV5L3sVYT0AO0FSUPttA1ynofwObwLgjcCdpYL2wTwl9B9/duc2m/4+
	PP2vqrda0ur6z+apOgPJTkUirMOYTQZ+8bzwO6BRWxRHhhkqiqnAAbXzx1Zf7L2Sgb0HTe4HAXM
	j9RGXZEpVsoQ/wzMksy8IYHqmJyNtD4aIDqRwo+Zl/DGjQSHxk1incq8U/JBpdX2VgMZpCGULCA
	mvZX0BFvcCvbYBdBnCWZB7UQCn1PH+9aTFSsBZ4yrkzkgy5dthWII6Hw5EOGJZUCqAZze6u5XA8
	XC7tz0n1YPE1ORjhgeKmdZrdET8fjg3wmvRmAgl1mkVHKJQmjhgvC4v/oyXQ==
X-Received: by 2002:a17:903:2307:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2ccea47c7a5mr27721945ad.37.1783520472703;
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:23 +0700
Message-ID: <20260708141734.578926-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072113_496961_824F06EA 
X-CRM114-Status: GOOD (  13.77  )
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Herve.

 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


