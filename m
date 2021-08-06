Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7A1C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6721C611C5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6721C611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IngNQVUGVqGta5G9TJ5AMcOvTiiC5oljk0AttG8ej6E=; b=UIGXQxAAJw9kGGjt2MqOIT3ddk
	CsDSKqxfTPxyuVW2SdkB2WIOX/kDJ7XnPyaLh6Oz1q1hQa8N7MTgfhWlCuUHbmP/nY2yykx/fh6Cf
	rSZDNJyrsb8nQ7+3aTPvDCKtO9KFsMr+CBR3KeCDhMHnE/YQHz9DrqxiVUtwi3Y+7fUcKHzJ6FqIw
	bQe0tH4yX3NjnKstpdjvF1v7jAnFVrLgE2VxaEXSJ2QhjE6xr9gQFft1whpk0y5M+hDRYan3MgCd7
	0cFAikjGGdMogiLz9nuySI9e2QHAuKoDqeK9V7sQvgJNffgCRc1MvaHOwv/Mh9aVljFThfDSgJVtx
	2Ic2AG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrHu-00BTIn-3s; Fri, 06 Aug 2021 04:16:50 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrHA-00BStV-R8
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:06 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 q3-20020a25bfc30000b02905592911c932so8377188ybm.15
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=FlUyCuv7nkwXTSJ3TTeSOKCRVd1rmSaLBcPma8bxmIM=;
 b=pMYzDnLMqRNNyVX7IyuBXL5iUhkbKDXXpG0CxRp58y7sq4gjNrB3bz4oxGfwUiKR64
 VjThSogoktlM+DG5BrtqtQvZ0bR0uRyK3tnL78Pr82fGOVHWURGaGEh9juJVyas8h8kN
 g/VZ0mB5H86LnfK7zM5awlyoPkGBLet+GtFWs7V/ql2mpIsO8jX7+DaCxcgeid0NWltU
 dOMbnMntZ3UdQe+MWCyEwz+5Xe2qrPfHqTUBBmyVX8vxNNHCRvjM1213/jShbPO84Dzg
 +00LwAAKtR6qMy1HbI6IjgozhgFWeSjF0y83cCRfypy0vz3Dco/Z42vUkKi1nibgoQl+
 L/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=FlUyCuv7nkwXTSJ3TTeSOKCRVd1rmSaLBcPma8bxmIM=;
 b=ifsxWEQPVKzKUeFEiV4xpH6aDLH0uRdiN7yOsvNdgYaNsdIuQHUOqtIfGDNbXYpxz3
 26MtLGZKjOD6pLDGTEMnHBTE9QFYJnoR7typc0Kvl3BZFWjR2J8TjmuochWh6+n4GI7Y
 ryxvq3441pylESDAf4aqd3QqmyjYZRkof8YM9Q4B5E7EOWiJfu1Nv+z1czgS76FO9Cai
 a484RNevjlm4PJgrvGuUC+ycYeDksqoenLlPlFHT+enq4dOODBNmyVsb0vnqjpCzQCn6
 wvmxdMssGV3agMBLoOBD+W4WSMQJbv4QEP3N63i23oknJlz06Mw9cgLxOpQXd8BAgF1X
 wF/g==
X-Gm-Message-State: AOAM5337y0XQg5ag4dKQnIAWGvbJ03ecLN7SBqbgpzRBSDk27DZMDMWK
 ReNPr092BY5hh84zAqVB9ScIZek1VWpt
X-Google-Smtp-Source: ABdhPJxQsftZR7o7MRHdKIkC/yVIzT3BAW7EZW5HLGDHihPAsV9sxnwfsKyRFnWdjjB/0CB/Lo9V4t1gqchB
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:7810:: with SMTP id
 t16mr10800664ybc.352.1628223363503; Thu, 05 Aug 2021 21:16:03 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:19 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 03/14] media: mtk-vcodec: vdec: clamp OUTPUT resolution to
 hardware limits
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211604_924101_9B081479 
X-CRM114-Status: GOOD (  12.05  )
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

From: Alexandre Courbot <acourbot@chromium.org>

Calling S_FMT or TRY_FMT on the OUTPUT queue should adjust the
resolution to the limits supported by the hardware. Until now this was
only done on the CAPTURE queue, which could make clients believe that
unsupported resolutions can be used when they set the coded size on the
OUTPUT queue.

In the case of the stateless decoder, the problem was even bigger since
subsequently calling G_FMT on the CAPTURE queue would result in the
unclamped resolution being returned, further inducing the client into
error.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 1a633b485a69..16e057f73789 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -649,19 +649,17 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width =
+		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, MTK_VDEC_MAX_W);
+	pix_fmt_mp->height =
+		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, MTK_VDEC_MAX_H);
+
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
-		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H);
-		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W);
-
 		/*
 		 * Find next closer width align 64, heign align 64, size align
 		 * 64 rectangle
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
