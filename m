Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F63C44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=; b=g1cUotgIFamX4yCcYE6upnV8lc
	qndXkSkHcf/+bRp4QOimIPhZ/QayOQNxMwiyKRubewtasYRkeYy9lJ/3tXPPxgtdvZADHyvB3jiN1
	MZgsSrLL4Gui670WMIZdT6zX0ZZrKaHrJyArPW7Vv2YuXMlnU4ujoAGq/6eCPKGV1ODtB6fY8TX9A
	0EEm5b+ksoGPLwPPKM0BA/TYEpa1LqaphQ4N+xu60PIOVoFlYmQoBMVkFsZIJCNiquCvmuVXPp97J
	jCmMX5fwxt/6DxqaoREzPRPpzYKWOJLVf7yMRotQKhPhhP1fJLq6e/GN1uyt0fHugSC+Asp7ORfgF
	WnN1a53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8m-0000000HHIs-28ZG;
	Wed, 08 Jul 2026 14:20:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8k-0000000HHGo-2Hh9
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2caf4496889so5140425ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520442; x=1784125242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=CovfaRZaAlMxhZeFQ4CyfvaNmXqokXt1ja83Hn6mcV/2E3PNko9090BE8mGNiS4l35
         nc9jx1M1+d1H5i5eGfxSuj+UJdBUGZoONsRxtWIJfGiRAaLMEPkNhp9HFy/3szD+Bd6b
         sVRTmBHYEYLcA13AwU/FkX+LFK/5BTOd0qB8yYQV6IU2rI23baN486jGPXxicmCD02ZU
         RK2iDgNcPwd/A+iJJjJXi2kclZi4PnZFgSMiKXT/wP4GeGCom2zzlTnzFGzSkDP0eUGt
         2SeBkpbAJXwjPNt5X1RZ3shnS/bPI29xWqp0Ge7KJr8U1eVZ+xAKtltS39FTueygDkSe
         ueAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520442; x=1784125242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=bH5GKVK5LUHEqyMyvHUBUYoHMPcYefJ/VqCWiUrcyHzzwpd/HHlJcI3sDExI2FviBD
         AUbU3PBn/ab9cKcT1unxHcatbn08wDZ8ixEsmiyJeGt0CbouESve3I6+6dfwRC7iu59Y
         Se60tA/TZGscZVbARb4f9kFXtr1qSo4wdkPhZGLRDwmC2lCMNFG3zTAzg/i67Q2kli3L
         ClqMY38UcRLf+PmeohJeytKf8EsT/sTpykjmXnaenSPKi8c0SE1ih+Dgk6NXu9XRNbGY
         uO0nOlvJQ3vu2a9HUTP3tR7ylX5pSh59Q5+InS9M8ws0K6sgEb2l6rChfA78uQUi2bR+
         vhzw==
X-Forwarded-Encrypted: i=1; AHgh+RppA3Xr366uHNU6g4C66aquTsh8d1VNlCiXWxeoNdhf+DIxRxQGgYKrUsO66DdcQJdHcd9nd293ho8hx2KIMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbI/HK7xFLQoKUpApLHRet+K8N8iGDAD6uhZLrjO/ykGWFB1Kw
	L8aGvKRYrAceShEtbeekyPyqzVLHkYxtmfHKHhd+ZXkwUIoZBGxwF5ut
X-Gm-Gg: AfdE7cmwt7RVDQW1YU5woB8LENtEKlJe/2QP9YWQ3CvTJEPvh4+bS1axODBrPXRnxTw
	KReE+J8wOxLoqVDEH4l7lytRI1yb99N78SJEOPRr2RWoYZzE4jdu/zX4nJY5GNO5egME0M8VMpR
	wyqc7zMM6xWExh4kHGWBIGzWrUgJdhxAXJ37JN7XBOeI+R/iJDSeoFkTjzYkfMDfWPrDiNmXMgy
	SVP6F3BKHCnqICl81z4BXEcuM+J9kXnLENzFFyaanToziCg37Ov1j6s1Kaw5YQFNCQiixeSt2uA
	USKfyj8PcNHStpGTxzC/YstDkz/PM3x0ZadksdnXXug0WhdZtwexACn72GizIjt26g/ljRlgpgY
	mUKaFrxmTj5vzD8xuRLxYC97cYrUP2yn3o/AlBvkm1Ud3fge+Ugfx7tRdhfBxTcO0zw7it2e1u8
	T20PKMnfmBDjJSfmHKWD7Z+tzoZNT+9KDR+WbMdV2m4hxVYgM=
X-Received: by 2002:a17:902:ce04:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cce9f79c01mr26690085ad.2.1783520440899;
        Wed, 08 Jul 2026 07:20:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:40 -0700 (PDT)
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
Subject: [PATCH v2 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:19 +0700
Message-ID: <20260708141734.578926-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072042_578629_7909C457 
X-CRM114-Status: GOOD (  10.25  )
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0


