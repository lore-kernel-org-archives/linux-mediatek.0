Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D708EC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89bWYLOLrYoMZpVNB5oaKZ7qU5NSqiiGg9T2aO957YQ=; b=MaLBAQbLK5xuCf
	OaENTEvHSzOIA3mkSTlydLDk6bTbGNRlS02fhvHxMkMwoA2bfB1F35hRQO/PajoFG4k3NwzNyEIxZ
	3A/Gw/6PE9m+F9PQvHqinGJ2FEiNv/OFE0t0bkCaAGtGtclPWXZicM8/thsjhBREYO5NnT4r70b8W
	fVrYoUUF3bjH5IZ6NdUSlp5bFhe7NzGV64PAWnfB/8XpTbzzd1CJHXf2twBHTMIbwNHgVnJ6Oos3z
	N9leQslJg2nJJjLGbYQoXY1pNdY6vw0yxj5YI1t8fVmM6N1jdSMbdZtXKbwDAaiEJCs+pmu3pE15S
	t5A8nbRH6zHM4DcvueFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjmy-00000002D17-3Kqq;
	Fri, 19 Jul 2024 09:20:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjma-00000002CwT-4082;
	Fri, 19 Jul 2024 09:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721380805;
	bh=yAETZC0ppWDyfmBdfHX8Kz6iCIh8buKJ8L4qqK40C4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VdOah8/+V/XtUxxIeVO4oIpiIH0uCMgVd99oNApZzhhpP3jQV5Kljtp9IeuvGwNXB
	 e2skTMRVBepNfeZO52MHmQMCeVo/k3JiAnLmji+QAvdPtChjV5azSSkVAsWW4XnYbv
	 U7LIw1ghoUkOPUzSPRgCwacR5Qiy8O4/6hFQEE5V773FAd5HLYJ/DNigf9qQyGFm3b
	 pHHNxN/cR4drlZg5v2+6rYcKBy/I1fBMnPpbqb5zIspHImL1NM4apEP0CITd0p1d/B
	 UeeSScaI2QHoygyMFiMCa9mnxInK/BXRnQe8X8ehq8RDyVU27h5otNIM6T1BY9biSW
	 PGjRwfbOlrPCg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D57D73782063;
	Fri, 19 Jul 2024 09:20:04 +0000 (UTC)
Message-ID: <c5ba072f-5a38-4faf-9b8f-906bc896881d@collabora.com>
Date: Fri, 19 Jul 2024 11:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "daniel@fooishbar.org" <daniel@fooishbar.org>
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
 <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
 <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
 <d6f20609-5127-4010-b691-40cd3b253283@collabora.com>
 <e74e25b01f85fb33d95e073f18a8049288b5c70d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e74e25b01f85fb33d95e073f18a8049288b5c70d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_022009_313281_8BA9EE72 
X-CRM114-Status: GOOD (  24.08  )
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "kernel@collabora.com" <kernel@collabora.com>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/07/24 10:42, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-07-18 at 13:23 +0200, AngeloGioacchino Del Regno wrote:
>> Il 18/07/24 13:10, Daniel Stone ha scritto:
>>> Hi all,
>>>
>>> On Thu, 18 Jul 2024 at 11:24, AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>> Il 18/07/24 11:27, Fei Shao ha scritto:
>>>>> This matches my preference in [1], so of course I'd like to see it
>>>>> merged... if maintainers are okay with it.
>>>>> Given I've tested the exact same change before:
>>>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>>>> Tested-by: Fei Shao <fshao@chromium.org>
>>>>
>>>> Thanks!
>>>
>>> And:
>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>
>>>>>> OOTH, Intel recently added a feature for enumerating "suggested"
>>>>>> cursor sizes. See https://urldefense.com/v3/__https://patchwork.freedesktop.org/patch/583299/__;!!CTRNKA9wMg0ARbw!nRf6mf-9tnE7vLYracLE6Xq_oblRvtENffF73fRzgz_E3zPc3yxeQPE5yPw95sj-ZeoiYJCQSIPWFZ0C3HCXpBkHikWK$
>>>>>>
>>>>>> Not sure if other compositors will end up using it or not.
>>>>
>>>> Yeah, that's good, and we might do that as well in MediaTek DRM... in a slightly
>>>> different way, as it looks like they are simply hinting the same values as the
>>>> mode_config is declaring... while we'd be adding a hint with a sensible size that
>>>> is less than the maximum supported one from the overlay.
>>>>
>>>> In reality, here, the issue is that the most popular compositors do not support
>>>> overlay planes (as in, they don't use them at all)... my first idea was to remove
>>>> the CURSOR plane entirely and declare it as per what it is for real (an OVERLAY),
>>>> but that would only give a performance penalty as that'd become yet another unused
>>>> plane and nothing else.
>>>>
>>>> If at least the most popular compositors did support overlay planes, I'd have done
>>>> that instead... but oh, well!
>>>>
>>>> And anyway I hope that the maintainers are okay with this because, well, otherwise
>>>> MediaTek SoCs won't be usable with any popular WM.
>>>
>>> Every compositor is going to use it, yeah. But until it does, people
>>> are just going to use cursor_width and cursor_size. A lot of older
>>> desktop hardware supports only a single fixed dimension for the cursor
>>> plane (hence the single values), so rather than guess if it needs to
>>> be 32x32 or 64x64 or whatever, people just allocate to the size. Not
>>> to mention that the old pre-atomic cursor ioctls actually require that
>>> you allocate for cursor_width x cursor_height.
>>>
>>> So yeah, this is the right fix - though you could even be more
>>> aggressive and reduce it to 256x256 - and supporting the CURSOR_SIZE
>>> property would be even more useful again.
>>>
>>
>> I thought about being more aggressive, but then I saw that IGT tests for up to 512
>> and that MSM also declares the same, so, making IGT happy because we can indeed
>> support that much (since we can support even more, but doesn't make sense) :-)
>>
>> Regarding CURSOR_SIZE ... right, I can take a look at that a bit later, most
>> probably not for this merge window, though.
> 
> This patch looks acceptable but it could be better.
> It's urgent to fix the crash, if better solution does not come out soon,
> I would apply this patch first.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> I will remove the Fixes tag because Shawn's patch has no logical problem but the system resource is not enough.
> 
> It's a dilemma that small size has no resource problem but application is limited
> and large size has resource problem but support more application.
> 

Thanks, but the Fixes tag is important, as otherwise v6.11 will be unusable :-)

Regards,
Angelo

> Regards,
> CK
> 
>>
>> Cheers!
>>
>>> Cheers,
>>> Daniel
>>
>>


