Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A7EC54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfsUOBcob2tEgcJPiw6Z2RCipcOVQ3xWyPbs+sKdh+Y=; b=elfCXYF0epXAWixtxHDNBTV2Gv
	M2vrPC01BOG5A6SdzyA9uX3vow5ndJgldgVN+7giywdvmCkNjn9QAm8yYcDqxi67ZwmiwT9cN1taV
	yZFAAuE0foS9fX9j2tBOL24grh2YMYUneWcDZD6UG443NaAY3rTviiOE5nSzy1zNeKrqMYmhD5UHk
	D/x8T+mZ2CS6KtpfBdFC/Q8O45wQPiSbDKeyxf7OS33CR5ztxMYyxp4+FkqmRQZ1vH6CoB38TiQKL
	EVCriwfhwgt3PmBHPPITADjy1/Xd/sWKC4Kqynt0Lzl4KvZeUFRIXio0fstEN7hipAEG9ZfkB0wIf
	o5emwhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWoT-00GR5T-7w; Wed, 28 Sep 2022 13:09:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWoD-00GR1D-Jn; Wed, 28 Sep 2022 13:09:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F250C6602292;
	Wed, 28 Sep 2022 14:09:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664370544;
	bh=Vf5x3tIxF1eH3jjuAIiQnki4BcokgilYkSxBESVxK/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kT6WY2mznangZxCUy/BmfaTldXwdJgzvbVFsk9ylrGn9e4Gh96hhrrvCnbqvU5rVs
	 oEMJsW7WhWyeNogyyqSpMaX1czDdmmLimDgmnPThszm8rXEpGKBYEUQdH5QdO6E/6G
	 Y1xUk4/tDYpPxShkVQH0jVShB2O6j08d42mkpPazOCaDCe23grG2q5XTv+znFBpq7p
	 M2YNsc04BZePUE4ywDfhEGH6WZEiGfYEhlvtNjh2rXz3hNdUWdJCnc8K0WdJpeBDK5
	 4IY4lWnmzpaVgpBQ16mYqDFJQy5l8H5XqetGhEIY30PcLNAqPScTgojv4eAfQvStKd
	 d25y2Gl2ezH8Q==
Message-ID: <eae3cb46-d665-a8c9-f0f6-505680470e50@collabora.com>
Date: Wed, 28 Sep 2022 15:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-16-4844816c9808@baylibre.com>
 <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
 <CABnWg9sSbtXYLpcCoEts73CAsciKMEeMMRwfcfGng8H-rGYvkA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABnWg9sSbtXYLpcCoEts73CAsciKMEeMMRwfcfGng8H-rGYvkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_060905_814895_06F10505 
X-CRM114-Status: GOOD (  18.38  )
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

Il 27/09/22 15:34, Guillaume Ranquet ha scritto:
> On Tue, 20 Sep 2022 14:22, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>>> Add the DPI1 hdmi path support in mtk dpi driver
>>>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> index 630a4e301ef6..91212b7610e8 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> @@ -15,7 +15,10 @@
>>>    #include <linux/of_graph.h>
>>>    #include <linux/pinctrl/consumer.h>
>>>    #include <linux/platform_device.h>
>>> +#include <linux/reset.h>
>>>    #include <linux/types.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/mfd/syscon.h>
>>>
>>>    #include <video/videomode.h>
>>>
>>> @@ -66,10 +69,14 @@ struct mtk_dpi {
>>>    	struct drm_bridge *next_bridge;
>>>    	struct drm_connector *connector;
>>>    	void __iomem *regs;
>>> +	struct reset_control *reset_ctl;
>>>    	struct device *dev;
>>>    	struct clk *engine_clk;
>>> +	struct clk *dpi_ck_cg;
>>>    	struct clk *pixel_clk;
>>> +	struct clk *dpi_sel_clk;
>>>    	struct clk *tvd_clk;
>>> +	struct clk *hdmi_cg;
>>
>>
>> You're adding new clocks and then you're making *all clocks*, including the
>> already existing ones... optional.
>>
>> That looks seriously odd.... can you please give a devicetree example for
>> MT8195 in the next version, perhaps in the cover letter?
>>
>> Would also make it easier to test this entire big series.
>>
>> Regards,
>> Angelo
>>
> 
> The clock names are different for MT8195 HDMI than for the legacy DP.
> Making everything optional might not have been a smart move.
> I'll try to think of something else to make it look less odd.
> 
> The device tree I'm using to test things is rather "hackish" and has a bunch of
> changes from what is found on linux-next.
> I think Jason and Nancy are due to upstream those patches.
> 
> I'll try to include something minimal for you to test.
> Otherwise would a public branch containing everything work for you?
> 

Any reference would work for me, "something minimal" or a public branch, it
doesn't really matter.

Thanks!
Angelo



