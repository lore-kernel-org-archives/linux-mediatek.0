Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A80C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=; b=eU5JrtY9wz7zv0OJ8ENf3hULd2
	rybWok5+/jHf5X3fOedXNv9PicYAxPqtPukjmWi/0zqc1ww/4s3wLtVNuNvOH6rSuK7uqch6bz+ae
	qz1RtbkPFbPkOUD8xycq9e+J0n6oei4nZktMCRI40KAsWs0SUHRBUEW0YxHjrXC3BtM5Gdz5oqiyz
	8YOkM15S+q74K04crsPx+efbKP6b9PWpjnLzd/UH6VUesdCAAGuCt9Vh8gnwI+veahYcP8+Ous8/v
	Nz2VAs1vfC5JqlLZ2H3mf+Usqfevch8zAv0d/LxPDk0RwD/oLIAYDf/60/DUYDOeGXADK1GdyDhRc
	pvh+6a1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7go-000000098Im-22lM;
	Tue, 21 Jul 2026 10:27:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gj-000000098F2-2Mul
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ce98cb8165so49944145ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629620; x=1785234420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=ryiGuuEnXslQ/c4oLm4c+JeIGhKDoHFsqNf/WUMrXVeeXOs/rg3zm1x5UV47VcFFtO
         o+aJoCbKOY08ZvhdECUqaivYaXTf/M3CtHNus7Jh06pectt4hQS7NY+4ZCA77bmw15HF
         TYK3qpRIYLOZdIulPNkpgQnziduO6sLguOZJKMjsYKelow8P8PQqZ5iZgpUad7CqYPTf
         YWH/p+lzW9p3g+jrHQ/+iGKXbawjDP1UvJLOEwRXn9p3kMw5GwMmoxPsjpnS8jbgD+Mh
         7Hrq5ABcaYnfA+KCvZL6f3o6ldo2lH7q4svr0hicjOUYCy7wU6cWcD9QZND6nkxOMM1P
         +7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629620; x=1785234420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=MEaZRoIJW7rSwAkPxkDnJDd3jHkikiSamgOmLoz+MqFzU1XD12dLUopcZnpJ7hd8wm
         hLi0uIJDnaj+PZ4Yue6fRjtKdJycXwGoBcyF1VxdBjWIXaxWIIv1+NR6StfnT5TW6hxT
         XfLI146ExzNNyoknsVLcQN4lBdbh8uj7rh2QMqNeHxRr2aW25imZYWysRdh/Zl7vwWgc
         E3FZvfM7n6FU7V3ETarVug0ykvcqdoicNw9mCm+DUmnCcFXrfqHw5qefPJIda2bO4lgo
         ZXnVH7gXPBj0jImDwFGsI5Nx8K3y483rmHuBBIuvuanUupHfsuAzMtThPnV7tmwgqg+g
         pL+A==
X-Forwarded-Encrypted: i=1; AHgh+RqvxyRoap83q3u0Aivlr7t3zt3vbX89jcYiya2S2RXBhLccNP+o5pbGaLRxFPIj8wNFxubiRoA+bgWh6K91xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ynZ1pv3VQXxYeBDHb69OXc/UMlj5mAySTKu789lLIwPl8Lvg
	7CWWm78GpG1KZvtnkXeoJ6NzcyMalnKvWHChZEPfLLN0pMT6uTKlfv4V
X-Gm-Gg: AR+sD13WrBmK+nL9AY4x3ODL8au/lEoDEvMU+ry1UODLRIhT2GM8JUmt7WyYG+pgeSE
	0ABzs4FVSNU3uy1x+hUISE9gNpA616TOtWz0EGcqgybx15HJweIv53i4xp1Vl1LeG4Ixo4GQX9X
	xP9h7fWudcDaoomVWLYCaRIo6ukQ2EKbfLnH2pJDXIQwVzouU5OeBOgl3M68g+w8uqBkl4dyYdu
	ZIHOnZDfb4BhyIZJssNako5jrQQHx8JhlVeFRVUHj/ZE5L0EOIEr2PGqV6dLpW8gsz4+CxzZYKj
	Nh+MtHRjQ2Gyfw33xahnjyl+NX3GL+lL0HUVakeWyJF23UxAUsrwwxuaqxGvnOJ2A+AVo36+oE0
	NUj6JrL5ADvNtJIDmQokLeVSzrau/BcSk/5FmUVoGSChW/ODy+hY/MdPfG8HrXwWeOeuWKZBhpY
	Nbh1h0ahJ/yctV6u6uUu0TlpeqwrNoEi/MBCRg
X-Received: by 2002:a17:902:fc43:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2cf41bab3cdmr143685015ad.12.1784629620455;
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
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
Subject: [PATCH v4 05/29] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:36 +0700
Message-ID: <20260721102600.523199-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032701_607857_31814EA0 
X-CRM114-Status: GOOD (  12.12  )
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
index f574b3d6cb3c..a9863900bf70 100644
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


