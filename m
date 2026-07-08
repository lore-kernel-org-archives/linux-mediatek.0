Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54647C44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=; b=ctWCMPMerADdBfeK6bkE6z6/xv
	MGlH1invGwPztcxbGTONLSuUanSFIP9WM/rcYlVHZ1X+zOY4iLpEFINHlWwoIgeeIAS9zjS1DpswA
	WHwG/rJ+PMJawNct9fuAWgVewFjlaQQGIDdWLcy9i1pI1EzHEw3F+K4zyVGkksB2HXgxLADPzpXzG
	OebQgcvuEJc+3f6IeeBR/VlFyKp46ATaFG3GNDx9TcX+TUG+gtxvUqf59pL6cofK/M/Mse3jm4zH4
	DfYWh661mgy1Q1GzJGqO3PhwShEjwXyyx90nijHeclEj9SsQRoC+ouumdko0sEIg0/ySyS4apsZCB
	3yJeWaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7p-0000000HGUT-1k8N;
	Wed, 08 Jul 2026 14:19:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7n-0000000HGSO-3OGM
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:44 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso608860a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520383; x=1784125183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=FSpEFIDeZCB0tHG68tx5jEQIy2Y7T03S2N3LwMGxX/TLxxgeavUvTM6gKbrOmaOyM3
         cQ+lAR5gmFhsSh4TK/wHUz4huCbNsVnTJIGad/Q3s70xSKy3IYi5F3HHsxnmIflkselv
         c9SKNEulDM4jKLIS7DdPdLOgrphA9pTB84mVoSn5vH+vK+PTNVd+sLAiDTw1xL/pwT+L
         v8wvFnQgYYwDt+H5RR4k4iXESKJOg7luokv/MVqiR6s8nQ+xI7inWfPXQtLW64rIVouB
         L58Re/O+eWqYW1uDOiSAePEVTdaLa9o97ouYut0Mhz2fHPCZoA2a9rSkWIGIIgVPSy5F
         gMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520383; x=1784125183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=AchWS+Wq3V2iyEAAXB6BBe3jMlbI/HxtFeL/P+V2wC94npFmZEFiA8sw56nXezwlKq
         AQ1w5BFdRYu8WzlCHEKYME704E8x9Z6c0mZPRFUve0oiAqpp7rcQRIGiDiaeRYff96V2
         rih9+Cl2ghblagHvnNNjeLxLwEnQqGnfNIMajOHk28Mn0QquLtRhk6PDScy1zFs951uM
         h4H4/1XBS6cG4liTlqW11cZklGa2m8C70LFiWeF5ENR8OXCd72ykN0qPGtGnn2BhDZRq
         NORbWKaHBv2YFCN1CipZ+cM9eM5w14uYvzzQNhsh25BXYN95CG5cLrHLU9bsiEHtdj/M
         7+wQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQWEg3xQswhKMDBYtCjkRMqEebbwouZUFoT4dJ0dNWiFEgJNPNBVpi/sHNH8aTTmNO8qFvUWPXsKw47Wbzgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ7gMqCjzeD4f1S3+QmgF+HqjhG3asMcx6DhHpjAZXxTTiqH1b
	EeNhGo3ql22aPoIv41drT1vK2+ysNIVyU1XXV9/VNlX+oiGRXLpuDGwq
X-Gm-Gg: AfdE7ckTfCotWB3gtN1t21zWji7V7iSjsKAkl2PoDkpi5hVQDc0Mf71nE334ubl4CkQ
	DHr7V8BOh5PhTYMg0+0KCjbMjD8rT1pAWMXAUf5EEumt76H0byyCO9PJftKw7NvzFuWlWGDbGpW
	48BxuHvQKQwelcw8l0y6mBEwLYIFRCGPH2Cr6qB3jSICeZgd9hxqgb96Y3EWt2uH5aG09x14ELL
	rRsazB2K/7b17Qa2RaePk1WFlzqum3vDsBZ+ZGvsmHJpuXW57mnMnD0oee+CDtIbNptS62tVDOb
	CaVv/UNG0puvrtsSbPxEquKHWs6VKyUiJNhCy1wbXW3V4KM6inDtWNr+SBsbO7AgjAVeyfCYB5Q
	/VUFG7lVt4X2aH9qQdzTTdadHtDUCtlhH+jPfYCauY79UWVYsTB2nnnfvP/MBF9zfrNvcMIbY97
	fSuij6sd15v0OD6H8OM2Ts0wQrRbiOHG1vhRYNaQJ9hXbllqr2J22C9F4QMQ==
X-Received: by 2002:a17:90b:57ee:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-3893f693819mr3074655a91.6.1783520382800;
        Wed, 08 Jul 2026 07:19:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:42 -0700 (PDT)
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
Subject: [PATCH v2 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:12 +0700
Message-ID: <20260708141734.578926-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071943_848775_6B0518E7 
X-CRM114-Status: GOOD (  12.68  )
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
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
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
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
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


