Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55572C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 02:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0toZ4lHH4yuaXuBk5XmT7w4+mYvbJXV+qlL1fDRTqU=; b=yVBuiBJfDm3bvxtGaq2nCjtrCg
	HlKZGhvqnrLYYvQja8rVaT21AaAYptNsDGqR2qLI1qnY34PIS1vBzeq6Mp4K6Cyk7ZF51HP4KjORb
	A5WmldQh8nsvZQRNwTtzTihSSs/jSbgJ/j35o5wBhiOAN24ezxQbM3Xw2DbL2Fp9NE2TXuAYabplP
	qeEQS/2P/UQuU4ZmvFjXVyfHlF9MhgIc6OMO+Xm3zaFTC8MmcQWK8zkHjd9QCSzu0oK40wLS8bIAx
	mVnZbObMj5qitNnGg3Us8gEIy3XTJz80tgLEzlbO7JTtZ2fNXHjGJQRq71FDkn6fsWgFsh3UmhWAY
	jX8vnobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9H2e-00D4xY-V3; Thu, 07 Jul 2022 02:14:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9H2T-00D4nb-UN; Thu, 07 Jul 2022 02:14:47 +0000
X-UUID: 527954b5abef4606ba87b92902f0822b-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:eeac5de1-736b-4470-bbb7-2f5142c676a2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:e59f9e63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 527954b5abef4606ba87b92902f0822b-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 405603345; Wed, 06 Jul 2022 19:14:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 7 Jul 2022 09:53:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 7 Jul 2022 09:53:58 +0800
Message-ID: <d802e3e442a516ba8c2f123a127e33c49f831744.camel@mediatek.com>
Subject: Re: [PATCH v16 0/5] drm/mediatek: Add MT8195 dp_intf driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 7 Jul 2022 09:53:58 +0800
In-Reply-To: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
References: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_191446_014290_7102D19A 
X-CRM114-Status: GOOD (  21.35  )
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

Hi, Bo-Chen:

On Tue, 2022-07-05 at 18:25 +0800, Bo-Chen Chen wrote:
> The dpi/dpintf driver and the added helper functions are required for
> the DisplayPort driver to work.

For this series, applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> This series is separated from [1] which is original from Guillaume.
> The display port driver is [2].
> 
> Changes for v16:
> 1. Separate input_2pixel and pixels_per_iter to other patches.
> 2. Remove function "mtk_dpi_matrix_sel" and color_fmt_trans_support
>    in patch "Add YUV422 output support".
> 3. Drop patches which are accepted.
> 
> Changes for v15:
> 1. Add a patch to remove support for output yuv422 for previous socs.
> 2. Only remain output format of reg888/yuv422 support for mt8195.
> 3. Adjust the order of patches.
> 
> Changes for v14:
> 1. Separate a new binding patch to modify mediatek string format.
> 2. Use GENMASK(4, 0) for INT_MATRIX_SEL_MASK in patch
>    "Add YUV422 output support"
> 3. Change kernel doc description of support_direct_pin.
> 4. Change to use pixels_per_iter to control quantity of transferred
>    pixels per iterration.
> 
> Changes for v13:
> 1. Change mediatek,mt8195-dp_intf to mediatek,mt8195-dp-intf.
> 2. Add kernel doc for mtk_dpi_conf.
> 3. Drop patch of tvd_pll enable.
> 4. Squash some color format transfer related patches.
> 5. Add new patch to support setting of direct connection to pins.
> 6. Change fix tag of "drm/mediatek: dpi: Only enable dpi after the
> bridge
>    is enabled".
> 
> Changes for v12:
> 1. Remove pll_gate.
> 2. Add more detailed commit message.
> 3. Separate tvd_clk patch and yuv422 output support from add dpintf
>    support patch
> 4. Remove limit patch and use common driver codes to determine this.
> 
> Changes for v11:
> 1. Rename ck_cg to pll_gate.
> 2. Add some commit message to clarify the modification reason.
> 3. Fix some driver order and modify for reviewers' comments.
> 
> [1]:
> https://lore.kernel.org/all/20220523104758.29531-1-granquet@baylibre.com/
> [2]:
> https://lore.kernel.org/all/20220610105522.13449-1-rex-bc.chen@mediatek.com/
> 
> Bo-Chen Chen (4):
>   drm/mediatek: dpi: Add YUV422 output support
>   drm/mediatek: dpi: add config to support direct connection to dpi
>     panels
>   drm/mediatek: dpi: Add input_2pixel config support
>   drm/mediatek: dpi: Add pixels_per_iter config support
> 
> Guillaume Ranquet (1):
>   drm/mediatek: dpi: Add dp_intf support
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 115 +++++++++++++++++-
> --
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  18 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>  5 files changed, 126 insertions(+), 15 deletions(-)
> 


