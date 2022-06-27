Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E0C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXn3wWbVxQI6jCo/9N11UZ5IVbNzRYO/KcWY9DeSESE=; b=fAZzW05jg2H0D/HlhEbWvV2AmI
	cPpHA3wNJlTscPnd1mJkdbuX0g/6BqEORTWV42XNLf3iVVVLJ+YL1clIOf7gMbxPAbOiUnboxq0NK
	GDvtl62/ckFu4jIxsU0x5s4yVC+MYO3+YmCAtb/Y2FRY9LYuN58jJZBmZEfl7dT7o1UqNqSUaApWN
	dKl3IVaD6ufjWgcQnoRV6fIFjUBMOx/gKsj8Q5dKNIVIQmYX6BrS+s7fsURoVw8qNkpbgsK0EoTP7
	LQatCr2uvnN4PruXYs4NzhQLc5wrM2QQ+8os9To8vARiTkoUFF5VAwrDGq9f8Tof6fPWVwn7+6MBe
	CmFdhz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mra-000TZF-S0; Mon, 27 Jun 2022 11:25:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrX-000TVF-NO
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:25:05 +0000
Received: by mail-pg1-x536.google.com with SMTP id q140so8825783pgq.6
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXn3wWbVxQI6jCo/9N11UZ5IVbNzRYO/KcWY9DeSESE=;
        b=YnPlXzKkEPch/sWHvGKsHeXpd88h+buPua0eN4oyDaqM34DNBm0PGwC+tZGTzDadAh
         8Wr4EbkdVWgOXhwf9B9sm20t0EpfN6y1ybvTGdiQLTO4MaIgo+ruM/RZ3UNuEaqt4yfk
         FvtJA6z6WkBX3v0VX40F+SeECrOgZaRAAtYfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXn3wWbVxQI6jCo/9N11UZ5IVbNzRYO/KcWY9DeSESE=;
        b=2wz4hTLVyMrlvebLYCRVd2GUsBNc/1vUztlSfTbDjfqngtwBDcfEsww12FavtIj9Hf
         jFWRGZTJ9rD/8hfq0JUPxxizAedfnW8RIR3qRD9Wow8rvk+kn/myUqgz2+iNJpjEOFf0
         u60f/w7AiH70aR3UecnuPiqvFKpKiTBkT3tjRrf5e7mPQlbH/2iuWfB5ibbcso6GA2JC
         12f2dznP5a55L3ypHHr7zyzZuYNNlPvBgAS7eUUC+MDkv3PcH94Bh9viR7g/lSOgTe7B
         AUxcx7xnPPECNE4eOc/N4R8VDpW289hjWk6rHZpgICumqDWJykki8HeSmen+gNAFBnmf
         T2/w==
X-Gm-Message-State: AJIora9uUXU+yhMJylT1h3TO55un1D/IZo4e4zTzE/U+zNsOxWpI2tRv
	udXbhUuGuKH0koa6l7aivqmnUQ==
X-Google-Smtp-Source: AGRyM1vaMaOkFM2pCPF4KFwOkt5DhQveHKus1rkl2C7vQO6ZDwtPdPvhygvlqcvYA0FYizMxom86mQ==
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id h7-20020a056a00218700b0050cef4def3bmr14510434pfi.83.1656329100033;
        Mon, 27 Jun 2022 04:25:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:24:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 1/4] media: mediatek: vcodec: dec: Fix 4K frame size enumeration
Date: Mon, 27 Jun 2022 19:23:59 +0800
Message-Id: <20220627112402.2332046-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220627112402.2332046-1-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_042503_848950_62A5ED7B 
X-CRM114-Status: GOOD (  14.15  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
Read max resolution from dec_capability"). In this commit, the maximum
resolution ended up being a function of both the firmware capability and
the current set format.

However, frame size enumeration for output (coded) formats should not
depend on the format set, but should return supported resolutions for
the format requested by userspace.

Fix this so that the driver returns the supported resolutions correctly,
even if the instance only has default settings, or if the output format
is currently set to VP8F, which does not support 4K.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c    | 2 --
 .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 +++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 5d6fdf18c3a6..fcb4b8131c49 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -595,8 +595,6 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
 
-		fsize->stepwise.max_width = ctx->max_width;
-		fsize->stepwise.max_height = ctx->max_height;
 		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
 				ctx->dev->dec_capability,
 				fsize->stepwise.min_width,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 16d55785d84b..9a4d3e3658aa 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -360,6 +360,13 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 
 		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
 		mtk_vdec_framesizes[count_framesizes].stepwise = stepwise_fhd;
+		if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+		    fourcc != V4L2_PIX_FMT_VP8_FRAME) {
+			mtk_vdec_framesizes[count_framesizes].stepwise.max_width =
+				VCODEC_DEC_4K_CODED_WIDTH;
+			mtk_vdec_framesizes[count_framesizes].stepwise.max_height =
+				VCODEC_DEC_4K_CODED_HEIGHT;
+		}
 		num_framesizes++;
 		break;
 	case V4L2_PIX_FMT_MM21:
-- 
2.37.0.rc0.161.g10f37bed90-goog


