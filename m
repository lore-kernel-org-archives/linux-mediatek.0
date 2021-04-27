Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A387C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCA7613BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCA7613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+jRsSBnLipev+BHCRsfwX2zTuWkECSoxv/VnYvK5F0=; b=KBeB8ctPUcgVgvYkIXblGsEwx
	3n0SJjvw+tnP6wSAaWc4DYH58AFuXwCnyDN1Cr83h6fTGEHZ1wABut30YRW6zMLMLm38wa+bNotEw
	p0cO9OFKKLcdsqIxevMqHyhK7rz5DU279oYTCHr6/XR2JPJ60j3MjSk4JXQG/vW4DDyDHsvxeVAA2
	5z7+BZIwxIyM5zRH7U/uKdzzI4EDjhYtMQObj6DE6gRaQbtw8izltq4mP62OJAALcvRof2seLXmof
	To5trgSFc5OnI0zXHiqh27XPrFnM1rkYvHmOQvmdyHD+pM3F2ikJnjy+35M/vMxfIfFrPb75Fkk+d
	cEEZzP9AA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhY-001TsB-OJ; Tue, 27 Apr 2021 11:16:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhK-001Tnb-IT
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6wyv4G/lQ/EHY+nAhCaUf35r1FQBf2AesHuDPMoclw8=; b=ntPBTZ/EkSr7aHodzhYhRW7YkX
 nW3KJTddXLahdoCV664WqyzgT4SmnIDbCfKAaf7fy6BqEPH6Eddw5erulRRjfwXMihqC7pdeIbDcW
 zN4tZKDHzHzY1rYYQR021Q5rKkhemvBO5VPF2nmmdFugYc4YmCb6F9D/2XiJmvJJdZJ/oBXy6A6sO
 44BJQHcAQpHRHD9JMUXiiRc2+8AW86cOBJE9/yh+SbDBIwUH9wMONAomsZDeFYGkmr7Z3eKefOFL2
 ktCW7UCprFmSXBGNCvk7BwuCNJwjeCv6bgpXlyKxcL9idjaje0PN4gbXIsbrD61nt1YHSzZ2+f63P
 6QIie3QQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhI-00GgGl-4x
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id e15so4337743pfv.10
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6wyv4G/lQ/EHY+nAhCaUf35r1FQBf2AesHuDPMoclw8=;
 b=EbDbUiG+s/5bKjIABss2BCP8TiPWspaaME+mSIBSYp3DybGob+DWyGvrhulQRVeADI
 rAg5U8NNWmpFbJk532ChdfH6hzLsJZ6kGlsdiWvKCO4RPDDodrz7wm6lKyScbKYpERGd
 9YJG/n/VxxcJ9zfCW6bpu+qkojFg1iJ4FoI/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wyv4G/lQ/EHY+nAhCaUf35r1FQBf2AesHuDPMoclw8=;
 b=eMi+vgrV926PilAibvbMNA7NqPuEjTJm+np1ZXMSSMGQ7idjfZP9b2vrzvL80ticuU
 qO1UD+rZw6+VkHyfDyYyAe7tKzvPIpjyDzZcaD1y20p3gqYn7iTu+6/GagN6tRFwQqZ3
 GA/vm/R02pHJzMN7GD6dz6cQY80hMxYCL0+sSYggX7felQ60ljUEcDQNrTIy8a7RfMEj
 gtiObWZs/nWhzN44Ea4VYqQMrjx7c0QW+MgXzDp+ynr3QrCYZrlVIi5uMTI/PHIAi/QH
 YDDAjOBQMM407P4mfIyEVTSC2HsPe/Qd/NpfVTYDUB73HcfoVtYzsnZClK8+bIRbILFi
 greQ==
X-Gm-Message-State: AOAM533Th0CchAQEDE23QWCchdR4PAeyX8Krx67dJAzMdKbO/SuWp5xx
 2WgHvOzUjvSUJ1zgSqiTSReRgw==
X-Google-Smtp-Source: ABdhPJxaFfZSnDofdrzYmCyzQRCADWHb3fdCONPpxa6HA2xpTld/7zf54fUs0nthxozgfrBcJR/Cqg==
X-Received: by 2002:a05:6a00:170c:b029:225:8851:5b3c with SMTP id
 h12-20020a056a00170cb029022588515b3cmr22453831pfc.0.1619522167429; 
 Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hirokazu Honda <hiroh@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 11/15] media: mtk-vcodec: vdec: Support H264 profile control
Date: Tue, 27 Apr 2021 20:15:22 +0900
Message-Id: <20210427111526.1772293-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041608_209519_DA6F04CF 
X-CRM114-Status: GOOD (  11.16  )
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

From: Hirokazu Honda <hiroh@chromium.org>

Add H264 profiles supported by the MediaTek 8173 decoder.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
[acourbot: fix commit log a bit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c     | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index c5538fcfc9a5..d815125c81a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -611,7 +611,16 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
-
+	/*
+	 * H264. Baseline / Extended decoding is not supported.
+	 */
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+			&mtk_vcodec_dec_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
 				ctx->ctrl_hdl.error);
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
