Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C453BC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO5AadnWR/mmUAtDkOOpuYWASUI/7oEnCgwfmi8iYf4=; b=2o6vADrL3GF0GkSQCb24d77KKX
	YbeCmVgdtgBPD7A82+E2HdQOeeGWmASAPrxr8Fc01SwhI+OLuZGFNs+rj4ZcrTmoskpkNQCeDgXfv
	jHTrI83qfTSxcRTG9stySJKVmmhulCVWdGsLUd+HtexnGHpP0WkIBK/4kDFo10cVUULksB7+Jgeq+
	jdGp+BCU04j44NQrCSepDOH/o5+fgT64n+vj2gBroS3Oz5B0sN3fL7tAZJWFsBHoKY8tHoNbou8fv
	qbeXf7ULnfnjKY+6fLj+CZwcPkwg+jEjU97FdL3Yg49OrBal3JvqQ61gLXINWJ/svTZxqU++N8g8A
	tNBaTJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK40-00BPbU-2L; Tue, 07 Feb 2023 09:14:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK3n-00BPXq-W9; Tue, 07 Feb 2023 09:14:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 83882660206E;
	Tue,  7 Feb 2023 09:14:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675761282;
	bh=yDG4mGu6jtsVDMEGMmzjAKZKrGPZh4YUhRcgyE1cfUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l/iQw3VkxE+7fb+CxtwD0ebMx+xBjEe9JmfU4bbY8M2ICYZimQdzfpt8npGgyYOW5
	 Z7ey/3yNlPeLflDo53uPzKVtkCdaHeB1DACuUkr3Ozy9WWlpUVWFnSlg4Xn7Z7Qew4
	 UeKEhQrFkUgPNoxmFJ8jL16Av9HBAjeRK6Ncnk7WzAggo4fQjravCuVaqnCcTbChWp
	 vwljaIvv1g+hJwM+GPMEZiJHZJJF7kgTKadvaWIBbUvnqNugO/L6H4NExbXoyL8eKD
	 rkFcnUFksRRF+aXuN3brfPb1bKNR4ZuE4ndS/TjxJVphtiwIlA9pDKJf4uM4+xBUOQ
	 1Qz/Vr1d02ZPw==
Message-ID: <0cf002b1-73ca-29c4-6e6d-5b0a54d356de@collabora.com>
Date: Tue, 7 Feb 2023 10:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 11/45] clk: mediatek: mt8365: Move apmixedsys clock
 driver to its own file
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-12-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EvYq9eJkfvrEt-LEN0ODt-_tQ+wiAK-BjKeSi6VCDzEA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EvYq9eJkfvrEt-LEN0ODt-_tQ+wiAK-BjKeSi6VCDzEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_011444_197584_F4E13063 
X-CRM114-Status: GOOD (  20.67  )
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

Il 07/02/23 08:12, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> In preparation for migrating all other mt8365 clocks to the common
>> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
>> While at it, use the builtin_platform_driver() macro for it.
> 
> `git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
> agrees this is mostly a code move.
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/Makefile                |   2 +-
>>   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 164 +++++++++++++++++++
>>   drivers/clk/mediatek/clk-mt8365.c            | 142 ----------------
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> But see below.
> 
>>   3 files changed, 165 insertions(+), 143 deletions(-)
>>   create mode 100644 drivers/clk/mediatek/clk-mt8365-apmixedsys.c
>>
>> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
>> index 3c7dd19cdddf..b004a47026d4 100644
>> --- a/drivers/clk/mediatek/Makefile
>> +++ b/drivers/clk/mediatek/Makefile
>> @@ -112,7 +112,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
>>                                     clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
>>                                     clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
>>                                     clk-mt8195-apusys_pll.o
>> -obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o
>> +obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o clk-mt8365-apmixedsys.o
>>   obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
>>   obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
>>   obj-$(CONFIG_COMMON_CLK_MT8365_MFG) += clk-mt8365-mfg.o
>> diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
>> new file mode 100644
>> index 000000000000..6f0fdf92bbd2
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
>> @@ -0,0 +1,164 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022 MediaTek Inc.
>> + * Copyright (c) 2023 Collabora Ltd.
>> + */
>> +
>> +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
>> +#include <linux/clk.h>
> 
> like in the MT2712 patch, this could be clk-provider.h .
> Or maybe we should do a pass of header cleanup? There's a bunch left
> over from the conversion from |struct clk| to |structk clk_hw|, and
> then migration to mtk_clk_simple_probe.
> 
> What do you think?
> 

I'm more for a separated pass of header cleanup, honestly...

Cheers,
Angelo


