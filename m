Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82C5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7550964DD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7550964DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UssS4WpFewKIrPPYhUdXIGctyuGiudzEqkooql55qMw=; b=GrBvD2bgrnRlmteQSU87rG5Sd
	bcVIK8DLTOndwB5pND2mSaIpyF43rW27+Pcr81eEIRxbV6vFuGnTmaSQsibIjbOOqhnsO5NDNG4XQ
	XgeM0+zCzt+QGlze2/G+NZKziozYYY98QNYKTX/qZHkNDAyaLJE9HxKAYgRXvL/Knr172M3QEmGnJ
	nlyvhOieTrhOEycKjNBl2Dngc+Hwo+c+62eCAPwy/DxXNBDgN2arrF+z39Lf4uCIpLfst6AIwdBVQ
	fY91zBexgOSyGbrCuBDiQuNfgZpLJrij1cLMByp2PlPh669V27EVpe5oMgTuNQHNRFNb2d0AD2m38
	IlXgGS9yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51jr-0008KD-9S; Thu, 28 Jan 2021 07:29:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51jB-0007yt-90
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 07:28:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id u11so2827622plg.13
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 23:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5JC3J9fiTLPDmuPJJpjxxF1Ga0nTHhfcPY/QtRnZ3w=;
 b=bKFUwTGyazHAINlNEy3tvekxCHGN20xbiU+MzmgJZ7r4ZJVV/IA51MJGx9CG0zzp/e
 WOg7TjLBWG8JaMfFhGBTHeFbRFBQ8eG5TY4G4VlVotheStiSLtGarvwpkxOC+xGF0qdT
 aHEkKWliZwTiqzGLhyutrShUsBuaJwlCTaPH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5JC3J9fiTLPDmuPJJpjxxF1Ga0nTHhfcPY/QtRnZ3w=;
 b=UdunRGfmCV2/6vZudFMYhdpsyAIFauQZrdrBCNoBQmBn+usMuknj1ce4ekeIcgXbfm
 QBBvV4kFEqNJCtHo5Njns9SbkSP8ybx/Tm3GLmAfptjmzFRMRJROSgG4hUX6DZSzY5Ip
 h0a676q4MukF3FJSVi0LXVb8D2uNVriQvBoG4ZuPMDzAZAzaHc+YXgRq11t1SoHVKqEg
 uPaMShpz2TBoBONwN+ejLrL7K7ogxcbY6ooMMNHuKQru+yugWy2/ZuWwNycQpTjVUcz6
 nsT5rEFmoYEVC/5BQVwBA3tPF/AzOJOAmkF4QeWCJbl2iI/+D/PyH60LSZIB60oyl69c
 NUzQ==
X-Gm-Message-State: AOAM533EkWyW2ecsQf157a0+auiyIJpbQflk5v4Bg8vy0ipSyCJR6vjJ
 t9A9mUb+PaI0mLMs5aMFV4c8YA==
X-Google-Smtp-Source: ABdhPJzyocAU6LTq7WYj6JtsVxXfqP8goZhEPftbrsaGKzBZHQ0g/EnX2JCxYKHF5CFlM98QNs2s4Q==
X-Received: by 2002:a17:90a:8e82:: with SMTP id
 f2mr9845390pjo.234.1611818906090; 
 Wed, 27 Jan 2021 23:28:26 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:25 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 6/9] drm/mediatek: add has_dither private data for gamma
Date: Thu, 28 Jan 2021 15:27:59 +0800
Message-Id: <20210128072802.830971-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_022829_369239_0835FA03 
X-CRM114-Status: GOOD (  13.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Not all SoC has dither function in gamma module.
Add private data to control this function setting.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index a7e2e326b2183..22199ef11f65d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -26,7 +26,7 @@
 #define LUT_10BIT_MASK				0x03ff
 
 struct mtk_disp_gamma_data {
-	u32 reserved;
+	bool has_dither;
 };
 
 /**
@@ -92,7 +92,8 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
 		      DISP_GAMMA_SIZE);
-	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
+	if (gamma->data && gamma->data->has_dither)
+		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
 }
 
 void mtk_gamma_start(struct device *dev)
@@ -172,8 +173,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
+	.has_dither = true,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{ .compatible = "mediatek,mt8173-disp-gamma",
+	  .data = &mt8173_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
