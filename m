Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DF3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oDlTmgjaeka6kmo3opkHpqbdBci761ROZXYzs/0EeA=; b=vImq49AKVkOmVsrefYt35FUjl7
	5prBRSgLNLHQqIVF++lXlZ/HtES5PRhZbGoD4jPl4hMlXcUXrwRG1sKnvC4IqRf949XXqRnZMzfQC
	counnk8JEen3mgXFdS8I3STpFl1naEq3oVyjDh/945DR+8qtKcSX9UbK7TKEBK9e66NWiuIg7ODxz
	EjBxiAmDRA/wh5J/K0+IpMrTgMI+PJEdZ0QorklCFurtumgfH19T0/tTLrRuJqwc90+VLDmuRbl/G
	1XmrYs0DI8n0+HN6Yu/76qVyrdxRgfty6A4lG6DezBG02PkT+Mp0zMMl9OJQDNVMLxBbH8WdGaPeB
	WnSSZvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nck5Q-00FvIm-MW; Fri, 08 Apr 2022 08:35:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nck4k-00Fuyv-Tq; Fri, 08 Apr 2022 08:34:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ED4E01F46C66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649406877;
 bh=ruWKosIiheva0ybWFhF+2wOQJy0lxi9sS5kbtYf5Lhk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IY9+aGuDoDBZhXOEGz9RnAdaoKfddTleq9HhoS1EjDW2maWc3xCLbl1z+D+XJlLNf
 AewzDdpL8jfHT0PMKUXKc4kK0yptIwHzbO7f09/5v8Q+h38lXMm1dKG/GEO3B/RqPy
 +vR1FpLTm8gWTOE5MIGf25OeuEC9YXXqFslOuQYR3WPziV4i2fAhHppmpk+E1gvPZj
 Ud/9bXEW5ypvCVeyvlIXl6hb7pyvzLgytwhEPFRlZMZQfeKnhS0hZepGf67HKb7O3a
 FOeYoDPlR0b/QN9KfLWD2iVrIT6TNzRhDLsClLDePvMIZrZMvM6xwM/rzlbu84lMgs
 al/g8t8TT7tIg==
Message-ID: <2b0448fb-41ab-daae-6419-d08abc331cb3@collabora.com>
Date: Fri, 8 Apr 2022 10:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND v17 3/7] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
 <8d5c41c0-ac7c-ed1e-726b-0d738bf22fed@collabora.com>
 <1ee8927744624fb0b6e97190e5a4b78cbee69751.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1ee8927744624fb0b6e97190e5a4b78cbee69751.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_013439_341479_ACB4493F 
X-CRM114-Status: GOOD (  39.63  )
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

Il 08/04/22 04:42, Jason-JH Lin ha scritto:
> Hi Angelo,
> 
> Thanks for the reviews.
> 
> On Thu, 2022-04-07 at 11:11 +0200, AngeloGioacchino Del Regno wrote:
>> Il 07/04/22 05:04, jason-jh.lin ha scritto:
>>> 1. Add mt8195 mmsys compatible for vdosys0.
>>> 2. Add mt8195 routing table settings and fix build fail.
>>> 3. Add clock name, clock driver name and routing table into the
>>> driver data
>>>      of mt8195 vdosys0.
>>> 4. Add get match data by clock name function and clock platform
>>> labels
>>>      to identify which mmsys node is corresponding to vdosys0.
>>>
>>> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
>>>    drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
>>>    drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
>>>    drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
>>>    drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
>>>    drivers/soc/mediatek/mt8195-mmsys.h         | 370
>>> ++++++++++++++++++++
>>>    drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
>>>    drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
>>>    drivers/soc/mediatek/mtk-mmsys.h            |   1 +
>>>    drivers/soc/mediatek/mtk-mutex.c            |   8 +-
>>>    include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
>>>    12 files changed, 461 insertions(+), 17 deletions(-)
>>>    create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
>>>
>>
>> ..snip..
>>
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>> index 4fc4c2c9ea20..b2fa239c5f5f 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -4,6 +4,8 @@
>>>     * Author: James Liao <jamesjj.liao@mediatek.com>
>>>     */
>>>    
>>> +#include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/device.h>
>>>    #include <linux/io.h>
>>> @@ -17,6 +19,7 @@
>>>    #include "mt8183-mmsys.h"
>>>    #include "mt8186-mmsys.h"
>>>    #include "mt8192-mmsys.h"
>>> +#include "mt8195-mmsys.h"
>>>    #include "mt8365-mmsys.h"
>>>    
>>>    static const struct mtk_mmsys_driver_data
>>> mt2701_mmsys_driver_data = {
>>> @@ -72,12 +75,24 @@ static const struct mtk_mmsys_driver_data
>>> mt8192_mmsys_driver_data = {
>>>    	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>>>    };
>>>    
>>> +static const struct mtk_mmsys_driver_data
>>> mt8195_vdosys0_driver_data = {
>>> +	.clk_name = "cfg_vdo0",
>>> +	.clk_driver = "clk-mt8195-vdo0",
>>> +	.routes = mmsys_mt8195_routing_table,
>>> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>>> +};
>>> +
>>>    static const struct mtk_mmsys_driver_data
>>> mt8365_mmsys_driver_data = {
>>>    	.clk_driver = "clk-mt8365-mm",
>>>    	.routes = mt8365_mmsys_routing_table,
>>>    	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>>>    };
>>>    
>>> +static const struct of_device_id mtk_clk_platform_labels[] = {
>>> +	{ .compatible = "mediatek,mt8195-mmsys",
>>> +	  .data = (void *)"clk-mt8195"},
>>
>> I have a hunch that MT8195 won't be the first and last SoC having
>> multiple
>> mmsys channels. I would tend to think that there will be more....
>>
> 
> Yes, there will be another SoC with multiple mmsys channels...
> 
>> ....so, to make it clean from the beginning, I think that you should,
>> at
>> this point, assign a struct to that .data pointer, instead of
>> declaring a
>> drvdata struct into mtk_mmsys_get_match_data_by_clk_name().
>>
>> Besides, I think that this kind of usage for __clk_get_name() may be
>> an API
>> abuse... but I'm not sure about that... in any case:
>> - if it's not an abuse, then you should simply pass
>> mt8195_vdosys0_driver_data,
>>     or an array of pointers to mtk_mmsys_driver_data;
>> - if this is an abuse, you can do the same checks by looking at the
>> iostart
>>     (mmio base address) of the vdosys{0,1} node(s).
> 
> Do you mean that I should change clk_name to iostart like this?
> 
> mt8195_vdosys0_driver_data = {
> 	.iostart = 0x1c01a000, // instead of clk_name
> 	.clk_driver = "clk-mt8195-vdo0",
> 	.routes = mmsys_mt8195_routing_table,
> 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> };
> 
> Just to confirm that address information can be disclosed here.
> If it is not appropriate to use address here, I'll keep using clk_name.
> 

Yes Jason, even if that looks strange, it is an accepted behavior... at
least, on Qualcomm drivers, it was done exactly like that.

Besides, I'm sure that you will definitely agree with me that operations
on strings are way slower than checking "a number" :) :) :)


By the way, check that one out, that'll probably help you:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c?h=next-20220408#n789


>> Honestly, though, I'm not even sure that you need this different
>> of_device_id
>> array here... since you could simply wrap the mtk_mmsys_driver_data
>> in the
>> of_match_mtk_mmsys that you have below... here's another idea:
>>
>> struct mtk_mmsys_match_data {
>> 	const struct mtk_mmsys_driver_data *drv_data[];
>> 	unsigned short num_drv_data;
>> };
>>
>> ...so that:
>>
>> static int some_function_handling_multi_mmsys(struct mtk_mmsys
>> *mmsys,
>> 					      struct
>> mtk_mmsys_match_data *match)
>> {
>> 	int i;
>>
>> 	i = [ logic to find the right match->drv_data entry here ]
>>
>> 	return i;
>> }
>>
>> static int mtk_mmsys_probe()
>> {
>> 	.... variables, something else ....
>>
>> 	if (match_data->num_drv_data > 1) {
>> 		/* This SoC has multiple mmsys channels */
>> 		ret = some_function_handling_multi_mmsys(mmsys);
>> 		if (ret < 0)
>> 			return ret;
>>
>> 		mmsys->data = match_data->drv_data[ret];
>> 	} else {
>> 		dev_dbg(dev, "Using single mmsys channel\n");
>> 		mmsys->data = match_data->drv_data[0];
>> 	}
>>
>> 	...everything else that mtk_mmsys_probe does ...
>> }
> 
> I've tried this idea in my local environment and it looks good.
> So I'll apply this at the next version. Thanks for your idea!
> 

You're welcome! Looking forward to the next version!

>> What I'm trying to communicate with this is that the currently chosen
>> solution
>> looks a bit fragile and needs to be made robust.
>> In comparison, even if it's not technically right to have two
>> different compatibles
>> for the same hardware (and shall not be done), the former solution,
>> even if wrong,
>> was more robust than this one, imo.
>>
>> Regards,
>> Angelo
> 
> Because we don't have a property to identify the different mmsys
> directly (not using multi-mmsys handle function).
> 
> Although it make the code more complicated and not robust, but I think
> this time it should be implemented for other multi-mmsys SoC in the
> feature.
> 
> 

Yes, and I agree: please keep doing this future-proofing, it's a good thing,
as long as the code keeps being readable and robust!


Cheers,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
