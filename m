Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C3260F36
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3C3260F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PthbJ357WAkvj6DucdHK2N37BTdtEk/XoEs5yyYeuPM=; b=4K8aKSMbKOw+udYHGgnK0iaPKZ
	MBPQCXxTXVIwSExUXSbNbvt5hZiPSuTmhLaoQQcyFee3v6SNwHpxCL1jtcGEbm2cFV0QekENMZWQS
	a4p6o0pafPXEarFFfKkPNeM0qiEzIt8FNVTSeHudJynA76XpvWzdvhq96lhUuPksNeXiIy9K7+BQG
	oH8AXhxKxCZKHdAFU7uaxIhmGXkwCxoXADAvF1+LiTb90wUNDxs5N8Zws/UThNZTsesc8+w8wMGff
	0A9bHGSYwji7bNZ0iGd7qIo790ePh7q7HqFKErHQb3gW2026xchseeL6UfZX3ykEOJFJwCYChyfZf
	c+t3B4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb26I-003VjT-93; Thu, 14 Oct 2021 14:52:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb25r-003VZv-48; Thu, 14 Oct 2021 14:52:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1E93B1F44D01
Subject: Re: [PATCH v6 06/16] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-7-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c6dd417c-a575-8054-9d10-d56d925ec6bc@collabora.com>
Date: Thu, 14 Oct 2021 16:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004062140.29803-7-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_075227_334059_8A4D9A8E 
X-CRM114-Status: GOOD (  16.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Add mt8195 vdosys1 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h    | 136 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  10 ++
>   include/linux/soc/mediatek/mtk-mmsys.h |   2 +
>   3 files changed, 148 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 0c97a5f016c1..f19ec72c1243 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -59,6 +59,70 @@
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
>   
> +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
> +#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0		(1 << 0)

There is no bitshifting action here: this is simply 1.

> +
> +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
> +#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1		(1 << 0)

Same here.

> +
> +#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
> +#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT		(0 << 0)

And this is 0.

> +
> +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
> +#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT	(0 << 0)
> +
> +#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
> +#define MT8195_MERGE4_SOUT_TO_DPI1_SEL				(2 << 0)

This is simply 0x2...

> +#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL			(3 << 0)

...and this is 0x3.

There are other occurrences of the same logic, so please fix them all.

Regards,
- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
