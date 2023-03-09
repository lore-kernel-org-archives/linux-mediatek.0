Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC07EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psX2Kl9N0nkGxZU5txR5SzAm+jatIaIM8bmLNX2QD0U=; b=ZXHhINmJshMIHMmolBiiqDGvoY
	cYsrJxaJF10kC4v3N9w6NuA/9C2GGZGmH5aMtxBnjTaxGnUdt6XaJZgFeZ2eY38UGw7t1d7/PePt3
	iyObdQAFJF/E2y0kkG8PaO++FoD2cAeSt8zBzg+CTc3q6Mhh+gLXp2i+8Epq7vfldpMopxPen6ls+
	js7VrM+csVlyr1h/5zNsHU77erQ2vWXJebaWPETHqs91hOsDeWWLgZhS+1WrlpLH9xy7ZdkAhOZco
	zCDbB07IX0zuitiYiJPhad4CNCOngWT6oahMifFo35Bnn07TNhT2lVoWCFy8VzSxM2KsFkpyC7IDF
	UwJBKCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paACI-008AZS-62; Thu, 09 Mar 2023 06:56:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paACD-008AXy-05; Thu, 09 Mar 2023 06:56:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id f18so1042813lfa.3;
        Wed, 08 Mar 2023 22:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678344970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psX2Kl9N0nkGxZU5txR5SzAm+jatIaIM8bmLNX2QD0U=;
        b=bIZ+WlW5/obmlMjDv3V6TEooL709jm9SJcRnOUjBOC4K5c9PeWZSuin/LLZjq54D5T
         wt4F6LIpGPf59PxgoJMemlUnFdRFlzXlgl+wSpqDhh7A+Mjqe7YEBUsXhplsJyOMC3/5
         1AjsR1X5x7J8bGnfNzfMC9rdrquNr5HhkEU753gawWh+RwohCCRJd3fk72MKq3sbrn5n
         0kojqphG234D3KDsCD4EQkfBbefqNXhNDOUhCek8sflcv45abOyOyGOhQqAtoF0Ogd4k
         8VW3DJlzKGZqq44dblxAo02/Hp8Sl6sgKvThnvJXIL/4IN7XF++t9PXqycKyH98STasW
         RXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678344970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psX2Kl9N0nkGxZU5txR5SzAm+jatIaIM8bmLNX2QD0U=;
        b=qgbaHDjj1iH8pGmBpbrXcGfXMbidDA/4YexdSQ+tcnJX55bQJqM4dUZ2oNOBpf14O8
         sErznswhUye1pWYpZyjzLFCXvqs/iAASpKEl6Hty+n5g/pasQ6IiKBbG713gVnCJ5ryi
         wNdX0AdOeKMZMOe1kANLVnTD3219DXZlnf4fBS5/fmYbIILhCuXbU4ub4c1HbCh7Djk1
         +KJkQ8Py7/TaR/xunWKxlrQ7UzKFH+Ac6Jv95OCiAODSPRg4/RiU5+9x4MOt90qV8nNu
         quC6+dgkJVGZA55omGzSagSmInEedm9Iaf6e1SXf+ieP+cWRMxlRu9+3sibUSy7aMKyp
         8DRw==
X-Gm-Message-State: AO0yUKW9o8GoEg9hGnu+nMd0JsCDjiCde/sFu6gf/5x5YEF3XP+ra0E4
	oH5ewDP+p0fAqOBNHqdaFJM=
X-Google-Smtp-Source: AK7set/1DASv6OgvWXWuj4ETN403kCbuKcvZ6CSfypbSgTKmVi+9rh0TXtBlOZRSUCf7NSlLDgA6Uw==
X-Received: by 2002:ac2:5dd9:0:b0:4cd:7fe0:24 with SMTP id x25-20020ac25dd9000000b004cd7fe00024mr5000383lfq.27.1678344969717;
        Wed, 08 Mar 2023 22:56:09 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm2065557lfb.186.2023.03.08.22.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:56:09 -0800 (PST)
Message-ID: <930f3549-440d-adac-ae9d-1aa6ef07c44b@gmail.com>
Date: Thu, 9 Mar 2023 07:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed
 cells
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org
References: <20230224072903.20945-1-zajec5@gmail.com>
 <20230308173256.3837b87b@xps-13>
 <91ff425b4c901648b1faf34c784f20ad@milecki.pl>
 <20230308190636.7fabab9c@xps-13>
 <5974d28426057975e701c4a8454b5a13@milecki.pl>
 <20230308193121.7f5b3d02@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230308193121.7f5b3d02@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_225613_093461_343C4FAF 
X-CRM114-Status: GOOD (  29.92  )
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

On 8.03.2023 19:31, Miquel Raynal wrote:
> Hi Rafał,
> 
> rafal@milecki.pl wrote on Wed, 08 Mar 2023 19:12:32 +0100:
> 
>> On 2023-03-08 19:06, Miquel Raynal wrote:
>>> Hi Rafał,
>>>
>>> rafal@milecki.pl wrote on Wed, 08 Mar 2023 17:55:46 +0100:
>>>    
>>>> On 2023-03-08 17:34, Miquel Raynal wrote:
>>>>> Hi Rafał,
>>>>>
>>>>> zajec5@gmail.com wrote on Fri, 24 Feb 2023 08:29:03 +0100:
>>>>>   
>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>> NVMEM subsystem looks for fixed NVMEM cells (specified in DT) by
>>>>>> default. This behaviour made sense in early days before adding support
>>>>>> for dynamic cells.
>>>>>>>> With every new supported NVMEM device with dynamic cells current
>>>>>> behaviour becomes non-optimal. It results in unneeded iterating over >> DT
>>>>>> nodes and may result in false discovery of cells (depending on used DT
>>>>>> properties).
>>>>>>>> This behaviour has actually caused a problem already with the MTD
>>>>>> subsystem. MTD subpartitions were incorrectly treated as NVMEM cells.
>>>>>
>>>>> That's true, but I expect this to be really MTD specific.
>>>>>
>>>>> A concrete proposal below.
>>>>>   
>>>>>> Also with upcoming support for NVMEM layouts no new binding or driver
>>>>>> should support fixed cells defined in device node.
>>>>>
>>>>> I'm not sure I agree with this statement. We are not preventing new
>>>>> binding/driver to use fixed cells, or...? We offer a new way to expose
>>>>> nvmem cells with another way than "fixed-offset" and "fixed-size" OF
>>>>> nodes.
>>>>>>   From what I understood all new NVMEM bindings should have cells >> defined
>>>> in the nvmem-layout { } node. That's what I mean by saying they should
>>>> not be defined in device node (but its "nvmem-layout" instead).
>>>
>>> Layouts are just another possibility, either you user the nvmem-cells
>>> compatible and produce nvmem cells with fixed OF nodes, or you use the
>>> nvmem-layout container. I don't think all new bindings should have
>>> cells in layouts. It depends if the content is static or not.
>>>    
>>>>>> Solve this by modifying drivers for bindings that support specifying
>>>>>> fixed NVMEM cells in DT. Make them explicitly tell NVMEM subsystem to
>>>>>> read cells from DT.
>>>>>>>> It wasn't clear (to me) if rtc and w1 code actually uses fixed cells. >> I
>>>>>> enabled them to don't risk any breakage.
>>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>> [for drivers/nvmem/meson-{efuse,mx-efuse}.c]
>>>>>> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>>>> ---
>>>>>> V2: Fix stm32-romem.c typo breaking its compilation
>>>>>>      Pick Martin's Acked-by
>>>>>>      Add paragraph about layouts deprecating use_fixed_of_cells
>>>>>> ---
>>>>>>   drivers/mtd/mtdcore.c          | 2 ++
>>>>>>   drivers/nvmem/apple-efuses.c   | 1 +
>>>>>>   drivers/nvmem/core.c           | 8 +++++---
>>>>>>   drivers/nvmem/imx-ocotp-scu.c  | 1 +
>>>>>>   drivers/nvmem/imx-ocotp.c      | 1 +
>>>>>>   drivers/nvmem/meson-efuse.c    | 1 +
>>>>>>   drivers/nvmem/meson-mx-efuse.c | 1 +
>>>>>>   drivers/nvmem/microchip-otpc.c | 1 +
>>>>>>   drivers/nvmem/mtk-efuse.c      | 1 +
>>>>>>   drivers/nvmem/qcom-spmi-sdam.c | 1 +
>>>>>>   drivers/nvmem/qfprom.c         | 1 +
>>>>>>   drivers/nvmem/rave-sp-eeprom.c | 1 +
>>>>>>   drivers/nvmem/rockchip-efuse.c | 1 +
>>>>>>   drivers/nvmem/sc27xx-efuse.c   | 1 +
>>>>>>   drivers/nvmem/sprd-efuse.c     | 1 +
>>>>>>   drivers/nvmem/stm32-romem.c    | 1 +
>>>>>>   drivers/nvmem/sunplus-ocotp.c  | 1 +
>>>>>>   drivers/nvmem/sunxi_sid.c      | 1 +
>>>>>>   drivers/nvmem/uniphier-efuse.c | 1 +
>>>>>>   drivers/nvmem/zynqmp_nvmem.c   | 1 +
>>>>>>   drivers/rtc/nvmem.c            | 1 +
>>>>>>   drivers/w1/slaves/w1_ds250x.c  | 1 +
>>>>>>   include/linux/nvmem-provider.h | 2 ++
>>>>>>   23 files changed, 29 insertions(+), 3 deletions(-)
>>>>>>>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>>>>>> index 0feacb9fbdac..1bb479c0f758 100644
>>>>>> --- a/drivers/mtd/mtdcore.c
>>>>>> +++ b/drivers/mtd/mtdcore.c
>>>>>> @@ -523,6 +523,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>>>>>   	config.dev = &mtd->dev;
>>>>>>   	config.name = dev_name(&mtd->dev);
>>>>>>   	config.owner = THIS_MODULE;
>>>>>> +	config.use_fixed_of_cells = of_device_is_compatible(node, >> "nvmem-cells");
>>>>>
>>>>> I am wondering how mtd specific this is? For me all OF nodes containing
>>>>> the nvmem-cells compatible should be treated as cells providers and
>>>>> populate nvmem cells as for each children.
>>>>>
>>>>> Why don't we just check for this compatible to be present? in
>>>>> nvmem_add_cells_from_of() ? And if not we just skip the operation.
>>>>>
>>>>> This way we still follow the bindings (even though using nvmem-cells in
>>>>> the compatible property to require cells population was a mistake in
>>>>> the first place, as discussed in the devlink thread recently) but there
>>>>> is no need for a per-driver config option?
>>>>>> This isn't mtd specific. Please check this patch for all occurrences >> of
>>>> the:
>>>> use_fixed_of_cells = true
>>>>>> The very first one: drivers/nvmem/apple-efuses.c driver for the
>>>> "apple,efuses" binding. That binding supports fixed OF cells, see:
>>>> Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
>>>
>>> I'm saying: based on what has been enforced so far, I would expect all
>>> fixed cell providers to come with nvmem-cells as compatible, no?
>>>
>>> If that's the case we could use that as a common denominator?
>>
>> Sorry, I don't get it. Have you checked
>> Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
>> ?
>>
>> It's a NVMEM provied binding with fixed cells that doesn't use
>> nvmem-cells as compatible. There are many more.
> 
> Oh yeah you're right, I'm mixing things. Well I guess you're right
> then, it's such a mess, we have to tell the core the parsing method.
> 
> So maybe another question: do we have other situations than mtd which
> sometimes expect the nvmem core to parse the OF nodes to populate cells,
> and sometimes not?

I'm not aware of that. Please also check my patch. The only case I set
"use_fixed_of_cells" conditionally is mtd code. In other cases it's
hardcoded to "true".


> Also, what about "of_children_are_cells" ? Because actually in most
> cases it's a "fixed of cell", so I don't find the current naming
> descriptive enough for something so touchy.

That would be just incorrect because this new config property
("use_fixed_of_cells") is only about FIXED cells.

There are cases of OF children being cells but NOT being fixed cells.
They should NOT be parsed by the nvmem_add_cells_from_of().

Example:
a607a850ba1f ("dt-bindings: nvmem: u-boot,env: add basic NVMEM cells")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a607a850ba1fa966cbb035544c1588e24a6307df

So that would result in U-Boot env:
1. Having OF children nodes being cells
2. Setting "of_children_are_cells" to false (counter-intuitive) to avoid nvmem_add_cells_from_of()

