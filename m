Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA11C4320E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:20:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B543561154
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B543561154
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=za7tU7KoQIHtmw73tkdEg2IzWcxP7fnlQnS9Mmm61uM=; b=W+e8PlF5UPDGxexiOtaW36g23l
	r4e8xKHitQu8kK8FMJQJO3RPiiYi/iX5tlRW8PDHyVfhvvSITZymzZ4iOkQqwF+mBxDWwetEPxFrU
	LQR92PgN2zZMzgDumbdALwHKPSpHxgTtWM7oUHMP9k1lM+Ei6LgbCXkJ18O+AKHuHAYpfplldwjw/
	uW5r7l7lJF9vgKZXab9mqeQ1Z3Gjq/MqZKB4qtdET3Y3aNcJOTlKEdX/KIhHrMayHBb5xpdfdhpua
	hoeFY7nMlTZ6q1fFx/ZZuGsOkjma5RZnQpqsj6zr9YB7ooz2s6cF7pvDjS4nKYMdeAsPhQlPQYkNG
	DBhk+0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrKu-00BUxO-R1; Fri, 06 Aug 2021 04:19:56 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrHW-00BT2H-SK
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 b9-20020a5b07890000b0290558245b7eabso8358886ybq.10
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Rsk8mIk4NwGxcjmp10DQpgJja1pgzgMacDksVnB64/o=;
 b=E83KNjyD6f2ijKsOirozZyWrM3b9FzL5lre5NgdVK3PpHsDxEAnljSjqikUGv+uznH
 Cv5fr7wOv0r93E9RyZWV0pbqwBG5EylwUyPJJ20qd3YAtbzqjhXAyL1ySXNevTsDvgI8
 Q6OglpVh/rglb/jayX5U2qhUbA7nW/eVeGNRleNg//Bbs0qwDkgmqRTaUnUXOA6QUIhl
 38rTajZWL3w0cpgv0+a6EfFavEhbweMbRr9VMjBJ0gd4plcH6G9yE4Pkw6kiJ8cH5F6c
 bopVOVk9n5IfXVdUeP/MvEaHIypuKMLZK7iIdXThWDEVYDRJFUsXQsel/BQ5VlyLAc1z
 6ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Rsk8mIk4NwGxcjmp10DQpgJja1pgzgMacDksVnB64/o=;
 b=N6tZZQfR5/DGyKnsTZl6lENRvl4BPEcHa/Tw1o3P78NrZFrZW9eRtJuZtAFaDTXWkw
 astfl7eRGdT+EcZqw5STrKcu37RI38U0SJLm/Y2XWtk8LHOvoxQShaoQayBV81S7giIp
 olBbfmiWztHeUsJ9oL2Gv8lZ0S/0DhYZKRiIsfUTy8Z8aeZS+tB0U15g2lMatTOeybk7
 l123wh1h5lZYe6TAQlVN516ITZO6vbN/5KgUG+qnb2QwhDsgfPxCE5LxX/X2KMmWFTQK
 Tret9OlWC0LDI3m4Y8T8eFeYqnL2HIKwcBE2XYnWXXIR0HA1gLEASyGTNlbQ2E3FejUe
 Nbvg==
X-Gm-Message-State: AOAM531xuMJ3ScHI1uDf69wE+l/e5EmlwFJPHZR2EicU5TsOKYFj0HgQ
 q7oM4WhwMa/F/W/G8+vnZiWwqOLNBSXd
X-Google-Smtp-Source: ABdhPJxsM4qGrQbL2g5YSGWG8rqFeBL4viRpVSL06TzLyTQO4wOhxnYyLr43IoMyC0RrGixmrTlDLQp+8UzG
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:8445:: with SMTP id
 r5mr11095742ybm.20.1628223385460; Thu, 05 Aug 2021 21:16:25 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:25 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-10-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 09/14] media: add Mediatek's MM21 format
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211627_023117_D6E26DD1 
X-CRM114-Status: GOOD (  10.81  )
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

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format by the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
index 05d5db3d85e5..b394a2b7cfd7 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1346,6 +1346,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
 	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..bc1dc5adc071 100644
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
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
