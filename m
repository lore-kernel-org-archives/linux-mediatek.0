Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB2C54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 21:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0M8Ho4hghHsHT9QadaKTfyu0riwtgTi9mQkpLqOU5Dg=; b=UNs1Z9pq29iBs8zopb4luxFtKk
	FErh/nbbc/+SVRcKdbUVFvX2G2NcVcnFgYXrBelKmlLJdCqmfYsv65u1cCDGvr9uNcez2dephiu9p
	yYl2QLDHUEh80slMe5XqhtLJhgXvATAy7mven6XQi3LbjYRog54AicwaefaZ0+DZkpFCTptIgD/jE
	LX8IPDDSKArdilKDs0I9XOt5cw5fDlRQ2WT5BFx5vIZlYBiPtEVbc7C7C0QBzfrpbpAClhfSQr3LI
	LmnTnFqQ7oYW8uHrIA5rHLJGZ6ydBw0E/7RjrralBrveN5Sl4QY83EEHvR1mTQUC37kCEcFqpT8tw
	g8ZDC8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdd1w-0000000BKBt-47mW;
	Fri, 23 Feb 2024 21:24:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdd1k-0000000BK5W-1e4T
	for linux-mediatek@bombadil.infradead.org;
	Fri, 23 Feb 2024 21:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0M8Ho4hghHsHT9QadaKTfyu0riwtgTi9mQkpLqOU5Dg=; b=Rs9PgNkUidlLIj+i0PgtsGJ8G3
	76stOhbHwh6DFz8kW3+ZP1hXvOeJfvtpsGKhEZFxNiREpnzL+h4fzaxd0LNRyfIg/ufk2x14cjkdx
	GFpdedpdiu+WvduOSnzXyZv/v/QvM9ymKAylmT3zbdBeStwVodq6dG8ioaEqnBJacSntZ/aKGx+07
	jdwIlbrMz2XKXeRctUk7sidC5fQZAZaooeRjxGvaidcVgrdav6yWv4uYpfXrFyHtB/tFKb+kXbe7a
	upoV9E+ehaQByI5iuirw/S0apd9G/nuGEXgb/J3t5l1o8nK8CD4Bcg8AFvN8BOoC3MkSbUi9BmPJx
	dOIYBNLA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdd1f-000000008bG-17OU
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 21:24:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e4ea90762aso528039b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Feb 2024 13:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708723449; x=1709328249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0M8Ho4hghHsHT9QadaKTfyu0riwtgTi9mQkpLqOU5Dg=;
        b=QdPwiH55TJH40aMrYMsUN2zKMhmSZjm6X0psW2HmpSPZhZtRNM9dEbsrWVymxz1G9b
         a/OLGu0WmX/CWOPyMz6sBFx24oQke6yk9qIReM9YIqyX+btGFgKGDek6rYninr5vTtY5
         mGDnJkgYQ4Qu2bRnrzwbZ35Zau65UiQqmgO2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723449; x=1709328249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M8Ho4hghHsHT9QadaKTfyu0riwtgTi9mQkpLqOU5Dg=;
        b=fT0bzJ/Y8K3dJJBlIqjiwCFvonDSx0ciav3mz6HEtw5+HFE9UZQW1+QUhxWY3akt5l
         9ct24mDk9tLxK4+upveZubrHb+POGHiyq4wNovWNMHoM3P0FrBuhvL4w50DEYiESeelB
         A2edkr/3gzMgDGb1tnSWMD03kjon9BYNlNXRNhvL3JODrT471jg1bxOpUbg8faxJi7LP
         6iaylVRFrVsMGeMsDjN8ntGyIxFmESf7ohNxcFPbGSMUezCj/bUfgn/BCnd62cbyQwTn
         S3vV/gbQUdCh8xYlG1dnsCAbgzZMfE2En24/Pv0/FcbXdys6dBKMDORGFn8DyLeo+tVB
         pLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJXsf/ziT4tLEMsaSYeEiUkc54NrO/s1eeiJxg12xBsNubPqmH4pazkvyaLLNqPJMbdZnxzV8GY9J5ApDX9CfJpKfxBn0j7tKSnOO1/4aPtyRA
X-Gm-Message-State: AOJu0Yy7XdGWJ9nh7b/Jt6Kx/2dF+9tH5WSIXCRcOhQHhSI3bsjzlGS7
	63R0BeCvSfuNrqncD34YOpC6eGdG3+ioZ488F/kDzWH5QKZanKSoC6sXvVywn2VrjkYEu78n0cY
	=
X-Google-Smtp-Source: AGHT+IF/iOCf8G84HtjaG5OPfPAZChzYV76riZA2G3uYSX6UcLKBg0B+sc+slfUuIZE19uyFrsPkxw==
X-Received: by 2002:a17:902:7b87:b0:1d9:a2b1:8693 with SMTP id w7-20020a1709027b8700b001d9a2b18693mr1106969pll.23.1708723449437;
        Fri, 23 Feb 2024 13:24:09 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:8ff9:a089:c05c:9af])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902d50f00b001db4b3769f6sm11970413plg.280.2024.02.23.13.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 13:24:09 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
Date: Fri, 23 Feb 2024 13:23:29 -0800
Message-ID: <20240223212404.3709690-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_212412_839102_3AD96C1E 
X-CRM114-Status: GOOD (  11.78  )
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

It's possible that mtk_crtc->event is NULL in
mtk_drm_crtc_finish_page_flip().

pending_needs_vblank value is set by mtk_crtc->event, but in
mtk_drm_crtc_atomic_flush(), it's is not guarded by the same
lock in mtk_drm_finish_page_flip(), thus a race condition happens.

Consider the following case:

CPU1                              CPU2
step 1:
mtk_drm_crtc_atomic_begin()
mtk_crtc->event is not null,
                                  step 1:
                                  mtk_drm_crtc_atomic_flush:
                                  mtk_drm_crtc_update_config(
                                      !!mtk_crtc->event)
step 2:
mtk_crtc_ddp_irq ->
mtk_drm_finish_page_flip:
lock
mtk_crtc->event set to null,
pending_needs_vblank set to false
unlock
                                  pending_needs_vblank set to true,

                                  step 2:
                                  mtk_crtc_ddp_irq ->
                                  mtk_drm_finish_page_flip called again,
                                  pending_needs_vblank is still true
                                  //null pointer

Instead of guarding the entire mtk_drm_crtc_atomic_flush(), it's more
efficient to just check if mtk_crtc->event is null before use.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index db43f9dff912..d645b85f9721 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -95,11 +95,13 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	unsigned long flags;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
-	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
-	drm_crtc_vblank_put(crtc);
-	mtk_crtc->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	if (mtk_crtc->event) {
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
+		drm_crtc_vblank_put(crtc);
+		mtk_crtc->event = NULL;
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	}
 }
 
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
-- 
2.44.0.rc0.258.g7320e95886-goog


