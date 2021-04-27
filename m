Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B1DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD15613CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD15613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TjXeF8LYybZ658AmSQo/PLtV45mrkGiTQQCKW+4PtUw=; b=RJDDaCdt4h0hkRJBkhPIHkgkT
	9UBIsJuplr0OrbsESVhxBN1ACk3JZhaWx6qR/F9oe1Utj1gpJnxfPTdw63kPNeNLj3QI9pMxQP7W6
	A5fZD3WIq+dQtSoGgMmmsk+UQZCcp4AqDrwxUZyz4hZC2Re+PN0NRc8ax5e70bmy2VO7CaYCmBVaM
	jReo5FfzzU2iSs9iQCi56D5DwB99C2vr4lRCpPjCK0ZzaXS14wicAGa4m1iy5ZH0ErJU8MFUJYRmX
	O+XNeERgpu2fmN27F65O9nIEjofMBXR2zaHBgFoShbmHLrQluz0xypGuP3YAkUIiwDfJXwHT+ut1d
	1NGkXxfsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLh9-001Tkr-Im; Tue, 27 Apr 2021 11:16:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLh0-001Tis-Pq
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rhS54utv1YzIbFPUPZVH1abgq1ro55v2mmnzFXetrAM=; b=qUAki4pJKVn1ZtLbI0FhRCPD+P
 IN0+edGNNOyD2brGJKwBkNaEhYzM6a8jRDlar5BbnhojQWEE5zwrdxlt2SK9A8MxeGCSUvq3Z73nf
 Prq5+NhjweJ5O37/QSc9ok08uiJllU5wR6CAsCF1w8C2THpP/aGJEXkj0dvNtwbd2ei6GZ5Hx+qRc
 bZb8NcL+u3yV9MmAwjLI8D8gZtUfWYcz+gWd/hMOoCQPL/WQVPdIJl1iV58VY+qPuEr+oRcELNImM
 ly1El1ncFygm+vOpUDPmMBCNf5BtSRWCxtnG57P//SjnAiNlPCbebSYa9R5u19tl2L4gwvbZ66MvL
 W0zoYkaQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLgy-00GgC1-7K
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:15:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso1193776pje.1
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhS54utv1YzIbFPUPZVH1abgq1ro55v2mmnzFXetrAM=;
 b=dmzIuyFPRC2KRTi15IBaYcLiR1g2yCRfSlDgP0mRgEv0OR3plonVKqxwOyrjQVQuaN
 hUiRC7iZOrVb4Mvzzj5ALQQtU5ts7TMxRBg9kXrRU//93Cos8ksFOrBrex3AlrF5bEk5
 kYNSj6LkCopCPG7hp4fUXO93VVrUN7webOF70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhS54utv1YzIbFPUPZVH1abgq1ro55v2mmnzFXetrAM=;
 b=ZXlDbMjuQofXVXi03Z2COaGzKBIT+UVGfJnHOIf63jly8wB8ebirnvFHv4tBnRS6BJ
 Kn61PVBHtHZ7akddqqAX7rpDsJxk3PnpMJ9D25p4eooHtQQcgU/3cHmd9Ia/tgWDA1lc
 Cm8qB2MHAJYBVUYudf/xuHFnvM9lY3vZR9m5ab76tGuf0ksb+qu1wfbOKQD354K4MtJj
 FuaLCb6nDbOnri35GiYNa28ItX9BrZzM7BAbjpC5U9v3aJAfz5+WCt496sGBGnTm45ky
 XLuguA5+3SLqSBxyY3Rs8xNKFb6HmlYDM9H/DEdBKsrNCqKl/Fn3k34tFbX8K6mQW8Cq
 Uf3w==
X-Gm-Message-State: AOAM530ocZiCyNKkZRMUurzWvSyi+bWet1RNBMk4HY09jB7isEi5QfcO
 Wi4j7+DLh+zEKZrmiuMl7ghZGw==
X-Google-Smtp-Source: ABdhPJyCcW9kLpLl2eDspunleRze6lqZixbd7S2gRrdMnoYGRuckAWazBnOKh9E0c1MjbLf70D4rrA==
X-Received: by 2002:a17:90a:8548:: with SMTP id
 a8mr26549983pjw.48.1619522147830; 
 Tue, 27 Apr 2021 04:15:47 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:15:47 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 04/15] media: add Mediatek's MM21 format
Date: Tue, 27 Apr 2021 20:15:15 +0900
Message-Id: <20210427111526.1772293-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041548_285918_F041A587 
X-CRM114-Status: GOOD (  12.65  )
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

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format by the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 0b879c0da713..42357b0b3535 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -246,6 +246,13 @@ please make a proposal on the linux-media mailing list.
 	It is an opaque intermediate format and the MDP hardware must be
 	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
 	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
+    * .. _V4L2-PIX-FMT-MM21:
+
+      - ``V4L2_PIX_FMT_MM21``
+      - 'MM21'
+      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
+	This is an opaque intermediate format and the MDP3 hardware can be
+	used to convert it to other formats.
     * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
 
       - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6a5d1c6d11d6..608e3ddc0f42 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1385,6 +1385,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
 	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 311a01cc5775..db04e37da1a8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -733,6 +733,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
