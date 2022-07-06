Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77584C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw+meNfzzIV1Almfx5ThT7o1FyVZQQjN7oxJZ18EGrw=; b=GOfFED1VFLqSkQyqzLnTZQZTcV
	dLHAFuv8AgKx7u0I5tzRcnJbE9aZ7+AQOnD1V+DIfCpDH9eUMQJTch0VFWOY93m67hPoQGJhaicUf
	ZFxicQ3ijv24+vDdqsLfgbQ7BiFNJcwKdYe6XIx2+kc4UKInJgfZ0yZl+axYDWqUNRIbzt/7Ffa4t
	KF9HUO1x3igOoais67pD4xSXbuiAsqxy2UBafp8WtCCDOlzrb4K71roNnA5PFdnMiuP8dkayS97Th
	BEEnelzC+ZxGNI3qNuleYIOQ2LS7o9iaXp11Yn51+zjea1wEuLNLXVGn6VJXk8K4FBFJjF34ZDKsF
	TARfOLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Zb-00AUuz-6X; Wed, 06 Jul 2022 14:00:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95ZQ-00AUro-1Z; Wed, 06 Jul 2022 14:00:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 090DC660186F;
	Wed,  6 Jul 2022 14:59:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657115998;
	bh=hlSoJlMQ1wNrpKuPTKn+3MdUzD6VbIFbGoYJHvb0jKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9+ALsZmAkZHB57bQsEqs/yp/DtoHi+5edpM+LAwaBt2OVVBP/IlUYu+L52n3To7z
	 R3jSDTxLpQcdkUD/oM3E9Iqe12UPRPe8qdAiAqFDv0P+YEbsphVdVxhtMsfzMpL36u
	 Zli3i5AdW3v8EfJEckF5TQ4fi+lr9njpbTpjQ0M6ZzXhTDjBEAKQTwnB6aomuRjQNT
	 FoPAn52JK414APBY+eBHYAT/hjh1qJfNG22hkWRhU4ujNkeYo+WOnfL5qLPZldKL/I
	 blCDOZYR/NFIhT3uaIK4onFqjOdbDQ455gBYC8FOkWa3KJNMVO7jh68GeDWgB6oWCr
	 d0hUXXTkUbQbw==
Message-ID: <a7c7e807-5489-c731-224f-a4b681952917@collabora.com>
Date: Wed, 6 Jul 2022 15:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 RESEND 0/4] MediaTek Helio X10 MT6795 - MT6331/6332
 Regulators
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lee.jones@linaro.org
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
 <YsV9IerWCoa/xtwM@sirena.org.uk>
 <57367b11-f2d4-476b-b92d-16c1726316c0@collabora.com>
 <YsWG0jfqAf4EqojE@sirena.org.uk>
 <82736173-b3b8-1e1a-3e2e-25d9ca3287eb@collabora.com>
 <YsWTt3YSHI9LLpnw@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YsWTt3YSHI9LLpnw@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_070000_247661_705584DD 
X-CRM114-Status: GOOD (  13.93  )
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

Il 06/07/22 15:52, Mark Brown ha scritto:
> On Wed, Jul 06, 2022 at 03:38:34PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 06/07/22 14:57, Mark Brown ha scritto:
>>> On Wed, Jul 06, 2022 at 02:49:56PM +0200, AngeloGioacchino Del Regno wrote:
>>>> Il 06/07/22 14:16, Mark Brown ha scritto:
>>>
>>>>> This previously got 0day failures due to missing dependencies which
>>>>> need would need a merge with IIRC MFD, I see no reference in the cover
>>>>> letter to dependencies?
>>>
>>>> The only blocker for this series was the MFD patch, which got picked and
>>>> it's present in next-20220706 (as you suggested me to resend when things
>>>> were picked... I decided to wait until they actually landed on -next...)
>>>
>>> Right, I also said I'd need a pull request - if I apply the patches
>>> without having the MFD bits they depend on in my tree then it will fail
>>> to build.
>>
>> I remember writing that to Lee... how do we proceed in this case?
>> Should we add him to the Cc's of this patch to notify him or..?
> 
> Lee, Angelo has sent me this series for Helio X10 which needs some MFD
> bits (not 100% sure which, I guess Angelo can fill that in) - is there a
> tagged branch available to pull in?


(Thank you, Mark!)

The required bits are all in just one commit:

https://patchwork.kernel.org/project/linux-mediatek/patch/20220627123954.64299-1-angelogioacchino.delregno@collabora.com/

Landed on next-20220706 with ID ad7f984a6aa9722443c1db9e8f72609bf06a8910

...which can be also found here:
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next

