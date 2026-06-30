Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A181EC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=; b=upe9ds7ngsOrbYhExuRPGIvtb9
	xBM/5Yodv9vKwXQW8E1FpmDr4ll40CHdpzc5TELk1+Wr6YD6vmYN+v6aIY6nQoCkWegT4TI5ENiJ5
	t+PVpnzORRWvUnpO5Q4zARvIn51UMAnZKTFNtdUbcH9D4C6QXF4VODa3mQ+lRzuZvRq4+cMDKG1qh
	dF89KfC6seVHHy/1KXNQWChn6dQfFw+lRcARBtrNfqiZ7WWxeMiKMJbYd+gzRNgKvpVzx07a9mosw
	SxcXnLIqqoPxefkDfcSY49+UqfAMVVJyvIbphn/fDc/CQsFeZCJyyzbO1U7jNrXbBEsw/QNqqRPh4
	kiys51tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4R-0000000Fy5o-3Alh;
	Tue, 30 Jun 2026 06:35:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4Q-0000000Fy4h-0e7P
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=; b=ZQKscQG++mmEEmu061XrJBIQaI
	4MqJZcMn4TlaPKUNkVcgfIzGt1iLBkWYURlLcQZd3Ib+9SN+HMO/MzoP36Ob5su4khUT2Ba/279Oa
	eg5xZPXGYCzcrk6YmYgSfGWl7DBgICcN/9uJxRmdm2hnokb5dmKuzPxB1rfZxr94SKy383h3wveR3
	XUNNToD10+wVx8W/NXbDP52ZJy6MAHefHKAwQVNmxmMsHWHmOx1MzJBxfLWJpn+a93VQRG/IbtxqL
	4wEb7+z3uAXV9GsdQ4+8q5Q77az7QJ3m+ExL/q5rD1MYHMFiqdg/Kq8XNPd8RoBSDqeG00pTIAqlZ
	uIWRzbnQ==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS4J-00000001Z6i-2IYb
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:44 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so772364a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801337; x=1783406137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=YOY6nfStT6+PeASm0OkoxbNrzs95RU+CFmpnP0GZIJIKmX5yukiYh3iju1Ch00c72/
         biq/fILuMmnQ9GF7iT1lMK5O+tF54oRmBhpxg0T8gFdnYfY8qwQ62rnq+g50yS1ygCuo
         KKagIMo+Fdjl57lI1AiRMPuy1cD9xb6SYr8LKNhYWEj8IDR3h/WSAumE5egjcNVqDSDo
         Hx4oN0cCDN0Uvjc6Sk2Rx1a56mXLBzDjnbwDIG9INvjNgSxPAZnf251TqBx58GAlcbI4
         2pwkdGMTIJ8+mv9lqGxFcv3UiIf7+fj0r0r43FH68mzvjgQ9qMo6AP44xVAbGDEzUiMK
         OKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801337; x=1783406137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=JcSBPgEc4Aos1lYOBmlyRadhcmSdl6GZaVCRYwn7uDoRQkdjqC2C2llNfQjGVXnUio
         J8qe4gSBJ5+9VxsiDxVI41ckOZrNKdDOPzOM4Sz/0XWdKl4mK80GOEgMosm5SYYMK39b
         GWP0D30J2L84w28fjC+vDfqhm6tbiDo3WjjZ84AI0s7GYdX7BJqlyF0C3dscSNHaPKqX
         NPgsdYQu4bu3QWvUKk7cI0NQH4FEtHS1n4RvejVwE/bzRHaHh2HNIPeXXOAGpCCvQsC5
         8hKJ5LKZqKHDmqjGX6RD4YRNyLYJMu7Ery98R32BX+svJZGvpB7vDM0DZvJuqA4qKUza
         55zA==
X-Forwarded-Encrypted: i=1; AHgh+RotVVwJlREd1xknMlgkAJiB/GFsgfZmBpQzmvXOPCgrj4oid/LH406A5xDyzn7OYCzd5RWB9wAork+CeiH5tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZv4TXJUFk60kmytGgMzSlItU8avcGEhrWA9aZFsPWk3zoHRXM
	dN9v74CBCmYffPx0sxtHd4IDUi5M1zUHpqE44OCFLlM/coQ9n1nXO7Mr
X-Gm-Gg: AfdE7clmSKs7CZYxtRg3lP3X5N+WP8f4cz2t8rloT4PsTc7zYf9INkUFHOkB+YajV4h
	7WWLCiNXRORfavbPa+gYK8g+zQdUYzIJYZ0Ed+U0gLKgsIj+XTdCXDRC0jGLse3/Yo578zF4O8I
	3nGSH6oBxg9uVAVRPdFOu4DYufjM9yLdjoE9FZhvC98uy/uuXiuF465zr97jtjCgV33BpoWvp4U
	UBFeJdkoQVUM2CC2EPtxPt4P8xOeDl7KfABsgCSSW4yNDt0477STer0UC0a7HLXTYOS1gPZyt2U
	b9vhDo5MksohlY3vRMsjeh1ZiKP5in3tK2zVgcdIHHraaA3mPDsrFgFsmwlCdGh3b1VSjFJEG5u
	wuFgepKalENsPnq7RghqnnQB26b6Stx4uUUjgXeqRCTjbxobcmMGvMzI1otTKvBx8mFrlQgkZP0
	vTopfhgCQViJWQ4eWl5eWOyS6OyT4447CJFkXqE7Ehiedq/28=
X-Received: by 2002:a05:6a00:1894:b0:847:888f:9b16 with SMTP id d2e1a72fcca58-8479eed1d62mr2006682b3a.18.1782801337316;
        Mon, 29 Jun 2026 23:35:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:37 -0700 (PDT)
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
Subject: [PATCH 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:26 +0700
Message-ID: <20260630063449.503996-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073543_166565_27946CBC 
X-CRM114-Status: GOOD (  13.37  )
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
 sound/soc/codecs/es8326.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..c5460589a88b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -6,6 +6,7 @@
 // Authors: David Yang <yangxiaohua@everest-semi.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -790,7 +791,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +846,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +855,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +873,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +930,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +939,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +958,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1198,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1216,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0


