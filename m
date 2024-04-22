Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D5BC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSkyOzxUcdbMqzp03KnrhjrfOdlW3TL2PUxe3CYy+uU=; b=tdbZzWdvl4Ia2gHWVIf1cQc4/W
	6scMiicXipXC+XZY4ug1gf8UHutpkaNQ27RODYhv/QO/a1HDaojJY2DD0pIA57Ed/Pkib5bXp1AeF
	m7ekE7AiQDfQAB0VgzHTtImMACAlVzhKwGC5oSj4Cqi6Xd6sw/76HVSUyhELB20q/2J3kfEPloRrG
	P/MbKBQQ0vcWaAFEzteNc2aPAE8MvGvNdCrT6GVgGLIqtYK1TiWQw4fdC2ieXO1Xmul0rHq5D4ry3
	kiu8Ph7ZH2RA6BW3dwdltywBNrlPMpSjOFrU1RalduDxxsf1ozstF79CI0TZj8f63T+qZBnVPCJHm
	BfK++UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryx6W-0000000EQVQ-1LCr;
	Mon, 22 Apr 2024 17:05:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryx6S-0000000EQUb-4BoB
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Apr 2024 17:05:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so4493105b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Apr 2024 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713805514; x=1714410314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSkyOzxUcdbMqzp03KnrhjrfOdlW3TL2PUxe3CYy+uU=;
        b=DzGdwx4W+4Dhv23mFXs7/raq4mB8ER5n/onImRa+BMxptR03wyQE5kDC8+GoXOamIe
         t2uGn1DVm0MlpfAqqG1pIW4Ne+vPmTKj87m+XFiq7ZFdK4pqoCtdBXaXf3oujL87mnRE
         lPITJhZJfevJZqpchHPdvwZkEX0Aq0uCBp/Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805514; x=1714410314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSkyOzxUcdbMqzp03KnrhjrfOdlW3TL2PUxe3CYy+uU=;
        b=QSS0FJscHizMDayNhysND5nl/3n/VTCXnAveITCe56yot9MqSJzf8Wq1LIE8rOxx93
         fqv5T5SdUWRP6b8fqG+pgJ2lAwSeptSUNLIxjgpEO/TnS5axr5inMoRaO+HcmGpakdkm
         1d/iyaPPrrUxZPeDiOVWG7jw6UqKLBpHIvZUOxjaNm05hHwAbPVR3h05AsyXxNFkm8em
         BnRu99jZANbZFE0hlZo2st71cR5rzHqq26bcMqpRos9FHwiW1KTvEN0+3UIjLkPUKsTQ
         Tucu1HoM2BFHMXFmA2QCFp3vi+cbWhMgydqD92X/o3bKNW3gn9sC3XVFWHBjRxfrVcv6
         rsVw==
X-Forwarded-Encrypted: i=1; AJvYcCUZuuYX2tvES3FJO1numuJLn6RX83B5kRmhUFgV1pX5AaN3Ru3jQOgiqoJnf8nTa9xUrxRkNH8aJfmXPz00j659uCaqtzPq96oKAm4zuv7BRUBm
X-Gm-Message-State: AOJu0YxnSIV4++4lr2gIbMUl60msW1S7ggXGMKZm8op44azLXP/JSLuE
	ZQNIbVnx9ZhlP4pugqHipGB0KlOS6Eh+/FVmehaYAwixDIactR9bUD7ny2TBNA==
X-Google-Smtp-Source: AGHT+IFxJFeMPcL8ytCxc2u5zPDcX0TiDfN/BOFVsXaXujFuR9MAhpYnZXK32l63JffeuOssUsOYXw==
X-Received: by 2002:a05:6a00:1407:b0:6ed:2f2:a8e with SMTP id l7-20020a056a00140700b006ed02f20a8emr11839710pfu.30.1713805514163;
        Mon, 22 Apr 2024 10:05:14 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:843d:b423:30f9:2b2])
        by smtp.gmail.com with ESMTPSA id fa34-20020a056a002d2200b006e5571be110sm7997617pfb.214.2024.04.22.10.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 10:05:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei-Shun Chang <weishunc@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
Date: Mon, 22 Apr 2024 10:03:59 -0700
Message-ID: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_100517_044708_DC1334EF 
X-CRM114-Status: GOOD (  12.46  )
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

As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
really make sense to try to allocate contiguous chunks of memory for
video encoding/decoding. Let's switch the Mediatek vcodec driver to
pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
memory subsystem.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
NOTE: I haven't personally done massive amounts of testing with this
change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
specifically for the video encoding / decoding cases and I know it
helped avoid memory problems in the past on other systems. Colleagues
of mine have told me that with this change memory problems are harder
to reproduce, so it seems like we should consider doing it.

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..3fb1d48c3e15 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -64,7 +64,8 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 		id = dec_ctx->id;
 	}
 
-	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
+	mem->va = dma_alloc_attrs(&plat_dev->dev, size, &mem->dma_addr,
+				  GFP_KERNEL, DMA_ATTR_ALLOC_SINGLE_PAGES);
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
 			     dev_name(&plat_dev->dev), size);
-- 
2.44.0.769.g3c40516874-goog


