Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXZOIUmXNwEyN7vh7EjUyK8P2zIuhe6dYutBLhe+xwU=; b=SNA/+ItxQez8+6
	+mT+uX45olmN7Oq1dePNHnGpKxahOW0A6pgopk3evgTg1tQnzz5WmCWIuwBRBcZ5HyFxpSN2YoSN1
	wE78QzTbJUyle/4Hy5dJfUU2T4CFiUyiuZ5D43I2Rtd+eVqACpDXorqHBxc7nYT9SqK/h7fzz3rwi
	MJOVxptmahsMNOr83d3Ewjsalh5Zo4yb063DaNz1Rqh14fFtpnET07/4ghwuEWK+gXiHQ6OqdLfw4
	8ZmFGmrqZWIN72Ykc7x5kJ+aqUJkmO26nG00WlG1sJObHlkT17atcjIrCn3KccvRnZYD/9tsMYDBq
	/ID3vsv79IN/cyJI87lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJ2u-009bBD-1L; Fri, 15 Apr 2022 10:19:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJ2W-009ayp-PX; Fri, 15 Apr 2022 10:18:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 36DC41F47D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650017933;
 bh=7VVEclTxMCm4KiyIwNVph4lsHbE022T2X31UOnYwr0g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kZgoHNYbBgXd0vEWlo7ZDDNGW3+nC1Qn/Dk31ndJgkwkJSXOWKZ3nq+sG2uzcB1m0
 FEWUQONrT5TQFYgnVHimMpzf/K7wUEZ3ZUIeubKqQdmDnVr2bJYGgeqmpsL4adJ+qP
 diFXWw+fvZFLpHckXrQjyH5st0q6C4jbUR928w1IIWgM+u5y6rqB7V+sYwU9llL6bG
 FmH1FI7Ww5epaoh+b47Haizza2x6YVNbg9HcPxodL4iTqE5FrqSx7WWqjK0F/rs/2y
 twjhqcX7U1324hmBYUglBH3wH1f/PiDpcpfVcsWpcCqNh4Y0kYrLBPM16zr1OIqXwb
 Ylg83v8ZVDCxw==
Message-ID: <8dc9928b-3e8c-bfcc-8424-ab577c97eb03@collabora.com>
Date: Fri, 15 Apr 2022 12:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 07/10] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8195
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-8-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_031857_036151_CC922AA3 
X-CRM114-Status: GOOD (  13.71  )
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

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> 1. Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 2. Add get driver data function to identify which vdosys by io_start.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 141 +++++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 +
>   3 files changed, 145 insertions(+), 8 deletions(-)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index a58cebd01d35..e1a37ca091f3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -21,6 +21,7 @@ struct drm_property;
>   struct regmap;
>   
>   struct mtk_mmsys_driver_data {
> +	const unsigned int io_start;

As mentioned in patch 03/10, this has to be

	const resource_size_t io_start;

Thanks!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
