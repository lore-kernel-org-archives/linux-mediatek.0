Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vswKS2kVm4Ja3JJFKlq+7x8cT6rwQvJVREWt162HFv4=; b=AjChCKnFKMVkTY
	RFjU8gJGSiLa5JV4U2rJ/KSiZEb1Ki9ChVa8w47tkfgr9lno+TVJzxogXly+thpoACzjLrwSdfP4D
	o4qWUbPfnM0sCDaFaGYYJ1KkKRscGqqbOxgWQMeUe4jnOj2nd6OiCcTY+l40EtinXgiYGMaBl3fEC
	zaAZK/d3Pxwj0YCzzkkNLbvntqg+vdZm5zzOJIvxm4HRA5gHwSCJ5UTAfMCdmObY6MXSIKKAAAgUD
	PwcwjjebkKn521A53sJJn2d9CA555YOMUfP90y9ASpK73m3/WPONn9fLrHQyNAeQlZ0kpi2eqHNhr
	zXNT/pebHdCDKJbOWuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqXdB-0071t7-3J; Mon, 16 May 2022 10:07:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqXcz-0071qp-OF; Mon, 16 May 2022 10:07:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 58EF61F42B2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652695620;
 bh=f6jwulb2NLULA/5oaTqgRp/7nSTOiexmXap/G6mpgmQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K3sXLj7fAWivUuYK3E1gThr/SRZt6RsQxqFySXNUH9sG3uZ73T3VYxUpGWDlTLHgG
 dTR4g96sT+ayvxJVZalEkVc5f+s2mQrd+R7OQ3f2r4YPE9u4pFV+f3ipZTQx+0FTkD
 dywnvP7JfxbKkFL/vgoK7NzkSRvHwhcQPCR4T0tTrrnbEmzzB7RrBcJn3d1GoDr//c
 Dt32cFurWFMVJNN3/cXqLBMLhJ6zP/MVIBAUex9o+5q7ttnJijAroA/7QdvdOZwici
 Q7foSG414T8SIjIMG81oDq9cxwcFyCu2d+vtCFxpxy//dcvaqvzdEVXAQMHMLkmvt/
 7pBs8xU9fUqdA==
Message-ID: <1c0b5dfc-4eb0-aa9d-cf38-657124022ed5@collabora.com>
Date: Mon, 16 May 2022 12:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
Content-Language: en-US
To: CK Hu <ck.hu@mediatek.com>, matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com
References: <20220513170350.502501-1-angelogioacchino.delregno@collabora.com>
 <7c996c665a57fdd9ba8d6df4dc085f70afc1b933.camel@mediatek.com>
 <a7afc559-4e0a-6552-190c-19e58851ce68@collabora.com>
 <4b5d6607b90f3e36fce7e61e1768da55693546aa.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4b5d6607b90f3e36fce7e61e1768da55693546aa.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_030701_971668_8BF4B5D7 
X-CRM114-Status: GOOD (  21.64  )
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

Il 16/05/22 11:50, CK Hu ha scritto:
> On Mon, 2022-05-16 at 10:44 +0200, AngeloGioacchino Del Regno wrote:
>> Il 16/05/22 07:43, CK Hu ha scritto:
>>> Hi, Angelo:
>>>
>>> On Fri, 2022-05-13 at 19:03 +0200, AngeloGioacchino Del Regno
>>> wrote:
>>>> Add MM support for the MT6795 SoC, using the mmsys default
>>>> routing
>>>> table.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <
>>>> angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>
>>>> In order for this patch to have any meaning and functionality, it
>>>> is
>>>> required to also have in-tree the [1] MT6795 clocks series, even
>>>> though that's not required to actually compile this code.
>>>>
>>>> [1]
>>>>
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=641493__;!!CTRNKA9wMg0ARbw!ywDb_Gj4oV0iYHK_PbtJSNejzsJGlFVjX-1O0G1mR0vZX_5VeMtlZJ_AS6K_Mg$
>>>>    
>>>>
>>>>    drivers/soc/mediatek/mtk-mmsys.c | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>>> index 06d8e83a2cb5..38b36b881a3b 100644
>>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>>> @@ -57,6 +57,13 @@ static const struct mtk_mmsys_match_data
>>>> mt6779_mmsys_match_data = {
>>>>    	},
>>>>    };
>>>>    
>>>> +static const struct mtk_mmsys_driver_data
>>>> mt6795_mmsys_driver_data =
>>>> {
>>>> +	.clk_driver = "clk-mt6795-mm",
>>>> +	.routes = mmsys_default_routing_table,
>>>
>>> mt6795 should have its own routing table instead of default one.
>>> The
>>> default one is used for mt8173, mt2701, mt2712 which no one knows
>>> how
>>> to separate them. If you don't know the routing table of mt6795,
>>> just
>>> left this as NULL.
>>>
>>
>> Hello CK,
>>
>> I agree with you, in fact the first test that I've done was with
>> leaving
>> routes to NULL, but that did not work (I couldn't get the display to
>> work),
>> while assigning the default routing table resulted in having a
>> working
>> internal (DSI) display et al, which is why I have done that.
>>
>> I am sure that this may be a quirk that is required due to my
>> platform's
>> bootloader, but still, it won't work otherwise.
>>
>> If anyone from MediaTek wants to help with providing a better
>> solution for
>> that, you're welcome to - but otherwise, my proposal is to configure
>> MT6795
>> with that default routing table and eventually come back to this
>> later if
>> any issue with this gets discovered... I couldn't find any, though.
> 
> So you have a drm driver which support mt6795 and it would call
> mtk_mmsys_ddp_connect() to setup routing routing register. You could
> generate mt6795 routing table from default one by partial element that
> you use in mt6795. I think this table would be smaller than the default
> one.
> 

Okay, that makes a lot of sense: I'll try following this advice.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
