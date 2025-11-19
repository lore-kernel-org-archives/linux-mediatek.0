Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF583CF258C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnxreAw2M+/KKPrgfMHnxnVoSP9VVw1b0fHW/wvjwSc=; b=vEEtKkmRqp2vFgSdgjxiRvWxTX
	iYjOh5SyE2q7ISlSJD3xVSiCm1Uwv4LHtTer9SzqsIjveMZj2oTsqUgx7cWhxjlw303WLEZOQ5Qkd
	y96PAA4/F5d0H4iF1AeNOxlfGsL7hlHYyGsNslW9dlFXNJdz0xnZMtT35pJjPeScmhr8/BoTM5f7t
	zHOo5x/C+nervh9WINF3sz0MPoCaphAkpIT5xLbMSprPTPMP2H0YWoo53ZnFvMndwuBV6oOcnDUJI
	d2vH/wo/1Boa/HEsrNmDu/8p3zfmzA/o1uM0KWtmcAsoOfvY64EieYVIbGGDVyGN2Hd6qqwE2zRZd
	gEFkj8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdic-00000002o1J-44WD;
	Wed, 19 Nov 2025 08:39:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdiZ-00000002o0T-1Lbd;
	Wed, 19 Nov 2025 08:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763541548;
	bh=6XRDIcE23p1oIoiWUrxZPEk0k4GxcOxPuD68CPWrDSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+ayNv5mWWuJLSvrm6hwUGyQA7Upstur+j0+sMeLNMncK5SzMW6GZfjicXb1jUG45
	 u7A2EiULEPBPGo0T8iHmbKjR1pdT7z0gn1jXqN9UBEwYW1cYDgeZRhoYdkqVV+a18a
	 8gpk+rGuAiV6dtgUs1XZCmEr5Im/3/EuiUC2rKql5nN0P5gMq0Ij3M3b/uQO7kBotf
	 sKwBng+7IvvMf6bNB9DTmGURvQHjCswzE0VR7l1zPGkyHPygiDSWhunkncYBz3ETih
	 IXbUVbCu+ixlwovokDee5pSgvNKnb9OZCkY5OIP4BxjTW8z6Xo1ziPQ5Bzl/MlJoOz
	 uZtH4zyDNMWSw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29B5717E005F;
	Wed, 19 Nov 2025 09:39:08 +0100 (CET)
Message-ID: <bd64ace0-b4c5-46e0-870b-e62f950f4199@collabora.com>
Date: Wed, 19 Nov 2025 09:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at
 build time
To: Frank Wunderlich <frank-w@public-files.de>, robh@kernel.org
Cc: matthias.bgg@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20251117211306.725678-1-robh@kernel.org>
 <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
 <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com>
 <trinity-dfca2931-a7e8-4b33-b722-c22105569d82-1763485361461@trinity-msg-rest-gmx-gmx-live-56d984c6fb-85gcg>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-dfca2931-a7e8-4b33-b722-c22105569d82-1763485361461@trinity-msg-rest-gmx-gmx-live-56d984c6fb-85gcg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_003911_537875_BE0EA263 
X-CRM114-Status: GOOD (  19.66  )
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

Il 18/11/25 18:02, Frank Wunderlich ha scritto:
> Hi,
> 
> this looks similar to my attempt i did here
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240608080530.9436-2-linux@fw-web.de/
> 
> But in my case i added full dtb with 2 overlays as there can be 2 devices (1 mmc + 1 spi) at one time.
> So usable as dtb for bootloader config without overlays, not only for validation...
> 

Please don't top post :-)

That said, for the target of what is done here, I think yours is nicer to the eye
compared to Rob's (not his fault at all, most of the times overlays cannot be
applied together, he can't possibly know if that is possible in this case).

If there is really no other solution to that... well, at this point I prefer to
have something nicer to the eye, with all of the necessary "evil" that comes with
it.

P.S.: Strong words contained in this reply are meant to be lighter than they appear

Cheers,
Angelo

> regards Frank
> 
> 
>> Gesendet: Dienstag, 18. November 2025 um 13:31
>> Von: "Rob Herring" <robh@kernel.org>
>> An: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> CC: "Matthias Brugger" <matthias.bgg@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
>> Betreff: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at build time
>>
>> On Tue, Nov 18, 2025 at 3:36 AM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Il 17/11/25 22:13, Rob Herring (Arm) ha scritto:
>>>> It's a requirement that DT overlays be applied at build time in order to
>>>> validate them as overlays are not validated on their own.
>>>>
>>>> Add targets for all the Mediatek overlays.
>>>>
>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>> This will soon be a warning[1].
>>>>
>>>> Note that if it is desired that the combined .dtb is not installed, then
>>>> the combined .dtb should be added to 'dtb-' variable instead.
>>>>
>>>
>>> Uhm, sorry, can't we do something such that we don't generate a DTB with a
>>> preapplied overlay?
>>>
>>> Even something like generating those and deleting before build finalization
>>> could work, I guess, though that'd be hacky maybe.
>>>
>>> I don't know if this is the case, but I'm worried that various people have
>>> scripts to copy DTBs somewhere (in some partition) or embed those in images,
>>> and if they get the preapplied overlay dtbs in the same place, havoc could
>>> happen as the bootloaders might be selecting wrong dtbs (as a plus, there is
>>> no dtbo that varies machine compatible strings, rightfully).
>>
>> If they aren't using dtbs_install for that, then that is their
>> problem. When we moved all the arm32 DTs to vendor directories,
>> dtbs_install maintained the old structure which seemed sufficient to
>> not break folks. The same should apply here.
>>
>> Rob
>>
>>



