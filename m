Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A85C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:28:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8319B64DD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8319B64DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJewEI+FwBfi9HojJz7haxd4XIAGFMrxIOv65MpJ3SM=; b=LO2n0hTW7S49zRZiHYRINeKxX
	ablaBzD5AAHCQ/M/2A60bM8j+9z8yi/0YoGC+Jm06zDfLVKDkkShCFuxiAok9A1blbWnLO2Q8fmkC
	/hiJAJy5QEeCw3L+lJIyF52HUsOPQqHAj8mAIDCLazb+o/0aD09iflguetGoxJ/ZnassSKKfkzjlm
	pESqDjRvB6Xlu6LRT27arkNTkJiPY2l3uDF6ZFPHGRL7CELKOCuCAZ9iBe4us/oZX7Vlda3cHq4Fy
	wM2TlmtvOcVSOVbgZ4Hz8tC8MAFY6oPx/XiV+u/EXp5xGeoJlDue2Xga1omn3lJFJsnMamcQkPAyX
	7K8ICmzQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51jK-00082v-Eo; Thu, 28 Jan 2021 07:28:38 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51j2-0007vH-8G
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 07:28:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id t25so3727053pga.2
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 23:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=DJj103V2Njc+NoO4woEfA6J6X06d1HNMixRSgUCD5i0E/Q5qZzyKLjmNvPwif/eGKc
 x4uj6ZJJvdI53nD54eSOpHTcXDkRa701yNtQND0RXA6a5jtK9+81T9fY9zqgFvbzM2Tg
 tyU27jVZZ3Sn59hSSX/CVQLatnBFMHE/s5XNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=QFVHNIrydiSBl7wR+U0XaspYIaDSIxxUyHEsX+/o6vjJxJn15awZNWXYL6LvbOESWX
 BURkLpza9zF9o9dlbwmw1/d36lc0jt4fj2MuBSqF97b09tMRoMF+JRQA5COHruMWS/+N
 hw6qUn4rg7i4WJ10JwjcqTFYAOH0OOcCQTznGsBcLj0K1uI4Cifwqb7PCIje0HPt63oR
 xG/eYd3XNmXfmmrcUbh3S7SOx0df7hBz77m5TzWFDEL/xWpOCOe2icdtuOfjH2Tkv3oH
 iCzRJga36POEFEUbzdEGKRBDMyvOvFZxpuFki91Dg9PKqds1mLbWdXknZEeWBrEbSy+S
 oXtA==
X-Gm-Message-State: AOAM532mwQVWUlTbSjMsaC5+Zq1e1vlhG7aBCmBksxN7O5qn91ZH6IGC
 AC2i3Hz1ifbP13MDCELYxa1ooA==
X-Google-Smtp-Source: ABdhPJwxuGlbJMSCFjgxLE5OD4BDM1JEJbkoAhNZxMSevFQzC2n/y/UMOceeaZv3CtUn/6bVeLGZbA==
X-Received: by 2002:a63:c444:: with SMTP id m4mr15080576pgg.420.1611818897031; 
 Wed, 27 Jan 2021 23:28:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 3/9] drm/mediatek: add RDMA fifo size error handle
Date: Thu, 28 Jan 2021 15:27:56 +0800
Message-Id: <20210128072802.830971-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_022820_852175_E2FC76D0 
X-CRM114-Status: GOOD (  12.12  )
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

This patch add RDMA fifo size error handle
rdma fifo size will not always bigger than the calculated threshold
if that case happened, we need set fifo size as the threshold

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index b84004394970f..04b9542010b00 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -168,6 +168,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
 	 * account for blanking, and with a pixel depth of 4 bytes:
 	 */
 	threshold = width * height * vrefresh * 4 * 7 / 1000000;
+
+	if (threshold > rdma_fifo_size)
+		threshold = rdma_fifo_size;
+
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
