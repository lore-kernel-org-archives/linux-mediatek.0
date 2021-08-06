Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91081C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC3E608FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AC3E608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t8Giad2N8kLt4l515zOh3OaICBkfeyaG/Z0guObTlw0=; b=Ut7xRMEntpfpnQyz2nNNpUofZT
	KRzszc2fg3acVg4bUzqgnQeD0RyiZdC+BDOVblft0gKNVDazhemZyhULTJjOg9DCSXt5eavCi6PQ8
	C89RtHbfio87dRhLn3HiFBX+kkwtS+8IOoW+RnHwyc34SFPN/V6Vcn4SHr+f2l+GlRThUVWvYaCwy
	A+4RRA5BsTBRjLCH9eNo4TxWcSrDsVbyNu8ebsgBrNh+3mcn4FYDZA9yTa++Vmgt04OFfmLlZgmE+
	Pyf9VCGwc8p2svGbfCcaTPm1Q8wTZQvnV7cGk059DXadVhvUGJr/DjwWT+wel3vXQiO256eBrVKVW
	H4NjWjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrHT-00BT10-Gt; Fri, 06 Aug 2021 04:16:23 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrH5-00BSrU-Ct
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:00 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 e3-20020ac80b030000b029028ac1c46c2aso3780271qti.2
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WL3xTLZhfFrhkuc0OkQrHT12omffck/a/CybJO83okg=;
 b=R5gi+wfQozM+tZmJxMGO77+NbPcGSEqShKmY1tmDXb6iXvWLefwje5oDCIr0Oi12TI
 s2WSxUGQMGewK6zp1nesYCPh5Ju/7pZkDZ2NFVDRBbC2oQp9ejMIPzqfVYyb0MOpfvnr
 0SmKzgDLbJBY+J3tyHxpiduBBbftX2KWf1KTG4XKOCEUyvK49508x3muFkf75Pd4VgE0
 6UGaCSvcSzPttBpWBfHDjhrodXR/JAE2nUrttIB/xQfzSHJmWrJx4msrXI1OCbmM8sRd
 eTW4R7eT7ADmyCtNRccrfaLZ0n0CR5N8FgcYjyGw4ykYBR/jwJCtch0SJrJXh0KoMkeW
 USCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WL3xTLZhfFrhkuc0OkQrHT12omffck/a/CybJO83okg=;
 b=oIenfmzR2hG427hEiCMdbI8FJdouBOTXJY0W9JWHA7pgunAPtwxD5sGdPj8a8x0d6O
 /uHJ65U40Cj5AY7O70UVpHtqkseuKhwDGe36QYvRFKnUf+KyS78ahuxx3n97/N6mFHhj
 Cb9BjhArZCR3ggn660hmZ0TUYbD6VPKfyzOwfebKTGmUBCiHiT1hKZt4mo1/Yz4ZzB+5
 czdxmZ+cQT9bZKL/HbkOwxE20jJbmrao+0xupY5E3l4BQGEPUTEhypI5yhcTbIAxmBGL
 mx360kvz2Ms2GQatVvbMYvz6MbxpWdMooZZuBNQ+2bDgtxyXPRJ+JTeYEAX+uS28mny5
 4r7w==
X-Gm-Message-State: AOAM531XfQI4hSHsVAPFA7vIykRaQKdK4rBWJ0hQR9qF3E9vvjFl9ZYb
 DGOfSmu4rESM0ukb8VCkCin+JgeUiLMJ
X-Google-Smtp-Source: ABdhPJxBsaIDHmyQ29WaZg2znI4qKV7rxgagb+NJIsfnJzseCynAI4hpCV8igttTVtE9rT4oRwzVuBmDRsN2
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:3001:: with SMTP id
 ke1mr9176750qvb.52.1628223355982; Thu, 05 Aug 2021 21:15:55 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:17 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 01/14] media: mtk-vcodec: vdec: Support H264 profile control
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com, 
 Hirokazu Honda <hiroh@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211559_465781_FEF57EA4 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
