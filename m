Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC175C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYNBF21VsZvpzJv1DCwA4qFXSwjkXhpJtdzwqO4h/Kg=; b=hljFyPjfvaT9tIcTQ4NsQK7SOy
	0MNk/yAKuR/8ZajOGXmeivH1HDcgSjnmbWXUaeMudRO9um8DL+yoLIn9F/nL+2B6Xu3vIC3lcxICH
	hj+tydMhRIM9Ttp4+Sr1AOzRfrzPE5g+c4cDwwEdN3CCuoRuDxod9/+nbEYdH93L1xgDiQgV/FLBK
	TFWZNl8fxczzcHsarlPkc7Xw5wLoKrwkoyo8LBAMJw16nrFQ1PxR8pgRlOY3y9xKVLhJovACHyGBS
	580+kfD6CKuV8QtI5O6V/+lk+dQtXgK2uJpySrW1ngdYVxnBAaXQQGAkfLImwE9LthOe+kG4QZeKp
	70FLpKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fD6-003OOc-1l;
	Wed, 08 Nov 2023 09:50:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fD3-003ONY-0G
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 09:50:55 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EAF066074E8;
	Wed,  8 Nov 2023 09:50:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699437039;
	bh=hV5PrSazCSEWT+JbX/dnI2J9mY7nwlBwRZXNosSL/PI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jnXPZrtjdm9/qZM/zkaE9rJtTlc3TW3SfSBjmSi+zzFFX5RvffC5dGthWohyvCEpU
	 +1d9m+5996wfW4lLMsosUck3OvkW17BQy2vaXsnFQzxyJcQtvusf7Sz5qTHszsKRh8
	 CNE4c+iOzORsE7mWc0bxlAm2XtpzG4kyC/qhtKJkcnxpSr03Nczb+Lat9aPQOP5LkQ
	 h7F1EGofj5+YGyvlpXKrN0kg1jWRUs9+r7+2cIE1JuHUMGh7y17M2fhtIzZCeU91dU
	 PglUr5VmmU6Bwla1BO/lUgHufsej7creIN48uDNlM4uwUhooPIWqk5Ot94cHliiWM5
	 8FDQYyzMsFK4Q==
Message-ID: <5f3e6b13-6ab3-4952-89ec-e567c6a6526f@collabora.com>
Date: Wed, 8 Nov 2023 10:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Limit RT5682s to
 only supports dual channels
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>,
 "zhourui@huaqin.corp-partner.google.com"
 <zhourui@huaqin.corp-partner.google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "perex@perex.cz" <perex@perex.cz>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
 <20231108012617.3973539-4-zhourui@huaqin.corp-partner.google.com>
 <35837139c1aca2408f64b87c4eb13862e002c089.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <35837139c1aca2408f64b87c4eb13862e002c089.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_015053_262387_CB3CB038 
X-CRM114-Status: GOOD (  16.17  )
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

Il 08/11/23 06:12, Trevor Wu (吳文良) ha scritto:
> On Wed, 2023-11-08 at 09:26 +0800, Rui Zhou wrote:
>>   Limit RT5682s to only support dual channels, not four channels.
> 
> Hi Rui,
> 
> The title is still confusing, maybe update the title based on Angelo's
> suggestion in v1[1]?
> In addition, please modify the commit description to mention support
> for stereo MAX98390 specifically for the mt8188-rt5682s board. Now, it
> reads like you are adding the dual RT5682s support.
> 
> [1]https://patchwork.kernel.org/comment/25584066/
> 

Actually, there's another alternative, if you like it more:

ASoC: mediatek: mt8188-mt6359: Limit mt8188_rt5682s from quad to dual amp

Cheers,
Angelo

> Thanks,
> Trevor
> 
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
>> ---
>>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> index e994faa3556b..917640939621 100644
>> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> @@ -1549,7 +1549,7 @@ static struct mt8188_card_data
>> mt8188_nau8825_card = {
>>   
>>   static struct mt8188_card_data mt8188_rt5682s_card = {
>>   	.name = "mt8188_rt5682s",
>> -	.quirk = RT5682S_HS_PRESENT,
>> +	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
>>   };
>>   
>>   static struct mt8188_card_data mt8188_es8326_card = {
>> -- 
>> 2.25.1
>>


