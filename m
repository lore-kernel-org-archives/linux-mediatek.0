Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A54C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFcuWu+a/0jQAq13Z8shQrsHb9dMGb1Gt76WHS2404k=; b=GMI86SndNLbAGA++qrpVUkVtk1
	4jG+eqUp+G9BebuBtzUyLrs9PW4RQklVkqf07895zxAxcQ204NF3KavZO0w58M0TSq2LsflXMr3jH
	QortVuDy2ub1UN6xU1DOYQO2ZDWP1mstsmilDAMu6G0/XfxeRlcYVO+9JqaQmAH1eUXDAdZjfhN3m
	6f900k+nlFLxXSxftq/sdEXhItxbvkTL8rRh+Hy28bJ5Br1z166znDkJWy1a4ebMkDxktcVg4k1aB
	0OvtLLgaGEZ01wj1/7/Q4Rm1MXd0dOACvTejnqiezNezn9Bfr89qxH6IPZhQe8klzPc0mfmx0JftH
	CEOPG0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyvx-00Dwxx-Ig; Fri, 17 Feb 2023 11:29:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyvg-00DwsB-TC; Fri, 17 Feb 2023 11:29:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E457A660212C;
	Fri, 17 Feb 2023 11:29:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676633367;
	bh=8erMMp/b3F39tRE2R/nCGBBfR4DFmaNqkX8xwNyUHvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ad/BDNeLml9CtjYisoMhW31GApcs5Se7olS8xAvVAbfNdCx3xOjcsd3yKKGxAj3uH
	 +o37+8T2w6NHR7gCrRvK8l0XYX1s3JLL4rYsV6+86XXuFOg+Y48zPc4T3xcIBlWZHt
	 YcZwM81Gk41I5BOX54P3RBZcF92B7Bqbt8Egrqu7IYnmSXzl2t4PZMxpjkYOF/4Yeq
	 hqV3gz6IzBgVTh95pmd/P65bJrmTch+LFdDv3crW13kPBLVh74udPPQ1jsz4rIhFge
	 wHALU9fOsWUFXPynqCu4GjMVgM3vcbMsGOXZjLx8H8pFe4/cn0z51D1l+aFOyf9jHz
	 Kqb6cy7IbRs2Q==
Message-ID: <c9bd53f9-7d5a-6e2d-4062-297158661422@collabora.com>
Date: Fri, 17 Feb 2023 12:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 37/47] clk: mediatek: Split MT8195 clock drivers and
 allow module build
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H7=rOwVK2SapqyeKHKnRJMwXFf1OSD-qhgjkbkoR=Zmw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5H7=rOwVK2SapqyeKHKnRJMwXFf1OSD-qhgjkbkoR=Zmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_032929_119105_1089B650 
X-CRM114-Status: GOOD (  21.10  )
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

Il 17/02/23 05:31, Chen-Yu Tsai ha scritto:
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
>> option: there's no reason to do that, as it is totally unnecessary to
>> build in all or none of them.
>>
>> Split them out: keep boot-critical clocks as bool and allow choosing
>> non critical clocks as tristate.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/Kconfig  | 86 +++++++++++++++++++++++++++++++++++
>>   drivers/clk/mediatek/Makefile | 20 +++++---
>>   2 files changed, 99 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
>> index 45b7aea7648d..88937d111e98 100644
>> --- a/drivers/clk/mediatek/Kconfig
>> +++ b/drivers/clk/mediatek/Kconfig
>> @@ -692,6 +692,92 @@ config COMMON_CLK_MT8195
>>           help
>>             This driver supports MediaTek MT8195 clocks.
>>
>> +config COMMON_CLK_MT8195_APUSYS
>> +       tristate "Clock driver for MediaTek MT8195 apusys"
>> +       depends on COMMON_CLK_MT8195
> 
> Would something like
> 
>            default COMMON_CLK_MT8195
> 
> help with the transition?
> 
> Otherwise we'd need to add a whole lot more stuff to arm64's defconfig,
> and anyone running `make olddefconfig` would have many of their clock
> drivers no longer available.
> 
> Same applies to the MT8186 split.
> 
> Seems like not all MediaTek SoCs apply this pattern, but at least MT7986,
> MT8167, MT8173, MT8183 do this.
> 
> ChenYu

Right. Since MT8195 machines have been out in the wild for a bit of time now,
I think it's worth following your advice and add `default COMMON_CLK_MT8195`
to the new configuration options.

As for MT8186, currently, there's only one board supported upstream, which
is the "unobtainable" EVB so I would rather not do that for MT8186, unless
you have any strong opinions on that.

Regards,
Angelo

