Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A582C54E71
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l6EEmhk9Y5reOAFsAV+HEJlc3gS52f19SksxotmeIlc=; b=ZR/KvBGRCND1GK
	LvwbIWKvP2al+3qaWiDACFAvTyEWJoiaMlSubewxzy0/tihsyYqzSuN8EemgwH5OdN9lAom86gggG
	WGzeeuhs2/4K2cr9QfXMPfAMe3c7klQ36n4D/5EMfRAAz60d0nIsIxaq70MjiLIIlqV2SJrMQ/e3R
	CX1bO/pIOZFjvvxaePKm+S0L8Nsdog4AvPV3t/9rWlJXGawYs29gJdRBBw5pXRLCD31M3BbTQBJWt
	VSEqHog5zKch1RiJ5nFC+9t3X5qkTx9duzIlsvcuKqQODXHgqbWd1FKb0x4zf8kzXcy/FuvzxrJEp
	ZRqcV4AoFcTsJI3s1cCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFo2-0000000EupA-2QbQ;
	Wed, 28 Aug 2024 10:21:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFie-0000000Esnp-2TD6
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Aug 2024 10:16:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-201ee6b084bso56080545ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Aug 2024 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724840163; x=1725444963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6EEmhk9Y5reOAFsAV+HEJlc3gS52f19SksxotmeIlc=;
        b=JdVY2URFNBmJd0KuBa6LHHv1C20tvzKnVw4xICiow3fOrw95NfCObh9/b2NsbCGSCw
         dy9zOBZ3YNoUu0EuF49FKCKg63SHGUFHLlWb5Y4C9xZMrrIdWagsvYeiZykHxasAa0U2
         LUYRbVgQz6t0YguWmhUNwv5FV+B9zJfZGIFc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724840163; x=1725444963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6EEmhk9Y5reOAFsAV+HEJlc3gS52f19SksxotmeIlc=;
        b=Q4d9hRsnKw4UVp30nF408JSYorOMLs0kq/EDqISZiIUQda29RGkDcFybv+xLX5BnSo
         WBHF2KqyEYHE4XcRrILWb+i46TEC232r3O5H3VMBZx26Tluj8saHC1OOm16N0XLCarwa
         Y+KcqJfy9kptKaU5yTYddmPLJsmi4FsSBOmO/DGos+S6ULPMeB4efFIM/S/VatRQY8qg
         iRFajEL+myR1L6Xb82qrrZx5LLuQrqIdAGOWpNlmTdIDF8Mp67WbkwYAd8xFDrQZmlJr
         NwbZsjQuPIC6+KOcx49TxMsmbH4BwMUkjVA4vy5PNJus5dmdHDG9WwIuxBya4IEXuMES
         drJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdJOw3MXBKLZP2xj7K+M85p+rUXtrLYvxio18RKdqDxr+wevITEnNKm+qWufT8jWCsYYRVwHa4Nil7+Edoew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbDUQhZEMS4nEW0Z/JC0QG+/PRQpM5w1NR8YUqqIDcRSoHfi1g
	P4NXbsB0i9erX5BoPzyUXFE4/g0UH/oSvggi0fSqlTD+SIHHYAcCeAeD1LvTfQ==
X-Google-Smtp-Source: AGHT+IGtCtgGflkPLcIWz63EIUUuX6MMYmWQAYa+kWCCehY2yI9ZV21P39BGDfxsdsq/CdkR0IzgFA==
X-Received: by 2002:a17:902:fa88:b0:202:100f:7b99 with SMTP id d9443c01a7336-204f9b7f065mr15103095ad.22.1724840163370;
        Wed, 28 Aug 2024 03:16:03 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e0f3:8e32:ef17:cdd9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560dfd1sm95645455ad.206.2024.08.28.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 03:16:02 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
Date: Wed, 28 Aug 2024 18:14:47 +0800
Message-ID: <20240828101511.3269822-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_031604_674604_0FB5C778 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the state-aware spin_lock_irqsave() and spin_unlock_irqrestore()
to avoid unconditionally re-enabling the local interrupts.

Fixes: 411f5c1eacfe ("drm/mediatek: handle events when enabling/disabling crtc")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..42f47086f414 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -449,6 +449,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 {
 	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
+	unsigned long flags;
 	int i;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
@@ -480,10 +481,10 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 	pm_runtime_put(drm->dev);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 	}
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog


