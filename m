Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86386C43602
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=; b=hXJCBgOvNCbnyXVeRKIS6uimxc
	WIq0jmORBaNl0dUMckGk4d7MN+3j9aBSSRBL96VYG6Caa7055ObtwiV3VEAbyRL+4U54MUhOEOgTv
	pY43BKPK+EWh0uvc/J4JYFHbvLhzKj4e/MjszcOG7AMnCTZ5rwv3NItU4Yf1gVQkq3/pAlTqLFxFA
	uYssN7vPjNLqW/wnUJbs4/UFCjXASatPIwEaq28lS/k48K9y4pueQLj6qgk1t5b9lQAVLvsNvcOY8
	TicZQXrqQQ+wGKW3/rP7cn2dLUnvhTX+/QfJE3LfVZ/Eb/ckLL//L+kBgBsNIexgbGpXVo17CwmHl
	Q6eAM/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAp-0000000HIz8-2fD9;
	Wed, 08 Jul 2026 14:22:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAa-0000000HIkp-0cxE
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cad4170e8eso10223265ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520555; x=1784125355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=TDEVrxpR2zIbRwQXqMCNVBJoml0M/7z2YBzX1SWJfdDpKvXNu1PDAsl2LrPiKtUdr5
         pnEVT2Y+d5j0wtda8kUGzl74DSRtjmElGeRTKut+n/am5Oiv3CKD2Mono/4d6kS8gUky
         aHwDPk40fztFqWNNABvxd3tTO9irOFOIkFCmsx2C3WX+0tuMUkHNA9MCmGADzh+yoGYn
         K7c2JrCCvZp/wSKUxdM/15Ow7JL8sQNCJjMBd79f3NyDBsG7e8A/WtlzW3/l7dZX/QVv
         fkCeIC+HC4jiWRQlQBtQRWuguzA0ayQm1t/0MTB06XsyQLZE2MuV97cGCC6v5VY1odfD
         Sp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520555; x=1784125355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=AKKFw1EzzO7d/Takx1eGAh9Om4ZZddGP7l2MI8d7cfcwuMWlKqnVdDMYQ1VKNApUg6
         bCfbvKwhk3xQ637Laq2AIwHMXSzjdMFFrI3gxCytsHf1rNSOWOqIyBXrCmx4OQw/6Sgv
         erI/XSLH8SsoRi4lIBpsmLmW8Gb7pjYXx3oAJCf6nvEzkY6X/O8RxCjWEJct2J4/KW2U
         i1bT3FG1VYv3kac5UVZ6xatyLHVrKiNFhZKP6IC+819pGCfswIsgwb3slodaySjW/c8Y
         Hg6vWfKpUA13y+7Z0mWAPTqunN/zPSC5Lb6/t3S2qPwdFkVadRE2dpAnhTljL34sRz++
         TDig==
X-Forwarded-Encrypted: i=1; AHgh+RoMGjnwMZ8c00QmYxd/97Ws4YKpb2IgNwxzp5uYM2nWgn9FQYzqIHbX/uXKZm3jMqWrLAKbIpwK8xcOSPv7gg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7l4FQij6eN7EeIcY1TkU9QBAUUDTNs5xII0secPqIw+vXzXVL
	tcx7d/hRn/KePCFh7W+gwkv1FGyIprJLnB+AXHz4mYhaJhYH0VNqi0IC
X-Gm-Gg: AfdE7cndl7Id5qlbPGVFzbI41m0Kjz2qtwmn9jiEZiFvQBV2gbEkVjDn60OHd8VZcul
	1gWCpKj59Aet/c718Vjuy5bYE8N9y+JWWF7GGatTFyXWXevN6hzkzE2lZDJDec3og2/ZD7ookw6
	Hc1Ht0N2Vf6D4sFA2mErZozDy8WTvYdMt9w8Lq0lO41CE+ZSAiKRfseAoSlKY2sRbPgXoT5+zpK
	/0vHgKiOpgwfKAprGsaNx05ruC13JNInO7Jcpn9fe9EOwiTdh730GoqW7NqrmIDE7+DPcrR14ok
	fgvixXqQq+wt25X4KkiNDY4SLp2uOEXXAgzPakpz8TZ+gqi0MIJhva56BrJuEOt8Fg7LMlX9y5d
	yWQj6o7UFRZIeJni6uGX31bfVAOISFmYrOx4x+whYcXqVv3olVK5UcHcc9kJgCR+CZ71O1jMZnz
	IC8CEB2yvzruJPqPAGS03/MJ8RWUTGdDJdR70dWFga9tNHVaM=
X-Received: by 2002:a17:902:f68a:b0:2c9:fbde:ab66 with SMTP id d9443c01a7336-2ccea472721mr33400315ad.37.1783520555235;
        Wed, 08 Jul 2026 07:22:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:34 -0700 (PDT)
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
Subject: [PATCH v2 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:33 +0700
Message-ID: <20260708141734.578926-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072236_210137_EF4FA16C 
X-CRM114-Status: GOOD (  14.03  )
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 02df04a0ddad..f4f7fc306ea5 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -467,13 +468,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -495,13 +496,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


