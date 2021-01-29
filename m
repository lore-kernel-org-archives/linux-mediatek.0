Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99ABC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:36:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701E664E05
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701E664E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kFBL8z2A5lCn9RhJsK80Tv+ddXxCgKir6XeSEoOBh/s=; b=H1KZwpM1gD3eOtUoQIwToD3ZS
	cXaUthZg7J4eMq9NqPCi3QAaqeSzm/G8VXACVAxXmw8B73xWE8HURRoC+4riCypL5qcVr6Y90oKt0
	30csM9WlyXwQ1A1V7IXgrTwNTVDiUWVzLaKs+U0MdV/dVuQZ9wjvyUlkevwKRwQljIKrW+7e2nMZb
	2AyJoCfmAPcdDY0YBWmo46+7keO0n06UnI8K7PFg8oDdxA2+vphpOm0Zu7CzTh4vty8hVNYnOpf6e
	RzufY3vHlX+lbwS8/8ydKnn9mHi44PBAgm1Ayj+EEtS2NyYo8RbP/l4Z6GUzYcsYcr7Fi2aPCPIYr
	IzsBCwiaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OJp-0002r3-QC; Fri, 29 Jan 2021 07:35:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OJ1-0002Sf-53
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 07:35:06 +0000
Received: by mail-pg1-x52e.google.com with SMTP id g15so6089293pgu.9
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 23:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0VzfNDnc1RNpKDeThOpKuoraFZ7ZUithfDN0lHwcjc=;
 b=TZlyGJRidU43SvB+usEmJhbiogpEBxkWU7lt38+Hx8JDPJUO+68ZyCxSXCNgPBDW25
 0uYkOXwFqmxlBYwzrJ1s1BbLh8cDVbUleOI/cLu1ScjXfvn0gwFW6biVIqPg9Pe+fARn
 s3Z8/v3SE5rdkXQops9PO/SAcOecDmpJSPSjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0VzfNDnc1RNpKDeThOpKuoraFZ7ZUithfDN0lHwcjc=;
 b=K5lAPuDU1SZBY85F6zgrjahmn+qwuJ2Otd9UI3jJdUMIY2w2Ol6gRbGHhc102ffX2E
 Q9YdAfdZLOC0szBMSz/UDsMRG43OIfVbOOi4ruugrESyWJRaUrRwpt/eGaYv/0nrvmlh
 S1n0RyqaEfbGKQd9bkaJqPzkvhQtnHCMJgeJNOOOMtVhm+ziMD7UKCAlOCqY0uk3FoWo
 7AeYmOMcNCyUtKjiz/h+vXvW9fskqBVmL2MTiK3YaQJeDUiqlMT6pQB1s1gHCj0QtNqm
 U0fefeH6UbqG6mzgmDYIrqf7tcBrqmaeUNdiChXElng3HdtzSapPozocy1GxWby6VY9U
 CZ/Q==
X-Gm-Message-State: AOAM53241iNWHrVy8cHwb1uwnsCTYsdajw2ZWk2lVRGRxIexxtZR4+zv
 jWNUbDemJl2LEntzcOsmsewOqw==
X-Google-Smtp-Source: ABdhPJy0ekUDoYPIR7eUwYsy3duD/m0fqRvopGyLRi/0wI+d34WZYnW5TQk31h5jTmTx9tnOn/Drkw==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr3528882pgh.39.1611905696728; 
 Thu, 28 Jan 2021 23:34:56 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:56 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 6/8] drm/mediatek: add matrix bits private data for ccorr
Date: Fri, 29 Jan 2021 15:34:34 +0800
Message-Id: <20210129073436.2429834-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_023459_618126_6EDAA596 
X-CRM114-Status: GOOD (  15.40  )
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

matrix bits of mt8183 is 12
matrix bits of mt8192 is 13

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 0c68090eb1e92..1c7163a12f3b1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -31,8 +31,10 @@
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
 
+#define CCORR_MATRIX_BITS			12
+
 struct mtk_disp_ccorr_data {
-	u32 reserved;
+	u32 matrix_bits;
 };
 
 /**
@@ -116,6 +118,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	uint16_t coeffs[9] = { 0 };
 	int i;
 	struct cmdq_pkt *cmdq_pkt = NULL;
+	u32 matrix_bits;
 
 	if (!blob)
 		return;
@@ -123,8 +126,16 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	ctm = (struct drm_color_ctm *)blob->data;
 	input = ctm->matrix;
 
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
+	if (ccorr->data)
+		matrix_bits = ccorr->data->matrix_bits;
+	else
+		matrix_bits = CCORR_MATRIX_BITS;
+
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
 		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
+		if (matrix_bits > CCORR_MATRIX_BITS)
+			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);
+	}
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
@@ -205,8 +216,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
+	.matrix_bits = CCORR_MATRIX_BITS,
+};
+
 static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8183-disp-ccorr"},
+	{ .compatible = "mediatek,mt8183-disp-ccorr",
+	  .data = &mt8183_ccorr_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
