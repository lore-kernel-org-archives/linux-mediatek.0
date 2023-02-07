Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21B2C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDtB/GDC6BRjBqEL1ycw0/4EZaqWVRwa87NN2XJTUCg=; b=34gsePJJlJOvX/ZBObVUt/4d6N
	QaC/la0XkiJ9W+MaLjDhIcWdhXETuXmGBNhTcxWAwrebJIet+pZbMgTg5vaoasWEHCxXRlhTN9snJ
	RUjp6AoaPz5jlOIGV8Xx6z99ZX0vzIhoylcNKLQcPqnFlvajPS8UEKZLqvqpuldsDluoRjFBXhgQ8
	TnkplyZ84HXaWYy6/U+zEFJqHQN2YSJ6cU30avaCWJ6HY0jfEaxfiaWj8KdrfrAgkKOYHERzusI9l
	pae0xHAdKL1IAmtEodwhdjtcIpUNS3uSOQ/N2w+TEmVOphHQrZWWMFguphXgzrTS3cj8woYI6db71
	rAf5YhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJc3-00BJo7-Gy; Tue, 07 Feb 2023 08:46:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJbs-00BJiU-CF; Tue, 07 Feb 2023 08:45:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C62B6602063;
	Tue,  7 Feb 2023 08:45:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675759548;
	bh=bqZiPDggGgpkRR/4QMaq8dEmj6yC7YxNan82FZ1HEg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m0Qt7Y7U4EDGztoWKbo7sR7qBF5kPURAE8Sle8wtvUxDCZJLfQ+4fFZRN5h2Dd8Kb
	 DC7liY2X7Ik+9W+XK3hEcatLlNBAMiHORH66o/zTht6ju0WYhU7SpjLjzxN9IYG/TQ
	 hyq9tbKeXtEUVFmr1d6fF1r+YMR3gv/AA8k3ePuvLeSycWYwEBvxP1vTLzl7wMjwV8
	 82y2tIbdKCZDDYKJRAxAo1gb5D2ywScj/OmU3VOHTROOXeMR2pVp7fnRHh21SQlWKG
	 Jc0bu9fIWcvRFk1H3DeFi3QZXaRV0nF8RRFgq6H2bzKItjORCZWQiMovLiG1IFef9c
	 CPIMVU7mn+Ybw==
Message-ID: <93d95309-84eb-16c6-b64e-b0c43d784900@collabora.com>
Date: Tue, 7 Feb 2023 09:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 05/45] clk: mediatek: mt2712: Migrate topckgen/mcucfg
 to mtk_clk_simple_probe()
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
 <20230206152928.918562-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gg60-4B29V9cYUw7b1OVcZvU+w9qdiiBbt10LJsAJiCA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gg60-4B29V9cYUw7b1OVcZvU+w9qdiiBbt10LJsAJiCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_004552_597726_6B4EA963 
X-CRM114-Status: GOOD (  15.16  )
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

Il 07/02/23 07:15, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Now that the common mtk_clk_simple_{probe,remove}() functions can deal
>> with divider clocks it is possible to migrate more clock drivers to it:
>> in this case, it's about topckgen.
>> While at it, also perform a fast migration for mcucfg.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>> ---
>>   drivers/clk/mediatek/clk-mt2712.c | 127 +++++-------------------------
>>   1 file changed, 21 insertions(+), 106 deletions(-)
>>

..snip..
                      __func__, r);
>> +static const struct mtk_clk_desc topck_desc = {
>> +       .clks = top_clks,
>> +       .num_clks = ARRAY_SIZE(top_clks),
>> +       .fixed_clks = top_fixed_clks,
>> +       .num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
>> +       .factor_clks = top_divs,
>> +       .num_factor_clks = ARRAY_SIZE(top_divs),
>> +       .composite_clks = top_muxes,
>> +       .num_composite_clks = ARRAY_SIZE(top_muxes),
>> +       .divider_clks = top_adj_divs,
>> +       .num_divider_clks = ARRAY_SIZE(top_adj_divs),
>> +       .clk_lock = &mt2712_clk_lock,
> 
> At some point maybe we should look into splitting up the locks to one
> per block, or converting everything to regmap.
> 

I was thinking the same about the locks... but about regmap, that would
actually add up some overhead at every R/W operation and I would really
like to measure that precisely before doing any kind of regmap conversion
for the MediaTek clocks.

Perhaps I'll even find a way to avoid any kind of (even if small) overhead
while doing that sometime in the future, which wouldn't be benefitting only
MediaTek, but also other users like Qualcomm (as they have practically all
clocks on regmap!).

Cheers,
Angelo



