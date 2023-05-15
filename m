Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB5FC7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 06:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DY/Tvek46OkRim5dYg2uuI8WkPZBk0b6iwqvYb0rtSM=; b=mbzGiXZhz+uhYO
	nPT7VNGJcPz9dJSgwzrz/fg3LTHwZV3G3KJxBid1VYD94VngQnDSbjbif8LKpTc1+T3lncNXMjQyd
	s9htIAHVCOeXHGPbVkaK8iydkuKRmZcYh/qsqeLklK84ObLMnPg1MRFwDTZ47jT6WC3dELwf5b0od
	Te/dY69X9KreWlny9WfdC2RX5/fAT9u004xZjNfr6UBPb5tS4lSPRvVIOeMDljdYc4cfJtf/VI1ll
	/a5YUA5xHVNlRylBNU4uG+N5TK/PI5szBpf6ejkHNo14Vnu2jeM+Osi09y8Et+YMSAzOm06frJppY
	LNNNCBtgC6kleAHxWbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRWo-00164f-2G;
	Mon, 15 May 2023 06:17:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRWj-00162U-15
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 06:17:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-528dd896165so8795704a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 14 May 2023 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684131464; x=1686723464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DY/Tvek46OkRim5dYg2uuI8WkPZBk0b6iwqvYb0rtSM=;
        b=SHQD3SCR9W+xMBa5+chJhxwA/WtZwLNXlmU69gJd0tzp7gXBkk5GmihQlO83gvhqu2
         ILCPJqysWYqlwQC/4a1tMhGE4nX7QMwQoDG1A2s7ZGxk/BPKLuxDWcvMbbPgRwWyiBta
         82f2sGFYCBKjfzsdc8HdtI1PSDcX/gCsQURSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131464; x=1686723464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY/Tvek46OkRim5dYg2uuI8WkPZBk0b6iwqvYb0rtSM=;
        b=ZcHDmDsb4t5r7VghlBs93yLnSbRua9EoOVoTKsapLIZ9iEcDuaD7gXU6tvMaAUn2dx
         +ln6TNA55BUmZALno+l6UyqrGFQ82Hz0hiYviJeSoyVgd1mEhRiG7drIf4f4zhYt99uK
         ChPEL4+maWtkPZ9cM2xOQBCjSyhxxDEBcqXxFKPXM0m+2ugXVtwFjDVVxy4DC4bsWXIW
         +YG/bP0FLhs0xoc8VyYunb4ekvPtaTX6/kQ+fO95HU+YjFxN6JILu0l2bW8dzzqL4+Od
         G5rYwuzZ6RQwfmogCgqU7bE6fDmivITij+qglCowLlbjX07QTTi42tEN4A2H2qbPRd5y
         +QRA==
X-Gm-Message-State: AC+VfDw4gVYdq3iZ+aSQ9iqvdOO7SImnT0fRPoxPEAk6ngAIEQecZbSR
	eSh31t0AwCFc9HMLq0TtsOTsNg==
X-Google-Smtp-Source: ACHHUZ52DW6enl/aNrixK9TkcAw1Q3rEqPtBBG3wTF5oS74t9pGxSj4R90JS+A4/OvgNSW7wfSaeSg==
X-Received: by 2002:a05:6a20:144a:b0:105:dafa:feb3 with SMTP id a10-20020a056a20144a00b00105dafafeb3mr4095639pzi.61.1684131464030;
        Sun, 14 May 2023 23:17:44 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:cdf5:d894:a1d:dc15])
        by smtp.gmail.com with ESMTPSA id 12-20020a63124c000000b00502ecb91940sm10680495pgs.55.2023.05.14.23.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:17:43 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use devm_pm_runtime_enable()
Date: Mon, 15 May 2023 14:16:10 +0800
Message-ID: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_231745_409264_BC775F8F 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert pm_runtime_enable() to the managed version, and clean up error
handling and unnecessary .remove() callback accordingly.

Signed-off-by: Fei Shao <fshao@chromium.org>

---

Changes in v2:
Use devm_pm_runtime_enable() per suggestion from the previous thread:
https://lore.kernel.org/lkml/20230510164330.z2ygkl7vws6fci75@pengutronix.de/T/#m25be91afe3e9554600e859a8a59128ca234fc63d

 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 26 ++++++-------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index b753bf54ebd9..e1cb2f8dca33 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -148,20 +148,21 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	ret = mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
 	if (ret)
 		return ret;
-	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
 	of_id = of_match_device(mtk_vdec_hw_match, dev);
 	if (!of_id) {
 		dev_err(dev, "Can't get vdec subdev id.\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
 	if (hw_idx >= MTK_VDEC_HW_MAX) {
 		dev_err(dev, "Hardware index %d not correct.\n", hw_idx);
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	main_dev->subdev_dev[hw_idx] = subdev_dev;
@@ -173,36 +174,25 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
 		ret = mtk_vdec_hw_init_irq(subdev_dev);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
 		ret = PTR_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC]);
-		goto err;
+		return ret;
 	}
 
 	if (!main_dev->subdev_prob_done)
 		main_dev->subdev_prob_done = mtk_vdec_hw_prob_done;
 
 	platform_set_drvdata(pdev, subdev_dev);
-	return 0;
-err:
-	pm_runtime_disable(subdev_dev->pm.dev);
-	return ret;
-}
-
-static int mtk_vdec_hw_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
 static struct platform_driver mtk_vdec_driver = {
 	.probe	= mtk_vdec_hw_probe,
-	.remove = mtk_vdec_hw_remove,
 	.driver	= {
 		.name	= "mtk-vdec-comp",
 		.of_match_table = mtk_vdec_hw_match,
-- 
2.40.1.606.ga4b1b128d6-goog


