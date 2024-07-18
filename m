Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B1AC3DA60
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlWFrie2bA9M4+Zktuizvsch4+fR4sMHeS71KZmhtxE=; b=I74KgV7dWLwH9B
	FRrN+hh3WbTbLuKqVOgDap6EsPT4ryp4GqrbJLOTbTfjiX+IeUXG3rGe+ozMpX0rp4G7nH5h8raTI
	/l0Psjxvv9PjP6yqcpoVT9o6aX9z7ekLUZ1E70oVcWD1ZjjJKIKji4I1CkHrBIQES0wVuzleIB/fX
	ELXrQXrwZWRXSFlADKYs/7sj7r3HFncCkiHfhcjFs7yRFGqQemP5l+j4ATjomJZlmA62ntE6DBUNy
	VH10bJnTW9GvYWfdqhUoc7GK3nPcy0SVQ7PP1bHdZBMIxxKXlcX9ZpnSzUkHU/Dr9IpwQr/mFgumK
	YmkWJlIiqnEXbrlhCsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPER-0000000GpLs-41E0;
	Thu, 18 Jul 2024 11:23:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPE4-0000000GpGH-3vNy;
	Thu, 18 Jul 2024 11:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721301787;
	bh=Rhu+ivLN8i4cGGfuNKe45o1pJKIStecWgDqToMVnLUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRVtoGyNQfsWeg4dFxpH5wAPa+R0323lbfRdSK23/AWBENSv+IAO3XPjSge9THc/E
	 PZqHjs4HABtU3UnGe0EYzgLA+quFty+o7HbaYM2ueuBQj/5vOKc2M2FXZidiTnCaU1
	 lf5JhkTpiidnrL8ssxsLdxAivJhW0mij2wPJzPeDrVWRNno4+ZpKrxpCARnFrEEYbw
	 s/JHlZ7qhswD4XVdqDl8KEh5CQjt8zqnTceRAKP2if5Op5phQV3RuBJBDJEnDi0BWR
	 M0ibod+QQlL4Pu/12Y9YGAq53aIJJFDv+RZl/3iYWfsqjpuTRdASZYbUQCyfkV/v+Q
	 gGySo5cAKzTbQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A5FBB378202D;
	Thu, 18 Jul 2024 11:23:06 +0000 (UTC)
Message-ID: <d6f20609-5127-4010-b691-40cd3b253283@collabora.com>
Date: Thu, 18 Jul 2024 13:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: Daniel Stone <daniel@fooishbar.org>
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
 <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
 <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_042309_146534_BAB196B3 
X-CRM114-Status: GOOD (  22.57  )
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
Cc: chunkuang.hu@kernel.org, kernel@collabora.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, Chen-Yu Tsai <wenst@chromium.org>, matthias.bgg@gmail.com, shawn.sung@mediatek.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/07/24 13:10, Daniel Stone ha scritto:
> Hi all,
> 
> On Thu, 18 Jul 2024 at 11:24, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 18/07/24 11:27, Fei Shao ha scritto:
>>> This matches my preference in [1], so of course I'd like to see it
>>> merged... if maintainers are okay with it.
>>> Given I've tested the exact same change before:
>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>> Tested-by: Fei Shao <fshao@chromium.org>
>>
>> Thanks!
> 
> And:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> 
>>>> OOTH, Intel recently added a feature for enumerating "suggested"
>>>> cursor sizes. See https://patchwork.freedesktop.org/patch/583299/
>>>>
>>>> Not sure if other compositors will end up using it or not.
>>
>> Yeah, that's good, and we might do that as well in MediaTek DRM... in a slightly
>> different way, as it looks like they are simply hinting the same values as the
>> mode_config is declaring... while we'd be adding a hint with a sensible size that
>> is less than the maximum supported one from the overlay.
>>
>> In reality, here, the issue is that the most popular compositors do not support
>> overlay planes (as in, they don't use them at all)... my first idea was to remove
>> the CURSOR plane entirely and declare it as per what it is for real (an OVERLAY),
>> but that would only give a performance penalty as that'd become yet another unused
>> plane and nothing else.
>>
>> If at least the most popular compositors did support overlay planes, I'd have done
>> that instead... but oh, well!
>>
>> And anyway I hope that the maintainers are okay with this because, well, otherwise
>> MediaTek SoCs won't be usable with any popular WM.
> 
> Every compositor is going to use it, yeah. But until it does, people
> are just going to use cursor_width and cursor_size. A lot of older
> desktop hardware supports only a single fixed dimension for the cursor
> plane (hence the single values), so rather than guess if it needs to
> be 32x32 or 64x64 or whatever, people just allocate to the size. Not
> to mention that the old pre-atomic cursor ioctls actually require that
> you allocate for cursor_width x cursor_height.
> 
> So yeah, this is the right fix - though you could even be more
> aggressive and reduce it to 256x256 - and supporting the CURSOR_SIZE
> property would be even more useful again.
> 

I thought about being more aggressive, but then I saw that IGT tests for up to 512
and that MSM also declares the same, so, making IGT happy because we can indeed
support that much (since we can support even more, but doesn't make sense) :-)

Regarding CURSOR_SIZE ... right, I can take a look at that a bit later, most
probably not for this merge window, though.

Cheers!

> Cheers,
> Daniel



