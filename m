Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56904C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SINEy6Ps810DSauiGyuR9Dy3HjzpARltc6RCrXX0nc=; b=ypNTtFACTr/FdpKh1IgSAUCrmq
	VhRFv1d12djY0etFIJN19VW5w+3h3ak+DsnU11o3cBQJUBDSvTcbSndIYcLL17exrOVynJ33GqmuB
	6+2Ye2AtUjlsRizcMu5Ihl0rpo58w73SuPudXHNOFjYhF/HbSmeQiRVweHu/RbCHAByzjXr3QIEjw
	FhWvIRgqq9wYaZkWg610H2YdZm6VwzQ9Yg9lJ7UjA8y0g39lblsmS91ecohLD5ytq9FCIUqrIN2A5
	bNdDFtYiVmHm28Wz8lRyFxmxrJG72aNR4d3HaXmvSQ6H9tiG/hkfOxT8x2FCSAFYHcCDaAemfK4bT
	8iAJr7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK2P-00BPBm-Mi; Tue, 07 Feb 2023 09:13:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK2F-00BP9H-FM; Tue, 07 Feb 2023 09:13:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4D7E660206E;
	Tue,  7 Feb 2023 09:13:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675761185;
	bh=+nHmOUUUbSXdP/e82tgIxtjXu2hnF5Fu3GtIeW8DNpA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n1oQGRjV5IfYBwT2+XXXTYOPFizrDBNGubR0+7h2BlqUpgXf5hq+hHU7u06Bnn2co
	 l2rG53XC2slSEmtZgnM+p9D1ixxmDiQqIKMhusefnri7m8Y+feYi/ZP71kaYeSO33o
	 UtsHC+tIRPgcvcvgGqZNSTEuISkyoVRKOt5e/9hIjmaZfhmS2xiI++nxz9Gs9N50cq
	 2Bm92PXp29sikoTcqmvYC8P1cSCLRfCScDlpLsBc9zRTlvNB5VmOfJogusej+6GVTl
	 brj7SpNCriNYuQZmW6wwU0RWP9F/J008WusbNSuaNro2AhQ7FIM1tYFOuZquU2yuKg
	 cd1h836bXUBMQ==
Message-ID: <6417aaca-f58d-7195-1f88-9bf896e69a90@collabora.com>
Date: Tue, 7 Feb 2023 10:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 08/45] clk: mediatek: mt2712: Move apmixedsys clock
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
 <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EFKxx8-8aD1VeMpPmNsztPJMsirpDc4Nd17ZMi7ED_9Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EFKxx8-8aD1VeMpPmNsztPJMsirpDc4Nd17ZMi7ED_9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_011307_684384_170BFBEF 
X-CRM114-Status: GOOD (  22.92  )
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

Il 07/02/23 07:50, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The only clock driver that does not support mtk_clk_simple_probe() is
>> apmixedsys: in preparation for enabling module build of non-critical
>> mt2712 clocks, move this to its own file.
>> While at it, also fix some indentation issues in the PLLs table.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/Makefile                |   2 +-
>>   drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 152 +++++++++++++++++
>>   drivers/clk/mediatek/clk-mt2712.c            | 164 -------------------
>>   3 files changed, 153 insertions(+), 165 deletions(-)
>>   create mode 100644 drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> 
> `git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
> agrees this is mostly code movement.
> 
>> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
>> index e5d018270ed0..3c7dd19cdddf 100644
>> --- a/drivers/clk/mediatek/Makefile
>> +++ b/drivers/clk/mediatek/Makefile
>> @@ -38,7 +38,7 @@ obj-$(CONFIG_COMMON_CLK_MT2701_HIFSYS) += clk-mt2701-hif.o
>>   obj-$(CONFIG_COMMON_CLK_MT2701_IMGSYS) += clk-mt2701-img.o
>>   obj-$(CONFIG_COMMON_CLK_MT2701_MMSYS) += clk-mt2701-mm.o
>>   obj-$(CONFIG_COMMON_CLK_MT2701_VDECSYS) += clk-mt2701-vdec.o
>> -obj-$(CONFIG_COMMON_CLK_MT2712) += clk-mt2712.o
>> +obj-$(CONFIG_COMMON_CLK_MT2712) += clk-mt2712.o clk-mt2712-apmixedsys.o
>>   obj-$(CONFIG_COMMON_CLK_MT2712_BDPSYS) += clk-mt2712-bdp.o
>>   obj-$(CONFIG_COMMON_CLK_MT2712_IMGSYS) += clk-mt2712-img.o
>>   obj-$(CONFIG_COMMON_CLK_MT2712_JPGDECSYS) += clk-mt2712-jpgdec.o
>> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
>> new file mode 100644
>> index 000000000000..e841be3a02c9
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
>> @@ -0,0 +1,152 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2017 MediaTek Inc.
>> + * Copyright (c) 2023 Collabora Ltd.
>> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> I think the original author still applies, given you are mostly just
> moving the code?
> 

It does indeed, that was a big mistake on my side - my apologies.

> [...]
> 
>> +static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
>> +       { .compatible = "mediatek,mt2712-apmixedsys" },
>> +       { /* sentinel */ }
>> +};
>> +
>> +static struct platform_driver clk_mt2712_apmixed_drv = {
>> +       .probe = clk_mt2712_apmixed_probe,
>> +       .driver = {
>> +               .name = "clk-mt2712",
> 
> I'd change the name as well, but I'm not sure if that constitutes a
> uAPI change.
> 

My intention was to change this name as well, I should've better
re-checked this kind of cosmetics before sending out - I focused too
much on other kinds of re-checking action.

Noted for v2.

Cheers,
Angelo

