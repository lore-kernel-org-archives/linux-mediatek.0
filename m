Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6421C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F90164E03
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F90164E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aqXZKjYBOY3FyC25jrcgCjAfoiKmBBLcQ6kxbDk+aCg=; b=ULbt9dtny+Oq+3jnQwaw1pqqF
	3GMhR7DmQZiv6RiWIIyHhdu83dHx7hkCLB/iKV8N8pFIf+w/9irE1+NLMdTkC7wVs7NmvMVoEfXCL
	YwD3rvoL0lWH5BkBBni7YWAng8xLzDYJ1Aitnx8E3BqUp6xsb4Xw1piPCd0QJAIklWdvVmy6Ed6Av
	IYPP1wh8du2YiF27FbUTWshRK9FkjeTHpqoLGs2AkdnhuMTai6dVnBbWwOUeVaJRuBosU16bC4Al5
	TCAIE43aMMfiGFu3xFCysS2y93rVbYnrO4AtXHCZPvcdv5XqHH85vsCbNp6k/ieZxBHa2Tf3hnxO7
	8ojdOhTyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OJP-0002c2-PA; Fri, 29 Jan 2021 07:35:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OIt-0002P9-Ij
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 07:34:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d4so4776691plh.5
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 23:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZWXOVsKIxcx+tGQm76xdUBCxirqlUu+mbOtPxuu9AE=;
 b=leoqf+1hTP4H2PyDaC2xZP2m2uUPHXR5pGWVrCK34boQBgu2ADdiKOqVdRJgQEo9TR
 9p5kv+xcuqa2WJcl5zK1Yna/BxYoBX7gGOnDfNGW5F/bl6VGwU01ceEpKkCgBgW9t8Ij
 cw0EJ04W3ir5FmuYOVsxM491joxVdzFf9M60s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZWXOVsKIxcx+tGQm76xdUBCxirqlUu+mbOtPxuu9AE=;
 b=eAmIy35LPuC/dJ3k+1FFJRRFj1yR4k2cRIL8jVlKJu8nHI9FQ4HTrmhxEByNyqZF5r
 0gO2hy2UlY4QMTo1l5gg/CdCk8J2J7GBf9FxLZ35qG+8YJjpB3Xd1pjMApiJGsgvWlbz
 cT6lF8ETXYBLShS1cWStTtGvoFgIZJYOGmp6p5I4TZzK1qxpL67vZnp8i0kXoKQ47mav
 WclQ9Uhf4GlR8ERKLwTy5v7UUuoXAbf6Pv2kfopvwmJJANd0xSGWevuBHPVCBXq1019S
 fylOSCXqbn6/BHuW346QyhScKsTBcUCeftLEVIXnyxjFRa2YiRfen2DfSKoqDA5ItDyv
 E0pA==
X-Gm-Message-State: AOAM5309AFvgL0BV2DgGhfT1yJmP64eA2MqFjEgSOsiSyC0nYGQjQgXu
 MuKKvBctouraEv7wPmsJ73qUlA==
X-Google-Smtp-Source: ABdhPJzFhYJSIIxoG5CMdSpK9JhxCqNvNkZfWnMW28x1fFvVi+kdtvyTLL/rylCjR4CSvx9Vq84J5A==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id
 z15mr3446744pjt.88.1611905689225; 
 Thu, 28 Jan 2021 23:34:49 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:48 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/8] drm/mediatek: add component RDMA4
Date: Fri, 29 Jan 2021 15:34:31 +0800
Message-Id: <20210129073436.2429834-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_023451_709220_E4AD27DD 
X-CRM114-Status: GOOD (  11.71  )
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

This patch add component RDMA4

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6c539783118dd..543cbfc9c5d85 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -496,6 +496,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
 	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
 	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_RDMA4]   = { MTK_DISP_RDMA,      4, &ddp_rdma },
 	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
