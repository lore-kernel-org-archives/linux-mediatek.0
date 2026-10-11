Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF59CA9ED2
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=; b=R8kOp1ZbGClCJXlHLqSbjUnrk/
	KgTAUuGZF/ifS3n3MyDNM6Po+oyP9DPfjJlxiljHG3eLHDjz4Euy8tVNPwPsJz9GFCXq0fXYS80jm
	nLo5Vy9vsW6sCvMxq+MCqLPqoqLbe29/t5haJyA2cq5jqBPiigmy56PmSL78hxL69NY6mhSzi11Fd
	S1vDsgKJ3hlpqmBh7YMivid2owMEJQTKG79JmfpajEkQUmJzUBwYXIwwcZuYWq4U/Lt4uw8lBwceo
	f1yBIKr44PPYF4yMp4e8GV2iHzwEqBdVO1tE85tTK6m2E4xXUA8kt62D/Jsojj274vkLA7H8VQvsB
	DSLdZHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wQ-00000009SEu-2Yyl;
	Sun, 11 Oct 2026 22:22:50 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wM-00000009SAy-1yRq
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:48 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-53381e53b80so18020451cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757365; x=1792362165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=;
        b=n4YLsKcfgBrN/rZMfoVNTdC/h0IpnAuzZoPjRDZMtb+H/OkVJlTPQvS6R1P+nIy3Ht
         qbiTz7rSmiX9N21KRociCzbr6xiaG6WRW1oXfZgv3sjOBTYXupodaVw/gDlRCM+ZwNd6
         D8+OujWs2fIOB53oKWSlVJooAPW6Fk824dUaYbn+haL7ptf4P/B6cqvreDOeGGKuhUzl
         AStHQizUpFPiADbXyCEJPx+C5SKo/yzKBvNtZrH9Fey1k4L68wyxIxdludNEIO4Tsy88
         BxmKMbrQoqDv4XP2chXuGGUUcjOd0a9/y1Y2zw0mpRWEMboJA/BTP/S5Y2DlWKRIEf/+
         lXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757365; x=1792362165;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=;
        b=RsYkk33XudkIjhezZfz9U1M51P+qsm5iFPSHCsah5TY24zg1gtlIWB6L+y+9n50zM8
         UpQsv5eW3+iaUgIuBOzfy1u5DxzOIyvALbJZ2jJTgwAzZBMet8ad+BrulOvq325B22dv
         qJLxU1rlj/MTnKSYTkjWgMBG7ltma1S7Xy1Mp4Io92L7FULPVuu2YO7/ENjlEqYYGgIn
         P7cH7nZ1QOMhtgSNvwBiAZzICe9+P22UVeFigCLJdxMPVUqiRyG/epHZ2eI4g2g5V0NH
         u+OooWq5sh+IZPlx2mTOH/J3QFOZbtUbnjPZrzTaWX6K5dL+I6aK4vXRCL+nBV2vDpX5
         B/AQ==
X-Forwarded-Encrypted: i=1; AKwUvBznGelVH8Qo8XI3Y1uNbzUQCuzmLWMoHz544y/R99oHkU9qt2fVYqAVgcw4U9cSlIUZpXzd++BmDKDTXw/mCA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKfzdaiXbRl3eiIjYw8tj+2x1NkwM9f5OBA/MywgtHxhodIshGU
	QXYrZP2p7TLdv+sirOmHMTp2y0CwVxUmUUfBl95Z0SpV7a2s/c1MKJ4=
X-Gm-Gg: AYBFou0i1GvU4ILBHBMmEvOjM1cmsObEC4xzsbI/ySh0YwiTN1JK0qHuG4qwlKX5Y8B
	EmTzCkg5oLGhGRegOAktm5g/bFYojMWNJWetyuRTa0rZb/s9JdOS7b0/6VgrnXmT2fmUVUPM5UX
	lr3Cn6DIHQ77rm0WT5xFoq47fdK9qatmY48MHkW/iDF67cFDIWGum/airrl3vryq/rMMPQGcMZv
	nWJwwtlExaP7GxY2VV8aarlXCSM9KQMPlT0T+obKb9TjtUnO4PKctMGej23QTuLtfjrUn47Nhz7
	eFG0b1vn3oyJ4hBsZxDw+TGdhVxTg2iA5kgbElibBQz74IXWy9aS/oMDwmtCTlB+XSA8dxE9dTW
	ZtgDfCNPyDdj4O2AK3iJN/Nsu5CncUZfY0RXj9vK3Hb2/BkENKPNe8OPhIKRfOgsoRun6tBR533
	ooA2rtRNeFd9bXtDgh2mSjT/+bJBKrohgUgaMqLlQ+jUGf8x0PPbV1Z5qs9i4Z/8oIrLP5+tjfk
	w0P0TYucmEFM+PlyIieFOLFUeGZZx8iQ4E0yVu8MS91IUzel1jQ7ywHrpXlNWL/1/O5LlpLmTEl
	TQ83NgKxkCkHnlvPBmhMyl4pKgzi
X-Received: by 2002:a05:622a:2615:b0:535:1ee6:ab03 with SMTP id d75a77b69052e-5359fa73be1mr143610051cf.20.1791757365216;
        Sun, 11 Oct 2026 15:22:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:43 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:33 -0400
Message-ID: <20261011222234.2098904-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152246_541276_672AB6E8 
X-CRM114-Status: GOOD (  16.84  )
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

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before joining the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

This issue was found by static analysis.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

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
index 77cf2b604f6c..913c3b43fda8 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2507,12 +2507,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return dev_err_probe(dev, irq_id, "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2567,6 +2562,14 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_put;
+	}
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2596,8 +2599,11 @@ err_pm_put:
 static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 

