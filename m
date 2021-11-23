Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E34C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xfXNOI9UCqcuS8sHhBzZluwVsw4CWuUcSyYwqzNGApY=; b=KjzUY/sTk/cXGC
	IVSx/M36l/RD0ybFyqYQu2PeaRaeT8Diaa594cxmjh/mgGmpPT20/NL6ZTpNPDzEKBCXfClCDd8S0
	ogMoJogYbZjDzOpSxNIPQ0GVJ0wj6TAqeNfUjpN1uHITvGLlTPnIWG++MxlI9MzskiRjqcMXTtlyH
	a1FMyBpToAB/nUGV2VW3G6Z6XNTCUHv2V0ehql96bjwz8IaBduuCauX6/WAchDuaV4nap0cj9mJx0
	Acbz1DGM4pp8e8yEImOxlX7mXD4Ul8VTncuixIRRwrDctz01bvMDmdp/hEPP7dtRzIG3SrLQLdvWp
	okIFh4ZE9EOfO2dG1mwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTrl-001sE0-Bp; Tue, 23 Nov 2021 11:21:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTrN-001s13-Rb
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 11:21:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id p18so16766459plf.13
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Nov 2021 03:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/NUU473gHgJJWAHyz9icycAmdo+qfzcO9MMsTUYLCA=;
 b=Ka+/WtPAVKmsC47ebx/EttMPimSyaFaQsXvSwohDRgg53jo8emMNbvUMSjBffFZJiF
 6mmEV31XO/9nn98pDJV/kWkNmFi5luffIqiHkegaqh/MUKTubaMVlPLwa07SSu/o/XsD
 8ngdYw/RZqDR/Hmx12cSy0gEWVZ3Gd2d3Mktk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/NUU473gHgJJWAHyz9icycAmdo+qfzcO9MMsTUYLCA=;
 b=l9/HHuL3pPxKjXCYDONvsaVjfDdTquJ7H7GLGr4Xu2jGGhOkNCNsBV3xq777OX9Lhx
 Dz9pOaJv9/x6g+E21sQ/0ORVwOhy+EKskaPgCp1nNgORe39LD/tCOEpoybVoDCKL/1xh
 QDNfu5cicckgGJA3hnbJGMlIIioBz7S2jWCMTfma2fNvS4FG3KZ4gp/JT5jBwBB+f25Y
 HbuhSqbzrHc4/Y3oJKBKL4T7XrLiCJrY12KvcgbsQK1T24fqdv+mlnz9Wg4pMLNHbLB4
 NkQG0miNervDi3Zkq+gnBrS75bOaDFTgLghK6N+gD/ziabjp5THySZiGsGWI81tDzvst
 prDw==
X-Gm-Message-State: AOAM532TCTD7wuhpMaA+DorfCsfaNzWXGvLOcGCiYN4aYlZYEecUYqNE
 bbLJOfumV7+WX2ntSxKrrxfjlQ==
X-Google-Smtp-Source: ABdhPJzZX7TeNDOF6tm1dgQN6UgDtm8Er0h77Xe7AqW6C2wdt/CMcVsKuhDG9eZ4EtpKo4xugVw3nw==
X-Received: by 2002:a17:902:e5ce:b0:142:780:78db with SMTP id
 u14-20020a170902e5ce00b00142078078dbmr5853227plf.12.1637666470227; 
 Tue, 23 Nov 2021 03:21:10 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:d1ae:c331:ed2a:15e9])
 by smtp.gmail.com with ESMTPSA id 63sm11093914pfz.119.2021.11.23.03.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:21:09 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, - <devicetree-spec@vger.kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 senozhatsky@chromium.org, tfiga@chromium.org
Subject: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Date: Tue, 23 Nov 2021 19:21:01 +0800
Message-Id: <20211123112104.3530135-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_032113_908495_A8BC0F53 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Default IO_TLB_SEGSIZE (128) slabs may be not enough for some use cases.
This series adds support to customize io_tlb_segsize for each
restricted-dma-pool.

Example use case:

mtk-isp drivers[1] are controlled by mtk-scp[2] and allocate memory through
mtk-scp. In order to use the noncontiguous DMA API[3], we need to use
the swiotlb pool. mtk-scp needs to allocate memory with 2560 slabs.
mtk-isp drivers also needs to allocate memory with 200+ slabs. Both are
larger than the default IO_TLB_SEGSIZE (128) slabs.

[1] (not in upstream) https://patchwork.kernel.org/project/linux-media/cover/20190611035344.29814-1-jungo.lin@mediatek.com/
[2] https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/mtk_scp.c
[3] https://patchwork.kernel.org/project/linux-media/cover/20210909112430.61243-1-senozhatsky@chromium.org/

Hsin-Yi Wang (3):
  dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
  dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
  arm64: dts: mt8183: use restricted swiotlb for scp mem

 .../reserved-memory/shared-dma-pool.yaml      |  8 +++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +--
 include/linux/swiotlb.h                       |  1 +
 kernel/dma/swiotlb.c                          | 34 ++++++++++++++-----
 4 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.34.0.rc2.393.gf8c9666880-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
