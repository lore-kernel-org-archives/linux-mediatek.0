Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE13C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=jOS1gZujEWQlOKXqLv9BcSu2Vq
	BNQ00IsrdbtBU9YqN5O63dBrUyGPMPA11XZm/vA1dga07c+93quInhRiIXihYBdvOgqxYIWxVmZRs
	fEtLhGBQHlDpvTNi4xth2z05Ae/r7bXIwxcbsHBXLXrvfJnSFlodT5yLhD6EEuz/Gx1nQojCBFh4+
	EeKj3eo6Vn7Nf/T+Y8lewepZ0YCqpZ2BFJn38JFyHEZDnCN70C6JEKhltZVWz3cSENSB5aeJORIDd
	SiFJLFpqw0gkFaazfDoZB1CBI2lyN9WwWzB8GQe1BU8OwbP/U31eAg8y1FajLK8L3RxJi3rA1YpFY
	T6RQrSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT92-0000000HHUI-2yLp;
	Wed, 08 Jul 2026 14:21:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8r-0000000HHNJ-2gjW
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c7cfa17fedso8139095ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520449; x=1784125249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=SkyIFkJiyg4T3rsEuWL8QeLJmi7zT2k+GLbLrVyoOPs6TD8RnwfbtOC4GHlxmV2ITs
         h9qXp60Y+ZMJI/ooiwNSBOQswKMYvtfDYKkkP59hC8sgZCt0LilUp10gXwYI+tbjG9LL
         xHqVeT5Hlb+X1HfC5US9c/yepVJHsHjPV85kBi/zdi6B62dd5PelQlWj1C6VNN++Za7h
         zDECVEWQA54pbIjAa5Vgk5XuOfxrwebGpt03a6pvBPpfNn6Of5DtAlsP1gJT5Jcm805c
         MzV7WzlvEcdAWr39EFkNl+OTFvOgiBToY2mzHswKplIFjFhi+kRR630VTRlnM3hC3lMh
         Oayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520449; x=1784125249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=g2pBx4YHMoUEwrarAEk76SEvGKVYlOSxboPYkJjQSTecR+S3gu0YIHX6EmDEl5WDV1
         1ttue3x8ErTFeQ8rMvCTupQZVAi8zZhg1dpNR8f/HCnKv319PTKCgxjKMoHLmi/YtK0Y
         9kNJ6N7KlA3sA+YUe6mc/uZ6qbo8vWRNEMWoza+WO9alIBeLcEEnmmK86sFNd/zJ/wqh
         mO0f2XDhkUGt6WqZAJtb4Iu6UYCu/1QwnFo18GGPldy1UjztGF8JO7l40ntQYHUPkZdC
         UwXZwwlxVxUk1kMv8dIB8ffJMP3TB5MMKgAfqB3/N7krbfIhH6M+JtbzVVLOGt0k4cOh
         C6Og==
X-Forwarded-Encrypted: i=1; AHgh+Rop/Qn8gS6UZ/tevFJwTxopcLDVv9KCZSJ9zd89JxXJoc/wq49TVMLN2n2ZGup76XR+fNrCTo1Y0HCrjnmwBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzScPUMh0Jo940nKanVo6PXaN81VXUXxl8fu7bt5VJ2N14qiiDx
	WfC0ZfJtFaeo4cvNWtBB1hKoXdyeT5zpPk30//wWrIX3VWC/cZksWDNX
X-Gm-Gg: AfdE7cmai/aRrhTB/7pBoNz3atKKWKMDMLf1CnGP9Xv4Hfv4DQJnz/kdSBJ5rXl4k84
	n3UyoRfVfk33zmE/rIyM8Idkc6PdmfmJDrNl0a9tE4O5jKrgP426rk0TdoPqkaF+nprw2Zt68uL
	LxT252mlcQUUABe5Qauea3DPdiudrVZNS/rbCXBx1HDoRgZB6oEjQ8/9x4fYeUce3M66Mbmn12l
	9rsjtX4cpjc5Bp/XaV3oJ2Nqq/twMRoHw9fo2vgCbIhq2uyerM3MJgASaBjZzRvHOkRdCMiPOSk
	egL/B7WnLgfwS9mJRQ/S1oDtH2P42Bdyh/gkGxxhD6wPegrmSPY2eBIeqxU1uN8aFsJYMboI0k3
	Z8tkabGt4EHuOg4q0kHJAJ39DhjoT/az2w67ikMFS2dohEpdpIR+bjYKMJ24oX/uLfRbMBki9DR
	lkQi/q9nlyWnWER13ZM7Ij+dUEvY/lJMp2gcYqAzEQIXwoFSE=
X-Received: by 2002:a17:902:f64f:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2ccea2d7881mr31360455ad.7.1783520448903;
        Wed, 08 Jul 2026 07:20:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:48 -0700 (PDT)
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
Subject: [PATCH v2 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:20 +0700
Message-ID: <20260708141734.578926-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072049_698555_A996D7A4 
X-CRM114-Status: GOOD (  12.91  )
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
 sound/soc/codecs/mt6359-accdet.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..e1190c644021 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,6 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -398,14 +399,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +416,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +450,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +458,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +473,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +496,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +518,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +536,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


