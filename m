Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECB1C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOUJnG3QiuhdM2k4LUYMS/81pPGEtKMlKJPGgFwLoVE=; b=xjkzfDcn58tA1RIlyoERr0OhMJ
	JLqe41xYwNkllTtR03mZF46Ufxac+DojGtM8cax8mm791Ze4TvjaB9K/iPuqfxjjyF1LZCkxthsXt
	GMYb8AWXlovn0T2d5CPfcPp5Vm0NVMmOVpgULIV/A5v/XqOSg+DdSx7m7wiC4vNJrXWmtITMzrlCB
	vA1m3ovunt1UWU1qjoBm0agb9fziAPgRphgIZ0yB7T6/BuDumGfxPHzFBkn9tEJ19toVjZ4ccZqXr
	Uu36vt7DmXHNeyIzwcHgrl4FqShp2h+hfiXFPAvY5QhR4tHu+xlUdfHAif0TPhwgvqlQGL3H40cDN
	ArLJE0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU23W-003QQV-CL; Mon, 20 Feb 2023 09:01:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU23H-003QLs-MV; Mon, 20 Feb 2023 09:01:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C5266600872;
	Mon, 20 Feb 2023 09:01:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676883696;
	bh=wRsFQ2JC/MDhBdv1WWKTeDTXi0UHILH+uiTslXRktbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DoA8WQ4Pg5/JafFh2rMOi4m2dKIDVwaIaM2iRRWSOQ7edl76MpAnqTs4zBOL5/2JM
	 9gHlW3TO6Ihgta4vrcb1BnWgnb6agHzu9sbDbhrjRTvAza0fusJr9zQTKKnWFMLgU+
	 9T5DRcCagczrZqyzzlyzXAqxJlPbAcyK7kUIKWpg1Z8LxbugK27+S8hzr4Bf9ZP1Rz
	 mbW2372OqFoXA3cUXtAtNhLxLW/3Vh/iFhbNZFWOgZj7HDq+nw7BdRct+VGzgT5jWq
	 x8vfkV4u9cn2PpnMoOc0iWhJ4UMycJ+J9wlMhn827dNPWzxgsAJOyqkl2DJKSnga2r
	 /0L7KlHOjifuw==
Message-ID: <dd25fddb-5c62-2dc7-6095-861499a5d21d@collabora.com>
Date: Mon, 20 Feb 2023 10:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 36/47] clk: mediatek: mt2712: Change Kconfig options to
 allow module build
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
 <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
 <37690521-4d24-ce55-f81e-30ad931dfe95@collabora.com>
 <CAGXv+5FM_pxu4Ms1mbvpdJLxkOZe2ZXjNoiOCfANpdxLme+_Lg@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FM_pxu4Ms1mbvpdJLxkOZe2ZXjNoiOCfANpdxLme+_Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_010139_920243_EBE63950 
X-CRM114-Status: GOOD (  20.14  )
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

Il 17/02/23 16:19, Chen-Yu Tsai ha scritto:
> On Fri, Feb 17, 2023 at 7:25 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 17/02/23 05:24, Chen-Yu Tsai ha scritto:
>>> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> All of the mt2712 drivers have been converted to platform drivers!
>>>> Change the Kconfig options for all MT2712 clocks to tristate to allow
>>>> building all clock drivers as modules.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/clk/mediatek/Kconfig | 16 ++++++++--------
>>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
>>>> index b9c0a9e21cf1..45b7aea7648d 100644
>>>> --- a/drivers/clk/mediatek/Kconfig
>>>> +++ b/drivers/clk/mediatek/Kconfig
>>>> @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
>>>>             This driver supports MediaTek MT2701 g3dsys clocks.
>>>>
>>>>    config COMMON_CLK_MT2712
>>>> -       bool "Clock driver for MediaTek MT2712"
>>>> +       tristate "Clock driver for MediaTek MT2712"
>>>
>>> Hmm... How does that work out if mt2712-apmixedsys is a
>>> builtin_platform_driver?
>>>
>>> ChenYu
>>
>> That doesn't. Thanks for catching that, I've added a .remove() callback
>> and changed it to module_platform_driver() for v3!
> 
> Actually, I thought that if it were built as a module, then the
> builtin_platform_driver would then expand to a module_init() without
> module_exit(). So it would become a loadable module that cannot be
> unloaded.
> 
> That was just looking at the header files, so I could be mistaken.
> 
> Side note: IIRC a missing .remove() driver callback doesn't actually
> block driver removal or unbinding.
> 

It doesn't, but we'd leak memory because of the kzalloc() that happened
at the beginning of the probe function... so adding the .remove() callback
was pretty much necessary :-)

Thanks,
Angelo

> ChenYu
> 


