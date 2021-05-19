Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF694C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360AB613BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360AB613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vGn+ni8pLrkaAop4jHp0hCYsqrMtiPjeYsf9RetZOFQ=; b=lfR/Vem/yB+f7ZxLROGnPwmmr
	W1hNxPljxFj9y28HXU+N03GYIvSItFBR0+57xlN/Z0s3Cs4kZnzI71RUm8JakUoT/fEmCfWhmU35i
	0tXcx0IHd6gVnHzelUfgHaDBpK6jITUo9gE4ljd0LT3QYOaxrQlIzztBVbZa4u298f/Y+ZaajOhpP
	JLjVC0Or05P5jw3E61fMK9S2E0uwgIRjh3Ag8DT6AQtvuazvappz9le+0yyXTZrIXBLQaPW/Nizer
	Cu1kIqgIc3FNByEtZ3l32Hm85//bMsLx6mskI7DXgPv5lG0BHsA/+LP0LKxvRDfJIrekVVWtZl1nA
	klYogO/9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNDi-004GeD-9Z; Wed, 19 May 2021 14:30:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDf-004Gdh-RO
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=H/JegrmtPw3esG/3ONCAiiuwrewSM2bmGc32IKl+Wak=; b=YWG06Qkx8YL6iqNTTFSSpswp93
 AGobMNNE3L/0hEZnWRx6oTgzquL3fuZq/o5NEIEafzH4fISSG4Ha8lo1vu58cwKOCegmmDYjmsdyN
 k4phy8I6Q9pzC0hZAkDuHjzTwGJH9aIVxEjxvTUpp/FXX3RsY0V769SM9O5ab2nQNHdf7WtBYtIrL
 0JNavikKy0NDNmmm6mkEMIAqXBwjw/DKwSqEDfMJO9gmAojajIO6dS05xzXaN8qN4xMSNxhW6qnsi
 1mrOxOmqcxfA9l5TVfiqaSm9nf095MCKeRYkswaw99d2wQeRpFpwtyWsEVyiEEJ54Zt891KcS3BZH
 HD6TVrZg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDd-00FXnC-6n
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:30:42 +0000
Received: by mail-pf1-x429.google.com with SMTP id d16so10006330pfn.12
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/JegrmtPw3esG/3ONCAiiuwrewSM2bmGc32IKl+Wak=;
 b=e/0683k5vnhao0MCIfGZACYaPEVYU2bl/WZxt7NjbMOfkAlfCxAViAbId0UB7Odl5V
 SsztA8+oVVyffcTEsp5QwfYpVYqZk+652QCCg/MwyMdZO/HdZY071TP+ofLANRFg7oFM
 pcjAJ9UprGKmqPVzdvMePFt3nDM7UKv2N3RiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/JegrmtPw3esG/3ONCAiiuwrewSM2bmGc32IKl+Wak=;
 b=FLh960F/awe2qPt9EpO16CoYpRyfi8u2fTDD3xm43OMUCZ26N3Y7vhgtUwWY70RW14
 Bcjw9oNQ/ncI2Y0du8W7r6G1oKjkKNIzpSh6PReQvol4WlSQuhFOIbg6AJk6D5KBd70p
 rFY8OP4bIjKz9MMWi2LVkOmenQvNLfHDmFEkbqfexz39sn1r2qnp6SCzuQzSj2TNOa5G
 MiM7nZNbMHG6MfSNLdCLpM+sC4JATiInoT0mjHVx5Idfinn30YmJQ3Zw/P9trNpbU7JS
 JI7nqK61VFS34xuGxwYik+PXajhV1PY7kDMmxs3zp4Rzxke/qf49prEK/q+lPn8vqmia
 FR3g==
X-Gm-Message-State: AOAM533d3DqB8FbWPp2sJgvdsEifsBGDJrlpH+zsuKZXt3DMr0EgqQuz
 B+XkjKvY0nkQ3yNNl0dscztrbA==
X-Google-Smtp-Source: ABdhPJwj+dDw2M/xBSoFiLwfOMAGPnq2OgavxTLnltYVk7rgjWKTjHRU0Xtzoj+g2ZXxX7RNqOlCsw==
X-Received: by 2002:a63:38d:: with SMTP id 135mr11417309pgd.285.1621434640225; 
 Wed, 19 May 2021 07:30:40 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:30:39 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hirokazu Honda <hiroh@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 01/14] media: mtk-vcodec: vdec: Support H264 profile control
Date: Wed, 19 May 2021 23:29:58 +0900
Message-Id: <20210519143011.1175546-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073041_253172_2CD13381 
X-CRM114-Status: GOOD (  10.67  )
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
[acourbot: fix commit log a bit, move to mtk_vcodec_dec.c]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..8df8bcfe5e9c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1421,6 +1421,16 @@ int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+	/*
+	 * H264. Baseline / Extended decoding is not supported.
+	 */
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+			       &mtk_vcodec_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			       BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			       BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
 
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
