Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C487C43331
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:37:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A2D64E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A2D64E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1CIfUOptGUxzjLDkGvfH5hAjFfv+h3RmYMQcrhbcOyI=; b=fQfrlf3/JeQ2pQUa+pasiL4KY
	0/wXU4cAK+45DT65PJO7wfiMNcwWpki3pvJ+OTgNBd78MO9Jx4jcctbyYZynD258OR1bEqyQWAlsi
	W4vWBTA9sEnAO7htIu97XQXIptnyciROmHC6e4GgMNu5O11MJ1LM+0g2U7Fh9Pf6iTcGE2VtDtI2c
	Wn3idkMsMbQrSDAjpvpj7SXC+hzwE3340IrsccARLfwj3MJlBvV95Cfgs0gr30gwjrsI4lKF7b/I4
	EV11MxIrWz1LwWQ/vhDzOjmknH60BIBTrPYr8G/rwfNIPOD/TbwK79LU2v8Kz0KfRRLJE9Eoff1Lw
	AKdsmSfiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WaS-0001du-IU; Mon, 01 Feb 2021 10:37:40 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WaP-0001bw-Co
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 10:37:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id md11so10047712pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 02:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrTdRFcnWQzuRTgnluBbuBsSEw406Rl06q57E8Rqlko=;
 b=WpMFU6q6a/odWPME6nItLViwl7Dk4d/YMVq+6O3MTBuys+RR+6xKK03+6xWYZNQafu
 RCjRWP/ZuL1ErIm/I3aJFJ7UJdIxuBHrlni6lXyJgfGmYkZ6IL9N4OHN7FsIbhgvD/w4
 HWvvHyAZkaZC4yYPDYo/sf8u4/vJZasNpbUp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrTdRFcnWQzuRTgnluBbuBsSEw406Rl06q57E8Rqlko=;
 b=Ir6tZY5nKSK+wHMAD3cmQHIdPFqPdTj6YrqBfWIu4wfwin3h0JynepDOkiaecXVtAg
 YPlWgzBJZCxssOiqGRZjRqglXUwsxCKk0q90ORI+CCWBwR+oiHyumspJXBGF0nWMO7Es
 iUruWl2cJh+Yt4RZegC9S2TnJKdvgxG9yqXYHOPPi0PIm8KTVVhstW90gScdTtxQG94N
 rm3MJ5l7epFNMhBggKsiylwgxFgV4l4bmX+4rVbqFsUnmcQYKJu4UsrHO/wXLvx692ZZ
 3S08VeLRxIycmAIAsj7UCEVBcFc+5EaEMk5xrq8xaacg3rQk+CCKDDRiC37Q7X9Twjv9
 FsEg==
X-Gm-Message-State: AOAM533YPtbFSm8HaxUscwm6DVohgrP99BEvhpywKf7Fv30g019Atr19
 Cyy0n44ZlqTt07XrrGT4ORFNrA==
X-Google-Smtp-Source: ABdhPJy/H/X+tkbdFrbG/4/lVmtjqOFlXPhdSQz3Lua3UzweTfJfL6z3kMdFS1JR99nvh6s9hj/6yg==
X-Received: by 2002:a17:90a:f0c4:: with SMTP id
 fa4mr15709655pjb.132.1612175855167; 
 Mon, 01 Feb 2021 02:37:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:34 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 1/8] drm/mediatek: add component OVL_2L2
Date: Mon,  1 Feb 2021 18:37:20 +0800
Message-Id: <20210201103727.376721-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_053737_551853_49E8CDE1 
X-CRM114-Status: GOOD (  12.88  )
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

This patch add component OVL_2L2

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 0444b429daf00..b6c4e73031ca6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -477,6 +477,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
