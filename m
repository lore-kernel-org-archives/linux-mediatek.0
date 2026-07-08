Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4CEC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=; b=bkxPiP2tI5825PrV3qOa0wLcH0
	7Y3maPB0QR3oU/UCSsDMJ026hRsNnySoMzC7D4a1qlWczxMYR8W37Z+yEMjvLeOgGH1vik2opoJqR
	xyDvNB/qNuxuTnapL/5pSgjCqh/w2eJRk3+nP8W0/KEgqBsA6JphfHsRjhdlh52E1U25Z5JrFRUc+
	TGSxJVOJVO5AHMY/buvSwoIiujJw/o3JWJaS3Enje3MDnj4kmyfGHBxQZ7ihd14KxoWwa0fCR0NY8
	Ph144tKBDF3yatvATm66sdtqHOuD8/+jq54AqO1XVViYKXeEgl2MwbhZqvDBmI+TxH9zVAxX5/aaQ
	R4cLVL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7i-0000000HGOW-11KB;
	Wed, 08 Jul 2026 14:19:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7f-0000000HGMJ-3e3Z
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc8e87f29bso6252815ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520375; x=1784125175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=N/UQDz6I7IiCUT7S1qwX2QnKrnju51QnLG5t1amTfIxDSUbNgOt6g95RTDEMWNFaBV
         VTVsWTLtgFRj8Xam7eNi2u7KHGVk9eEVSh+X3jcinTebGFLTPgubER2RUSyoMPvRA1J2
         0c3m7NfhLXKMsdKUxLP7+BPi+Ohx82fxsUjuveqkeKqIRwSrl3nwLFuHZY5WmuuN9p94
         mkkhqytFdDI9Y0fq04uTXkkDMYttd3TAepemS8D/s66ZZVegLKO6rjJ91/viEmh3uCB/
         qzfhG74Vud/9gpkAyrE8LzAQ5DmFermZx0+aNy2eKL2VW2/YhUoVb44YFbvqoo1evTGb
         jBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520375; x=1784125175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=b3BwhpXDJijVMOr9sdDMDgJCrmFAInMnnoI7z/EmGEwWyaMeJ/99djhMEhW9cTQfv4
         0ATZBa0tRKDGbhn3EXpY3I8u8d8JCtm6heYc9Gepx1KpUk9IX710p702df/horq9Hu/g
         4EU15h3wlEzSs6xNMdY4d9DmWwyno4ZpzwtfGMB1mvKif6158SW3HaA/hSwF/gybgYRM
         CUJPGG+ntcRQiolpgx/9I7RrI6l+vQHxLim4RQGtRHBtay7CqUQTYgQjK/rpbGJa4hUi
         aKalVCwxWm8JOuLVe0GnmCxU5c8vFRWJjP5/ADWgFdLuHapmQ5n8TYs3WqeOybRBI9Az
         MIaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpe7/IihTm273a+QsRXk5qcfzD8GYUQeFQhARPr3X3UOEba8N/BQgDJP5sfzeN3r48n9BIE5RE39QF/15NLKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz12X2DBT83hGrq3Gwh4z31RajZFZWepjNZ87wI2daIa+hJR0eq
	pzlehzOu+F/0ORrZKUAsQBwapDoTlmrdvcCSv40PV9GdzPAWZ9PV6LQ/
X-Gm-Gg: AfdE7cnlapyhS0CrKxMfM8bFTObtmYSQu0Dgw+1GBUeh12PORj82cQfNvFa8mL/ECd6
	Lld1gdJ/sxDoO9Eu5xiCeU2Euom0KNl+ilafEJhJsvoCqw4xqhMoe+pjKIvNkTPNYmVEVi+k+/7
	RFZqwV7ItcMQLXz943LVYVRv7eIduCUZcPXYDDe3olOw4dyPyF9499vagVtISyaU2BcbKi9mY6G
	2TFyDQYSWeF794YTyAafoSn1fA/4lVaEioUXwpSYu3LSjrrvthV8LwM1PlbYagKYGeFjD09liFB
	5Zlzg1oGVuwzj1szuxKAMnapFFqIGQ3MwO6iHDSv0rKJZcCYZDRi8kEkQYG0xBm5BsZJKEY8OQC
	c5lXMzcs0YeK0s5yBnUDUqxPQUtyg6YkC30Mr9t3k7ixABJ4WdV/cbB9A3JkQYOQPcz/e7MhjSR
	V+tyex3SI4MxBuIIMzvbz3Elb25D4L+WbArstJmkZDWLlLU5M=
X-Received: by 2002:a17:902:fdb0:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2ccea37bde9mr27502985ad.28.1783520374943;
        Wed, 08 Jul 2026 07:19:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:34 -0700 (PDT)
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
Subject: [PATCH v2 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:11 +0700
Message-ID: <20260708141734.578926-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071936_328421_7529CBC1 
X-CRM114-Status: GOOD (  13.98  )
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


