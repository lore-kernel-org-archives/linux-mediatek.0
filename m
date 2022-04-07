Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59779C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhrpctkg0Oh+4wZdNbUCrZuFf/PywFYZakJIH7qVBkw=; b=Vx//vlkxmWvcgxsW90Nr0uWxjI
	f7hga6mdqidtPW+6qCt5Ecy4CRCQ1gnovMqto4kNlMTHp4uzmIXGwB3Xv8TK/LBlq6qDN+gt3d9Pb
	J5j0swziIuyfZTiZTbd3YpMszA0HRM4k1qVAlfVepmFlZA4dyy1Qn46s2JOKI5+lTh6wUk+YLjzYb
	eDwmt9xWNv3MjRF0j2COd/dGZRFEirbC61XBIm7QYtLbnC492eS/aZoo0ch0OZ3eCPVZFewmAeKRs
	MUJf4z7NaY/SvhWS8IxboOzYOFUtOlv7g9c6p+EMCscLez8j9lPH3VczYUGwM4Pt8J1V5irAifLfV
	I1CXrN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncOS9-00ArbD-Uy; Thu, 07 Apr 2022 09:29:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncOB3-00AjJ0-AS; Thu, 07 Apr 2022 09:11:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 006981F45D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649322699;
 bh=rEVxd+xPGVMs/CpV12WmQkqmi9WRB6BMXNDaHReiDOY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GrHSP7XETyXeNfXB7qFfIC5PMGX8gULYeCFWgeYatt24/x3Cr++PSBrZXXEDOvVQD
 zs/hr7ro9iJT7vjFMHNtOcMVD8QHi0pAnLEnnAcdmYxUxe1fTTq/obSmiTWobVpv3E
 hZRrdJd8Kgj2aZqdQjH3pcoY+ZJ4oWJHUmNaiSP0NJv+reCJ1XFkG1PxhPkzFpoRNG
 espsRguBhGk7UZj63QcytFBdirmkJRI4z8iQC5UgB2I/SbPZGvrlwQgg1LTZKfey3t
 kh4ISTovwspxDqmtknZb180gcLm95u4P6CNEQFX2DHMUeou+QzWEClZ5WL31R9Yewh
 m+zptKh4mDY7A==
Message-ID: <8d5c41c0-ac7c-ed1e-726b-0d738bf22fed@collabora.com>
Date: Thu, 7 Apr 2022 11:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND v17 3/7] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407030409.9664-4-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_021141_821133_489ECC75 
X-CRM114-Status: GOOD (  26.79  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, hsinyi@chromium.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, postmaster@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, roy-cw.yeh@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>,
 John 'Warthog9' Hawley <warthog9@eaglescrag.net>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/04/22 05:04, jason-jh.lin ha scritto:
> 1. Add mt8195 mmsys compatible for vdosys0.
> 2. Add mt8195 routing table settings and fix build fail.
> 3. Add clock name, clock driver name and routing table into the driver data
>     of mt8195 vdosys0.
> 4. Add get match data by clock name function and clock platform labels
>     to identify which mmsys node is corresponding to vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
>   drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
>   drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
>   drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mt8195-mmsys.h         | 370 ++++++++++++++++++++
>   drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
>   drivers/soc/mediatek/mtk-mmsys.h            |   1 +
>   drivers/soc/mediatek/mtk-mutex.c            |   8 +-
>   include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
>   12 files changed, 461 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 

..snip..

> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..b2fa239c5f5f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -4,6 +4,8 @@
>    * Author: James Liao <jamesjj.liao@mediatek.com>
>    */
>   
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/io.h>
> @@ -17,6 +19,7 @@
>   #include "mt8183-mmsys.h"
>   #include "mt8186-mmsys.h"
>   #include "mt8192-mmsys.h"
> +#include "mt8195-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> @@ -72,12 +75,24 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +	.clk_name = "cfg_vdo0",
> +	.clk_driver = "clk-mt8195-vdo0",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
>   	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>   };
>   
> +static const struct of_device_id mtk_clk_platform_labels[] = {
> +	{ .compatible = "mediatek,mt8195-mmsys",
> +	  .data = (void *)"clk-mt8195"},

I have a hunch that MT8195 won't be the first and last SoC having multiple
mmsys channels. I would tend to think that there will be more....

....so, to make it clean from the beginning, I think that you should, at
this point, assign a struct to that .data pointer, instead of declaring a
drvdata struct into mtk_mmsys_get_match_data_by_clk_name().

Besides, I think that this kind of usage for __clk_get_name() may be an API
abuse... but I'm not sure about that... in any case:
- if it's not an abuse, then you should simply pass mt8195_vdosys0_driver_data,
   or an array of pointers to mtk_mmsys_driver_data;
- if this is an abuse, you can do the same checks by looking at the iostart
   (mmio base address) of the vdosys{0,1} node(s).

Honestly, though, I'm not even sure that you need this different of_device_id
array here... since you could simply wrap the mtk_mmsys_driver_data in the
of_match_mtk_mmsys that you have below... here's another idea:

struct mtk_mmsys_match_data {
	const struct mtk_mmsys_driver_data *drv_data[];
	unsigned short num_drv_data;
};

...so that:

static int some_function_handling_multi_mmsys(struct mtk_mmsys *mmsys,
					      struct mtk_mmsys_match_data *match)
{
	int i;

	i = [ logic to find the right match->drv_data entry here ]

	return i;
}

static int mtk_mmsys_probe()
{
	.... variables, something else ....

	if (match_data->num_drv_data > 1) {
		/* This SoC has multiple mmsys channels */
		ret = some_function_handling_multi_mmsys(mmsys);
		if (ret < 0)
			return ret;

		mmsys->data = match_data->drv_data[ret];
	} else {
		dev_dbg(dev, "Using single mmsys channel\n");
		mmsys->data = match_data->drv_data[0];
	}

	...everything else that mtk_mmsys_probe does ...
}

What I'm trying to communicate with this is that the currently chosen solution
looks a bit fragile and needs to be made robust.
In comparison, even if it's not technically right to have two different compatibles
for the same hardware (and shall not be done), the former solution, even if wrong,
was more robust than this one, imo.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
