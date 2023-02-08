Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E821C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq7GEayWsvRw96cMHfok6bYt1VMpZwPrUFgKIuPy65s=; b=yaG3x/Uygtu+X+
	A69YRdtCs3oZLpY5WzGMx+XORgRDjbql0JeJ5wXXW68LryS6m5HCVNg788q5pIQ4HMbAgSrwQ+sX9
	zRYdv+78vocMVhLBKayeAomuzV0wAOP1roLHzPUHcp1alPNgJbk3xoiDIAv5LYmPxJ7JbJy3tzFJk
	s/kls2b9tLgp6ecA+UF+f5kBpODmdq3CRxP+tXY+bZKdsjU/gB6gmN5/ZdzHPQ91O1/HYBcR6mVV0
	sXXbUkgP88Y8ww5bAmfMi1okKOgbcMtHLeDDMkGUjniKx1v2XJqJ/pkmAFXirjWHKe+Z0pRxsOHVr
	wrXUP3bT06HTj0S401oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfb8-00EYSw-7T; Wed, 08 Feb 2023 08:14:34 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfax-00EYPk-1q; Wed, 08 Feb 2023 08:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675844041; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WeDIxqqukEHbNXOn/uBSj0kVXEhR97vE6zejJ+WfzvB1repQPM5ucfM8jCPyTWFhSeXTn9T0eIOx06N71IVqJmca2MLiHWcRKe01kgfX5we2MOXJOHpMYz0frdQPFcYEUTByCWm5nNMfDm2Fudy11OK76LUi2vfd0gac9leZy6M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675844041; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Tq7GEayWsvRw96cMHfok6bYt1VMpZwPrUFgKIuPy65s=; 
	b=ne6IDCfXBMNPAPGv1UsKN6Q/gp5D0txK4aGFhr3G8UM23w6wABMPyW5kcVCG3V387ZZrp6BZT7KQe8Q1bBaOrs7VNoRTWSVnifYr4tZ011LegnhzngJ09p8s2DzyP8qKCm1QBwjEJ7BHDkQup5LBHwmevsyCWrYVEFZzb1t9gdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675844041;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Tq7GEayWsvRw96cMHfok6bYt1VMpZwPrUFgKIuPy65s=;
	b=Cn+QHurTvKT5eFvMaxyl7rXMMSpuNNKSJpDnxZlHDLheoh/FT46dkphMeFBeYvG7
	2BNjxdNJbMvT5s1JfmybdQ2WpeEv0Z/5zhRA7oHSGHTra12049wVYx21snHKPMZxnSI
	9U5tlQ8i+vEXBKRhhAooTkFpA8b8gqIIvVWQ4GXU=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675844038914268.9156197429097; Wed, 8 Feb 2023 00:13:58 -0800 (PST)
Message-ID: <17958d10-80cb-b5a7-3a5b-97192de2266e@arinc9.com>
Date: Wed, 8 Feb 2023 11:13:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: enable special tag when
 any MAC uses DSA
To: Jakub Kicinski <kuba@kernel.org>
References: <20230205175331.511332-1-arinc.unal@arinc9.com>
 <20230207105613.4f56b445@kernel.org>
 <5d025125-77e4-cbfb-8caa-b71dd4adfc40@arinc9.com>
 <52f8fc7f-9578-6873-61ae-b4bf85151c0f@arinc9.com>
 <20230207155801.3e6295b0@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230207155801.3e6295b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_001423_172343_13A86BCF 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Richard van Schagen <richard@routerhints.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, arinc9.unal@gmail.com, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8.02.2023 02:58, Jakub Kicinski wrote:
> On Tue, 7 Feb 2023 23:25:32 +0300 Arınç ÜNAL wrote:
>>>> As Paolo pointed out to me off-list this is pretty much a revert of
>>>> commit under Fixes. Is this an actual regression fix, or second MAC
>>>> as DSA port never worked but now you found a way to make it work?
>>>
>>> Second MAC as DSA master after hardware DSA untagging was enabled never
>>> worked. I first disabled it to make the communication work again, then,
>>> with this patch, I found a way to make it work which is what should've
>>> been done with the commit for adding hardware DSA untagging support.
>>
>> Should both commits be mentioned with Fixes tag?
> 
> No strong preference, TBH.
> 
> The motivation for my question was to try to figure out how long we
> should wait with applying this patch. I applied the commit under Fixes
> without waiting for a test from Frank, which made me feel a bit guilty
> :)

Oh that's fine, they were going to test on the same hardware I've got 
anyway. You can apply this one whenever is convenient.

Arınç

