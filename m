Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AB3CD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Stmpo+0lPViteLuiSq8jsNNiYrzYXEO7tqXW2BNyTVw=; b=1L4RJt4EAuUgmNmpSMbmMlKvH0
	zLTnr/lZChtOFW/PqrCCovMuzh9ocJPYL2ZIM7V+40Y7BWqm5EpTFOnJNiF+6eBHu2QBVnjOMJ2op
	4TZW7H+G9NTahD/mozFVb5dEyhl3AZ/5hY3Qj2bYgPsdJW3kB4OjreeswPo6IhXBUYe6IiZRG7ZdY
	Z+fn3V/Uh/pmGa/jLtxZ/dxlO/H/RPCrlUz2SB9h1zrDclLiJT0dl71SFCfVgdqfJ3yTnEzsJu0bL
	/4UjrGyxv0IsUuRrfb82wZb+TA/gnRdRmv6nmtlsgpsVqFlD+X6kb3w54ZDrnJJ0fqDW1N4lHpKfZ
	6G4Z2o8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWUb-00000005dbp-42k9;
	Thu, 14 May 2026 13:52:49 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWUZ-00000005db7-0p4T
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 13:52:48 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2f0ad52830cso11737480eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778766765; x=1779371565; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Stmpo+0lPViteLuiSq8jsNNiYrzYXEO7tqXW2BNyTVw=;
        b=rllV6RXq1WhI8zW9KV8nn6iRhw/4c4MFyZQ+uOge22ZDVDkunt6nKz+fIq6tQ7+X84
         0NIupb8Fzt/LC2DisoMe9uGypxXfOASULNgrwEnoZi5b7xnBryCH4SuPIjbj9F85Ghzo
         zoGctXgLGWBnwunvqCBTtBWwzkS/7uqH909DCrHvPqLRZeIvJA+LPuCO081Zgv9cIf/v
         l41SRkx9smorxaXi4oC0T/ufrO6WFJRi3Hncroe+dq0rkbq9vIdnDZA6rHp/CKxui1I8
         L7FuR5to9ouvjtKQoDNNmMBdmW/aDM/HW4i9UmqwGDrr1pd191rN4yrH+43GanK1O8t3
         WR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766765; x=1779371565;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stmpo+0lPViteLuiSq8jsNNiYrzYXEO7tqXW2BNyTVw=;
        b=kyu13sIy0iz2LO+pUhWKFjwX1cV4C6eViZxQ6tnRfVvYUMH0WdzeQN2BYht/uCASM/
         v8L3MA3QP2uvShwfE03cWFoGH9R4/b3hsz8Sa14+PEgAVyNNZeHm2GrzYsHEKAIqGOdy
         qoDMKVOIrxqHahTgkxJ3O3E23/9kE2psakxpaLXQAXYCx0V/99mGkpdXLONz1vLdV6ib
         bQ9CqolH9/EOB5Zitj8Vty9EGXtk9oFr9PYA9TAnPwWHbpmE9ddA8Au+JPDSlx3zYlFQ
         yDDdJZ2pC3tjG7xC7gbG61oOasOv6RBxmTn8Q/96DTP+8VVXYMv1crsUi1gw+yu+/Ju0
         qrxw==
X-Forwarded-Encrypted: i=1; AFNElJ/4f3F+MAcVqDujRg3aSe/aLJYoGkJrZxwkDbwH+5pUbhYdC40ZLSN4U+CZg1vpOY4yjZXNMdq7wsT/6HAjZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUkjkoVctYC9MsWWRVIwiS0eAvE34Ne8KcW2NJhYOtuaPXSf6n
	87WaJgytvWc+csY8pyt9ZlsTYVUo87/CZRNlteDg+/Pk3td6PxChAJSa
X-Gm-Gg: Acq92OH071h/sEilSgmxiVMoM5K6FdI1iRyhW0DCuaNhVrbnV7NtqmS9HAjVpzl74gF
	d9s0ZGQCo0FpnumozpS7k2NLqDJDbeHNWKciVCxdtK0OpUDBQzG/ZRO7hpiRHMQsIBwHGqeu5qS
	imuatUnJTR4vq4ou9voBEJdDwgzbQITMKQ6kb9l3JB1zoaUVLfQ9RGl1RD8zRdDE4dGEmnvd/vq
	2zH07c8GD52UluH6NuoB5rnea6lqhKbJqGK9jpzoH7ED6grVXqibW5oTrUV8ERrB+eyNJCtasd/
	ZbxMSFJwsL2xVuS4TIeF1ijvVkx7skg5kgJgXsAWyq5x3u+/xe4Zla5Ed8cKw87XjaT0OUDWdIi
	TysNbRx9ZZklIzjx2AKz6F5vPudHJsiUqEXQob/wvesGlXNr0ud9zIVEjFODiQ3UGTS7a9V7+ii
	CwtKt/Mc18h+DspdXDRHbAokVzKhzrsz9wMxOkT0PObzZn7ED273r75ZuQaclZtdoNQpFAncxVI
	g==
X-Received: by 2002:a05:7301:4002:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-30119f6d53emr5000426eec.23.1778766765152;
        Thu, 14 May 2026 06:52:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm3029289eec.6.2026.05.14.06.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:52:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 14 May 2026 10:52:35 -0300
Subject: [PATCH] ASoC: mediatek: mt8189: Fix probe resource cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-asoc-mt8189-probe-cleanup-v1-1-ded733363281@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJ04RavIpxUcqgY7RtOmBMC
 Hen6PIt/l9BuQgrXJoVCn9EJcUKOjUQHj7eGWWsBtMa23Zk0GsK+J4duR5zSQNjeLGPS8buPPZ
 EztLkLNQ+F57k+3tfb3/rMjw5zMcQtm0HHpQo2H0AAAA=
X-Change-ID: 20260512-asoc-mt8189-probe-cleanup-57d911861f86
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4629;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NhHX6IBXjO/0G1g+R1TOgHR37BItrClQUpm46od0UVo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmsl5caqG1/d3ySrujjHf3qbZvmXZ/P2yGtUm3V8iWp8
 cIfl+meHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjARHi1GhvbDrLpCpRNfZT84
 uuzrjZyfc0S4Evvfvqlx+D6rL7wr6zzDP+umW/Xavy6KS5jGKXE9X91SUzzv6SJBM7d7cWEFq9y
 +MwMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_065247_244853_CB094443 
X-CRM114-Status: GOOD (  15.63  )
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

The MT8189 AFE probe assigns reserved memory with
of_reserved_mem_device_init(), but only releases that assignment from
.remove().  If probe fails after the reserved memory has been assigned,
the assignment record is left behind.

The probe path also uses pm_runtime_get_sync() without checking its
return value.  If runtime resume fails, pm_runtime_get_sync() leaves the
usage count incremented and the driver continues initialization without
the device being resumed.  Use pm_runtime_resume_and_get() so resume
errors abort probe without leaking a PM usage count.

Finally, component registration failure currently jumps to a label that
drops a runtime PM reference even though the temporary probe reference
was already released.  Return the component registration error directly,
and do not drop an unmatched PM reference from .remove().

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 38 ++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 24b0c78815f6..77cf2b604f6c 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2351,9 +2351,13 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/* enable clock for regcache get default value from hw */
-	pm_runtime_get_sync(afe->dev);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "failed to resume device\n");
+
 	mtk_afe_add_sub_dai_control(component);
 	pm_runtime_put_sync(afe->dev);
 
@@ -2417,6 +2421,11 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
+static void mt8189_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2431,8 +2440,15 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = of_reserved_mem_device_init(dev);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev,
+					       mt8189_afe_release_reserved_mem,
+					       dev);
+		if (ret)
+			return ret;
+	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
@@ -2533,18 +2549,22 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	dev_pm_syscore_device(dev, true);
 
 	/* enable clock for regcache get default value from hw */
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
 					    &mt8189_afe_regmap_config);
-	if (IS_ERR(afe->regmap))
-		return PTR_ERR(afe->regmap);
+	if (IS_ERR(afe->regmap)) {
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_put;
+	}
 
 	ret = regmap_register_patch(afe->regmap, mt8189_cg_patch,
 				    ARRAY_SIZE(mt8189_cg_patch));
 	if (ret < 0) {
 		dev_err(dev, "Failed to apply cg patch\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2563,12 +2583,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "afe component err: %d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	return 0;
 
-err_pm_disable:
+err_pm_put:
 	pm_runtime_put_sync(dev);
 	return ret;
 }
@@ -2578,14 +2598,12 @@ static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
-	pm_runtime_put_sync(dev);
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 
 	mt8189_afe_disable_main_clock(afe);
 	/* disable afe clock */
 	mt8189_afe_disable_reg_rw_clk(afe);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id mt8189_afe_pcm_dt_match[] = {

---
base-commit: eeecc92a9f1dd213dd52d9b8f42d155595b1d278
change-id: 20260512-asoc-mt8189-probe-cleanup-57d911861f86

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


