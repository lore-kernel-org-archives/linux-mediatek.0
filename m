Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2949606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xcfv97bI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAUSnAig
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=; b=xcfv97bIXz13WC
	/LA7dm7Au2ztOWqgIWUFvUVrRDPmYVatP9RcbSDlHH1cNgQt6KeuBXjHvQuSXMkS2IuZ8zKTXoO5n
	zaeM1MMY436fmOdXrMQmL/RyvhX3ASL7GCI9SpGPfAPzCjQuCOZphz2Jbxd59+8SnXspdKLraNUS6
	lkwcZfI/orXyw0fo8bSbvxpRzjLBAA7/5pTtxImTDubPQe8bWbn4TkAuV9tBUdKo7RqVwV8zPKspA
	53SdbpoqPl5Yau4fqLhQON6+ldJg6OJbBRpxGPKiAiLOm+zpj0wEqVVx/oKc3YHC+s31vG2q92sFM
	WZLWfe8G/5wPwUGu2viA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO96-00000008nZB-0GjU;
	Thu, 12 Nov 2026 06:18:52 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8F-00000008nLo-2fYb
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:10 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-91eed03da8bso40682296d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464278; x=1795069078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
        b=xAUSnAigNCG+PK3CBDn/296sbPaRHv6w1jRWscYw5mDHHkkkVQ4NYdHoIJKwJiEaW9
         jmfFsm2G+K9jmS3WhwlHAF8qUg95iW7nFvCkNtQbRzypX2y9iN4Bz6bAZzfAA/uBetNU
         F6QreZ6Ug8tK3TdCWYIDgMb6pSgv5ntxC9V9RPw/KrlVDSIGgtomN23K//OCzu7KphMK
         nsiJZaSdGQ9lHxauXZ+chDVBRQlEpEpno5V5WQ45DODTFO8MUljPhpLgdxLVDeZyR+uc
         Y7jfl+cgrmN6Hn6JecpyLYXmKJeQ0SeWrKGqJYBRcZSmFv+eSkdjRu3Ng6eKe/JD5RN3
         HGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464278; x=1795069078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
        b=YDtDRkNYhfiS6U4FcDuB4Gp6xu7hv9l3jn+NMl761My/8iFSkPd5ic0wnEnGsWaepJ
         hQLri2FF2JbVWc1K5MwTn8aoSgiW/sCQH4JZ3OoFycck70BvG2jrTd+SUOR7Psny+IvC
         1iOLd+qy7WE+UK2mQV2PUSuwDTf6Nkbjd6xznpdhinZ9rHveWskPjPCqhNd1e0EANCyn
         rCQJptxAAOjmXLfeYfBXMVgZKcArQYp/T664zV/4N1FN3OWZHXVfPE7Pfcq4M1yvzuqW
         nZ2ek8dCxmZnpKvovKXNyIrOw6G9n9eRh8LAMxnsoG+Qajrm/rwB/EVppfoShEfuEQQg
         5UwQ==
X-Forwarded-Encrypted: i=1; AL+hErFqg5yZ4RdBMJ0PhSyNkA2M/G6hc2A2j/sfTGnPKN0/azsmmvLsT4+IiHIkF9LBQ7itr+FiEj0yT6KihTfk3g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/JKuVsVTdJZpgONcO93k2RWwpyqfS04T3MNZnKWmfLdu4dkaxV
	xsglh0Ty/DelvAO4i37lufQ6waqeiHLbC0K+VzUa7ab8YnLLbvIqNBw=
X-Gm-Gg: AYBFou1gL8SRqvfUYA6A+3zELKw6IMlQSxZlxcE5AqpUwxnRcRiMywBERDjiwU4ApSE
	9/YFS5jG0SyW80vGKOFz1REyZSEA3+4VYiGA+AdoCZvsGoOqeug6TJCbucQXDG0WbtMgYUYAO1q
	//Zn3TNDYfAQ/DlAsad24EisoJ0KPI/IxKal8yHYH77Hz2LX9FYZE4XjV0PukoRC6GDqtOslKP6
	0donSQuJIwgfRyeqvFAYct2P39LY2VA8/HaD3fWlYB+fEnZvRfOOZGG/AHeKmWdOrwjHG1Pg3/S
	OzwTTM/NiJ7aRGbMylR083x22atac5qNTBv5dZn0W0udkxlHc814Sb25K/vzP+OcJGda9ITN8rq
	QpkdFI/7MDBFRMWT7iPFgj+ITn4fUv6Gx4PGfVQ3TYF1CYnygHKnLHICZlqxSGSPXogjpoIr5Je
	+SjozPkKue9cyaDfU+4qYeZ3zjXKeCv/uBCllIOXCoYLguENvdTWMD36Sw+pT8cPSIhlL3I6D7V
	nJRASjOradx5p6uWZj8BKb/YzuAmrXS78TBEThskr0dGu2pMB+O6iHSi0jGaB406QD7WL4diV7+
	WiiVbcKEQFVDKDOpyuz67X2iMPRAUxKV9EEp/ZWviua7/ZC9L/+qroQxakA0wz1AN16EQ+hdlPf
	u+ILrDPWx9OoYMne0oo8HMZYyyC3ZkGRFkXIuZ3wJDNHZJ47sGL7Lze8ae+4qW+yMt3QmRdRit8
	mtUAUDzTqs6eaDUgccLb7gQXtwuH27X0SY
X-Received: by 2002:a05:620a:2995:b0:93b:db80:e0cf with SMTP id af79cd13be357-947b008425emr752527485a.60.1794464278344;
        Wed, 11 Nov 2026 22:17:58 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:56 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH v2 2/5] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:46 -0500
Message-ID: <20261112011708-afe-v2-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221759_784929_8A444C0A 
X-CRM114-Status: GOOD (  17.43  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-common.h b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
index 910d90d3d146..de715c92add5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-common.h
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
@@ -202,6 +202,7 @@ enum {
 struct clk;
 
 struct mt8189_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct regmap *pmic_regmap;
 
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index eefa96b701a5..e9fddf2063f5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2516,12 +2516,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2576,6 +2571,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2603,8 +2604,11 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 
-- 
2.43.0


