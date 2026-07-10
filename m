Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B607EC44501
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfvB0lMuldB+u0jwzr6lQv/Vg3HM48QxhaQsc6Uk5yE=; b=QdjzZ4DMoJjyqA+LADsUPzTKxG
	5uPjA1crWOBR9aPD+WJFjNK0FPuQTP5u7UNSp3lIrgIZz42PkXx8lPVfiV9xVwdRmwQteOIVpvwAF
	2a9Mn3igc+sQ1QH02FlwoKVV6LIL1oHK0A3FOffsZtcHSrz1iL/rTZXTdMRW4wsosz/n1uKv8wyxF
	6Qbka2ylnQWJl6wZNnF1wJ5eZAvWXExbj+TU1mPCvZ9UyNbJIsM1cTlmkRmVp7tj9g33PEKa1GvN/
	G8yr7B6XPnHq3K+66G/jfuwJAnsvry9mmqMJJdwoT+C+yUhkGOSYWtBD3PHj7gSK04FjAYwW7NNhb
	o+tzmFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Qt-000000047v2-2yl3;
	Fri, 10 Jul 2026 05:05:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Qq-000000047tA-2d8J
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:05:50 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-848643382fcso446733b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659948; x=1784264748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfvB0lMuldB+u0jwzr6lQv/Vg3HM48QxhaQsc6Uk5yE=;
        b=OO/o7F8s3+7daioE77MFV+yUhN0bqaCW8xhODHXWvQWKAPiYYOwTswh1G31tVK3P3Y
         1Dw8vKCnbDqah79FQqDmK2wyjcMFYu7YYBS3ArE15azEOo6dItPRb1tCTJ6EzANXB1cH
         jYJPBuaZDwNrUVDQMtV4rsFillt7Ff4DTLkJybd1arFtl13iY9347hBhvsUbz/irAQsX
         4lChyshheG+63iv+o+yEh5uC5zn62GErL26mD+JHMDBT5zTgWovqWKp3a6t53u5zoyCt
         l/jEX05kfahYDy6a00mtIpubs28PJs77vUpaztOaptlexQhhOH3xK9tKEXzVLnf0/2ZK
         gezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659948; x=1784264748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfvB0lMuldB+u0jwzr6lQv/Vg3HM48QxhaQsc6Uk5yE=;
        b=mzBU22LzuIL3CaWA4hBMBEb36gD6QmAUYpaYZsDlhRZ6HOqObpsdF4EyA8EvTKLRHA
         jvXYGpQcB3tncJFScQg9WPFdXzOq2LGIfIDWUezdjf6MIBhOYRdxdbhvDlkjJvp1w0By
         o4vsz9fSXrphTrx0f8B8t8nxm2KgFkCHuxSYXOdnycTLsIf8EHpmc0rIkNFXp26KMg1V
         gJnWWvgk/on8vVRCWaK9gWGxL7NPEzWFOkpPT0gjPJLmfaEDkx4bCmBjUAUP9OzT6ki7
         gAembfhCyxdLNICoXJVEe5NFuXE44c1/MYIDBxNCsq6QtgagYBt/OE7XZGnUAlTKRY39
         Jiog==
X-Forwarded-Encrypted: i=1; AHgh+Roin8MensErIaQkfcA5ZT8n1dNrLFpRXBHiI54FfenfYdPnVl6ekrToTSUyBuX3o7weMIoQbL8LgShwP/wMYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDpXaj28xUsC6WEpbLiLwECVUSaTiXNz+rMkLwmtp/kgsEVIv9
	HRBTW7tsFPd56D8gbu3MaAB1lBJETd0PHpkcN8GFHdmdB41L6vZSuha0
X-Gm-Gg: AfdE7cnfzr5Rrrawx3Vc9biaTuqCEbbklV3cq9bLEtZrFSnatUWQ0GOu5Xd6r1v+I4D
	BsuooFcLFc0iEmTCRbQ7+j+DLGP0+zyk5M0y+/aUZogGBwqpi/ctXyRYRnITIAdf5vfwvdiTHzs
	+oltaH+2YDIukCWlpZNrDgkQfeJC3k7yai+mmmKPg0HvKBcpzYPgRdJbTd3OFpB0nYf0iseqJiA
	2oSuX5nt7y9A8R8UDeijJVfZvgeDANmx5htHAwT4omAjO0HKo8mKDsCmOoen3tTZmol1q85aPED
	YPAuxY/uo99TILR9OVLOyMW89JGHg1ZeCJBc5j4dCJ5J4sflkUV+fxVa1YWt7gligQHqVZaswp/
	7IxKHvRp8QycFT6ge/YUwP+Fy9iAGm1+gbXH0s7tsdCiJFApTWQC56WPEHryXe+L2liCCx0/ltO
	HUS5x7me8fktHPgSZTr/R28Bhe+mwKtctveDjAQY1sOOOWEzs=
X-Received: by 2002:a05:6a00:2384:b0:848:7071:9856 with SMTP id d2e1a72fcca58-84870719ad7mr2037063b3a.61.1783659947725;
        Thu, 09 Jul 2026 22:05:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:47 -0700 (PDT)
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
Subject: [PATCH v3 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:49 +0700
Message-ID: <20260710050511.14439-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220548_671642_73E2970D 
X-CRM114-Status: GOOD (  11.99  )
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 1122455aab77..8c61c4bd49ed 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -500,16 +501,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1091,9 +1095,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0


