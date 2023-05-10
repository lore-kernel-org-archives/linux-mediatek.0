Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFD6C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juWcyeSBe03nI7TSodOkq9zFpeZ4gErVFi+Ebwz3Ux8=; b=uGOGQEEIipXj8W
	TG1ybXyM9xkYlh3agB0JLqjDNBebpUhWMLHDm1VmjlF+Nz57lt2Mj8tNm7kUI3fyMtwxx9iwwJzKE
	B/yeMVgCBSFPT/aXzI6lKS3VkTHXt5JQyELCZCzGMjVA99hj3Dew9P0GAw1JGPo0x79n/3xQtdOEq
	GQSf4eAhBfg7b/duwinicwavVhN/X8JOZq6cxSwpmMZb5yRSKZIgxQxKICjeGsRLBcjppSF58uSOk
	tL1NjaEY/OWM6oUmU6ce0mF8DakF1VAw647apnAvDptmMZVXlqmOx4UsRksuBoG8Zc8fnR79oIDUa
	XDtcIzX/bWFc936ABB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlnc-006TT1-1Q;
	Wed, 10 May 2023 15:32:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlnZ-006TQq-0c
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 15:32:14 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6439d505274so4318095b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683732724; x=1686324724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juWcyeSBe03nI7TSodOkq9zFpeZ4gErVFi+Ebwz3Ux8=;
        b=bH/rifR2+9qrvGxj7TGq/T7hSFeNNm8MW8DaYbysKrlNYXI5LR0Q61vXSzKVOX3W5B
         SHCCJhYLlyXR9pxGi++ZILCd2enTcwsaL8oDkHLgOgamlJgrF9mxYAKBxJk8Gv4L5BTs
         G0tGHCfpEqXhjee9B+2Qe71/0+qn3cDmiOBLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732724; x=1686324724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juWcyeSBe03nI7TSodOkq9zFpeZ4gErVFi+Ebwz3Ux8=;
        b=VZ4D2spvhqvwZd7k5Eye6wPtEE6HJ7htl+XOfbVEaNTwvqMoqJMFW8G3T2mtuaHT27
         5Udq2B+uy/ufv2x6N1+qt3bUjssFR1ULLARFjm2etTzPIVX1XHGVgJM8y8UtnpRMYwSq
         Ro5OKXTIFCi94YI43Uu5WfklTngERCA6z9M6pVip2B5W1vWNjJAyqsMdMMYDeKrFK94K
         /qA6tyfTtOhGYxu2GjXIuPqWoZz1rcIIOHQEurQx6HfBX6bWQDvBsrAAU6ogYW/ZFLq4
         nPFOg9CbMs4EY/wO08gs1IpsZ3aknG/Z7ovtTqtBRrUOt6Dgj8eezCZlkI539vDiDjb7
         0PdQ==
X-Gm-Message-State: AC+VfDyLtDZ4hCnbhtificJpoJY5gtz0neze98q5SyMnshzXvbhNb7G5
	+/71j8+Z7yx4v950V1JcgcnEbA==
X-Google-Smtp-Source: ACHHUZ4covKpZINnEbCbA63hw2wkSQsa8YuVFl+q+NfVOLrvs4TpM1hHNJVz6obDsAcae18eoOtPEA==
X-Received: by 2002:a05:6a20:9187:b0:dd:e6f5:a798 with SMTP id v7-20020a056a20918700b000dde6f5a798mr23115371pzd.6.1683732724336;
        Wed, 10 May 2023 08:32:04 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:d50a:c03e:3f7a:7e5f])
        by smtp.gmail.com with ESMTPSA id y10-20020a62b50a000000b00643b04b515fsm3643210pfe.160.2023.05.10.08.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:32:03 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw platform remove callback
Date: Wed, 10 May 2023 23:31:35 +0800
Message-ID: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_083213_230648_393DE1AD 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This aligns with [1] and converts the platform remove callback to
.remove_new(), which returns void.

[1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
     platform remove callback returning void")

Signed-off-by: Fei Shao <fshao@chromium.org>

---

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index b753bf54ebd9..bd5743723da6 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_vdec_hw_remove(struct platform_device *pdev)
+static void mtk_vdec_hw_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static struct platform_driver mtk_vdec_driver = {
 	.probe	= mtk_vdec_hw_probe,
-	.remove = mtk_vdec_hw_remove,
+	.remove_new = mtk_vdec_hw_remove,
 	.driver	= {
 		.name	= "mtk-vdec-comp",
 		.of_match_table = mtk_vdec_hw_match,
-- 
2.40.1.521.gf1e218fcd8-goog


