Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD2BC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tF4dHXue6VAthDO8rjRCUAqbIs0qxhJRHcU9wI4358E=; b=L0IWhBUCuZi+RxLRAKswH2sLgM
	2nStbeuombqdNl5uZzDL5xDQHz+H6pMihcEI0/O8LWrna+76tdDrhvi6pHb1M4iDJ4dW3t1NmbMFY
	EdQ7azwfz9M6KayzAGYOQsBNSMSQoJGzv6AAyvLKQtNwU5MThDDHPogoBoYAbzFV2ys1VzgR/RTzn
	ZMcFq8B+798LEb05pQrTZMk2Ec6wfH4hPLK9CUwDwUHA2cmE9l4vPZd3e+xxHgBXbGK1/d6EEdUYe
	6N6a2SPZouBejgDRdlTlHHMEvxWCtd2Z+B61aRWbIRnce4UF0jmlmSLOLbHyWHNkCySbwkNZ95pFQ
	4iCigmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IU-007LRy-1I; Wed, 06 Jul 2022 08:22:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IQ-007LOS-6v
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 08:22:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id j12so6260422plj.8
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tF4dHXue6VAthDO8rjRCUAqbIs0qxhJRHcU9wI4358E=;
        b=ZrQU0PrLMmbvxDBU2iEokT3gZ1VJwzUYnGZoo1MKx6gO6KZtoRwqLz13RzQGoaCh89
         W11Q1Q9Pp2QciYnlTxHqQj2PlHWSJpQ8fmCDVwQ2FuH6/lcS8tkrwOUVK4yRim08o/tG
         FKuXDrZ0u3emEEGWUDGE32QQB1ALVrI2O7nWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tF4dHXue6VAthDO8rjRCUAqbIs0qxhJRHcU9wI4358E=;
        b=7FFO5y2dotKaWKRWn42lKel6FyTnZBEB9WY6Iv78E09CZ5D1VlRyzv1V88YeDOsslq
         +UN+eU6P3GJm/Af3MtnXaKRNCv/SF6oYwPRUp3VgZC1YP2So5cNdlQFku+MXNbzqOA1S
         udPAL/YNAseF2pWn6Yh0yP9LJG0dKnAOd/+T8mW+NqkcA0s5hLP8u2LKstwJPlPjpzLS
         zePRCGgrTG5yzbMgAMfYl40A2tMcwQc12nhxU34FS/VtkAmTSVIB1vlyyJdpE2c8IWXL
         JYtbLevlhtF9VgSoJl8HoD4tw9L1EgPqENr2R/SgCMEpi9SVnv//UniNs6ejnIoctQxH
         QZvg==
X-Gm-Message-State: AJIora+VTXQBypJUHKW7gABSTxoMBesVNGzM3yXIj0R9admubeJmv3fy
	FhyMMnkc1rAReLcMU/Yj9yQOtw==
X-Google-Smtp-Source: AGRyM1vXb+lAKa3a12GtkthhfA4R8Yn7YU0ba2/ue2KUfpCm0R7dPGik1fSM9nymwNvDSjjdrtoP8A==
X-Received: by 2002:a17:902:cccf:b0:168:c4c3:e8ca with SMTP id z15-20020a170902cccf00b00168c4c3e8camr48217740ple.40.1657095724545;
        Wed, 06 Jul 2022 01:22:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74a3:a7a4:af57:d7f])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm20767040pjb.2.2022.07.06.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:22:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 3/6] media: mediatek: vcodec: decoder: Skip alignment for default resolution
Date: Wed,  6 Jul 2022 16:21:35 +0800
Message-Id: <20220706082138.2668163-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706082138.2668163-1-wenst@chromium.org>
References: <20220706082138.2668163-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_012206_270224_9015C2DD 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

The default resolution of 64x64 is already aligned, according to the
call to v4l_bound_align_image() in mtk_vcodec_dec_set_default_params().

Drop the redundant v4l_bound_align_image() call. This also removes one
usage of ctx->max_{width,height}.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index fcb4b8131c49..4a64877bcd8f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -180,13 +180,6 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	ctx->max_width = MTK_VDEC_MAX_W;
 	ctx->max_height = MTK_VDEC_MAX_H;
 
-	v4l_bound_align_image(&q_data->coded_width,
-				MTK_VDEC_MIN_W,
-				ctx->max_width, 4,
-				&q_data->coded_height,
-				MTK_VDEC_MIN_H,
-				ctx->max_height, 5, 6);
-
 	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
 	q_data->bytesperline[0] = q_data->coded_width;
 	q_data->sizeimage[1] = q_data->sizeimage[0] / 2;
-- 
2.37.0.rc0.161.g10f37bed90-goog


