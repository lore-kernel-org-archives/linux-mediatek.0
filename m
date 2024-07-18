Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB78EC3DA60
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGmk8mB9p44Xwk8wW99z+rauddAWqGEfcpO9hru4esw=; b=I9lbErX8bS657oIyY2BZwPqCoY
	0lBXPYtDyTfLmAPwTJtostmAg+gEMQ1VjtCN/ohMR+waBCwblFLLMuFMR+7l3rwPab54k7WHkDH4E
	3+7pZoUO6rnfBd5IB2xlJ4ypZYRe1Vc4DH9wuC5/aNlYW2AZdMv2twqndE5v/6204F2F7y0gidGQD
	0gt2ivWWz61i5AkyJ4hFqPTCbtdoYTZhNIQQicYFhpEbJ+oDOKs1U1OpBdyNoa5a6JKayVF+W4HIg
	SDVJJR+FGjl77gSdbjYuMX1SqlqKx1ZLdZMU4MDYqsoJgKs9sA3TIDHHCz/9u0wIer6BbE9KKdpA/
	dYK50Sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOJt-0000000GgA1-0tU7;
	Thu, 18 Jul 2024 10:25:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOJW-0000000Gg5Q-3EnT;
	Thu, 18 Jul 2024 10:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721298280;
	bh=VfGA0MNPDxpzY3+7gxwzo8OvFAauh4Lp07OuvQvJc64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lm/u3WpGxs2VcAayIMBmt6INiXYpVfQnbDc0FwxQl/I5JRVORgK3dCNj5KRzSb7vV
	 cg+HV9vwO3DdMUh5WiEO2dG0YlXO/V0WCQwjUcv/i32WSw+fzF4VhzImrRzLyEmYTi
	 GBbmvMW+/IHm+AjbkUxqXODBc+2en/EzF4Z3AzIJPUHFPDG7jt1GfyhxD/5By8rt8K
	 /RN+F48ILmBFl5l8oLSckGeKNKafYx1D+TBIZAOVEzO8K7U/A6edUU14F8E6pQfR8g
	 +D+w6irDgFgB9ko57cLxQGB4qLGbWmQDSUbuUwyKxA2QLVpHQna3iZW9ZOvnSD1kQH
	 EpS2rBPxk0XzA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D66BE37813D3;
	Thu, 18 Jul 2024 10:24:39 +0000 (UTC)
Message-ID: <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
Date: Thu, 18 Jul 2024 12:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: Fei Shao <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_032442_979195_DA357841 
X-CRM114-Status: GOOD (  28.29  )
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

Il 18/07/24 11:27, Fei Shao ha scritto:
> On Thu, Jul 18, 2024 at 4:49 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> (CC-ed Fei Shao)
>>
>> On Thu, Jul 18, 2024 at 4:24 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Hardware-speaking, there is no feature-reduced cursor specific
>>> plane, so this driver reserves the last all Overlay plane as a
>>> Cursor plane, but sets the maximum cursor width/height to the
>>> maximum value that the full overlay plane can use.
>>>
>>> While this could be ok, it raises issues with common userspace
>>> using libdrm (especially Mutter, but other compositors too) which
>>> will crash upon performing allocations and/or using said cursor
>>> plane.
>>>
>>> Reduce the maximum width/height for the cursor to 512x512 pixels,
>>> value taken from IGT's maximum cursor size test, which succeeds.
>>>
>>> Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 6f0b415a978d..b96763664c4f 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>>>          }
>>>
>>>          /* IGT will check if the cursor size is configured */
>>> -       drm->mode_config.cursor_width = drm->mode_config.max_width;
>>> -       drm->mode_config.cursor_height = drm->mode_config.max_height;
>>> +       drm->mode_config.cursor_width = 512;
>>> +       drm->mode_config.cursor_height = 512;
>>
>> Fei already did the same (?) workaround downstream just recently.

Heh, didn't know that :-D

> 
> Well, so another userspace gets confused...
> I actually sent a separate userspace (i.e. Chrome) fix where I
> encountered the issue, so I didn't proceed with upstreaming it in the
> end.
> 

Actually, there is a specific recipe that doesn't trigger this bug, that's why
I couldn't trigger it when reviewing the patch that was introducing it; if you
use a module instead of built-in, and insert it right after Panfrost, then you
will get stuff working - but with a performance penalty (and I upgraded my system
right before testing this patch, so I thought it happened because of the upgrade
and not because of this one).

After some more upgrades here and there, and seeing that I was on X11 and not
Wayland as usual, I was able to trigger this bug in any and every condition...

> This matches my preference in [1], so of course I'd like to see it
> merged... if maintainers are okay with it.
> Given I've tested the exact same change before:
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
> 

Thanks!

> [1]: https://lore.kernel.org/all/CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com/
> 
> Regards,
> Fei
>>
>> OOTH, Intel recently added a feature for enumerating "suggested"
>> cursor sizes. See https://patchwork.freedesktop.org/patch/583299/
>>
>> Not sure if other compositors will end up using it or not.

Yeah, that's good, and we might do that as well in MediaTek DRM... in a slightly
different way, as it looks like they are simply hinting the same values as the
mode_config is declaring... while we'd be adding a hint with a sensible size that
is less than the maximum supported one from the overlay.

In reality, here, the issue is that the most popular compositors do not support
overlay planes (as in, they don't use them at all)... my first idea was to remove
the CURSOR plane entirely and declare it as per what it is for real (an OVERLAY),
but that would only give a performance penalty as that'd become yet another unused
plane and nothing else.

If at least the most popular compositors did support overlay planes, I'd have done
that instead... but oh, well!

And anyway I hope that the maintainers are okay with this because, well, otherwise
MediaTek SoCs won't be usable with any popular WM.

Cheers!
Angelo

>>
>> ChenYu
>>
>>>          /* Use OVL device for all DMA memory allocations */
>>>          crtc = drm_crtc_from_index(drm, 0);
>>> --
>>> 2.45.2
>>>


