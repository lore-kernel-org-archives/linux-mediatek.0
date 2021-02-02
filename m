Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C961C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:14:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F186464EF2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F186464EF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OkfJLTZqvLo4T8WS+trFdbVqJ27/EIujWsUtCTgOAyI=; b=pSAWt3K29q7vnYF0+NYjXAURM
	SlIVKfywb5uBqnnekwdqPrj5R44uuYp60z5PkP6yrNnVc295RMt4dhq7DJIcy19Wv7RHXkcJ/Jbvr
	E6El1tJXO4/nFbCEHgA+VI/iN2kMMZ3PQJOdagwrMKb6YoSw0jP7gIg3TlsuSH3ao+LCk3uV769le
	s1lysMr7oGHXrQyzO+6N6DoRK2k2gcQg3aRdt1QaLyYRcqEBSp1TvfFIU8v6XpSPpyi3mcemta1vX
	u+4cUcwnqOu1HbwKYp3pJlBtNN5PgDYTA0cx/vkKquGMzsJYASKqawoOh8iWEoP9/f0mM8bh2LVr4
	gdQiVULAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qp3-00014q-5z; Tue, 02 Feb 2021 08:14:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qoB-0000PU-3Y
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 08:13:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id y10so7774944plk.7
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 00:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZdphxYwQpNgHOFUOUaWm9uwAnlzsS+AdxWYfgDd9hA=;
 b=nyz2ipv8gR61iZC6SDEU3wS2dS5Fsq7B8cB5SdScOyLbk4RWn/orif0TrbbnOuimXP
 rOuZMPHgjm3LHUVOF1Pf07US1Dcky4JW3fryFcnj9+9+Ftw60OEv/6OPpg0Cp5hliapK
 gtUc64F3DmnzUxFYTaSI+3f3F74jTKBqr3PD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZdphxYwQpNgHOFUOUaWm9uwAnlzsS+AdxWYfgDd9hA=;
 b=fiyN3XaT0NDzVyanl0qgKGekk64xGXEWdDfACkPaLu2LfdZxBJDz3w0OSQuAAT+d4z
 tVA0ifDfkRv6Bt69f+n4NUnQz4NO3RjoS4kU4I1LABX6TX9TrWsGATonjutALYw9qbEh
 bdiD9sxO2tHHo2zhfq13Dbh0ocir6cNjQ9rsmlO5LoIkN5oo0IIry9+TUy0EArjWIN75
 KdmQ2s2w8o/KR2I/VTsQysbaoXlwFqqdBcl4VhpCbEicPNZ4qf3GiwnNdTQWZahIWrYv
 ncGPUIWuovxH2Mf26dnLvC2ts1F2zx4ylUjve/wRUsUbfqOGwlpZEh061aPd5VSRODZ2
 SZtA==
X-Gm-Message-State: AOAM5315WoivzE01pDof58UcjCU0QDrTKptNkOlNXk6acMKABZ2Ovaa/
 YLZ6U1/QmHetxEERIfRjjEGdyQ==
X-Google-Smtp-Source: ABdhPJyF8bc5pdb1FJPBhQ+/6UsN7ak+pFPIp5SpdezQiD7juh3TAHxaPLhUkY/18ZfpcAMIdFReNw==
X-Received: by 2002:a17:90a:6549:: with SMTP id
 f9mr3147931pjs.17.1612253577756; 
 Tue, 02 Feb 2021 00:12:57 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:57 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 6/8] drm/mediatek: add matrix_bits private data for ccorr
Date: Tue,  2 Feb 2021 16:12:35 +0800
Message-Id: <20210202081237.774442-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_031311_249694_C60024BD 
X-CRM114-Status: GOOD (  16.35  )
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

Add matrix_bits and coeffs_precision to ccorr private data:
- matrix bits of mt8183 is 10
- matrix bits of mt8192 is 11

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 6c86673a835c3..141cb36b9c07b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -30,7 +30,7 @@
 #define DISP_CCORR_COEF_4			0x0090
 
 struct mtk_disp_ccorr_data {
-	u32 reserved;
+	u32 matrix_bits;
 };
 
 /**
@@ -85,21 +85,22 @@ void mtk_ccorr_stop(struct device *dev)
 	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
 }
 
-/* Converts a DRM S31.32 value to the HW S1.10 format. */
-static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
+/* Converts a DRM S31.32 value to the HW S1.n format. */
+static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
 {
 	u16 r;
 
 	/* Sign bit. */
-	r = in & BIT_ULL(63) ? BIT(11) : 0;
+	r = in & BIT_ULL(63) ? BIT(n + 1) : 0;
 
 	if ((in & GENMASK_ULL(62, 33)) > 0) {
-		/* identity value 0x100000000 -> 0x400, */
+		/* identity value 0x100000000 -> 0x400(mt8183), */
+		/* identity value 0x100000000 -> 0x800(mt8192), */
 		/* if bigger this, set it to max 0x7ff. */
-		r |= GENMASK(10, 0);
+		r |= GENMASK(n, 0);
 	} else {
-		/* take the 11 most important bits. */
-		r |= (in >> 22) & GENMASK(10, 0);
+		/* take the n+1 most important bits. */
+		r |= (in >> (32 - n)) & GENMASK(n, 0);
 	}
 
 	return r;
@@ -114,6 +115,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	uint16_t coeffs[9] = { 0 };
 	int i;
 	struct cmdq_pkt *cmdq_pkt = NULL;
+	u32 matrix_bits = ccorr->data->matrix_bits;
 
 	if (!blob)
 		return;
@@ -122,7 +124,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	input = ctm->matrix;
 
 	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
+		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
@@ -199,8 +201,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
+	.matrix_bits = 10,
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
