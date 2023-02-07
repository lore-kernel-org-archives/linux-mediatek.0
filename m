Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCBDC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reZCN6vxOUAcUsdtlnkK46OHNBVV2DdkDT5EzljO7Iw=; b=aowsO/9DgqAHXh24TjlChEQhtr
	q2M6gP5T6VLHEKaiwu/+6fwgTbJEa7rcd9Cnx4TDWdAU2Gq7LZht3b7zOrufJpx5Xdpw38DL68s6q
	rx2QevX7SvSyAuJF+VAI5ODTMfgbUddP+J+jpZT4kIXyiumbJZ501O97PPxy+q5HmBHrus/bON+vr
	ZY0NKZ7hg3PaSICjadCXhr2MQlrw2BEjvif243lSipgpEx6BYgu1T/0ozExEiEeaJz2Tzrauh4u0i
	KEj4r+jDyrIa7EzHZmR/j50gaOtMokCNP5b+LP3xlWKgVL6psF7BeFFZufqCzz8TuD4jVyvoVeMCa
	Ptn8Pwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJpt-00BLt6-4U; Tue, 07 Feb 2023 09:00:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJpj-00BLpk-0P; Tue, 07 Feb 2023 09:00:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A0860660206C;
	Tue,  7 Feb 2023 09:00:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675760407;
	bh=f0nG3eBmFCxeHuko6fB9k/VrHD/2/5hvPtzYHQjF/mE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EBlKZzWFAbkQVTjKrIdQ9x6AY1pe9kN5uINajGuaobbCgOCWtNToRktnj2XxumZXg
	 ySms93OfBxwnsPGbPr9Vuswn6ecvenRGPynpXsreVy0kU8gM5aisU64pZdlfmmN2yV
	 hdSGEeYM40FMCtxrpsJssbJqwxd4ZDEbScg5ZI599Szw2SM6okBksfmIknOsbG945K
	 bW+HWSmUAipY7ZgHa5FcRSx7dZiIUh/5qP/vyfXIjUt9LafqmFiIzxWn7vCWPn9TyW
	 m1ihU/2iTbUftKp9mHp29SVO5RdxW4aa499K1F6IMKYt4OZyzloAlOKHCi71enwXRJ
	 6TPUwMNLaEDWA==
Message-ID: <b7b35901-59aa-5342-1bd1-5ed591a0469c@collabora.com>
Date: Tue, 7 Feb 2023 10:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 09/45] clk: mediatek: mt2712: Change to use
 module_platform_driver macro
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
 <20230206152928.918562-10-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GfwY2+55UupTUNYVudg3-YDQtkkfhT=M53CJwdqG=ERg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GfwY2+55UupTUNYVudg3-YDQtkkfhT=M53CJwdqG=ERg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_010011_337914_9B9BC329 
X-CRM114-Status: GOOD (  28.93  )
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

Il 07/02/23 07:33, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Now that all of the clocks in clk-mt2712.c are using the common
>> mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
>> to module_platform_driver.
> 
> Instead of splitting the conversion into a module among many patches,
> I'd do it in one go. With one patch we get a working module instead
> of a half-baked one half way through the series.
> 

If you really want I can eventually do that in one go - in any case, the
sense of having this split in multiple commits is:
  - Bisectability: topckgen/mcucfg migration being faulty would point at
                   one commit doing just that, making it easier for whoever
                   is trying to debug that to find what could've gone wrong;
  - Slow changes:  A driver being a platform_driver doesn't mean that it *has*
                   to be compiled as a module: infact, we can use the .remove()
                   callback even with built-in drivers (as you can remove one
                   and re-add it during runtime from sysfs)
  - Signaling completion:
                   Saying "this is complete" in this case is performed in the
                   last patches of the series, where only the Kconfig is being
                   changed to allow the module build for (most)all.

> The subject could say "Convert X driver from builtin to module". And
> instead of "migrate to module_platform_driver", the body could say
> "convert to module by switching to module_platform_driver, and adding
> missing MODULE_* statements". I believe this constitutes one logical
> change. Maybe the accompanying Kconfig change should be included as
> well?
> 

But again, I don't have *really strong* opinions on this, if not preferences
for how I'd like to see the changes getting in: this series brings big changes
that would be done in many more commits if they were scattered in more series.
Another point about having this conversion performed in multiple commits is
showing how it was done and how to replicate it for a different driver...

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt2712.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
>> index c5fd76d1b9df..65c1cbcbd54e 100644
>> --- a/drivers/clk/mediatek/clk-mt2712.c
>> +++ b/drivers/clk/mediatek/clk-mt2712.c
>> @@ -1028,7 +1028,7 @@ static const struct of_device_id of_match_clk_mt2712_simple[] = {
>>          { /* sentinel */ }
>>   };
>>
>> -static struct platform_driver clk_mt2712_simple_drv = {
>> +static struct platform_driver clk_mt2712_drv = {
> 
> Why the name change? If you do change the name, could you also change
> the of match table's name as well to be consistent, and also mention
> the change in the commit log?

It simply looked like being a good idea, as "simple" made sense when we had two
platform_driver in one file, one using simple_probe, one using a custom probe
function.
The latter going away forever means that there's no more distinction to do
between the two, hence my rename here...

Regarding the of_match_table name change... I'm sorry, I genuinely forgot to
change it, my intention was infact to actually be consistent... :-)

> 
> I'd just leave it alone though.

I had to explain my reasoning about all of the above, so I'll just wait for
your opinion again before going for a v2! :-)

Cheers,
Angelo


