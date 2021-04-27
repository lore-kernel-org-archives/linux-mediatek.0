Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC133C43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09E6861059
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09E6861059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HLsTnTcgrMtnuGFJ96hIVfYls14yWhquCLU2sqPGHwc=; b=fZG9txskK7SghCp+UsKWiAa2Z
	54Ao9QY1/1qTythlQwEnHc/tnU9NqoQbatrluxAG+4zlNuHwET1hX3aKc5+QM7l1IcMPln1Hi/d1Z
	rblJLL41IkSxUNx81U7pEGZq+eLCO/ck/YyLaOUhgjOQRdFHXKTUnP8r6Jso4xHctgpQ7ATw1rgkF
	E2p752dE7vL+HBFKlCo7DxWnOfC9AadJN5RUh/THJPUzBTC7Gu6X7X2pRnEGwCgKI8r4/Jot1JDso
	V4eFuKGx8//h8OrGClmmVDBGRmED9JWdncadfih6r1GwM8nUYD+B/8q565NHrR0UjVEI/OFB/0LAn
	6gn5Q1PnQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLha-001Tt1-Ev; Tue, 27 Apr 2021 11:16:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhN-001ToV-Ev
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NeuaYr+AFNS6zFyhjEclvaB+RiQlE5bnT3MqlgX4tYM=; b=djEojUWz9cf7DW8dpm4fLtUlZS
 ajX3Vfn3jf+KwZVwbKRSAB+YFXQsobZfZOG2p6cEr1TjY5MYs4M2ir5DoglaIpOQ5ih3yXg4Londi
 cyUFge57t2aqme/DaiceX7S0GNg9PRw8uQJPtT+OzYmeN3r6IhlevshLIFKDtbD0Ofjd4J+1GTE5S
 kx3tkoH2/7EpwdQZ/NWZW6PjZrUrm7y31V9PWtsKJzPDLjPVVJ4yTWKYZV7Np9efILS4fhLzN6CAq
 +hNEqutNZ8NXj/wGbYW7oKwNFXEW4awvr53unI7sE0oTxIh3HG9SByU27TbmQQ+MWH05XdyF9Yx6J
 T8oJeLiw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhL-00GgHQ-01
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b21so2181007plz.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NeuaYr+AFNS6zFyhjEclvaB+RiQlE5bnT3MqlgX4tYM=;
 b=NM92KqfkwK8D3MAj2A2IAOebWPxBDpy9nSUs6JX+LRjwpxE0EIEV6xkPFinBPMwPcJ
 7z4RGCGDQ1uTLDWFAbWnbv131GzqbJY3okRp8m3cMGKPOVIsWF3TlS8P+ko8Pe8XwWgf
 4/Ju9NNy1J/ngY8tL+zqPRbuxYBveekRdsRnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NeuaYr+AFNS6zFyhjEclvaB+RiQlE5bnT3MqlgX4tYM=;
 b=KF01zjTqm+GfIMTsTG735RM1XHFRS72KI4jg9ij02pRF0OjFjPmhBg3dVS6bWYMtuL
 8VMCq8CA1grQtmc8TY+k+92b6k/GlVABpoRn7tyztjQ84K0DkmLYVBrOpjAcDXuGy8ny
 xBkQQDz76hizEDYBoSLTizy8E+eBXNSsomogqlTzHybFNJTBpdbp9H9E/75tFV1OKk4p
 T1Mzv57BrVAtitRM2kETo4/wj2Nikvpw0wjnrv3mHZIePOUBLjeQvCJHXiQJos5UX8f0
 SPo5i640YgJxKPPuiI2URfj31TKlojyWZNIcZqFArQ19W/028+bx/OIod1thN5inxk6J
 /71A==
X-Gm-Message-State: AOAM532YsZJr+DpopW0zxuQnZo6j7N0Q42gjlllgVByyA6lIdogGIHrR
 C2jgom3YBbMClco5LrEG9XQ9DA==
X-Google-Smtp-Source: ABdhPJyutim3aaPgcxoEFFLupS3n22kco1aCh6AI2C6Fs/kJN99bNeQBf5nXs1moTycGo7zNU8lGPg==
X-Received: by 2002:a17:902:9a0a:b029:e6:bf00:8a36 with SMTP id
 v10-20020a1709029a0ab02900e6bf008a36mr24255695plp.51.1619522170256; 
 Tue, 27 Apr 2021 04:16:10 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:09 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 12/15] media: mtk-vcodec: vdec: clamp OUTPUT resolution to
 hardware limits
Date: Tue, 27 Apr 2021 20:15:23 +0900
Message-Id: <20210427111526.1772293-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041611_054817_AD4F5C38 
X-CRM114-Status: GOOD (  13.92  )
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
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 4ef4b68ec9bd..0fafe8f9e1b9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -223,19 +223,19 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
+				MTK_VDEC_MIN_W,
+				MTK_VDEC_MAX_W);
+	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
+				MTK_VDEC_MIN_H,
+				MTK_VDEC_MAX_H);
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
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
