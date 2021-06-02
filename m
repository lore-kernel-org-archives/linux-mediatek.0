Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345FFC47097
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D8A610E5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D8A610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5TCqJPToMY6wEjMtUed76QKUwxGesxoEyq7nKOJDmw=; b=DXsDw7oW96a3hK
	GoMiu6RUXrCi/7t4XE2SDueh+TOOoKLsI9rkClftLQFFPfFJ8eI2AEgDpqxEcd10XbHgcL6zpXdhb
	8sKRoZ39RT+TtLOlnojpg0q6ArVJi9okAgJus0/lY1Svhveswv+/gVusiEchZOgo6O2S+tEQI46hS
	6bHu+sXTmdQSWg1646sh7alv9sr5cSqNajVJcohU7q5v/EMFatNoQsOUEt1dDyjrZTjgoY6S8T9I0
	N9dtxas8bZX1BcvbfLKtSQWmxT4IStHDUuP3YFTdU1khP5/LZs5Zgoc/9yKgF1ooAVmO4jNCjNW0T
	7t05Mv5UkRawabdx+ZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loRvt-004ZyQ-An; Wed, 02 Jun 2021 14:33:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRvm-004ZvF-Vq
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 14:33:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so3924111wmk.1
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=xUhef00MAVJBy+PY/e3mmGBGxXvIB8iTo9q2dRXzdTl6KgRNOFx3Yh5yZm5G5EDaa4
 MqdznlwSY7+USlsU8c+sFceCBC4jbvyxI1T0bdvESoujA+UP7urnlvjIJSKSVIG9CZpp
 3y1jKPC6xkQRU3IbTX6PaBsEUEQoVuT5KWblMlVi/2luDXltDZnS8VexfxbJrdoQ5jvr
 MXkykFkPCdRogUZ1amrbUundmf8LFslbw3D9ChQKatF0ihn61jSwGhg0tiwejOxV3UCG
 OshO5G93Twyyo8dVe3UVrzg9/ZziR1X4PrgmJqOYNb61iGuhDts2f6VYWZjl2Oh8g5kM
 dFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=l3TsABMIeBqhzC6aUTvQHCH6qqwqGUd15bjzN/eyX9xRpAndoyJjLc009W/6MmPk4n
 DHeYIH2gl8LGVQxmZzlgs8ygMShhEl90ygitjyrTcTER9ObuoP24zMB9QyD88wFYq957
 OP22+EfHSH8+25LVVljY6EYpXEgkFj7WvaFFL8eeF3T1cGW97hqRJjkjDLrY/lKZoa5G
 yvf0Ywrzdhev1vu88ion4WnmtTbKRJGYIpq6e5Odc3fQ7GNFYaz8f0my9fYG/77MSIDs
 j7pzsLFAT+Dmb5dIYvRFZjDZPSzsxrZUOoJVuevA6J7Z3OZa7PkOJsyeH0v1y9ILP6d1
 5SOg==
X-Gm-Message-State: AOAM530jzdoqAaOo4+ZvupDW6oCe1sSaZNvks1fqHEB4+kSc3BDRkdfD
 lliXOEu2/7Ce/AYXTYklYW7YrQ==
X-Google-Smtp-Source: ABdhPJzulksV7rbktUjzhrFg74d46BeymCpz5NyUxNhoO0P/xDn9e9UnTwrPNud6bo/oRxePX9B7aA==
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr15311724wmf.143.1622644393843; 
 Wed, 02 Jun 2021 07:33:13 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RESEND 04/26] drm/mediatek/mtk_disp_rdma: Strip and demote
 non-conformant kernel-doc header
Date: Wed,  2 Jun 2021 15:32:38 +0100
Message-Id: <20210602143300.2330146-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_073315_043467_92283FDE 
X-CRM114-Status: GOOD (  11.81  )
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

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'clk' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'regs' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'vblank_cb' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'vblank_cb_data' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'fifo_size' not described in 'mtk_disp_rdma'

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
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 728aaadfea8cf..705f28ceb4ddd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -55,10 +55,8 @@ struct mtk_disp_rdma_data {
 	unsigned int fifo_size;
 };
 
-/**
+/*
  * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @ddp_comp: structure containing type enum and hardware resources
- * @crtc: associated crtc to report irq events to
  * @data: local driver data
  */
 struct mtk_disp_rdma {
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
