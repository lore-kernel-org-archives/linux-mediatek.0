Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B656C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:04:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC76F20781
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e71+x4zR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SZIoVTB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC76F20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Q3IaOKLh6YP1k807Zp9SNJEbwNy218Alg22Rf2/MSw=; b=e71+x4zRn+xvGN1f8Ux3PhatZ
	M4UNqQIFiJPMiiqIpxYfVAk4o66yD0izDptmAk2nTEdr7/gJXgD+RbtHvnhNx60gL/ktMFOTl4DOJ
	9ICJJpETJCgwkJ7Y7h1i8fVj9k8wvdgO4D0PiR+YjbQivPD2mpCSMyxUC0FYB+Rb9SVEhxuGRQYgf
	EopO4L7SUc/TS2VKBgeVhs8KohCOeZVT6VXgRmiNb+DRUlTMi8Hys9XQHXvMmGYxFGOo6LkhVfkFw
	fTK7hfwUrWCBukj4A5PsA2vCcTQyPKHvX+0KMlNtqtQt8sT66mSFa8ySngs4hqan31/BPr+fm2ysL
	0Mp4DeAtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jom9w-0001xE-7w; Fri, 26 Jun 2020 11:04:40 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jom9p-0001tr-Ds
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 11:04:36 +0000
Received: by mail-io1-xd43.google.com with SMTP id i25so9409224iog.0
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5vXuXwwtIZUfF4BfG9q9gkBaSVJwvlyD2fg0DvyG/o=;
 b=SZIoVTB2bUsJPcvPGht36M0kNPya2OtypIUm6R/kU5idf+jHwGcKBDebxUMontdwE3
 ucu8ImAhdYwNMIGhZBU/ejFM6SA8aC6xrI2AQao5qFzDp/WSgwiTK0sOKxLJb7WLOiGX
 0c7g+j1jwesG3xBx+UbJku56d/hrsWmoLjKkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5vXuXwwtIZUfF4BfG9q9gkBaSVJwvlyD2fg0DvyG/o=;
 b=Dj+UyHpaEJBvGGlEgQ84Sl0fI97Y7h59Hly9NDRLoi05dqL23+xdUUNNuUkWcVvTFZ
 FcYUDWgNFSnETFw/+dtFs73NKE5JlwZ/SMZzcYIK8bNvzkk505rCZ7fzRADsjv/sV8vB
 p3q9MY25CTo6J1mCdds62nXaSNiB4m0xsck6P7PKqH6toHqEW79yj/jxCTSMacIEt+ce
 WrtLjknStcTqWf++y0yhdOdgX0PRIjpjFXLqSnOB0zBR8mzuvkMo1x4EL2nxeQevPvWo
 QvkuTDTqk3av9MkvTHAF5hmzL3PuMd5DFghL4xNPwGk8JwsrvjyG8ysAGWe+X4VrdOms
 tbzw==
X-Gm-Message-State: AOAM533xDOY2sLLXILpnXFY+fAomfRsLWyqcawERZO4ph6yZfNnNqbDa
 gNQaS4UCc7O+kZymQjd41Q6b0LLXQMnMyA==
X-Google-Smtp-Source: ABdhPJwsPYMFNn4UtISOFCd1oyh+Vgmf6qCPkOU+H1OcttLDf70TTxwBOBUiqZwXjwu/ORDB1zroQw==
X-Received: by 2002:a63:c58:: with SMTP id 24mr1611333pgm.343.1593158762125;
 Fri, 26 Jun 2020 01:06:02 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:01 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 10/18] Revert "media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding"
Date: Fri, 26 Jun 2020 17:04:34 +0900
Message-Id: <20200626080442.292309-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 81735ecb62f882853a37a8c157407ec4aed44fd0.

The hardware needs data to follow the previous alignment, so this extra
space was not superfluous after all. Besides, this also made
v4l2-compliance's G_FMT and S_FMT tests regress.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 05743a745a11..f2ba19c32400 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -299,12 +299,14 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 		pix_fmt_mp->num_planes = fmt->num_planes;
 		pix_fmt_mp->plane_fmt[0].sizeimage =
-			pix_fmt_mp->width * pix_fmt_mp->height;
+				pix_fmt_mp->width * pix_fmt_mp->height +
+				((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
 		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
 
 		if (pix_fmt_mp->num_planes == 2) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
+				(ALIGN(pix_fmt_mp->width, 16) * 16);
 			pix_fmt_mp->plane_fmt[2].sizeimage = 0;
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 							pix_fmt_mp->width;
@@ -312,7 +314,8 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		} else if (pix_fmt_mp->num_planes == 3) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
 			pix_fmt_mp->plane_fmt[2].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 4;
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
+				((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 				pix_fmt_mp->plane_fmt[2].bytesperline =
 				pix_fmt_mp->width / 2;
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
