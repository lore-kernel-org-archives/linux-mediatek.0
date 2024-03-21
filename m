Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB0CD11DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n85TXQ92r7jEONILJlwIkYmCX56BFSHoY2YdI6x3ao4=; b=nZFekry3e+4q1moe1HQsKVQXGo
	3B3KcH+fTgtbL+cXM6fA5+TVFcKRx0Iu3tJt+iOIVEcv9OWFCOgCcvhgHWau7l7s7dXv7WZmqlR4L
	HXtez86NgAkvzQB2XZR/e5EFqHSpmLEyB+C9Tz9I/VvvKjYxU2SntCmFoGoTvtCS/ipWemiaiZ8Dz
	iyQzKyOCeSDRPvdbBalrkKZHVO166HodZ4nIi+EskQg0fvjDstE1lGCQjZUf5XqEf/uFWxVublOwW
	u0nTY9NX8tqnxIVrFSCHZuQgACh9S5HBDiMpXa0jXUY8tTI1dkq1zqkJXAPZ7wD7O7h1xIk5+g5rj
	N2jWvDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnDrG-00000002KXy-2kxn;
	Thu, 21 Mar 2024 08:33:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnDrC-00000002KRa-29PQ
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 08:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711009978;
	bh=OYKB5vkSZXRayTHG8PtislSXGdVPY2nozhkEeUlG9QQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pRVpFsJfZOThpCw6XP29z0mkjKLuJ7HyW4QHRzz/4T/O8APO5WDuCyUwY2xlIRUo7
	 0anoEjGURQ8gsGJJJM5XjGS0klQkLjMqUUcMrAj4Vh5TcTIjsConOef3dDVUhkabYI
	 vXx+8L2hAbgqkYEI84ybHrJEwvqrMKRu58GirLcfar6EpedIyhFlfY2+QpmzbuAE34
	 VYayZtNT3DbO1Tf2IP+u6eB+nIv+ea1V9h6dkBDrK1GxG1aNxTVzI23t6MKGoGTZVG
	 cdiV8lI4ladherX3oAX22vNEzllAlz+tGh/rMsZ8c4TNi25ooZ3pZX+mp66AuNEzOX
	 2Erhd6lsIE2ag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DE95537820EF;
	Thu, 21 Mar 2024 08:32:57 +0000 (UTC)
Message-ID: <0b5d8e55-216f-4456-b28b-8aec47b4105e@collabora.com>
Date: Thu, 21 Mar 2024 09:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] arm64: dts: mediatek: mt8186: add default
 thermal zones
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-9-nico@fluxnic.net>
 <34e75ebd-b01c-430a-a051-47489492c189@collabora.com>
 <ron9o4o3-qror-o1o9-3911-7189925o1os2@syhkavp.arg>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ron9o4o3-qror-o1o9-3911-7189925o1os2@syhkavp.arg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_013303_112989_9CD41790 
X-CRM114-Status: GOOD (  12.88  )
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

Il 20/03/24 22:52, Nicolas Pitre ha scritto:
> On Tue, 19 Mar 2024, AngeloGioacchino Del Regno wrote:
> 
>> Il 18/03/24 22:22, Nicolas Pitre ha scritto:
>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>
>>> Inspired by the vendor kernel but adapted to the upstream thermal
>>> driver version.
>>>
>>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8186.dtsi | 236 +++++++++++++++++++++++
>>>    1 file changed, 236 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> index 7b7a517a41..9865926459 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> @@ -13,6 +13,8 @@
>>>    #include <dt-bindings/power/mt8186-power.h>
>>>    #include <dt-bindings/phy/phy.h>
>>>    #include <dt-bindings/reset/mt8186-resets.h>
>>> +#include <dt-bindings/thermal/thermal.h>
>>> +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>>>      / {
>>>    	compatible = "mediatek,mt8186";
>>> @@ -2115,4 +2117,238 @@ larb19: smi@1c10f000 {
>>>    			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
>>>    		};
>>>    	};
>>> +
>>> +	thermal_zones: thermal-zones {
>>> +		cluster0-thermal {
>>
>> Please use the names that are expected by the SVS driver.
> 
> And what would those be in this case?
> 
> I've used the names that were suggested here:
> 
> https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/#m05936e84a2efe5c431bad39c24d66c246fb8ca38
> 
> 

It's always the ".tzone_name" member of svs_(socmodel)_banks.pdata, with -thermal
suffix (drivers/soc/mediatek/mtk-svs.c).

Making it shorter for you....
performance CPUs:            cpu-big-thermal
low-power CPUs:              cpu-little-thermal
Cache Coherent Interconnect: cci-thermal
...and GPU is obviously      gpu-thermal

Cheers,
Angelo

