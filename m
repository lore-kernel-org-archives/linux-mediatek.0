Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41E3C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A627205CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A627205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJewEI+FwBfi9HojJz7haxd4XIAGFMrxIOv65MpJ3SM=; b=a074lpaYs1wXjXmWl1y+7amEV
	cPsLRuGNhvLOVxHKw4IQWgb3iHQkoLRw7mvtp7ItwPEM5XBo/VwXb5Jb832+BYGF8Qb15fUDQSELG
	p2sdv9awCOtWUlXHE169/jdD1wZKnOQo7nMbv7YTgLX8eBgaaasHzfJpahckUwusuFQZDNXxCdVol
	UslQ0wZRrAJ54Q/VPHyOfT4sAHjjCoQ/WNTJxvdM0DJM+TmcE2Z+F2DDuk/jI3GlIofZps6OKDnNm
	QVAbF5CPtUNPXMqidAKNqTIW2D42/m6lAAxquQaoxeAbwEHN2bVByzDmKzmyzj69eLKDotI7uR1Ph
	X2JKd43Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4crB-0003mS-5c; Wed, 27 Jan 2021 04:55:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4cqo-0003d8-LW
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 04:54:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id s24so534422pjp.5
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 20:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=QLrYujKWg6brD9Dn4569hiEZyanZ/c1eZlO9Y8Xkr3ZSqZ1GIkkMBWnx2iweqHKFzN
 98LgtgS7J1HKyPBfvqi3D+M21Balppe5d6zFiEFpyw+/iVnP8zFYOM+lB8LdHlVKjcOr
 XiAKpeDyKeqCp9VkmeyO3GpLbsopCwWYpXvAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=PKqV3KmtDegjdyE71VB6zbg3oSgllasRRV4imeo3IrD17Rod3Vxmqky0emmLgVZlB1
 7f7G5BjHVnjSj1mjjUgeLm2SdtXcQtFsapp6pJj1fJfwsHP4rf1oGehlzlCIXOKkpFCF
 2N0yOy7xuUwkCUf268sOt9889u9buJYRMiO6OmawrXvlvBaJyCqQ3p1lsEUUTJ+gi7X8
 uxEhm0NtItBK4kNR5fF8mKgA3IuKzcCOXfialFl0qMsRD0XjoAG/9qiectYC8gH2QYdd
 fXwCm7uBsbZ5Tf2m9MgPcJKlWnmXN4cw90BHNB24jcHqG8HUnnmRO5a0coKM3O1Uk8cz
 KaXA==
X-Gm-Message-State: AOAM532ArlLC9n5n5yH9sdrrTrblAnQ4Fwtr1B73bcnC3zFK6cVoxewj
 X+nHEpHVHweehrPUMz/tpTDNxw==
X-Google-Smtp-Source: ABdhPJy/lxAmlDmjnchY5j6fyQaiGPSUiu+V7cni9mncc8A/hA+9bzzULC0varJkx+Ggb//BqKRJVQ==
X-Received: by 2002:a17:902:70c6:b029:df:d62a:8c69 with SMTP id
 l6-20020a17090270c6b02900dfd62a8c69mr9586813plt.20.1611723280370; 
 Tue, 26 Jan 2021 20:54:40 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 3/9] drm/mediatek: add RDMA fifo size error handle
Date: Wed, 27 Jan 2021 12:54:16 +0800
Message-Id: <20210127045422.2418917-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_235442_746897_2ADB9358 
X-CRM114-Status: GOOD (  12.38  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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
