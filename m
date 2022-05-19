Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F700C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qzaIhIJoIEbNB0NpJ5Dw2acbP6exqQa/i8EiBmJuhc=; b=AoWlUfw1aaVi3t
	wNwzNlcx2i510q6pXNJm3QdJcbnIRoK0iYrlfzXOKNvNnsapHv3ZOzy2/+LbIdBsZTHdIE+i0TXrE
	HV88pBJDMLxma307y35LAmrZmMPpgjSQrIg+x2qt0Xeq6snxTu0qzU2OcvdscERjzQaIp94Y6e39T
	O81yAuM+sGarpxdqRvcFSWgQVaZkkC7iSUzkM9cHo5YGJ5/j4t8m8y7GtWycrK4utoPYbA8q1oumI
	z6E/cDh0VGCBdGW8BOu5mTd7tCp4CCUaokoJgicmn7fHncTSTL7Ma5JfZuKVX7pAKAryPioypCCeu
	Qxuyi0V9IEIF7Y8wLQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbum-005zrU-Eh; Thu, 19 May 2022 08:53:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbuZ-005zm5-24; Thu, 19 May 2022 08:53:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DA2951F4581E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652950413;
 bh=pXYO/JUu84qXpcGnHGzcLC9avotZHwX2ZHKuRJqCO4k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cGDtHUQ3m9zfrkF2XgejG2YVt17eVFnRcUfcbnnohf0M5QxVuIApZ4msi6pYSNmJn
 3ko2Rf/5qw8SBMyJEVfLQ3h7khZGb8lxlmyHeILsD3Cn8wfHW+gSY03EmYnY4kPg++
 gkBvecEzGu/FurE23QHMctNi1Vk8j5yTWNrgHL98dgAZNwhaC5zDtVR2GtXj4rLt0a
 sa9uBsEXO/6dkGTKwRxvlHMvMiQXT9zDl46nJUfLcO0d9HQZaSQuFnPJlnTnIcEGOc
 3eNVytoFR/IUdgNPdo2AtH/WKOj0QoVbXQE+vcqJu9zYzUJVjqNDoY+BkCMj52/Y8T
 XpzpqXUw8PgKg==
Message-ID: <4fccf1ef-5dd2-5159-7f89-7c60fd281197@collabora.com>
Date: Thu, 19 May 2022 10:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 6/7] clk: mediatek: Export required symbols to compile
 clk drivers as module
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Miles Chen <miles.chen@mediatek.com>, bgolaszewski@baylibre.com,
 chun-jie.chen@mediatek.com, ck.hu@mediatek.com, devicetree@vger.kernel.org,
 fparent@baylibre.com, ikjn@chromium.org, jason-jh.lin@mediatek.com,
 kernel@collabora.com, konrad.dybcio@somainline.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de,
 paul.bouchara@somainline.org, phone-devel@vger.kernel.org,
 rex-bc.chen@mediatek.com, robh+dt@kernel.org, sam.shih@mediatek.com,
 sboyd@kernel.org, tinghan.shen@mediatek.com, weiyi.lu@mediatek.com,
 y.oudjana@protonmail.com, ~postmarketos/upstreaming@lists.sr.ht
References: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
 <20220519044153.11078-1-miles.chen@mediatek.com>
 <7e60b63c-2bf7-a77e-fe0f-a891efa77a47@collabora.com>
 <CAGXv+5FiteAu7in-CnmVUkDKy=ub1X6etyK1--PHPYKO3FPa=w@mail.gmail.com>
 <3981552b-2153-1b87-f345-2b1f9be6c56f@collabora.com>
 <CAGXv+5GwqLKvM3yReZMW92ZC3nDwdbD+_x8ROBOjppgnsgGkyw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GwqLKvM3yReZMW92ZC3nDwdbD+_x8ROBOjppgnsgGkyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_015335_418200_A0A6E817 
X-CRM114-Status: GOOD (  25.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/05/22 10:45, Chen-Yu Tsai ha scritto:
> On Thu, May 19, 2022 at 4:26 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 19/05/22 10:15, Chen-Yu Tsai ha scritto:
>>> On Thu, May 19, 2022 at 4:05 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 19/05/22 06:41, Miles Chen ha scritto:
>>>>>
>>>>> Hi Angelo,
>>>>>
>>>>>> In order to compile the clock drivers for various MediaTek SoCs as
>>>>>> modules, it is necessary to export a few functions from the MediaTek
>>>>>> specific clocks (and reset) libraries.
>>>>>>
>>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>> ---
>>>>>> drivers/clk/mediatek/clk-apmixed.c | 1 +
>>>>>> drivers/clk/mediatek/clk-cpumux.c  | 2 ++
>>>>>> drivers/clk/mediatek/clk-mtk.c     | 2 ++
>>>>>> drivers/clk/mediatek/reset.c       | 1 +
>>>>>> 4 files changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
>>>>>> index 6b0ab0a346e8..f126da693a7f 100644
>>>>>> --- a/drivers/clk/mediatek/clk-apmixed.c
>>>>>> +++ b/drivers/clk/mediatek/clk-apmixed.c
>>>>>> @@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
>>>>>>
>>>>>>        return &tx->hw;
>>>>>> }
>>>>>> +EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
>>>>>>
>>>>>> MODULE_LICENSE("GPL");
>>>>>> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
>>>>>> index 2b5d48591738..25618eff6f2a 100644
>>>>>> --- a/drivers/clk/mediatek/clk-cpumux.c
>>>>>> +++ b/drivers/clk/mediatek/clk-cpumux.c
>>>>>> @@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
>>>>>>
>>>>>>        return PTR_ERR(hw);
>>>>>> }
>>>>>> +EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
>>>>>>
>>>>>> void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
>>>>>>                                 struct clk_hw_onecell_data *clk_data)
>>>>>> @@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
>>>>>>                clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
>>>>>>        }
>>>>>> }
>>>>>> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
>>>>>>
>>>>>> MODULE_LICENSE("GPL");
>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>>>>>> index 05a188c62119..41e60a7e8ff9 100644
>>>>>> --- a/drivers/clk/mediatek/clk-mtk.c
>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.c
>>>>>> @@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>>>>>>        mtk_free_clk_data(clk_data);
>>>>>>        return r;
>>>>>> }
>>>>>> +EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
>>>>>>
>>>>>> int mtk_clk_simple_remove(struct platform_device *pdev)
>>>>>> {
>>>>>> @@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
>>>>>>
>>>>>>        return 0;
>>>>>> }
>>>>>> +EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
>>>>>
>>>>> Thanks, I need this too. I am preparing a patch to use mtk_clk_simple_remove/mtk_clk_simple_probe
>>>>> for MT6779 clks first and maybe I can apply this to all MediaTek clk drivers.
>>>>>
>>>>> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
>>>>
>>>> Hello Miles,
>>>>
>>>> thanks for telling me, because my next step would have been exactly what
>>>> you're doing, for all MediaTek clk drivers... otherwise we'd be doing
>>>> redundant work going afterwards.
>>>
>>> Should we consider using symbol namespaces (EXPORT_SYMBOL_NS)?
>>>
>>
>> I don't think we should... I don't know if any module in the common clock
>> framework is doing that, but if we want some symbol namespace separation,
>> we would want that "at least" on the entire MediaTek framework, right? :-)
> 
> The sunxi-ng clk driver recently started doing this. See:
> 
>      http://git.kernel.org/torvalds/c/551b62b1e4cb64d3b42da0fbfdcd26a5fcd684be

That's good. And...that's one of the examples for which using "a trick" is
shorter and enhances maintainability!

> 
> And it's being done for all kinds of common driver libraries.
> 
> I agree that it would be done for the entire MediaTek framework.
> 
>> In that case, we can simply keep using EXPORT_SYMBOL_GPL() and change the
>> Makefile in this directory to add:
>>
>>          ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=COMMON_CLK_MEDIATEK
> 
> Oh, I didn't know of this trick. Nice. :D
> 
> I think we still need to add MODULE_IMPORT_NS() statements, right?
> 

I haven't experimented with the IMPORT, but I believe if that's relative to
files in the same Makefile, we won't need to add that... let's make some
experiments :-)

>> ...but that's surely out of scope for this specific patch series.
>>
>> What do you think?
> 
> It's definitely out of scope, but nice to have, to reduce the size of the
> default symbol table, and limit the usage of the symbols the driver exports.
> 

Agreed.

> Regards
> ChenYu




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
