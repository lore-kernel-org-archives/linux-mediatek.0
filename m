Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4811606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYSOxNcm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laJpWWaD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=; b=jYSOxNcmrJH/dK
	doOJXYmi6tLh3XKEHdi4IO98Yxzq67S7o9DoSDg4PW/b6Z9LM5MAaDFxrOtOauB9E9O3fwxS2D9Hs
	ggb2wuc7FUqtLRgVK+JawL3EApjVegEKcxzArRfduFFcJfQJmElCn63c+2Hhag+Oez5xsqldQbqkK
	I6uzvel3v24XPbF7P/DCHaXljodffe9QHEsAn7q54ajfNlYH4UVUk9pd3ZdkUPlfu8GuaCvPeuB9X
	0YxwhIOcPImsp29mkf4PMsQCMiXuLBlJKKcnMlp6CoD2eCwsTtC5ZKQX273FyBNpZBFExSYDF+FYA
	Wv0oFNRbvjK4J/se9yTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROA7-00000008ny3-1GJ7;
	Thu, 12 Nov 2026 06:19:55 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8H-00000008nNI-0BBR
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:17 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-93f1e5d7450so392407485a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464280; x=1795069080; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=laJpWWaDBXzcXYz2pHuL9y1lehUKAPFqLdpUn7Yxj8oOw/DWgWuzNzbByWZpjoTUkB
         wSIZS2LgKaabaZkDAHD6xrDI5cg1AjJZmR5WcD+YIrVSKQlxKPpFAfXMqsL/0i4fRWF4
         jVrulehJzbfYSJPL8PRmCUBfsKhNZdbk3MZDNBVX1ga/SzRhg1KbP4M+0yTAVC0L383Z
         GjMdwi1qPcufpqQTa+jbNlCPr9uOj/RqWVkQInt//dB+xYWCDwcMb/0rG9x14pagTJP9
         5oJE8gKRJo5wYe/ntSukzMdSnskX1u4AmJSFGV/xdQGl4LbVI8XqNOuT0uiscp3vyxa3
         fBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464280; x=1795069080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=auyO/oANjKQ41g7q5gnCbJbXYiP8TdAp6zBgoF68BU/5/IbvPqcC0DPNqP/mE6dtQg
         BbVinO3Ge+o5y26JfJO+gffKc4W0+ff5WujCmBspWLT3o/IrHwtQ5xyzSQxWwaWTZCdA
         4UVMNB27UEWOIi6OkHpjwAvYyKWF22tpokpWnteRf5Ga9YX3n+T3btgiA/L16xNrUnjo
         mP6GGkOZmsxxF/IsdMZwXrJVXRzoZl0I3y4xSEoah1NBFrmSBVQNBxGEpWoiV/g2rFLr
         HuJBovPUvErfmUEBa9dQU50PeoLveHgslJZHHYvGwM7HYKF7rb7xnaC/LSx/t6lUzUDR
         d82Q==
X-Forwarded-Encrypted: i=1; AL+hErFoYvHShfyRi/pX6/CVXJ17VxmBcdG3TJw5AoqKR+wd/J1IsZaZnHIGYTNDRJ1xhtIIwj/yh/qUvag8V1jf3w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/bL9NpMwvjyU0aDEn6aiUCB77qhoHU55Mzd7DGAPR4xcO3Cpva
	tRr4r3+6Z5Eg9b5exGiWhCw2l37cjiKtx60lwrygmuO5mnNvkBCterg=
X-Gm-Gg: AYBFou0pPMdz0+HSCp6BKiEv0DwKy+5spcv7UuvgkQPAuerSULWwkcUqw11lflYTvWe
	NFDrxASuKxG6LOL1giDABfwQylje/ZpObRNY/KtgL5k6VdAp0FtsNDHtHtr1MpGbGTYhA7Z7Nn5
	MLtiSFlYbu+oU0PjPwLO+yxJDBWjP2vsYkHc19KPrlKOciqWHW1UBI4Zv0mbB+NqS2cvTnBuPzG
	qQoRzhLi+V2vjnPkikXpqGq4JapqxanZQqrdPEtUT1KmLngP8u028Y/kUpx7L2fNBq6s1ZvppnF
	HChU7RynTg5gme16C/+XHlcGD4yWJaTqGbM0wo8IdEfQ1v/7q1JNM6JmAS2ZtXRMBp0wERmvHef
	cs0+SlnVra/0bN1RinWY+9r9IStkNR+b5ehRV6v+I0DLOH0nVsUkH+/McwVRWNpmnBkit3WmWr5
	zp/fmApAe78jMXbMbOxym8qr9mE2tKfxaDfYucdwmOrPj+CfDSv7jkWwgN6E5do7TEUAU9vHHRg
	0gC1ZJHvS9/AWtxQlHs5G+IoPBocRZPYM85hlS3SoDoOuf0OVifmNSLq3mSCuj7sytkniXb81IO
	+cjlO8ZauStsoCzVJwsOiHTI04uj8XCiwYrxQ+PQnQanDGughPJPsTbilWC3ULej9F9GnaCRcH2
	AoyzRN+kwGrb76Z4ICVQbA/1oZzjdsV63/RvrNzfDeRUeQ0CzTbUdIcv8HB9814aWPsi89zC6KC
	MzXBpxPMXyMiTyTMfdZL3KXD50/gNQ87QY
X-Received: by 2002:a05:620a:4726:b0:93f:365b:42bc with SMTP id af79cd13be357-947affc152fmr801189585a.52.1794464280101;
        Wed, 11 Nov 2026 22:18:00 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:59 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 3/5] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:47 -0500
Message-ID: <20261112011708-afe-v2-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221801_113652_C3520AE3 
X-CRM114-Status: GOOD (  17.49  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before freeing the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

Found by a static analysis tool under development.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
index 4951a6f32abb..ce5d586721db 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-common.h
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
@@ -186,6 +186,7 @@ struct clk;
 struct mtk_base_afe;
 
 struct mt8196_afe_private {
+	int irq_id;
 	struct clk **clk;
 	/* dai */
 	void *dai_priv[MT8196_DAI_NUM];
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index f69ea22cfabb..dc462dd4235c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2403,12 +2403,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2463,6 +2458,12 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2490,8 +2491,11 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 
-- 
2.43.0


