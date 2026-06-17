Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4ACCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=; b=nLnt0EjbkO0Ko0BXsIjL9FGUfS
	gUhqzqlsG2LDnHjSxAxEo0NvnABfkmbgPn0tNT6l8pCbOb9nSQJo55h7Nl4QOey7B1vnAOvM/dtOG
	F9fMzrvTOIrhTk//MbJ5/SDWJaz4FTd/HWYeq33/uXa2lqAHTVfAxhbL8w/atw+Tv2zH52oiR48Dd
	4ZQxQJ89XZdmWXS6nkbSfrgBsvLc86fZhhteJWKJPEgTk7CcfT5iDdNrYyPdhaAabDyKK87SBcbwU
	BJonE5EdJLQZ6se3O4/Lh7SYlwu9UO2gVO9D3Z+QSN9KBF8rSknquRvxJrnEe0gSue+8JJrD9OuJU
	gA/NfwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZng1-0000000H8Rm-0c9v;
	Wed, 17 Jun 2026 10:39:21 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfy-0000000H8P4-0S7b
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:19 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3042a388168so431421eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692757; x=1782297557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=Lc4H9esDHd2d0hMSls/oXdimu7v9XA05k6pIwsNj3rzohy2LsYqzYO+bvYJEnn2VOk
         IDiRYfdMOhrMohoyugkGIszsqv5HgUz2XKOfxsdDSOZixHFHNopSDi9Jtsnl17v7oF6y
         Oq1GU2+D9uTHLBdVeSW60cm4/X9kpwwHewKFZcOW7+vmMG4gqMzT46T2vrPhunaaevqo
         zbKgELLVmaUqK9ZADowvKxQyMl4QowXqTQd0YOc12aDJAvxkhkr3UCIpD4QLt2DyVoHa
         NQu2D5UknZb86yB4bG3Z202BbtqeqEWmrQWZGmhiSBoZdfDvVn2uEJFdaIkO1BD3GMfF
         P3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692757; x=1782297557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=UeAQh08TfYfCaXk6NgwFncovJE7xOaCmgSoXq3EolJ6dpc7TvySq83HZmU4sRncL40
         lDqvd4PI08pUWGyzVq6MJrkA5+RTaBqY7Jz5G/gmf+nqzbILomgUHyy1zlB3SONzEYeU
         pqoPAlULJldCm00/MAU1wrhKfwReXr7w0aUn8owVPvIRbu6X6/e6LL1q80eoqxcnpKI8
         7kj/tE0KjrGp32baUS9zv+NzIl0+R3sM9Z6GN+pcDGMje7jrfvIZ7rkq2Bmrecpe8TVs
         UwVaPLElY5U5bDt6SUDxGv/bgN2qVr5ah+y5qeS3NCYOTsx+FeooHL6MNhT+OrV+RF3a
         4mkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZQZUBHFcKnnATHjmzWH/TrzwK448H8LxIK82NEIy0oirA2ewoBQnY6T7Wr7bxrnBDtfh2A2D0eNPWeCx/yg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/uDsZqxAdbIwe3UXwo9Npwh5FIRREpFr0Y7UEoaucZvVAaQ9s
	GlZskp1aHb0vNGtr6T8Klhow7d5gahQMN1Bh/K5zjrkNF7Qyalm9DqBD
X-Gm-Gg: AfdE7cl2fpB9UtsjtX31C6kyjelk88tVMrJsnRz5ehfO3MKlImsbWbVkNYEoZEQmFNA
	IZTAtGWeRsOSOU2guL+0UDK6qIMh+IKbjl5fOH/D7F/c103c8cniHp1gxyaTq0j6K95yWceAJPx
	VxTF/rh7yPGl4Iszrt9odSWydSnzmc2fMYRuaDBXWGu2ayI89b/5SRchDMsmj3znm/J6gAteDxh
	CEjsWraAEo/5rM9W5aqM+akX1QgLRegAmi/SpIhJdK5PzA7OlOthyPml9mhy8/vfxjioGTx+C7Z
	LcHkPbpVd2NlKGKW9t6UO6ha9i2aHDn7CDWX+TY8GTr0/YNAn+NBFfCISDIMfV2zQp3jFtxM867
	qXO3OjIqg4JkheY3B7rgTnqqoKgk93H4HZrDJrIhx7LLwYFo0tRqyPoOiHrImeO+gA/ShFce4pm
	//m/z6i50AXRcVbe2IqgBipdML1H7yNyNkuq+jWZnFv0/WzZI=
X-Received: by 2002:a05:7300:50fa:b0:30b:bf84:18f8 with SMTP id 5a478bee46e88-30bcf08d54emr885755eec.8.1781692757235;
        Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 40/78] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:57 +0700
Message-ID: <20260617103235.449609-41-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033918_143931_37CE913D 
X-CRM114-Status: GOOD (  11.45  )
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
 sound/soc/codecs/peb2466.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..ddbc5f34b08a 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1704,13 +1704,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
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
@@ -1718,14 +1716,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
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


