Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F05C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186A720672
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ogazu8hY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZC9CqbyP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186A720672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XQpTt1t+MOxHSxfzgrM3CwU8maL2sWiuSlBaPyC+XRk=; b=ogazu8hYXKBypvo4DLd2lgLxW
	ugCJ3Ql84U4zCtNHR42Z286R9T2k0XwJMDyYOEIHVh1THlkYTLHhrj4gCQAA6SI/QTkIFl2pXx1Fn
	p+Q0SIL+5bBh5xiZkGZV40X9NK9lcU1EemBOpC8KrzIW7nziPnsubQrQQfI3y/mypjBADRT6m00Tu
	pCGjJbIArxi0WlmVCYe3jKLeP05TIkn38i2Vfa2kATDwvibOHflM7OQCke557eso1wObHcC5Wqv6W
	oAoe8bONCMICBJz1UYHqyaaXmZgreAT7fDfQUaSDH9+dTo4y8aYoEyrml7dgcTquEzYybjPrjc3ec
	muM47vfyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9kP-0006aN-Ai; Tue, 30 Jun 2020 06:28:01 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9kN-0006ZP-DV
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 06:28:00 +0000
Received: by mail-pl1-x642.google.com with SMTP id 35so8081622ple.0
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 23:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLo9gWn34oxY8J/ohLJn1cwxm8tKGqTGHLzQqnvI/9s=;
 b=ZC9CqbyPemgUVWTi1ogG0chtstSnPpLx9j7x9lJY+aXbGpRQoMF0xQYCt/I8FK7GsR
 vrcebnckZJZhiemHHok5fIQoC/H78X3+pwJjY1RIwILg5Swg8vEXRQ5po7j8oPWJFH6s
 AOGydT+6StJymBvgF8jhgZK9wUZV5NnHZJ250=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLo9gWn34oxY8J/ohLJn1cwxm8tKGqTGHLzQqnvI/9s=;
 b=QGirCQx6Qvoq5X4JeGoSAf5l8KjTKEM+QFh8Hv/jSoERow34K5/q4zuwJOKSN8VBZa
 HRXkrorKQfIrreGjqcJdUUBT2wmY4vqzvF87XHxblS/EL7NX1OiYmNE4bnCdrQTpZtaz
 /ecyHX64Qkj0G36ZJs0rw0D9J09JqSMmO4tEaYgEpwuCVWMyIA6JC62N5MilkI/h4p2g
 PYcfVzFePpyDL7ZJDRvpkKRPbBc/+cEGJCfmYeum20oP74eW+Visa/2xw+4HP3LdWtPr
 1YkLOokGT601i5MC53bNRWQ+DWN1oIHnlNKXeAj6P35n7G66+f9JuQt57vnvmoPOIkDw
 d/qg==
X-Gm-Message-State: AOAM531wPswiwfJabP+FWSS670Q/pBmKdTEbjdjg7ZwEFGAz1WbpYF71
 ZouUKt+/TxPNt7VqjG63fRC2KA==
X-Google-Smtp-Source: ABdhPJzqEeELCaxH4ShNgfLDy3Z0zrZ0tXhBT5akKY7mXJeeLYO76PPIbsZcHg2K+9fLQgWJMSVpPQ==
X-Received: by 2002:a17:90b:1013:: with SMTP id
 gm19mr8675125pjb.143.1593498477799; 
 Mon, 29 Jun 2020 23:27:57 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 23:27:57 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 4/9] media: add Mediatek's MM21 format
Date: Tue, 30 Jun 2020 15:27:06 +0900
Message-Id: <20200630062711.4169601-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
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

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format by the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 02bfef0da76d..612be602bf76 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1398,6 +1398,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 303805438814..a35f65115bca 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -738,6 +738,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
