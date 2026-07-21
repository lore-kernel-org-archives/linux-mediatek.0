Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921C8C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=ckmR/PEr7dVJJ1ORyaYkPc2DJ7
	PPCNtf8PJNIN9ioxCtpC3gtQzn3RAr4U3xd7IPnl4q9JQzeNF0p/ZroLNv6E+iFUQ3JS5NRx3z4vU
	vgLtvHYrQScpS19n+uTYsi01sOjhTop0vtHq+igI2/fgLfc09AE78vek/b1uWMuW2IEy+SXke+nXL
	cGEqEN1VoL0UDz+fA2fl6uWoDeGT6w2BzWuofaoUEwQ+A5uM0uRN1srC9FAezeYOZgNJaGa/kbTNz
	vGnUO5Ov8pCCPgMFB0stKgMiVaVcWtCd1TC8EdlRP4LSlqeXl+NeaCroEuddcYP4Vq2RneHsGgL49
	5w6iOlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hr-000000099PA-16MH;
	Tue, 21 Jul 2026 10:28:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hp-000000099Lr-1ahh
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=f5lcOfQ5HwxVuk6xht4OtAcM1T
	2TE5sGB3gleXkY569EpB3/Nu3SkY/rWpWOnjfktCqkyONWSSA4PqkqwdCwRE3kohOq2ows/P1tkP7
	P+VWGPhLAQQh9wd81aeVzWHl1X+Cjp3MekCtmabi9U73cud6sUEe7FVe0VPa3twNeNl9+v7VNYdba
	2LPItnqFDNr6tt5yE3PY4IitsuR0IOJYl95xpric5uRnT8AaTwoju6OoXttOgaiwGiR+zjwQpy1ho
	eARYyt4FCboURNVmuJ7ZQnJsfealH/NmWmFwf22PTqbC6X9YLe6Jb3qfrNgSzJC8evZbTwfwDmjJ0
	ONLymoeg==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7hm-0000000HRe8-0TfS
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ceaf8a1265so110070575ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629684; x=1785234484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=s5HAObh4xSS7PhYDRbIFRHT69HqpgjbqmGs8rmSZwfhD/9hxOL7Ck6gcqLEiFH1GFj
         qfy3PJh0I7O7E/IpOwMbIFZff9qXZRskW+jMM9vTKABVmFwQoZ4VWS19FYTpwxu2hGp5
         KMw5Kl0hBs4vB1zLH2Tdm6IhXRQcQr2EVkCj0YFF0bs76GrIUnMn8c3Y4ITji5bPG90X
         MaVwTOWvCUSWzEuG/U7wqSp+is+3l3RwXBwupaFjlzaL8Yl59/CyqNoQW7iyovPdWyyW
         rBUfP8IsQ2/TVE8iud3ugMtzwawzetEu0QaqyqoDfc55XvrdOli05U8ECzNWA7YzXuEG
         iGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629684; x=1785234484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=FsHUB58fdwxmdeqE/IHzuiLu8Tp9xaDQWwqm6bn8qfYCc75d0T6P36bSmU5Xekj3Pt
         yUBiB86UHgyJppX3z+QLFqclHE36FLfhOGTNBTtWHysfbBm/nvpur9DnbMTJP2gI0Ul3
         /uCBov5WTRv7+LvWwFzp87/pVe4J+4mPZ6zWabfwEhpUsFuEYbCI9HBJx+28EQ/4QvVD
         vrpl29OjPHg+6jUSQjBDekjo6yhLS1YJbPUaa4QGeIg0AxCVJkig5zi/TVvGyD0uNW9v
         EFto7q+NVXaGnzmAA9ZfjAmMLwftgYAghwimVs2+t/TsqAIWRIz99PXd9pQTv0kEomwO
         K3vw==
X-Forwarded-Encrypted: i=1; AHgh+RrXd32OHRON9TfuHCguJfRV3nIVUYrC+brLHEFI4KqG5M8afM8S5cPCJkaLNAVReNiiMjXmHlM1i+XShGpGjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7zt/dIFWORPdcGEuvCDqPCL3FzvBKrgVrnGKytSLCkclAyRfj
	dQ+Ac/c0jFPRQvgtd1nROGRfH2hhHKn8gYhSPIhsedMB1w3qpq1bAfGN
X-Gm-Gg: AfdE7cmrm02vAIS126GPlfNPa5+J3Ie5wbi4sNbLBfD6TwmAfZc52JTTxi6+qo+bgm7
	dDdvfCuOFaU2Mnrrrct6OVRfqriIo8d4LmxBjOEswp7hJzquDC/31F/t0V24eosCkRFMQkC+C4k
	56QBTZvzQpSotH9PxXY0/hmeqM/VUczgcqRQq6P73AM38uXVBDxKKGh2gEep+NVecqjTuSnSTMn
	YBzknNvkOU9EginkBaAQxyOBT8a+8GroLnJciKd5HQoeoaLNzYXN2S3Nlz+ABBsvdGrJRUrLbWd
	G9QNghjdrT86Vfek7dqhHa3VBGeYHpyOU5UuXrqLs3C5JkS/0mXRTqF1j3+cE6nowMRBWnG0oey
	pkg3c7fSWRcKnPAJBYtXgxq4eQPDYKeblA22lFZnvKOjirGYrb/aoIRwr6rIm3l7NYMgRa/Xwj8
	HOPbefmC0HiN8IOY7D+Q8IqBgohWNp87qYGI3/
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr208350785ad.45.1784629683862;
        Tue, 21 Jul 2026 03:28:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:03 -0700 (PDT)
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
Subject: [PATCH v4 13/29] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:44 +0700
Message-ID: <20260721102600.523199-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112806_355264_110243EA 
X-CRM114-Status: GOOD (  12.44  )
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


