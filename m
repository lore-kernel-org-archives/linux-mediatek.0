Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC23CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB88oJUZLkHXze5sB0IOatvKM4nJJVIzsTiFsZe6THI=; b=VrVEDzz13ZJVzF8lr7YyZKCUdY
	IlPtk9UswY8ru6gryn7tFHmIBIMrkJk4WW0KNZwdvQX5NHGIMQsGYFEX0XK2xiZE68R9IZmwwBE5a
	09qYPsd8cttJWjv2P3G8vRx1H1Gu/sNyVyIfC/3yF1W8cOhRAvS7gysSek4ia2DnXNGtLIiGBjo++
	+RziF4sKzBcnU4FnNRlgHdn1zK82RPrv8pzer6+i0qILjX6EDquo0vzpENKQnLW/O2ceHdBlibSb9
	HUZyxwJNw9MT2MgjilCJEceJalDZ/YID5P1MObsb/TZLyYVarpbvteIJoV1wVzNd46aVXfTwFUkDj
	FIu1oqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7AU-001lvH-Jk; Thu, 09 Feb 2023 13:40:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ78v-001l6B-Tw; Thu, 09 Feb 2023 13:39:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2A5566020C1;
	Thu,  9 Feb 2023 13:39:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675949956;
	bh=el4tNcyCAEC+oZUCSzKc3hOlEvtwGNspm+w1ZpzJ3Xc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PnIJTG5CsdKRvBB73UJzYfCjjNgqY23zH/q7x5WGlFRPSrLBHu9CyGzclXShDplHr
	 45GsGoCaH00ri7vEucAQPXhh/joZ9GEq9XG99bRA+up1lx2CqyxK4xVHKuN2SP8gxg
	 lEju+dRBhSt0L+rz020G7wc3zzIGABTZI3iHjwTVcRZc2WbwN2dY+JblmWU4PGVeNC
	 HLk+2yPVDm3nY8fAzXqQDf7IfbABLHe19vK47nnz+pAsEHyhOQDe7X7YtlQJY8PDYW
	 BiUUvawIe6u27YSuqS7Pkmw6HXEOOTxrwmqwFRoRZTK01bW65YDAvAsieLMfpy6egQ
	 AGblF49BAwfhw==
Message-ID: <cab40506-8b3a-0b53-b45d-a8000e953289@collabora.com>
Date: Thu, 9 Feb 2023 14:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/10] iommu/mediatek: Get regionid from larb/port id
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230208053643.28249-1-yong.wu@mediatek.com>
 <20230208053643.28249-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208053643.28249-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_053918_291892_B48ED1BA 
X-CRM114-Status: GOOD (  25.77  )
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

Il 08/02/23 06:36, Yong Wu ha scritto:
> After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers"), the dma-ranges is not allowed for dts leaf node.
> but we still would like to separate to different masters
> into different iova regions.
> 
> Thus we have to separate it by the HW larbid and portid. For example,
> larb1/2 are in region2 and larb3 is in region3. The problem is that
> some ports inside a larb are in region4 while some ports inside this
> larb are in region5. Therefore I define a "larb_region_msk" to help
> record the information for each a port. Take a example for a larb:
>   [1] = ~0: means all ports in this larb are in region1;
>   [2] = BIT(3) | BIT(4): means port3/4 in this larb are region2;
>   [3] = ~(BIT(3) | BIT(4)): means all the other ports except port3/4
>                             in this larb are region3.
> 
> This method also avoids the users forget/abuse the iova regions.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 43 +++++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d5a4955910ff..fc3d9be120a0 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -8,7 +8,6 @@
>   #include <linux/clk.h>
>   #include <linux/component.h>
>   #include <linux/device.h>
> -#include <linux/dma-direct.h>
>   #include <linux/err.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> @@ -194,6 +193,7 @@ struct mtk_iommu_plat_data {
>   	enum mtk_iommu_plat	m4u_plat;
>   	u32			flags;
>   	u32			inv_sel_reg;
> +	const u32		(*larb_region_msk)[32];

Can you please document this larb region mask in code, other than the commit
description?

I can see this being essential for the next person reading this driver's code
without digging through the commit history. At least some comment on top of
the pointer, or on top of the struct declaration... and perhaps also describe
briefly that the array is "indexed by region" (so 1 = region 1; 2 = region 2)
and that the region index corresponds to the same index as `mtk_iommu_iova_region`.


Before doing that, I'd like to check if anyone else has a better solution for
that... because when looking at data for one of the SoCs in here, it looks a bit
intimidating!

Copy-paste from patch [04/10] of this series for the reader's commodity:

static const unsigned int mt8195_larb_region_msk[][32] = {
	[0] = {~0, ~0, ~0, ~0},               /* Region0: all ports for larb0/1/2/3 */
	[1] = {0, 0, 0, 0, 0, 0, 0, 0,
	       0, 0, 0, 0, 0, 0, 0, 0,
	       0, 0, 0, ~0, ~0, ~0, ~0, ~0,   /* Region1: larb19/20/21/22/23/24 */
	       ~0},
	[2] = {0, 0, 0, 0, ~0, ~0, ~0, ~0,    /* Region2: the other larbs. */
	       ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0,
	       ~0, ~0, 0, 0, 0, 0, 0, 0,
	       0, ~0, ~0, ~0, ~0},
	[3] = {0},
	[4] = {[18] = BIT(0) | BIT(1)},       /* Only larb18 port0/1 */
	[5] = {[18] = BIT(2) | BIT(3)},       /* Only larb18 port2/3 */
};

^^^^ That's what I actually mean by "intimidating"... :-P

It's just looks though, there's nothing much complicated here.

Regards,
Angelo



