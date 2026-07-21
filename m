Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE9EC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=; b=yitgnU+EJjWTjgQ/e2/E34ZdHH
	ZG5nXLOUouTHBezfPYrk90tZdiUs13DCjEQOKQhg3Lvw4uqEAYvr2jrk6DpFcXwjBC+oMGjKRzaNd
	cC2450q2ebCZ7b3VFcvlYLCBCFzGMbkKOYT3vZIPnaCE5QqhIqoJF0XuCe+4s1zVeAXwjtUyMyPyD
	/00EIIgJmO2NNIuGIxEuhwbEBWLLN4LKvBmP82i54Rt+d0acXi4DoLxpR+Klop3pBLSOR7DhQZlx4
	KX275Tc9Jgzmagu+JEz5MOQEC0m1GPhhAfGmtDgxtNTdxUguvkPbvbifJIeRakuQ5rnEbCGq68SUt
	fn9DTSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jV-00000009B2d-3Z6v;
	Tue, 21 Jul 2026 10:29:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jQ-00000009AyC-1KAU
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cf41bab353so49365605ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629787; x=1785234587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=AqAZUCPnQcgVBO+fAK+z/AFRybzxmXa56hy1mKBcEwIIXQ0C02dJp/Gz478fS+GSRm
         5Cg/Im0vtHYUH6d1kZhOmuJ9L9wPSHhIElqmmaTAF98lW0wOXt1aZn9alvrXSF/N2SQQ
         qiMu2FY3zjosqtsRlPJXydjSXgcBO0OoomdE077HfD58AP/HGheAAUs2kvjuXKCo/Ud4
         hITJFFRCnXZ9j3NpbYZH2GacCYTp0T2RMont4bUJBRq1655ThMyrupEYm2lCzwk0UF8h
         Awl95qB4Ur4W7cKugiKAGEOukA5KX/jyQmllyMlJJrtlKozMvrA2rfFkU1WmztZPLn3h
         VY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629787; x=1785234587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=maJvBx67pkE5IBCTACtQ8l6q5pZj58Jrf3500eyrJUj5K4lwVcyGTGjAkS05nxddX9
         I+JRhRl8nByeRnBUgv++yN2wffEw3mivvY5kYtbLMEyKgIAS/YppZFAHX+e30iw3q3M6
         kCL7fJRv+djKGkt6Zo/hfWXdis3tNGpCL+UpgCJZ1z5QAAinZRQjtFldByor3fg0+aNl
         BrmNARzdC+PD8IoUpT90iezzQsg7DAJ/Dw+a7kDEsQ/cSMmEa1FzozZqXV4Qe4e9Enkj
         A10c+RNCDUc6L5j0vuqAnHOfF2ekvjiFATEkmf2IGjRstzwtqSG7yBQ2O1ngC2pjlQhO
         7hFg==
X-Forwarded-Encrypted: i=1; AHgh+Rpy3i10273jkHH39kmdcWZO8JqgRUvzVeUPJQ1omEGrChdPGwxBSFO95zuy4b0ZxYMcPYkLzS0flASPycvw3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaLZLp0ryooPK/zNpBfJ+UNQ+L8s4sL2Fs6LdNnngr/6G1MX2w
	6GP8gBtNJ8g54NMXbD7ta3XayVHVoQowEmzMKEeGwpbbeGdUNnzj7yFz
X-Gm-Gg: AR+sD101KYKjxrYjnouL6+si6gQEzuIPA/JeURZDoPDIA2IRhrOwsXAp97poikAIsEP
	h+9v8QuvxFDruLpFB57WARpYYEEmnR5TM6cb5P3px8wgMR5o50vYL02o51wLISiX+GfkMQemXcQ
	DOpPXpyqYwhgjXtBJ6RPLU10bzG+n2frYwrRA39tSlkUClDEYAJLxI4e72A+b/zOLBp7nfH5nLP
	6DVdsUo5bLWVvBzFdWZmrI8+Pk9YK5d+MFsW7BCEwyuDEGNAS5dWHtU0ZlJHjf7xHIjuql/5KKM
	TYwKjt4AUSOMSxrxRdQqF2azCDNz18b2bILLX4p9b463ZFGpZJrg0F5qGueR7tQLQYycdT5iaJZ
	AcSXTEYBW6S/la9vJvz+Wp91kdu4jo87GMTGqQ2lwba4R3QmZiE36uwWNMKiYRqDzAWMg1DJ2qR
	79JGcUD34gwVPc+0n3iVH8g529PhSwutbq1JWF
X-Received: by 2002:a17:903:3d0e:b0:2cf:6dba:b294 with SMTP id d9443c01a7336-2cf6dbab68emr73742545ad.22.1784629787546;
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
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
Subject: [PATCH v4 26/29] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:57 +0700
Message-ID: <20260721102600.523199-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032948_392673_584AB144 
X-CRM114-Status: GOOD (  13.71  )
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index e23501ed87a7..c50e74e20a88 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -427,13 +428,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index d6353af07380..2218f9918ae3 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -403,7 +404,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +451,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


