Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81C8CD54B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbhWhWUC6KNOPLMapqFIWN0s7LOCCDDPvnWY8jyYcJI=; b=IoVc81gpAWwnn4u3ICQ4Ra1azb
	fsO3yfkQ3SnzgwJ/LiYr7iWCiHG4KU2wzeWgnNeh7cdy7ShaJirq6alilXpCaZ9lw5i36bAudKAh7
	csp/+zfWt9jlnAqQwbReLEl42lQ+zL/K0R0n49XhrOqcLks1OBxssSR52UDyymlv6io/DhT0pNmg2
	QPewUPad2r/K6q1CBBjDETpXsDQJ8bPuErsuGLNKqSPf29WFUf1HSFBB72wn/XM/UPpxtjYEeP7mE
	B2oFjvDbBFVJa3SA4jkaVfepg7tid5kVE9dbPhxDkB+ArMoK5OanPpwA5ceee1EFCP4m0HsuLQ4Mi
	tcKuTSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYTC-000DWG-1p;
	Tue, 19 Sep 2023 11:00:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYT8-000DUb-1k;
	Tue, 19 Sep 2023 11:00:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CD46606F85;
	Tue, 19 Sep 2023 12:00:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695121236;
	bh=pGABrkdMPNOId/UpOvVX0W6yAEUBMmgWgmu2kx8oQPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D+5/LSvlB2WPeQftHfgNSnq2s/t/wiLMXq3IYleEi5nSsebq+TVVlVYhPYRmOOvZy
	 9g37nQyJIkciCMjcHc+SN9DSZku7zx4GgHAkmtiNhF0t65tSRJ862EA/+KK9WQn/vl
	 5uQucyNIYElMbOT0OFyuLRboluvrnwBahVjvkb2bji7d/2ZJEQKShW3v7qPx01MYX2
	 lYz5BYuSXVKkOimtCEAV8p6Tw1GhfA44Z3Yq1byPkGLC8X8THB11gepUx2aAh5gO9I
	 MMOKFiGGF8fvc8i4mCrMfBMa0+7mUoJGV02Huv19EBZ3sXDX2btCXQetvjPyrAyb20
	 aUnIJkRXH/okA==
Message-ID: <75bcb583-a3c8-661c-d520-affc46c8f6e5@collabora.com>
Date: Tue, 19 Sep 2023 13:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "eugen.hristev@collabora.com" <eugen.hristev@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
 <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
 <CAC=S1ng8033sSGNFYr1vYfYfHbdG0Dk_0xai08=uomGO-EN66A@mail.gmail.com>
 <9a7b56ec641f79fc14ecd83faff61bfed05b12a5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9a7b56ec641f79fc14ecd83faff61bfed05b12a5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_040039_678643_65BAE01A 
X-CRM114-Status: GOOD (  39.82  )
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

Il 19/09/23 09:37, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo
> 
> Thanks for the reviews.
> 
> Hi Fei,
> 
> Thanks for the testing.
> 
> On Mon, 2023-09-18 at 18:47 +0800, Fei Shao wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   Hi Angelo,
>>
>> On Wed, Sep 13, 2023 at 4:35 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Il 22/08/23 15:26, Jason-JH.Lin ha scritto:
>>>> Add spinlock protection to avoid race condition on vblank event
>>>> between mtk_drm_crtc_atomic_begin() and
>> mtk_drm_finish_page_flip().
>>>>
>>>
>>> Hello Jason,
>>>
>>> Can you please provide more information about this race condition?
>>> (check below)
>>>
>>>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek
>> SoC MT8173.")
>>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>>> ---
>>>>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>> index d40142842f85..128a672fe3c9 100644
>>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>> @@ -746,6 +746,9 @@ static void mtk_drm_crtc_atomic_begin(struct
>> drm_crtc *crtc,
>>>
>>>                                                                     
>>       crtc);
>>>>        struct mtk_crtc_state *mtk_crtc_state =
>> to_mtk_crtc_state(crtc_state);
>>>>        struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>>>> +     unsigned long flags;
>>>> +
>>>> +     spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>>>
>>>>        if (mtk_crtc->event && mtk_crtc_state->base.event)
>>>>                DRM_ERROR("new event while there is still a pending
>> event\n");
>>>> @@ -756,6 +759,8 @@ static void mtk_drm_crtc_atomic_begin(struct
>> drm_crtc *crtc,
>>>
>>> ...because my suspect is that what creates the race condition in
>> this function is
>>> the unlocked *assignment* to mtk_crtc->event, not the rest.
>>>
>>> If I'm right, you don't need to unconditionally spinlock at the
>> beginning of this
>>> function hence ever-so-slightly improving performance compared to
>> this version.
>>>
>>> Can you please try this one and check if this *also* solves the
>> issue?
>>>
>>>          if (mtk_crtc_state->base.event) {
>>>                  mtk_crtc_state->base.event->pipe =
>> drm_crtc_index(crtc);
>>>                  WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>>>
>>>                  spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>>                  mtk_crtc->event = mtk_crtc_state->base.event;
>>>                  spin_lock_irqrestore(&crtc->dev->event_lock,
>> flags);
>>>
>>>                  mtk_crtc_state->base.event = NULL;
>>>          }
>>>
>>> P.S.: I'd try that myself, but I can't seem to reproduce the issue.
>>
> I can't reproduce the system hang issue reported from customer by
> toggling the night light mode in UI panel either.
> But I can see the error message "new event while there is still a
> pending event" when I was reproducing the issue.
> 
> Here is the debug info from "Wei-Shun <weishunc@google.com>":
> 
>  From the kernel tracing:
> 99342.377173: mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.377226:
> drm_crtc_send_vblank_event <-mtk_crtc_ddp_irq
> 99342.393831:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.393887:
> drm_crtc_send_vblank_event <-mtk_crtc_ddp_irq
> 99342.410469:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.410519:
> drm_crtc_send_vblank_event <-mtk_crtc_ddp_irq
> 99342.427094:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.443831:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.460495:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.477157:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.493841:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.510453:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 
> Every mtk_crtc_ddp_irq should come with a drm_crtc_send_vblank_event.
> However, when the issue happens, the mtk_crtc_ddp_irq keeps firing but
> no drm_crtc_send_vblank_event. I suspect this is the main reason
> causing flip_done timeout.
> 
> In mtk_drm_crtc.c, mtk_crtc->config_updating and mtk_crtc-
>> pending_needs_vblank are the conditions that may impact the vblank
> event.
> 
> static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
> {
>      struct drm_crtc *crtc = &mtk_crtc->base;
>      unsigned long flags;
> 
>      drm_crtc_handle_vblank(&mtk_crtc->base);
> 
>      spin_lock_irqsave(&crtc->dev->event_lock, flags);
> ==> if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
>           mtk_drm_crtc_finish_page_flip(mtk_crtc);
>           mtk_crtc->pending_needs_vblank = false;
>      }
>      spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> }
> 
> 
> There are 3 lines are called in mtk_drm_crtc_finish_page_flip():
> drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
> drm_crtc_vblank_put(crtc);
> mtk_crtc->event = NULL;
> 
> So I want to protect these 3 things to avoid them encountering race
> conditions:
> mtk_crtc_state->base.event //will be provided on atomic_commit complete
> drm_crtc_vblank_get(crtc)
> mtk_crtc->event
> 
> 
> I have tried to protect this line only:
> 
> spin_lock_irqsave(&crtc->dev->event_lock, flags);
> mtk_crtc->event = mtk_crtc_state->base.event;
> spin_lock_irqrestore(&crtc->dev->event_lock,flags);
> 
> I can still see the error message "new event while there is still a
> pending event" when I toggled the night light mode.
> 
> Maybe that is mtk_crtc->event here:
> if (mtk_crtc->event && mtk_crtc_state->base.event)
> haven't set to NULL by mtk_drm_crtc_finish_page_flip().
> 
> But that not a problem because we will protect mtk_crtc->event here:
> mtk_crtc->event = mtk_crtc_state->base.event;
> 
> 
> So should we remove that error message since it doesn't help and may
> cause the confuse after we fix this issue?
> 
> 
>> I'm still able to reproduce it so I gave it a try, and this approach
>> also seems to fix the issue.  :)
>> FWIW, the way I reproduce that is to toggle the night light mode on
>> and off repeatedly through the UI panel while playing YouTube videos
>> on my device.
>>
>> Jason, can you post a new version with Angelo's suggestion?
>>
> 
> OK, I can take Angelo's suggestion. Thanks!
> But I am wondering if we should remove this log?
> DRM_ERROR("new event while there is still a pending event\n");
> 

Thanks for the analysis.

Please don't remove that line, this indicates that there might be another issue
somewhere else, and someone will tackle that later.

Regards,
Angelo

> 
> Regards,
> Jason-JH.Lin
> 
>> Regards,
>> Fei
>>
>>>
>>> Regards,
>>> Angelo
>>>
>>


