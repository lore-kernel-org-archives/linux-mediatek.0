Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D8C4452D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=; b=SIdYtizrD1Ldv5gQu4Szmv9ryS
	++qlBYfLzNz9Z+7A2Bfa5nUL0N0/A3mq4mX7IVR3fzkrcuy0/aQDvidOWxWUXx0sHF94nSH3b3f59
	gPIk11pGQoMh9iaNjBIHVhnQsbQULFTXJsn1kR9fY+i6mtHeFXxYxZa73VZD6Rs/5F5jOHA01reiw
	lxzkztT/N9e5DCRG/W+aZ1CPAPWCFqEx+r2tI9+pQvI0d6GdsmNamq2gBI0zSJfRlH+/CiVry0t+w
	Q6EodHM7WXU7wNG/Ja4msh2jMaLl1PQTs0DS7QQcv1l4WAtsy2jVfl5HG4/d3xd/Aim9aTuKkoo4q
	y534/uiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7j6-00000009AfS-3XzM;
	Tue, 21 Jul 2026 10:29:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7j5-00000009Adv-2ZpS
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=; b=PTzNsq/oLPbNNfWtTObZN23IxQ
	wSaoNVDfelMWMLNLlqncwCTI/sdFgDRTWujk6rT3M+VHw6rjcI3ZEq7qzOBCvddlbAsuGew2lAMjq
	0F82c2GAAHgecxundtFKZvbgXtyNy8Mx7TBL4g6XU0UkhpjxEP5guwzNvQEc+Dlwgbwm2dy7dnlfz
	UkJr4zFd4tm45byCtmlevbUXDc3Jr+LDnyyRI9b5lYUTeTSETGKCfh46EZQqM1j+bUqnEiZ176XK2
	9srm+PrZRobRJmV7PXJGuKf2nVJx87YL/xa4dDinK3jbumWK51eXZZ3I3aaDazWjdo2Vg9FqLD5yV
	s/+iatAw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7j2-0000000HRnb-2Mzc
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceed7018c8so51070925ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629762; x=1785234562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=OJf/Wq3/P4Je7P5AwRzYr4K7vtjQTvYLrHNbUiVTrdUt/j9n2Uvh8XxC2WokPuScu5
         RcQ1LBLlSUv3RuEyLosa5zAWeCp+1Mn3f2rS1s2ajtsjy1Sv1FdRSTkffA47QwvSctO3
         wirf/VXZl4MgohRif31rKpPD6qwugtJI047YsDzCrJZ/+czWw0Z7E2cWmZV8vkJ7Xt23
         6eN4hwdtoErvzgcaNhSzhFmrR4Be4qCq84hNUHq9kZRlIs2TgepYWfuNH0/BjzF5XRnS
         HybuB4muxjabVbZwl6/8AVcVMFbXQQN88WPybmpnbLQH99v05+kD/Z8SNe/mNzvrfq6Z
         ZiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629762; x=1785234562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=oygItum/wwtlkfA4bFeqm71Ob4xD0dRxce5/Sk/9pkzQg2S/E861r+wFpsxiVsYkt8
         AeUFq4qydUfhPKpp377k8+w39h5cIWf+kFwxbVfruTdog/uk8dh/z+sor2NJLzMmEMn0
         8bs4NvR6eqY7q9aDHlKlOenjcqlC8UQ0TKI0JzjoypwLC3lFCK2VRQbGg8F7zPJEaRG8
         +01WjzFXGZ33lcVTuifIzf1vyqJi6NtRMi9V5C8tb03qcAesZ/zCjxv818oXKncbKIK8
         V8VwcYMtqTkiWVAn3pqvyhfYz02yBu79kAs/DQnYJgKukJBdnLTTYq7OracULs6kHbPe
         BHgA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5f6pI9cwEDoPyrzr4L7M3eavo1mflaYgO8hNNZaXkI0MMwDBPn2gtMav2nJWD1EEB+57AUjI0VkONDGtmZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzInjlWar6ne2O4qoFGnb5DpX3u0Sk7Rmj6dDbXcPDSAkqYkwOx
	e/H/JgatVZjbKJC3QDPESGbWJlpT8y6U8JhFBuxCeS1lAApuE1Ysy539
X-Gm-Gg: AR+sD11DbDVc6bnjMhqvCzr4k1oDkV4hV0eACW5piMK/ATpLdoOMRdsdDMVJgNiPIqg
	mV+qPkitnFvJX2CmLHbO0hJuxKlAC5jdBTqFNTYNQ6+JDDHW9oFabxtqztNgAeIdxQ/8NsEkQx6
	SfeEsa51O9obJzJFJwMBzYFXqnJ7hQQiLfP96bAzpjDXegfoIuTp6FM3gg/w20TR/cCR3mWChEb
	L4qKE8r7dotDXAdah5bqTx6zgF36VM0DQaqDZI9EWK8rpO8srVc9d4lV/oQGBG6DlAeZqTxcVX7
	ZXK3zilxN9CPwrqCwNaUcdmJ+8yoP2OPRBdCcsID3yK//JwwM1R7SswK8D34B9L7L72UbHLAtI3
	dz2pV/jeHt0lKTC3qa2KwmIcQKvG3hm5g0yQ4Bv29iyM08P/M/MkEPDwQav8A6sgzxaGEorO68W
	HbsosCuAno9uQLhdEkunP6V/Da1xT79WvvYs3E
X-Received: by 2002:a17:903:a90:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2cf348917fcmr180302245ad.16.1784629762301;
        Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
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
Subject: [PATCH v4 23/29] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:54 +0700
Message-ID: <20260721102600.523199-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112924_722095_DAD4605B 
X-CRM114-Status: GOOD (  11.95  )
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
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bb449f08e30c..3ba0cc37acd9 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -415,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -499,11 +499,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


