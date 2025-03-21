Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA233C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWnR5bCtS2OFl6qMZ2T0dze3z5cvO0emTkA11CaAm0I=; b=g2ZHrp3fGxLR2BzqS7uCcpkIZo
	XB3o+EhBU2Vh5nJzdZ8YLnk+KHU9qKyUBpQvfT/gsClBcYjOP5rmpnqwSjf+yzRG0OfyK1kkMKRei
	uDLomloEIXyadRcoqBHOa2T4MzB8JAM0taYTWTknXdUN8ctXnbsvzGH9MOlI42wlhEiaSVeRADSwq
	/O20E7bVvtchfAhumxWDYsW0RDePCMb2vppc0y2N0OfJyiOpvYUkIPoYB/WyXaOo1V2YNJVF1EEmN
	ilDN57yrMmUUAkePpjAIK5ryXwE7q//d9QGedNrfQdnvUgXIwI7OxpevC3A/wotUPd5ujUKJbIzpc
	KN4Fx5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYXd-0000000ELpq-3G6J;
	Fri, 21 Mar 2025 09:19:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYXZ-0000000ELoZ-3vG3
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 09:19:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d0618746bso11673295e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742548784; x=1743153584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWnR5bCtS2OFl6qMZ2T0dze3z5cvO0emTkA11CaAm0I=;
        b=tmcLyIn85/VkIeIhfpvZoRL2Q7lo7l3+HHwBEcDmh8EPYvbnvfo7G3/Ssp56vBXmwE
         NHnXtgBdUy+yt5aOMgrr4F99I29wnp7mVL5CXCOGd0URXW/FCzSzmeDiZATqcao2CDHG
         ys9VGogMx/QyOiVKDn/XADzkl4kjicrH8Q221OYigIe7mvLqdUicMrzSmq1qKr7R3Xaz
         JwpulB8UY251jkXo90dCXnwnIzH9cdfhJJ0Ww3v/kQpOpagRx+pKXXBMxe3muK3UAC3d
         TLDtCc8AsSC947ItEXMc+H7PQ3HXvbha3siJNdx2slWzg2WFewnEguEdRVPSsuSlWT4K
         QUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742548784; x=1743153584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWnR5bCtS2OFl6qMZ2T0dze3z5cvO0emTkA11CaAm0I=;
        b=ed1buo9i28qO9aIYMUeHJ45Tv7Qcs6VTCy50DMzD3ujEXTSc1yxNpfM/EX3adi/MHg
         o3cZiPxiESju4K5v6xs77qTfXUJEHxho1e0OMEB5D4igvaklDTJGyuB1ZQdGBuh68y4e
         nb/2BYYGUjME3QNPeFOJMMNdkT9uztyzc3i2Ggmv1T5deCUTp069uBB5HlG8OlrbOHSR
         qFsJ0MHZXQPdoWW7egRDRNQxktW91ybY306QFh5S0M0desS6Ju258bx5NL+3TgKMSZIG
         xOO/tKwJbXRI0/iXWk6QvcbN2MAjjPNcMM7/uq6w6GbebI1f5VihKlHjdIabCDWeZ9is
         t8tw==
X-Forwarded-Encrypted: i=1; AJvYcCWjv/jyMofr8wUAr/b7oZNLCz6mxerJYl5uFXx0PdNfLShtaW1UbGhQvdVaQKzIzMAu+7NN91OyNDeGCR/grA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0YEvtHAAzgoHNeyfcNntpZjkpiUlpf5Ea++axGuKLGat/erBO
	Oxq6+XGu8OAqgL4cuKUsQ3eMrezPPs729VmdakYzX+GpSOuFP2Ow36t7rZtf3uU=
X-Gm-Gg: ASbGnctTw85VFHPh1OG+tUheplfc2y8BAl/VTPhKG1fM0l2ZxoYus3/qaKx1hBq8SV3
	vGHpMyraPuXdsE4Q5a5TdyXnwlMDV9VqIEhZ3RfQeXtjDiRflF3ol6iQ2NitoFe2yrA0oX/Temh
	F/uqKnq7ONx8F/QqDgiWHoLPwDfRniBQOrz82UUKp3HFqMtvSCu7nVX77I1aqF/KlgNADn4UGzh
	bQt4jbiApauGXQJo7XnqLfghJ9pAYuvQ6jaF8b6UaiYAkMLy6hv4kujthUdoxbcVlRwksFKUNKY
	E+fAe6/xENaSf5+/FUufbgwJKiqgPypvFZGLZA2O39EnKAnFZScCmszCk6kE8FjcwQBTf40LTLG
	mc8Ot6Hha9xTVcFIj
X-Google-Smtp-Source: AGHT+IGb4qaiD8zveCmbngoPFmfN9WpLcjDxkx7ItZuEiKJ1uCoRacXpzZp0WPeOAWRPRphRbr45pg==
X-Received: by 2002:a05:600c:1e18:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d509f64b8mr23766545e9.18.1742548783913;
        Fri, 21 Mar 2025 02:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2756:9ecd:3e82:43c7? ([2a01:e0a:5ee:79d0:2756:9ecd:3e82:43c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fceae03sm21916245e9.8.2025.03.21.02.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:19:43 -0700 (PDT)
Message-ID: <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Date: Fri, 21 Mar 2025 10:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
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
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_021946_205686_A86BBF74 
X-CRM114-Status: GOOD (  26.98  )
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
Thanks for the fast feedback :)

On 20/03/2025 13:37, AngeloGioacchino Del Regno wrote:
> Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
>> Currently, the panel set power, set gpio and enable the display link
>> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
>> panel_bridge_atomic_pre_enable, pointed by
>> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
>> atomic_pre_enable must not enable the display link
>>
>> Since the DSI driver is properly inited by the DRM, the panel try to
>> communicate with the panel before DSI is powered on.
>>
> 
> The panel driver shall still be able to send commands in the .prepare() callback
> and if this is not happening anymore... well, there's a problem!

Sorry I don't think so, according to that def:
	/**
	 * @pre_enable:
	 *
	 * This callback should enable the bridge. It is called right before
	 * the preceding element in the display pipe is enabled. If the
	 * preceding element is a bridge this means it's called before that
	 * bridge's @pre_enable function. If the preceding element is a
	 * &drm_encoder it's called right before the encoder's
	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
	 * &drm_encoder_helper_funcs.dpms hook.
	 *
	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
	 * will not yet be running when this callback is called. The bridge must
	 * not enable the display link feeding the next bridge in the chain (if
	 * there is one) when this callback is called.
	 *
	 * The @pre_enable callback is optional.
	 *
	 * NOTE:
	 *
	 * This is deprecated, do not use!
	 * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
	 */
	void (*pre_enable)(struct drm_bridge *bridge);

	/**
	 * @enable:
	 *
	 * This callback should enable the bridge. It is called right after
	 * the preceding element in the display pipe is enabled. If the
	 * preceding element is a bridge this means it's called after that
	 * bridge's @enable function. If the preceding element is a
	 * &drm_encoder it's called right after the encoder's
	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
	 * &drm_encoder_helper_funcs.dpms hook.
	 *
	 * The bridge can assume that the display pipe (i.e. clocks and timing
	 * signals) feeding it is running when this callback is called. This
	 * callback must enable the display link feeding the next bridge in the
	 * chain if there is one.
	 *
	 * The @enable callback is optional.
	 *
	 * NOTE:
	 *
	 * This is deprecated, do not use!
	 * New drivers shall use &drm_bridge_funcs.atomic_enable.
	 */
	void (*enable)(struct drm_bridge *bridge);

=> "The bridge must not enable the display link feeding the next bridge in the
=> chain (if there is one) when this callback is called."

Additionally, you ask for something impossible because here is the init order
fixed by the framework:

[   10.753139] panel_bridge_atomic_pre_enable
[   10.963505] mtk_dsi_bridge_atomic_pre_enable
[   10.963518] mtk_dsi_bridge_atomic_enable
[   10.963527] panel_bridge_atomic_enable
[   10.963532] drm_panel_enable

If panel want to use the DSI link in panel_bridge_atomic_pre_enable, nothing
will happen and  you will get a timeout.

So, IMHO, this patch make sense.

> 
>> To solve that, use stk_panel_enable to enable the display link because
>> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
>> on the DSI.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c 
>> b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>> index c0c95355b7435..bc3c4038bf4f5 100644
>> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>       gpiod_set_value(stk->enable_gpio, 1);
>>       mdelay(20);
>>       gpiod_set_value(stk->reset_gpio, 1);
>> -    mdelay(10);
>> -    ret = stk_panel_init(stk);
>> -    if (ret < 0)
>> -        goto poweroff;
> 
> Also, you're moving both init and set_display_on to the enable callback...
> this is suboptimal.
> 
> You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
> should have a .enable() callback that calls DISP ON, a .disable() callback that
> calls DISP OFF, and .unprepare() that turns everything off.

This is not what I understand from the pre_enable's definition above, and also
the function call order by the framework. :)

> 
> Cheers,
> Angelo
> 
>> -
>> -    ret = stk_panel_on(stk);
>> -    if (ret < 0)
>> -        goto poweroff;
>>       return 0;
>> -poweroff:
>> -    regulator_disable(stk->supplies[POWER].consumer);
>>   iovccoff:
>>       regulator_disable(stk->supplies[IOVCC].consumer);
>>       gpiod_set_value(stk->reset_gpio, 0);
>> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>       return ret;
>>   }
>> +static int stk_panel_enable(struct drm_panel *panel)
>> +{
>> +    struct stk_panel *stk = to_stk_panel(panel);
>> +    int ret;
>> +
>> +    ret = stk_panel_init(stk);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = stk_panel_on(stk);
>> +
>> +    return ret;
>> +}
>> +
>>   static const struct drm_display_mode default_mode = {
>>           .clock = 163204,
>>           .hdisplay = 1200,
>> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>>   }
>>   static const struct drm_panel_funcs stk_panel_funcs = {
>> +    .enable = stk_panel_enable,
>>       .unprepare = stk_panel_unprepare,
>>       .prepare = stk_panel_prepare,
>>       .get_modes = stk_panel_get_modes,
>>
> 
> 
> 

-- 
Regards,
Alexandre

