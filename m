Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32813C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3D3610A5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3D3610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SlaXtjAogRZXjB0p7anjfwopao8PBzhTHRbEtNnbaGM=; b=j/wqPYNlukzsw+Wcibcpnm0Ee
	RjvFEFTBG1VOcLqhsfPloNgJF1D0BmKoqwk+HSX7my8cHQF+Ecf+1YoFPmGUzdfSaYA3laIqoQPRh
	DxGSq+bjHc4wNzIEqk2JmV4crAkPp5Qb4J4HPxTCSwiXIJyeW7Yl2W8vgd5i4Y+pyMB3tosWbt7C2
	wT0MyOuHbC4Z6UqWqnFM4YZHwHu3KTGd2iTV4BctDchXjbwvxg42jny2WG6JvMfdq5tKgRIxPMZNX
	l7OL2GCeCAbQhnpq6nDP4Qq72AWaR67nIQ65Ej7Pejc1FWVTKNTYtgNcC5E5Di2ubn5Pk4Se5wo4A
	g5K9cT91w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leCYv-000bRR-24; Wed, 05 May 2021 08:07:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYM-000bMR-DD; Wed, 05 May 2021 08:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=KNnUA6V6+eBMeqrvnHn7hFApZozuNBmSCEONxX0zPCQ=; b=QtKMqzSTGzZGXpcoQssoUYvN8c
 6p4H/wHbwCe/U4muOprJ/O6kjBaySMRaM7tdlfGHu89+A9Mcfuoo8H2POAv1Xeg1Ei0mKWr9OJWPM
 6Z16T0pCYhLzJRfv12KFw7Ls/EYVtxJnqCB9qBFj6jm25Q6oMQPwLqIXOLkcUrqXvvURjEtp8Jtbs
 vA6bdTucdyHAWbXO0sqBLFDv7ijCr71wfO2AI/8EFuNI2BR/554F7XugXTxM42RAPszYnqVnw6psk
 T1NenAdVYWqmljywaBU/unPXU27s6h5e72rfPLgydF6+VA+x6DirlKXN+USwAhma6B9hFr7emXaao
 /GbQDU7w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYJ-004YQb-15; Wed, 05 May 2021 08:06:41 +0000
X-UUID: 995994c87b9a4865a92b70be3401bafd-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KNnUA6V6+eBMeqrvnHn7hFApZozuNBmSCEONxX0zPCQ=; 
 b=P1Wz7CEP7/3I+lU897Od65ljnrSsK80xhqzWpuBlqHlaWQhqGlN6WjsRPU5V/RTX34nFgw+Gi9lAtesV/F9zVukJgI4fviriHB2BxbPqDoBxOnK6IszgvZ+5FIyYgk24XQtKSdeKOBF6+zk2AJSzTHMOFTguS1yrZn+8RKBrrlQ=;
X-UUID: 995994c87b9a4865a92b70be3401bafd-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656114216; Wed, 05 May 2021 01:06:32 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 01:06:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 16:06:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 16:06:29 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
 <arnd@arndb.de>, <louis.kuo@mediatek.com>, <sergey.senozhatsky@gmail.com>,
 <helen.koike@collabora.com>, <niklas.soderlund+renesas@ragnatech.se>,
 <yepeilin.cs@gmail.com>
CC: <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [RFC PATCH V0 4/4] media: pixfmt: Add ISP Camsys formats
Date: Wed, 5 May 2021 16:06:26 +0800
Message-ID: <20210505080626.15432-5-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505080626.15432-1-louis.kuo@mediatek.com>
References: <20210505080626.15432-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_010639_109129_42348FFF 
X-CRM114-Status: GOOD (  11.12  )
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

Add packed bayer formats with 10/12/14 bit for image output.
Add packed/unpacked yuv formats with 10/12 bit for image output.
Add specific meta formats for parameter processing and 3A/other
statistics.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 145 ++++++++++++++++++++++++++-
 include/uapi/linux/videodev2.h       | 101 +++++++++++++++++++
 2 files changed, 245 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 823ebd175f3a..00dba596893a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1259,6 +1259,30 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
 	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
 	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
+	case V4L2_PIX_FMT_YUYV10:
+		descr = "YUYV 4:2:2 10 bits";
+		break;
+	case V4L2_PIX_FMT_YVYU10:
+		descr = "YVYU 4:2:2 10 bits";
+		break;
+	case V4L2_PIX_FMT_UYVY10:
+		descr = "UYVY 4:2:2 10 bits";
+		break;
+	case V4L2_PIX_FMT_VYUY10:
+		descr = "VYUY 4:2:2 10 bits";
+		break;
+	case V4L2_PIX_FMT_YUYV12:
+		descr = "YUYV 4:2:2 12 bits";
+		break;
+	case V4L2_PIX_FMT_YVYU12:
+		descr = "YVYU 4:2:2 12 bits";
+		break;
+	case V4L2_PIX_FMT_UYVY12:
+		descr = "UYVY 4:2:2 12 bits";
+		break;
+	case V4L2_PIX_FMT_VYUY12:
+		descr = "VYUY 4:2:2 12 bits";
+		break;
 	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
 	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
 	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
@@ -1282,6 +1306,30 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
 	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
 	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
+	case V4L2_PIX_FMT_NV12_10:
+		descr = "Y/CbCr 4:2:0 10 bits";
+		break;
+	case V4L2_PIX_FMT_NV21_10:
+		descr = "Y/CrCb 4:2:0 10 bits";
+		break;
+	case V4L2_PIX_FMT_NV16_10:
+		descr = "Y/CbCr 4:2:2 10 bits";
+		break;
+	case V4L2_PIX_FMT_NV61_10:
+		descr = "Y/CrCb 4:2:2 10 bits";
+		break;
+	case V4L2_PIX_FMT_NV12_12:
+		descr = "Y/CbCr 4:2:0 12 bits";
+		break;
+	case V4L2_PIX_FMT_NV21_12:
+		descr = "Y/CrCb 4:2:0 12 bits";
+		break;
+	case V4L2_PIX_FMT_NV16_12:
+		descr = "Y/CbCr 4:2:2 12 bits";
+		break;
+	case V4L2_PIX_FMT_NV61_12:
+		descr = "Y/CrCb 4:2:2 12 bits";
+		break;
 	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
@@ -1348,6 +1396,90 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR10:
+		descr = "10-bit Bayer BGGR MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SGBRG10:
+		descr = "10-bit Bayer GBRG MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SGRBG10:
+		descr = "10-bit Bayer GRBG MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SRGGB10:
+		descr = "10-bit Bayer RGGB MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SBGGR12:
+		descr = "12-bit Bayer BGGR MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SGBRG12:
+		descr = "12-bit Bayer GBRG MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SGRBG12:
+		descr = "12-bit Bayer GRBG MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SRGGB12:
+		descr = "12-bit Bayer RGGB MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SBGGR14:
+		descr = "14-bit Bayer BGGR MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SGBRG14:
+		descr = "14-bit Bayer GBRG MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SGRBG14:
+		descr = "14-bit Bayer GRBG MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_SRGGB14:
+		descr = "14-bit Bayer RGGB MTISP Packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV12_10P:
+		descr = "Y/CbCr 4:2:0 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV21_10P:
+		descr = "Y/CrCb 4:2:0 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV16_10P:
+		descr = "Y/CbCr 4:2:2 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV61_10P:
+		descr = "Y/CrCb 4:2:2 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_YUYV10P:
+		descr = "YUYV 4:2:2 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_YVYU10P:
+		descr = "YVYU 4:2:2 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_UYVY10P:
+		descr = "UYVY 4:2:2 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_VYUY10P:
+		descr = "VYUY 4:2:2 10 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV12_12P:
+		descr = "Y/CbCr 4:2:0 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV21_12P:
+		descr = "Y/CrCb 4:2:0 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV16_12P:
+		descr = "Y/CbCr 4:2:2 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_NV61_12P:
+		descr = "Y/CrCb 4:2:2 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_YUYV12P:
+		descr = "YUYV 4:2:2 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_YVYU12P:
+		descr = "YVYU 4:2:2 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_UYVY12P:
+		descr = "UYVY 4:2:2 12 bits packed";
+		break;
+	case V4L2_PIX_FMT_MTISP_VYUY12P:
+		descr = "VYUY 4:2:2 12 bits packed";
+		break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
 	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
 	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
@@ -1367,7 +1499,18 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
-
+	case V4L2_META_FMT_MTISP_AF:
+		descr = "AF Histogram";
+		break;
+	case V4L2_META_FMT_MTISP_LCS:
+		descr = "Local Contrast Enhancement Stat";
+		break;
+	case V4L2_META_FMT_MTISP_LMV:
+		descr = "Local Motion Vector Histogram";
+		break;
+	case V4L2_META_FMT_MTISP_PARAMS:
+		descr = "MTK ISP Tuning Metadata";
+		break;
 	default:
 		/* Compressed formats */
 		flags = V4L2_FMT_FLAG_COMPRESSED;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 6641194b3fab..c86ab1c18284 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -593,6 +593,22 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
 #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
+#define V4L2_PIX_FMT_YUYV10  v4l2_fourcc('Y', 'U', 'Y', 'A')
+/* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_YVYU10  v4l2_fourcc('Y', 'V', 'Y', 'A')
+/* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_UYVY10  v4l2_fourcc('U', 'Y', 'V', 'A')
+/* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_VYUY10  v4l2_fourcc('V', 'Y', 'U', 'A')
+/* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_YUYV12  v4l2_fourcc('Y', 'U', 'Y', 'C')
+/* 16  YUV 4:2:2 12-bit */
+#define V4L2_PIX_FMT_YVYU12  v4l2_fourcc('Y', 'V', 'Y', 'C')
+/* 16  YUV 4:2:2 12-bit */
+#define V4L2_PIX_FMT_UYVY12  v4l2_fourcc('U', 'Y', 'V', 'C')
+/* 16  YUV 4:2:2 12-bit */
+#define V4L2_PIX_FMT_VYUY12  v4l2_fourcc('V', 'Y', 'U', 'C')
+/* 16  YUV 4:2:2 12-bit */
 
 /* two planes -- one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
@@ -602,6 +618,22 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
 #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
+#define V4L2_PIX_FMT_NV12_10 v4l2_fourcc('1', '2', 'A', 'U')
+	/* 12  Y/CbCr 4:2:0 10 bits un-packed */
+#define V4L2_PIX_FMT_NV21_10 v4l2_fourcc('2', '1', 'A', 'U')
+	/* 12  Y/CrCb 4:2:0 10 bits un-packed */
+#define V4L2_PIX_FMT_NV16_10 v4l2_fourcc('1', '6', 'A', 'U')
+	/* 16  Y/CbCr 4:2:2 10 bits un-packed */
+#define V4L2_PIX_FMT_NV61_10 v4l2_fourcc('6', '1', 'A', 'U')
+	/* 16  Y/CrCb 4:2:2 10 bits un-packed */
+#define V4L2_PIX_FMT_NV12_12 v4l2_fourcc('1', '2', 'C', 'U')
+	/* 12  Y/CbCr 4:2:0 12 bits un-packed */
+#define V4L2_PIX_FMT_NV21_12 v4l2_fourcc('2', '1', 'C', 'U')
+	/* 12  Y/CrCb 4:2:0 12 bits un-packed */
+#define V4L2_PIX_FMT_NV16_12 v4l2_fourcc('1', '6', 'C', 'U')
+	/* 16  Y/CbCr 4:2:2 12 bits un-packed */
+#define V4L2_PIX_FMT_NV61_12 v4l2_fourcc('6', '1', 'C', 'U')
+	/* 16  Y/CrCb 4:2:2 12 bits un-packed */
 
 /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
@@ -743,6 +775,75 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_IPU3_SGBRG10	v4l2_fourcc('i', 'p', '3', 'g') /* IPU3 packed 10-bit GBRG bayer */
 #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
 #define V4L2_PIX_FMT_IPU3_SRGGB10	v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
+	/* Vendor specific - Mediatek ISP bayer formats */
+#define V4L2_PIX_FMT_MTISP_SBGGR10  v4l2_fourcc('M', 'B', 'B', 'A')
+	/*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG10  v4l2_fourcc('M', 'B', 'G', 'A')
+	/*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG10  v4l2_fourcc('M', 'B', 'g', 'A')
+	/*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB10  v4l2_fourcc('M', 'B', 'R', 'A')
+	/*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR12  v4l2_fourcc('M', 'B', 'B', 'C')
+	/*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG12  v4l2_fourcc('M', 'B', 'G', 'C')
+	/*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG12  v4l2_fourcc('M', 'B', 'g', 'C')
+	/*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB12  v4l2_fourcc('M', 'B', 'R', 'C')
+	/*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR14  v4l2_fourcc('M', 'B', 'B', 'E')
+	/*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG14  v4l2_fourcc('M', 'B', 'G', 'E')
+	/*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG14  v4l2_fourcc('M', 'B', 'g', 'E')
+	/*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB14  v4l2_fourcc('M', 'B', 'R', 'E')
+	/*  Packed 14-bit  */
+/* Vendor specific - Mediatek Luminance+Chrominance formats */
+#define V4L2_PIX_FMT_MTISP_YUYV10P v4l2_fourcc('Y', 'U', 'A', 'P')
+/* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_YVYU10P v4l2_fourcc('Y', 'V', 'A', 'P')
+/* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_UYVY10P v4l2_fourcc('U', 'Y', 'A', 'P')
+/* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_VYUY10P v4l2_fourcc('V', 'Y', 'A', 'P')
+/* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_NV12_10P v4l2_fourcc('1', '2', 'A', 'P')
+/* Y/CbCr 4:2:0 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV21_10P v4l2_fourcc('2', '1', 'A', 'P')
+/* Y/CrCb 4:2:0 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV16_10P v4l2_fourcc('1', '6', 'A', 'P')
+/* Y/CbCr 4:2:2 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV61_10P v4l2_fourcc('6', '1', 'A', 'P')
+/* Y/CrCb 4:2:2 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_YUYV12P v4l2_fourcc('Y', 'U', 'C', 'P')
+/* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_YVYU12P v4l2_fourcc('Y', 'V', 'C', 'P')
+/* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_UYVY12P v4l2_fourcc('U', 'Y', 'C', 'P')
+/* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_VYUY12P v4l2_fourcc('V', 'Y', 'C', 'P')
+/* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_NV12_12P v4l2_fourcc('1', '2', 'C', 'P')
+/* Y/CbCr 4:2:0 12 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV21_12P v4l2_fourcc('2', '1', 'C', 'P')
+/* Y/CrCb 4:2:0 12 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV16_12P v4l2_fourcc('1', '6', 'C', 'P')
+/* Y/CbCr 4:2:2 12 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV61_12P v4l2_fourcc('6', '1', 'C', 'P')
+/* Y/CrCb 4:2:2 12 bits packed */
+/* Vendor specific - Mediatek ISP parameters for firmware */
+#define V4L2_META_FMT_MTISP_PARAMS v4l2_fourcc('M', 'T', 'f', 'p')
+	/* ISP tuning parameters */
+#define V4L2_META_FMT_MTISP_3A     v4l2_fourcc('M', 'T', 'f', 'a')
+	/* AE/AWB histogram */
+#define V4L2_META_FMT_MTISP_AF     v4l2_fourcc('M', 'T', 'f', 'f')
+	/* AF histogram */
+#define V4L2_META_FMT_MTISP_LCS    v4l2_fourcc('M', 'T', 'f', 'c')
+	/* Local contrast enhanced statistics */
+#define V4L2_META_FMT_MTISP_LMV    v4l2_fourcc('M', 'T', 'f', 'm')
+	/* Local motion vector histogram */
 
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
