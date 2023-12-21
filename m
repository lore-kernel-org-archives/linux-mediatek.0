Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C9EC46CD4
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lCEYEMR3ZdMjHY32Gwj2vmlAOglAWDLVN2PPmHFWNo=; b=31nqhDT9UnkMKZ
	+blC1zHSMaHS/sgLiI7yl83JMYXJu8BOJWsB3vf3n/gtcnshFAgin2zKmML4o5lnC2hkbFubU7t1E
	+d6VaDFBJZHOC7YnVdqeNtZyCjezbdfe9Wn+oacfCPORGlDZSlAbqermDv1Tlr5xgRZYBXyXTdFm7
	mx46wfzZ2Z3Kc2LZyu/KC1byUrb/1FfK6PzrB+I3L3OaDx0RSZUQFc5BLKw/C76Uf786n6cMOAs5w
	uD3uMKDG/LW+aY3f1SEAw15fWj3unRxjpOXFUr63RnmtqMLwEGIm09PFGRguR8euIsegtfEFhpOxk
	u1/TNZfPmhVRJv0GnFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFH2-002FHx-2C;
	Thu, 21 Dec 2023 09:23:24 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFGz-002FFM-0X
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 09:23:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cd86e3a9afso388367a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Dec 2023 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150600; x=1703755400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lCEYEMR3ZdMjHY32Gwj2vmlAOglAWDLVN2PPmHFWNo=;
        b=Dg0uYib511x9AB43ZjaSPSVUA9CGIllWrJCwwJ8kCcMe9ia+PlL0k44xRhmRWiKNac
         vpNS+JflQ2yd5fDKSwM6ubewPwFNc45ikfNZjdMpUymuRUToBE0YmTN+TfYO741DzYtv
         Wx43VLLKA0uvRHOKn4C/b65ipdQSqRGBG7aKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150600; x=1703755400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lCEYEMR3ZdMjHY32Gwj2vmlAOglAWDLVN2PPmHFWNo=;
        b=JFYB1uNZbvKOOSZ5w0Fdn7XGKutWkt55eeN/H2r4TiAEny48MRxNt3zy6GIem7a4Sj
         iur/KPC8iIzbP3Eb6a+JTmcokxwCQnihDGyfFJ0+t0Sm8Gga5gjBkEA6IGZR16zg+4qn
         s5dGrF2Fbz1wHnMdKy82ZzVqw+9b3hPulbnsQF19Seqs69F00XS2B7s4u/ZVYgvTTZo7
         NLbw5oCNp9YXLqKGTiQS/F9Vv+4mQ1b+9KMsnXgueUJOn66y06JUpk5xFQMBmy/ze+cr
         Z7MANyKvReMeM6aSTyF84aq0dl5sYa4JaUY/xn+wBDB9dQccF/u17QkzszAkRFRw8AkV
         H59Q==
X-Gm-Message-State: AOJu0YyelnGyRwhdmrZW0HVy6wpAk05Zy7Dhedhm5T1LwD2Wn6bdDNOh
	Oy/KgSzrKrUxwMSEkLtATXw5TA==
X-Google-Smtp-Source: AGHT+IGJaFa3W8ttJ0cxva573B0FW+Tv1L0wT9eD1Gl2S44RAoKQalXdgX9vfptXkKSVuDVY4wht4g==
X-Received: by 2002:a17:90a:fa96:b0:28b:e0cd:64a3 with SMTP id cu22-20020a17090afa9600b0028be0cd64a3mr481792pjb.26.1703150600225;
        Thu, 21 Dec 2023 01:23:20 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:19 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/4] media: mediatek: vcodec: Replace dev_name in error string
Date: Thu, 21 Dec 2023 17:17:43 +0800
Message-ID: <20231221171727.v2.1.I69223f1e438b93fe02f12ab9ef0a26f8c21f6ae7@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
References: <20231221092226.1395427-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012321_203177_BE77E3D0 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_v4l2_err() already uses dev_err(), so don't print the device name
again. Print function name instead.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
- rebased on top of next-20231219

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..ea8c35c0e667 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -67,7 +67,7 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
-			     dev_name(&plat_dev->dev), size);
+			     __func__, size);
 		return -ENOMEM;
 	}
 
@@ -99,7 +99,7 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_free size=%ld failed!",
-			     dev_name(&plat_dev->dev), size);
+			     __func__, size);
 		return;
 	}
 
-- 
2.43.0.472.g3155946c3a-goog


