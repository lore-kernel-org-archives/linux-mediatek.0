Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56739C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B55613C9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B55613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hknqnfzv9RhcQb5ZeuPkw15HRfcv6yCizC+8VabmOHM=; b=z7kk64gwYFWtaC
	MJ5mnU6nIMRqqJRqZnBu+MVEnmJ2i+1762JDKsHVcmNn13H6HJnCGm/sNbQWUh4SghXNt8ig4oLqi
	UtZ8DKDeJQJ34PvrU8vDW1sXtc0i6Hf9faUAwv2MoqDQTcBf4xhRrJJSAXBw5Uc6nKOecLX0BmvWt
	6xNazL1Z1ocwP2gzYkYNSjP48Q2lx620DsnVDQjqityJO5SXuCzcdMOyHxZ52oy0pEQwtBwFt7wiu
	vstavpT6wmydbGQfhFxM/h7kx8iK94h/6xBystEmQ/CC99fiCw5kiEiaMc4TUrgHvLfDFPbvSwWAa
	+9MoggiXsYAzwx4HtXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HEU-007qHK-IL; Mon, 05 Jul 2021 05:33:26 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HES-007qGJ-7K
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:25 +0000
Received: by mail-pf1-x42b.google.com with SMTP id j199so15282123pfd.7
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1jUXTbb2humu9f+3tIoHXLsI0UX1WeqPyARYAXIpkA=;
 b=T7YovlKMB542pbmQgFgtJcmwmIiCKxX85ZjUZwDy6QflB9FtLiWMtnINkgtyw2r+XU
 oPEYgcHFzqd1gmhvvt4JFqmRJ1BxgASduUHy8/CNnm0V9uKRf9GPqzTp5uWh4VuuFbNW
 mulGA2pmgaoRhA2xcsM1zcBri/RaCN6R8Oa9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1jUXTbb2humu9f+3tIoHXLsI0UX1WeqPyARYAXIpkA=;
 b=dDvWzQn6p1vG2K2/gaa2/b+/nNpJzQnwCFmxuj7SD91iQ54PPso8EGjINpXYCrecSD
 av1KfnWj/pa1P7FY1ijeI3ksEmbRfpD5FISBYq6Lrlu+opdTFR8gCpbBOKmOGdLlS0jq
 nYco43hTyb8qEk93wWuGUrp9VqMMivGcwk9ayFhfWxe/M5En5KkQSE2gymEi+OP1tIry
 OhP3oI4gLiUQAjwFCuhaCtM6CJlJtKOSEIjWInwdMCgWKZfZ7QDX2Q/blsQga72jxxtz
 gwtUiVn74hC5eIn2rGXNSfNfGJSHFwi4e+SXE1krvelnZJya43cI+3Ni3BOmjYNU+L5d
 MY4A==
X-Gm-Message-State: AOAM531gB/Uu0CBT7+FZXNvFbEqRcxxV9K2soCzD965sAzodDd5R0m5j
 QXtoXwNPAaga3lNd/sjBArRpzA==
X-Google-Smtp-Source: ABdhPJzlWymH7+YINF63PEFOvj//RlI7o8Rqvfxc/UfVgEwtyd7SZYkSwgjVwRzndX3uHQtRKHy6XQ==
X-Received: by 2002:a65:57cb:: with SMTP id q11mr13716173pgr.430.1625463203533; 
 Sun, 04 Jul 2021 22:33:23 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:23 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hirokazu Honda <hiroh@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 01/14] media: mtk-vcodec: vdec: Support H264 profile control
Date: Mon,  5 Jul 2021 14:32:45 +0900
Message-Id: <20210705053258.1614177-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223324_306319_BBBEC60B 
X-CRM114-Status: GOOD (  10.06  )
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
