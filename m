Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8F1C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A3B61059
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72A3B61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5TCqJPToMY6wEjMtUed76QKUwxGesxoEyq7nKOJDmw=; b=Z4HIba3iPhitdHfofhGXhjJHG8
	QiuEksL7d+NsU/6ESIAeAk2OSkAtSSUy+VPPSmZ4twHrHJgIekJnsKfdd18OJsxBMnnWy9UohuSrN
	FUXRiQjG7jPLMUOf4Bu7mOThyp9xb20tgL1ImGTRJkeptOeZdzW9sfGstziymT/ASL7c36BF3EpMX
	/p6A9sgk1VcPA5WPUD43pjjJGXd8FTqEXwzdLqwK0wbUlNngoTd9FAmfRbCrz4+9stdMfLXUv+Tjk
	2A3Nq8Gf0cVvsD07wN5vw/iGDpzHelHarWpjvjW2udp2+yRo9eLJ10KXTbtYHtci4c2ZmsCwGEojI
	q/LpEuDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhQa-000i0s-ND; Thu, 20 May 2021 12:05:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhOH-000hEj-MA
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 12:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=; b=ewnrd67LYktO4JTizksMXmmeqD
 aQmFKS7TvvjRBevhPDiwiY8DlE6KyMhoaJNH263jdWUXt3ll2a4wK6EUUDF4jYP+NYU9cp4EGrZAl
 0w/oCIQkx/ocoRZy3kIqCoIxeuk5TXtxfQmvupW3vEDWR2MI0714pcbc9gxze8U0PuRnHwRrcm3tp
 QInlAYx+BTh/h/hP+GQ6Xyvq8wUToZE/z5LPvg7yXxR0wfp3icPQbKuFkNpng+yjGsVy05oHup7xQ
 x+Jr4OEM1lRDqBzd+ULcGad31kajYog2hN2EvAbVIHdMZWmOkqP5R+ODSubRGzBmeJF+4lR+0u7f/
 YSieEUOA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhOE-00GHp4-Di
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 12:03:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so4959713wmc.0
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=yVNkE6LMgKRrm9L0PXzODtlbyrkJccI6tBlQKP5YfbFApvsFNWrsZlQrQUFfUwvQcH
 O89HKrq3dcoAIZ3K/9+IBkK5k8wTEwbsLnZbG4BGSXV8MjBRV36AU5mBa6tXbSB4TsOX
 Sink0gYtfRxJ5amdGUYoTJTqpdBFZ1A1RaJBuErq62rN+wWD6KPiOkK9SSTiBM3T6+yb
 pPUn+fvRnwU/0QN4Bg6/AcKQMBGBh797AmO2z6uXHyghSAG3BEA19YG1XX3sgCUH9rrV
 /lNhbYEunHaq4jQtRtzIwjb3olvNWsqGcTSWxf59i6Ef+ZnlVM1y73ZPKeWdGeMABZPV
 fTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=An3pIW/kBI1QLZLsq4rliXJmkXbbrvmReQ3+gpJCdOrolOJITs8FksSkteFTenrOkd
 CfxMXK7jYYPKHodilEyyAEIPagQkOACYOe5YLrd5laitNP0ScJ1BA5E9eXPO7Nju/lmv
 eTzuf7BRXvQWi1EUzSaC/EB6prPEPc8uQwmOnCsUvcbEGVUcYEWY7P/0iZWY2q9ntHjG
 VZbQGsIYc30iwuod6yuuWsbpVnirWST7tuuQXztIv6+AA6zbUnQKIFyfxNSOO3X2wDdG
 X+k9oVsz1kVMMhFRXyKZfHjPsZWu4oMB7aEH9n6mH0xhuf+7UKnOCZWn6/68/SXP7XKg
 c9aA==
X-Gm-Message-State: AOAM531KBWbsJisDnqnuHcn63Got6SIFdrsyXNVwR4X/GzsDeMVZDiks
 PjzLZ5pZJMUhpMuwqbcYa6OTjw==
X-Google-Smtp-Source: ABdhPJzL+TBqXQbBCqdO0J1TpltSMujA87+5MzgL9bvbaSIHTDzj0jzbKDSNOe+5REQBbMAiOcQ72w==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr3760475wmc.168.1621512177173; 
 Thu, 20 May 2021 05:02:57 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/38] drm/mediatek/mtk_disp_rdma: Strip and demote
 non-conformant kernel-doc header
Date: Thu, 20 May 2021 13:02:15 +0100
Message-Id: <20210520120248.3464013-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_050258_486729_21B9147A 
X-CRM114-Status: GOOD (  11.84  )
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
