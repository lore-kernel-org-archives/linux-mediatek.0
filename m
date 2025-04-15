Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916AEC369B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=; b=tysfMSDYnCZGAhX7oTkwygScIO
	tpXD3WSAHuQftsvZab8gNFJ2F+YGBqP7hxfE+2CfDR97/xxmgqZ0JZovlmy0tDjCiyPAbCfTjBmnI
	nH4gQuV9A1UXYIyjGAobYDUteV12Y5dXgm4/5c0SBGIZ7bAzy0wlKgZJXbh5wJ6rxcuukqYGASlO3
	1Cs8u/W0DxCf7BAC4F2om+oXl/OAN0M04jqH/nrqo+GcJCI5uDhgBscRrCIew9lioysn9daI8qsut
	l8S2VQi5WKwaD8b7iXMgomNvwTyvnIBwcQntl68Z/JIIU6gosLhDuwzo+Gd0EikrVuFROe0rpPBUh
	r27V4aWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4h4C-000000063sX-204M;
	Tue, 15 Apr 2025 14:15:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4h2P-000000063YG-37m3
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Apr 2025 14:13:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3965c995151so2528744f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Apr 2025 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744726400; x=1745331200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=;
        b=QPUpptRfM3sIM3QtF3oWtOah1PZr3X1egFruJjM+XsltwOSyIzRJM8lgyFqPHFtthY
         fanarHP1Z7ieX0z+kuL55zgEK9LqUhUQqnypu5AfHTFsA4MpAUrfXCYOJsthDs6M90j0
         48Z+7YL8BH21Ha+M+QzcMTHnIo0MiPEs7roOZOhDu+0dZWJT602U0JTA51u6oYX76j4m
         tDvPyd5EZHxxqOkKE6H+ojR/PKhSDjIrsDTSUlrSSXWZcGL5AusKeKa4cy4oDg/fV/Fk
         defm/qahlAD2yyj4dQj+1V8odc/5yBXjd7cF5+cDsAh6KMl8pUA8A5XuovHKf1LFSZZR
         RCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726400; x=1745331200;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=;
        b=WMMOMxiL3e33gtcq9nDw3y8Egwc1OOrb73KGm4wdpQ/W1yYR12IOTnxG2Fv/6+J0G5
         7AixGAnOg0dCr9YL61d3Yb9neHwXzNCXJli6AisalsIM6/bnfb/QhpKBkRzIsodZsX9S
         V9fduiXB0V39dBaTqWMmBN+vlYLib0AWSI1xpHR68w0WZjv8YRxDsFEKvlLX+JcF9oFs
         bcH/UViGKeq0tqQ1JD9VFFpNj68SPR6hty/TjfZQq2rqudrAysmGD3ljYStO/DMwqgBl
         RuGywQVxJrIbF0rpB6EblplTNoLcvID+F7atJkPdK99JbMFMRrlS+EH0ZFWEyvu6C6tj
         e+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTYOmOI9Rq5+/8wK1NG2eYdr1NvbNRTDFBcbos8ZG68C82B88m0rqsIuXJiG5V9kySdy7HXztVaKrupM1T2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBMYKhs8E05aAVWyVA6sKamxw5jVMHPUo/+2tQYZTQeRmk8wNz
	j3zpMOU207YA3Pdb/f92ecIvXC2pW4KDIssbjWOB27KvhbSKpoX/xIxua5+8Nms=
X-Gm-Gg: ASbGncuRA/0Uu25XiCy/F+xMfsSr06iRPtPZxCnkZWO27JF/4XKwDeWzdWGKkStxXK+
	BWUz/PsZ9KkW5LYJCDlM0g9GQHLiCBHolXifgwIjgKrLeOPLl9I/ozignFUD37T4jATGRZXrx+7
	sd9LByISIPf3H5C1StyZzfG+8kq9z82b4sIyQO3kPszD657QPb1ouqb036XszU0I1RvN9Nu4eCN
	k0WclH+VRyqxIlN/AGnb1DrYJHWwTvT6PGWFDA2N/VnX5UmyVHdeTFVLGOfA5iVQ0LUhrNTr36j
	chRyOiwPl5g9vUY6nm+1toeA6AX2OxRoKRHsSfeQfAiWH0J6N0Ter1FY3674HH+GaRfoozXt
X-Google-Smtp-Source: AGHT+IHJqCY80YdOi+QlRhbGQ2nBFJTmvFU9QJ/edLr9k+dp/3F0x7XFYeygRdayk8s5vjatDuOCHg==
X-Received: by 2002:a05:6000:1aca:b0:39a:ca59:a626 with SMTP id ffacd0b85a97d-39ea5211c2amr13165981f8f.28.1744726399630;
        Tue, 15 Apr 2025 07:13:19 -0700 (PDT)
Received: from [10.1.5.76] (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm205220905e9.31.2025.04.15.07.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:13:19 -0700 (PDT)
Message-ID: <1ed38e6b-8d43-4cbc-9c27-58ec3c0e4dbc@baylibre.com>
Date: Tue, 15 Apr 2025 16:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
From: Alexandre Mergnat <amergnat@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
 <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
 <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Content-Language: en-US
In-Reply-To: <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_071322_067250_078F9D99 
X-CRM114-Status: GOOD (  31.01  )
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

Hi Angelo,

Gentle ping

Let me shortly summarize my problem: I see the panel driver sending commands to the display before 
it is ready. My approach to prevent that is to delay sending commands until bridge enable. Your 
concern was that during the panel's .prepare() the panel driver should already be able to send 
commands through the bridge. Can you please clarify what you think should be the approach to fix that?

Regards,
Alexandre

On 21/03/2025 10:19, Alexandre Mergnat wrote:
> Hi Angelo,
> Thanks for the fast feedback :)
> 
> On 20/03/2025 13:37, AngeloGioacchino Del Regno wrote:
>> Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
>>> Currently, the panel set power, set gpio and enable the display link
>>> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
>>> panel_bridge_atomic_pre_enable, pointed by
>>> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
>>> atomic_pre_enable must not enable the display link
>>>
>>> Since the DSI driver is properly inited by the DRM, the panel try to
>>> communicate with the panel before DSI is powered on.
>>>
>>
>> The panel driver shall still be able to send commands in the .prepare() callback
>> and if this is not happening anymore... well, there's a problem!
> 
> Sorry I don't think so, according to that def:
>      /**
>       * @pre_enable:
>       *
>       * This callback should enable the bridge. It is called right before
>       * the preceding element in the display pipe is enabled. If the
>       * preceding element is a bridge this means it's called before that
>       * bridge's @pre_enable function. If the preceding element is a
>       * &drm_encoder it's called right before the encoder's
>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>       * &drm_encoder_helper_funcs.dpms hook.
>       *
>       * The display pipe (i.e. clocks and timing signals) feeding this bridge
>       * will not yet be running when this callback is called. The bridge must
>       * not enable the display link feeding the next bridge in the chain (if
>       * there is one) when this callback is called.
>       *
>       * The @pre_enable callback is optional.
>       *
>       * NOTE:
>       *
>       * This is deprecated, do not use!
>       * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
>       */
>      void (*pre_enable)(struct drm_bridge *bridge);
> 
>      /**
>       * @enable:
>       *
>       * This callback should enable the bridge. It is called right after
>       * the preceding element in the display pipe is enabled. If the
>       * preceding element is a bridge this means it's called after that
>       * bridge's @enable function. If the preceding element is a
>       * &drm_encoder it's called right after the encoder's
>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>       * &drm_encoder_helper_funcs.dpms hook.
>       *
>       * The bridge can assume that the display pipe (i.e. clocks and timing
>       * signals) feeding it is running when this callback is called. This
>       * callback must enable the display link feeding the next bridge in the
>       * chain if there is one.
>       *
>       * The @enable callback is optional.
>       *
>       * NOTE:
>       *
>       * This is deprecated, do not use!
>       * New drivers shall use &drm_bridge_funcs.atomic_enable.
>       */
>      void (*enable)(struct drm_bridge *bridge);
> 
> => "The bridge must not enable the display link feeding the next bridge in the
> => chain (if there is one) when this callback is called."
> 
> Additionally, you ask for something impossible because here is the init order
> fixed by the framework:
> 
> [   10.753139] panel_bridge_atomic_pre_enable
> [   10.963505] mtk_dsi_bridge_atomic_pre_enable
> [   10.963518] mtk_dsi_bridge_atomic_enable
> [   10.963527] panel_bridge_atomic_enable
> [   10.963532] drm_panel_enable
> 
> If panel want to use the DSI link in panel_bridge_atomic_pre_enable, nothing
> will happen and  you will get a timeout.
> 
> So, IMHO, this patch make sense.
> 
>>
>>> To solve that, use stk_panel_enable to enable the display link because
>>> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
>>> on the DSI.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c 
>>> b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> index c0c95355b7435..bc3c4038bf4f5 100644
>>> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>       gpiod_set_value(stk->enable_gpio, 1);
>>>       mdelay(20);
>>>       gpiod_set_value(stk->reset_gpio, 1);
>>> -    mdelay(10);
>>> -    ret = stk_panel_init(stk);
>>> -    if (ret < 0)
>>> -        goto poweroff;
>>
>> Also, you're moving both init and set_display_on to the enable callback...
>> this is suboptimal.
>>
>> You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
>> should have a .enable() callback that calls DISP ON, a .disable() callback that
>> calls DISP OFF, and .unprepare() that turns everything off.
> 
> This is not what I understand from the pre_enable's definition above, and also
> the function call order by the framework. :)
> 
>>
>> Cheers,
>> Angelo
>>
>>> -
>>> -    ret = stk_panel_on(stk);
>>> -    if (ret < 0)
>>> -        goto poweroff;
>>>       return 0;
>>> -poweroff:
>>> -    regulator_disable(stk->supplies[POWER].consumer);
>>>   iovccoff:
>>>       regulator_disable(stk->supplies[IOVCC].consumer);
>>>       gpiod_set_value(stk->reset_gpio, 0);
>>> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>       return ret;
>>>   }
>>> +static int stk_panel_enable(struct drm_panel *panel)
>>> +{
>>> +    struct stk_panel *stk = to_stk_panel(panel);
>>> +    int ret;
>>> +
>>> +    ret = stk_panel_init(stk);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = stk_panel_on(stk);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static const struct drm_display_mode default_mode = {
>>>           .clock = 163204,
>>>           .hdisplay = 1200,
>>> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>>>   }
>>>   static const struct drm_panel_funcs stk_panel_funcs = {
>>> +    .enable = stk_panel_enable,
>>>       .unprepare = stk_panel_unprepare,
>>>       .prepare = stk_panel_prepare,
>>>       .get_modes = stk_panel_get_modes,
>>>
>>
>>
>>
> 


