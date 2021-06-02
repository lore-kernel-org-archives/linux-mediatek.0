Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66A2C47093
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A45610E5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A45610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/sfIjJ5Ghb8czJMjBJEt1r/T3r5kURdB6SkY6slwYc=; b=F4+U55Nnd9t2Z2
	3YBM1FVnz5SPTDf8d0Ig6kscMa4e7GTEeXykgegTQyovJSmNXsfMF6h8KKOQb+J5Zk8jY8kX00Z4Z
	IAuz+yxSjqs7cWLgYg6rSFE20JrynZWHmLw4mltLOkqI5J0KxY79xlD08omDvRhF5rnrGh3p17VLD
	HTAvFXqa3w2uNtGsDLusxVea6hUGjar5NK1/fYCtAudLTxB3yn1cVOzhWmb8IcEZR31a1P9wTBghe
	6wjS12dH7sAj9hNB2DyP83fvPmx7sbLEVGUrv1YY/Sx0rApNe79ZTpYRKhgNTe19QDJ3MNPpOfs0W
	KhxOiXJUQRG408UvwvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loRvs-004Zxp-43; Wed, 02 Jun 2021 14:33:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRvl-004ZuK-2D
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 14:33:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 h12-20020a05600c350cb029019fae7a26cdso1788092wmq.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=FYmSxXOaVJ7u/hRBRjCRyMs468oivh2TsgX2RGPglQBkpugM6lgQWldOX0rIaOfXSP
 YVzbQwXiDA9smCQzDmzafGN3P1RprMVSNRl3BnqKNAfSQmT6ulR1Hv9/6EfLwMxmyo7z
 P6PyagKgW4BuWiOnsMTU6Y0JhWJJEX+DY/1Vv5eHGNSpouz68kzJzZutQ3ZV1CjhkM0H
 kzzsCCmphlHG62++alAVxt85h/Fj77OwkErFTBbHEy8olwx4eM1/k+Y4mKMUCge+8YMs
 14iIaeDvwMBwEKhfGiiU3WYlRVTOwA3gMFv4Xuf4/f9BthCK8u4+iw1ZJjxGde5/Bfuj
 qe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=uMEL1pWBw0gscKNo36DtKESJpT+PQ5LSCAbnPixoepumtWmL56U0ovL//LQKxdliLO
 9n4STZRQH+roSkaJUVdT74rwJHy/yp5qHaPfmDdn0v9iZgl4IYO9jtqUkCluflFRTMau
 RksWOdTy9XJ9vFn2iawkXg1EsbS7AE+V8BpOOSDBruDkX2Vvr+Fqrag3W5TknpTNTb5j
 f4LH1YQnEKsoukerIe9oDHOumIiLuStsrsV88lG5QDbbM91iq1BO70g2Ss3zedkZIto0
 0QZueFFw8aRmh7XeEH2uENs1FZEPNVPBALxd0ahl22HKd6cwMQAHJodKavRFkT17KfT+
 vt5Q==
X-Gm-Message-State: AOAM533O3PvV1KEKWjY8R5elxIEZ9f//0Hq2rO/DvjipUVr2KhVmKEql
 kSgvjoEOh+FYpjH9c+hNGPdBrw==
X-Google-Smtp-Source: ABdhPJzsdddao34LRabPBk4flX5Gv0pUOZLrhtePOoQ2SzMzu4f5Lqu++Joq8p3Yl+P1MsCSIKI/tQ==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr33825781wmq.119.1622644391896; 
 Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RESEND 02/26] drm/mediatek/mtk_disp_gamma: Strip and demote
 non-conformant kernel-doc header
Date: Wed,  2 Jun 2021 15:32:36 +0100
Message-Id: <20210602143300.2330146-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_073313_137303_8AC00A4D 
X-CRM114-Status: GOOD (  11.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'clk' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'regs' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'data' not described in 'mtk_disp_gamma'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 3ebf91e0ab412..3a5815ab40795 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -29,10 +29,8 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 };
 
-/**
+/*
  * struct mtk_disp_gamma - DISP_GAMMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
