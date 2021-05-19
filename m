Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F49AC43470
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2E76135A
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2E76135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dX3hfJx2L3CrRr/Y46VEu/DQSFXFKWC2jycIpgBP8jk=; b=J3GucuU5bQNEV+dMEnfRx3JM7
	LessuZ0wNj7mdd1jXvsoJcoq0SNUCyBfdKK2+5CjNh3Dt6P2hRzVna9HOSKrLJe9HYTPvTJWwbyzY
	BB0Q9+Z40/v1dT7rwQyKpbFtKVylL2X0OG/+++1QgSjI2VakOKgxHAWU3b+tEKzcpQVY+TrpvQbHh
	fiZ79w2qnLCLtcs/bkjWpJrE56G0HqBCFwCFsY7Un/nWbccR7XhpcNCdZI2EXu02CI1DQKk3EH31T
	b3k7jfGv+8l62Sa4gCqkQOdHahJhsppOaw1x63Rz5TDskf2PvxXVu9XaeoR3yUX/i0f5gfxLTJNeu
	dHi2lUzdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNEB-004GoJ-W0; Wed, 19 May 2021 14:31:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNE2-004Gm6-Ok
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gednTxgPx66VC4gCQ3Jr7JXud1OWY9l/+WYNK98hMTs=; b=Az1CXVjudPD6Cy+nW6AQjaQy2v
 WIKwFTZQCbAHvmoc++BgOik7yFTGfzHrXTmG4I1A4SLsOjO60p6qxsF4kzVpXr7jEzXL4HSE7NHBN
 fLot63y4PkvUAkvBikPU58ReCzehhksoxzjeKWTOhmpa9Hsqc5WhbsOte/CoWavXR48kErm28pzoH
 ZwO4BJ01MJsFtg17JAZ3svUv15GrlxrQ6TDfC0NMRI4vwkSjMpKBj/6SNSBzFGvpZqq7c+BavyClu
 vq/kHmlrqXceS+tdSz/F8W7j07YtAz0DR7ZaWQVX+JbmQaPdOTflRBRh8v+g/88Ck6o/c525Rez/R
 TN8a2WwA==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNE0-00FXsu-5k
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:31:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id m124so9564604pgm.13
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gednTxgPx66VC4gCQ3Jr7JXud1OWY9l/+WYNK98hMTs=;
 b=BHh51IQPT+XAspq8nFIWtmtzukkvDbgIYm+vZLcsrzOC67hcMsaooPLQ68qZFXcMqU
 wxLhMd2i/qaJRzN1alTaj/Qx+1kIBslJnB4IlNrPrydks0cIXOR9AS3xx/Cxl5E8Fk0N
 gY7Omlt2GBBaaFNYLOoIOrYysD6XVNulRbh+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gednTxgPx66VC4gCQ3Jr7JXud1OWY9l/+WYNK98hMTs=;
 b=I/M8Bc+AbdVIaKFawoCE4YVCv3QZdeoJ6RgHBbreA/Vg9a8wS4l3ADK7+6WQBH3wje
 ecXfqWAPgubJynvjCrLVEZpKpgAb/q7Gb8kXRgczvln1+xFkdk5QlJc4hLwTyprqgKIr
 nKN13wi1hI6UB6b52wffiF9kYM2q2ekVZGMf9CIrQFUJQz43Xt69OSTija5ipYBQttNM
 4GZ9Fa1RSLQtjzVl4lOJRLKLlAHWUcF26i2EBCNZeaq3I/6VMaBm+Xq3oihl+mfUxvQ+
 dz1z3DDDQc9c1cPemDN0EPGCymNX8Yuynwrr0Is3lnnaVleXrqtcGMsb+fZ+matGhlh0
 zgOw==
X-Gm-Message-State: AOAM530uimAIhSB3GMlFIaw3xYm4/x7OxisuCkIwYKMalWzsaXbvSh0H
 r/1zUpgAGPwRXZd4Rb6hudHQZ/ACUmnGPtrd
X-Google-Smtp-Source: ABdhPJzsmmBc5/96G4MtQtTnAEtviCgTpS4rSYWla9GFOKZzkPE/ZYp2wn61NySvAEWQ5xl2bJU9qA==
X-Received: by 2002:aa7:90d5:0:b029:28e:df57:47ff with SMTP id
 k21-20020aa790d50000b029028edf5747ffmr11101397pfk.74.1621434663174; 
 Wed, 19 May 2021 07:31:03 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:31:02 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 09/14] media: add Mediatek's MM21 format
Date: Wed, 19 May 2021 23:30:06 +0900
Message-Id: <20210519143011.1175546-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073104_223086_8CF44461 
X-CRM114-Status: GOOD (  12.96  )
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
index 2673f51aafa4..c63341b8456a 100644
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
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
