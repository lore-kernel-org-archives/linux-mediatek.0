Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63290C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kg7QV/oFyp9DuWfL+Kx8o8ppQQ1Ib7IJOm2jNNQfg5c=; b=gzgzyRATf5N+NC
	wnPh/du22AM43My/wMJmXHsFpVmZxy1+/hxAUPSPmt7tdqr71C/1vb7YfbKrsO//afrQ6oKMcWEVE
	FBg0TCKglb3UnSOHA2SQ96NlwwgKERe1gB4JqMOsAFiom93+KQFVCUy8fkIE7cJ10kso5TTx7RM/8
	kktyNRikdWIbbUIgzlJbomDfiuwc8J+49+lG8zT8aT1vQusr4Z/XPc9OUb4Iqe/HGns+KA1oFWQTu
	4BxbRk42gksW0Zld2c8JDypuMxWgw/jXlRVwnFiI8d2QTnPpGQ9qKr5n+hcYx5IUFOeKC5wZMkcuw
	AxY/T/fpLw4nOexbHTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFH0-002FGn-22;
	Thu, 21 Dec 2023 09:23:22 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFGx-002FDN-0f
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 09:23:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6d089e8b1b2so366219b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Dec 2023 01:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150597; x=1703755397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg7QV/oFyp9DuWfL+Kx8o8ppQQ1Ib7IJOm2jNNQfg5c=;
        b=Dfpj4FWXYGe/S9a99HRn8j3folTGBjmsbIYrkXVINAZJOdtV0knj+YO8fo18AGZLX7
         FTCGQyPL5GWy6pC2VMXIAV8gKRnWbyBFUz1/w9OQo/QpXZ3Tj2immDVhIP48fJ/iUSI/
         hEB9o6XHHB1ihJCXrcvIgIhUmxS507jk0t5wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150597; x=1703755397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kg7QV/oFyp9DuWfL+Kx8o8ppQQ1Ib7IJOm2jNNQfg5c=;
        b=XJ+xGNZVmdkgde63x8MLXo04YagiDi0NMYAQBoY+hjC6YVwQWaCs/YGhAUeF+odmxW
         8lp2oZZ8fcXCgs8201faWxnv45LrQwC/6pph4w4aBybxwfNLmvmvq+5SykDUt2djm1ww
         JF1GnliLd91ozOoSUC0rHJgLaZvGnkTxyKew6FvCsx5Uzv75cbgCSXI6h4MuUQTqnjrm
         BTJvfSYVluyBeOBU+lhr7L5dVKknMdh7R+PkdVLzLAGfuoSOsRVc6o11bbnxlKrs0Van
         GBByS88SA2+8iPQjoevqRSHNxhx15J6nj1OjyahjXbBK/bmUQfHixPVntfENI8xVg2Vc
         kGCw==
X-Gm-Message-State: AOJu0Ywc0banBdU1AwGLOjCn8sqKEbzP5fU6DZ9+2Lqd9P8A6bUugjjS
	DRTm2OlQgq5jvgvTMznRokRjLg==
X-Google-Smtp-Source: AGHT+IFDxUKLBz3VGC2yCoNsiSxvdSiRStRV4vEwYMcZ1GLlryESWkqSr0FR8fSbQq7cz7HdROcAPg==
X-Received: by 2002:a05:6a20:548c:b0:18f:97c:8235 with SMTP id i12-20020a056a20548c00b0018f097c8235mr778237pzk.63.1703150596960;
        Thu, 21 Dec 2023 01:23:16 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:16 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/4] Improvement around mtk_vcodec_mem_free() logging and usage
Date: Thu, 21 Dec 2023 17:17:42 +0800
Message-ID: <20231221092226.1395427-1-fshao@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012319_270771_3076ECB1 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series includes some improvements around mtk_vcodec_mem_free() in
mtk_vcodec_util.c.

I noticed that mtk_vcodec_mem_free() generates a spurious error if the
target DMA buffer has been freed previously:
  mtk_vcodec_mem_free(),69: [MTK_V4L2][ERROR] 18000000.video-codec
  dma_free size=0 failed!

The warning is harmless, but it brings some confusion to our developers
and testing infra, so I sent this series to fix that with some minor
improvement for the driver alongside.

The first two patches are for aesthetic and style improvements, the
third tries to make the error logs more informative, and the last adds
back the missing checks when calling the free function.

Regards,
Fei

v1: https://lore.kernel.org/all/20231113123049.4117280-1-fshao@chromium.org/

Changes in v2:
- rebased on top of next-20231219
- revise commit message for clearer intention and rationale
- update the error messages based on the suggestion

Fei Shao (4):
  media: mediatek: vcodec: Replace dev_name in error string
  media: mediatek: vcodec: Drop unnecessary variable
  media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
  media: mediatek: vcodec: Only free buffer VA that is not NULL

 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 23 +++++++++----------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 22 ++++++++++++------
 .../vcodec/encoder/venc/venc_h264_if.c        |  5 ++--
 3 files changed, 29 insertions(+), 21 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog


