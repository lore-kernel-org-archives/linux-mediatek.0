Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXRg9Ewtq49KDqlTUenKJPMmzqgIwyp9CcYjrlqT2es=; b=KM6ftWSKzvoyj9
	bOBS2923xipTZlwMhhLgtN2rqkXVQt3AMHZbwe2dtjz2VCOmV2FHW/Qi5y1smY+fFl0wCfGQHaEuU
	69VG+GsabTMxmIYm7++yyVb5+l9SGQ1NuNRhb3jKNf//E+mEJdvvZzPxRxo9wsc+biCSOTZNPuH4G
	mDShFcb8P3u507oMJFN2nhw5oeewQE09C771cGevcwZiQggTl+/EtGqvIYEEug8xrEsYeFwLHtlws
	mAD/BlHnbaQ2bfB4uNck9m7Teq1mfUGlUNrrp5aMDD1wzqxQ7324bDWc20cncZyiPzLGH/E8BUnY5
	f5G9axMVZVLEndvD1Dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMDv-00FWYN-BT; Wed, 01 Jun 2022 11:09:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMDC-00FWDF-2D; Wed, 01 Jun 2022 11:08:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 309B11F43FFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654081704;
	bh=f8UaqDooK99deu8q+6dpzulRy5t5QoE3TXUqdXno8fQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YVFOT+A4ShlTY5Zkr6DyBJxCpk79ZaXWTkrvNukTuUyVEddCTqztzJX3FLOSu1X1B
	 ftbNEdVSZ8UNU1OKiuBHCK3aKkUaREh0c8CP38jNA3El8nbLZyay40vPhIO6CONIkX
	 WxyX3SA54Q4/HrcfJVoEnuqdv1idXQzBuh0cVSN4w477w9thKsrFJamPM89eRTRWu/
	 NdzwMl+TXfqwBIo2/24IPc/BLeUy4fP5Aydb8sdZmdusjda79kqTlSO7p7Ed/9RDK5
	 mW7DUBcChxZOG/ZcK+Kol3I1plZlAoX28LjgMJ7pNdzc6hyj0lThvqK/nczBZqv9ab
	 NO3lZZFPBIfkQ==
Message-ID: <0682f3a6-01c7-66cf-05ec-33bd3d862116@collabora.com>
Date: Wed, 1 Jun 2022 13:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD
 integration
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <fab40b87-7471-83a3-d154-aa2da0b7d23f@collabora.com>
 <c2f2a3a2-ea5d-59a7-eb84-d59b7d9bff47@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c2f2a3a2-ea5d-59a7-eb84-d59b7d9bff47@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_040826_317441_1D694061 
X-CRM114-Status: GOOD (  16.14  )
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

Il 01/06/22 13:07, Krzysztof Kozlowski ha scritto:
> On 01/06/2022 13:03, AngeloGioacchino Del Regno wrote:
>> Il 20/05/22 14:46, AngeloGioacchino Del Regno ha scritto:
>>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>>> I am upstreaming more components that are necessary to support platforms
>>> powered by this one apart from a simple boot to serial console.
>>>
>>> This series adds the necessary headers and support for the MT6331 with
>>> MT6332 companion PMIC in the mt6397 MFD driver, along with some basic
>>> devices.
>>>
>>> Adding support to each driver in each subsystem will be done in different
>>> patch series as to avoid spamming uninteresting patches to maintainers.
>>>
>>> This series depends on another series [1] named
>>> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper"
>>>
>>> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>>>
>>>
>>
>> Gentle ping to not let this big effort (with drivers depending on this one) get
>> forgotten and wasted.
> 
> Yeah, but it was not even 2 weeks since posting and we are in merge
> window. Please resend after the merge window.
> 

Understood!

Cheers,
Angelo

>>
>> P.S.: Mark wanted to merge the regulator drivers for MT6331/6332 from another
>>         series that depends on this one (but compile errors due to said dependency)
>>
>> P.P.S.: Lee: Reporting what Mark said (Full context in [2]):
>> "I'll need a pull request for the MFD bits I guess, please make sure Lee knows
>> that's going to be needed."
>>
> 
> Best regards,
> Krzysztof


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
