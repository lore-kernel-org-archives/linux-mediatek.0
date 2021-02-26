Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999C4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3973464EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3973464EED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1RqpK1nts9qKgfcpHgc+dFHPP1xhmaMUFdf3ywMD5qs=; b=jqvTc4dXAc37m20F7kmwkHSq6
	LA0oj8EKiIT7g6hCL5fblMVmUwZUkq530s6fJ+EhLk1OPk9gX1cn/cWzsQR5vl8l33QVFp2yqsu6d
	EjTr6lPx2BEth4FbGWLk7o8xNQ3dAL0t56W+L5kS3ZShKVc9dWQcoxflZAKkpvSVdwjXRCwgXVr8L
	3DKE06w0YNnVN7Xq+ir/9gHZiqDV6t2MmXk9ZDUsUGQCwwcaSqRSOZUiXZjZjwDgp67m6mkyyBDm3
	vkB0X07xp7Ouem5Haz/V7mLSyMLrw54oGI7HqCo9Tg2aUoXRELOHdQToPqQjFd4U/78LAUZ5OI7I7
	tYdH5D34w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZwv-0007qB-Cf; Fri, 26 Feb 2021 10:02:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZwr-0007nl-St
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id f8so5043137plg.5
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6/Bo4By7p3IUz3tjBrdPpIJAcax042CocWRAmdAp4Ks=;
 b=VYBMbiSQNniHtWFP82fU0Kr7M8kPq1JBFTFWg8ZGcG28lnshC+I3gymdEwzZrg5tPW
 f4Djm++OaK6QO1G7R1x3utmR+TIDcHCEr/Uf84tet6accRFMq40NbGwgE7u3b5f0pgK9
 uSGdPTTTiQSdPNf9Z8ElVnJZA5KUg8O2qaXIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6/Bo4By7p3IUz3tjBrdPpIJAcax042CocWRAmdAp4Ks=;
 b=D1i6qXahodW639Cl91VlRsU+kXRxhR4HHGAWZxZ/YnDvHzxGxUocqlvuwLk9ViIsij
 xTpm6oZjSLtJc98hbA90MEkwhXtgQzxCuQQEYwoyex3LYO9hrTh3vA4B39ybeoa8wxyy
 hQIjoWkSnzmP9uwmzk8fWieBnlUuQAJL1jwJHhiP2byldth8ZBwzbgXlNzflMpcvBmfE
 nLW++A98dryrcKwtFTXSx76II4Pn6CALwIWLnZFgVn1IZhVyP9ValJtbjarFzfN761e/
 QzGjAkGSG4iBuo4NlT5CjEzEEy8hSZfjRq9R4pdxIjeMn6eheQg4jtYhAqLfRmoA69EN
 zYAQ==
X-Gm-Message-State: AOAM533BnM6o5GCyPretFhJUITZkLrJEUYlf5MNU2RyP7jgfahDT6yI1
 0RZFooXD4aQM9ZAurYg9XdZx8A==
X-Google-Smtp-Source: ABdhPJw3kCQN2MNyQCJvMWFx2xvw9NHuseQeEU68r1BlhsFrDDf2RaczEiFSqGOMMNTA49VFafeGyA==
X-Received: by 2002:a17:90a:2e89:: with SMTP id
 r9mr2623085pjd.95.1614333731638; 
 Fri, 26 Feb 2021 02:02:11 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:11 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 04/15] media: add Mediatek's MM21 format
Date: Fri, 26 Feb 2021 19:01:37 +0900
Message-Id: <20210226100148.1663389-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050213_984742_F4A289F2 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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
index c9231e18859b..187ea89f7a25 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -242,6 +242,13 @@ please make a proposal on the linux-media mailing list.
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
index 31d1342e61e8..0b85b2bbc628 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1384,6 +1384,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
 	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..e6890dae76ec 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -731,6 +731,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
