Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE547C44506
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=4dxf7h76zpiI51ThnKVyHY2hld
	sqV/Eafh/hvQ1cuxVAUql/OIiasuW+1eyYcnjVuj2nY1FBmBfSuOTjaB3nqyrFFfGNa/Rc1v+YvTc
	DD+g66gxikbz1L4XqERqP+rsWM6iVMY3B1AGm4L0H3CqiltPiT5t571GDwCzxYL4REixyva+aBnxU
	aMDyOazIcXkDsay3plAf/rC+mLzFDa6Ni01MH+rf7nGdoFonhiRtRJhayoIA/CBEHVDRRBa9KNrum
	Wj5X4bssf/bd5uAAtiRcnw72KMBHGi+mT9dBl9bU4P2upDHCOE7QWAS/eH2us4mQuo/GAcLl5O8yg
	j4QQ2CkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3S0-000000048pp-062Y;
	Fri, 10 Jul 2026 05:07:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Rw-000000048mb-3nyY
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-848595b338cso541858b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660016; x=1784264816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=Oi2Uqw1NTl1TKmJiPfROxtCDv2+jBHpbTpy8u44M/CKf4C9B8YkW9r34cncR/p4NfS
         jg/YHyqzZQx+ADX+Dd8CQny9eRYIsQOSMMOmclg03G2MtNeg8L6fLfrG6pIHsWYMLGJa
         TDjukdGiMmv0cUyAlF1bpeI16FZkxp+hbLUPxSnmu7Qq/Xd92MPv09dp0JBh+klbrAq6
         zGryX9uS5itd1PFoktJHJEHaYkUBiLaG3hPqzmT2ALgm1WX9JQpi03o45GfKle/xBaFf
         /kzWrS+3Fq3oZ51XpLs3t1Tzz/N+Bvu1gByCRXzIsJDk4yGLYoxejSQj4zB8kr4A7R5Q
         zISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660016; x=1784264816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=rNkXDdsJmWnPQ87wMq5mgB255FoaKjjFggCJswB0VPQb49W1ioPtd73CWZ7J/JRNxF
         KZgN3p5W0yhKqpqfjD66eYSUMt/lPk6p4Gf9bK/dsCQ6SZj31nomygS+7HZdEvTIpULh
         x2Nj3XBL9/Dru29yqMbu7u2YNYBWsWizx+bYj7J5j+unrwVTIP2MmzMDNLa9/A2pagdQ
         LToLLbochldUgr4nyjiA0742PbRTjcUlMzq3XNWartOfFv65FsqVrCGPzHU5Sc/84v65
         V+SFlsTkhmmev4eymqwVx6BSXVL2LUoWGkhsepX3zfjTnQgFX+Ojbs+xFO0Ybdk3Iqg+
         bydA==
X-Forwarded-Encrypted: i=1; AHgh+RqpEG+vIGMqf8x/jUb3B/Q7PNCExe55J3GU9V+z4f3OV9CbikOBZt26NvvvcmOoMPG8jitZSP6J1ChGRNoDtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlMkaCGFge68E1T9XGQygb0reJhz/vbIPZ9yZI/5I+pzVrFMpp
	2ZY3pWq6OBIW0UqcYeCSecVn6yh5M9gsHHREtNILkH52xzb1x2HLSvA3
X-Gm-Gg: AfdE7cnwrsmrRt++V6KhZQqNsDo7q1TMapfGjvAvoR2wv+0glBCnnLvkx5WA+K5xmEh
	W/tYD9Wi++tbbz7yxjz1SVMaBSph65WVIctgd3tj6rQP2JBlJ06rBVGj/3WkI77ZqPA6Fj9VShw
	n97PscdNv46eLLQt5O1MoK1btLiUKRskfLWSggwzjDbi9ASFEihEYn6sos5Hdh2+tYuaOHNleJr
	vL3d7OVsQ5Ajk9In9oS2MY0sUKQmjN7jQJEyZTl7uiySLL6dGh2MUrZ9QguBygoAR1EGn593eja
	8TSbGhh0+geWSFUqVvnbVWpOmi1gAxIltrzhR7lOPxz3O1wLo+mfvr3Hd30xPQfSK9qyPCTyVpq
	JBAC3LqTzUF+ff5hmm4jOiQhoCpVUKrXKYYl1Vj+x+Q/lWyiAOBnBBNiVQcqp98FzKsfmQb/7fm
	Iv76wqxQQCgvCysLq+8wpITTHwH1ZwLnTzyN5SVBwXLxVgIQI=
X-Received: by 2002:a05:6a00:9487:b0:848:4b27:36a3 with SMTP id d2e1a72fcca58-8484b274223mr7138346b3a.72.1783660016109;
        Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:55 -0700 (PDT)
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
Subject: [PATCH v3 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:57 +0700
Message-ID: <20260710050511.14439-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220656_964330_A46D07B2 
X-CRM114-Status: GOOD (  12.39  )
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


