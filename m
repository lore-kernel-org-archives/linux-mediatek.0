Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8481FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzaHht7C/yaf/hnRAYzcOCnlpLTocgudm9vAayanTsY=; b=4N2AJtpttMcO/+F0UPmOv1nXvI
	bq+Ort5UUOsX7rw4eFos46tw+TqP1KpViaRYb+iyyT0JhbF/Op2V2665SlniGL3FuCZu8bBPjFnQQ
	M5IicstNCV1clAA71BMpeSgIGjPsTPfs1KrqzJYvuGDnDAnbt7fyUyMrBEIFl4eXvYILwcpk2VDS1
	ioLQrqP9x34a6d40KbB8LGEl3YHT9f+DLW/Maxl/yWK96jF59aqNQdjA2egCZYCW5kBvh0sHqYeNv
	HmoK4iEWgFP8kmhjsC/0ycUhBuKJuOao1v3mTaaBCrEmz+6YKRdAqZC8C90+ZEGCsSQrBNRC0P7yu
	6mf/jBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcUg6-00E7t9-0u;
	Wed, 15 Mar 2023 17:12:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcUg2-00E7rT-01
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 17:12:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v16so18034312wrn.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678900353;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FzaHht7C/yaf/hnRAYzcOCnlpLTocgudm9vAayanTsY=;
        b=wmQ+cp4gPZXYCM5yoB7sWyCUlpyvPM4e1IGgMSdoQXYN5oG0LqwzsBqfaH/GSGvcAb
         ES9vL5J87JwjUTPpo6eFWBzlWHNOon+BpDIyQD798y1tY8GPdTLRqaDqxOX2ntuFx1rG
         EZLtrGV5tD3W7hs5I43pmZxx0he0nSLnr/E5y4AuDNLRYy0PYpCqgDZueJGhk4wQdUMz
         OiHKRFGGmDDn6GHDkk3QbMKj0GeH76Y4sDJhJsuPGZu3qsFDJyuP2Obh0NRtgwNVcmLU
         AK87OI4qtUD81bELg8C9Pr4+Nv/+c4cy7uMy1MbXr4lN45c6QEM+HkY2VqxBoijXvSS8
         TeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900353;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzaHht7C/yaf/hnRAYzcOCnlpLTocgudm9vAayanTsY=;
        b=1RJO3GMW8dLgFx8CVLi0T/o/ADoMBH47TbZv39jNHW5pwYOEQGIiAiLILu5BbFSdfy
         CytmMaRrLz9PFR+6q+1yCFjpioxx4VyB6Ad4qBq5j/wpLe7DLRlqxQ/wF8nVmrHSwQTv
         JEqJLL2Eg/o+X8xwqK6lKKpiPlEFuZzfvANFhQbZzoUL9I3VU1Cb+YIMeVLmTw1mvaqA
         1ba899OPwjQ7GLZe7NtTPvyQkuI+6JzY4dIlxoM9eEXnA3JajLK1lFDS/WSEGUwRiWIb
         mWwlHklfMs94olQYa7RWZ+cwCETIMjuXv7faY/KHsHUi8FiWvQW0p9Nvr6Q6i6rZP9fT
         hyrA==
X-Gm-Message-State: AO0yUKUcyHYHThYZc06vraPGDFApzpfg+9aVhASV9/hAaPgcPpyxdNIW
	ZzCUuS8NFw4fR5DSrSXagqhn3A==
X-Google-Smtp-Source: AK7set9i2/U3sGBpJsJyNrtAlPwSV8R/C0OdwZ8ZO0Qx5Hq/aD8kDRHCucxcOyP9OoigE3Bk2lLbkw==
X-Received: by 2002:adf:dfd0:0:b0:2ce:a703:1937 with SMTP id q16-20020adfdfd0000000b002cea7031937mr2521046wrn.50.1678900353430;
        Wed, 15 Mar 2023 10:12:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7? ([2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b002be5bdbe40csm5119855wry.27.2023.03.15.10.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 10:12:32 -0700 (PDT)
Message-ID: <39fccf61-2e48-abcf-9fd9-7bcc6ea32774@linaro.org>
Date: Wed, 15 Mar 2023 18:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 21/21] panel: startek-kd070fhfid015: add support of this
 display
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-21-45cbc68e188b@baylibre.com>
 <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
 <CAFGrd9pQJWYpdruUvbZNcQRZk5viyOAUCDpJcu5anA13E26Unw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFGrd9pQJWYpdruUvbZNcQRZk5viyOAUCDpJcu5anA13E26Unw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_101238_040906_5C4A9530 
X-CRM114-Status: GOOD (  17.47  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 15/03/2023 16:59, Alexandre Mergnat wrote:
> Hi Neil,
> 
> Le jeu. 9 mars 2023 à 15:51, Neil Armstrong
> <neil.armstrong@linaro.org> a écrit :
>>> +
>>> +#include <drm/drm_crtc.h>
>>
>> Is this include needed ?
> 
> Seems not, I remove it.
> 
>>> +     struct gpio_desc *enable_gpio;
>>> +     struct gpio_desc *reset_gpio;
>>> +     struct gpio_desc *dcdc_en_gpio;
>>
>> Isn't this "DCDC" a regulator ???
> 
> According to the panel datasheet, this is an input signal needed
> passing through TFT connector (PIN30):
> "Power IC supply enable, High active"

Ack, perhaps the name isn't the right one, or specify something like panel-dcdc.

> 
>>> +     /* Interface setting, video mode */
>>> +     ret = mipi_dsi_generic_write(dsi,
>>> +                     (u8[]){DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00}, 6);
>>> +     if (ret < 0) {
>>> +             dev_err(dev, "failed to set display interface setting: %d\n",
>>> +                     ret);
>>> +             return ret;
>>> +     }
>>
>> Use mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00); instead,
>> it's simpler and doesn't need explicit return check.
> 
> "mipi_dsi_generic_write_seq" doesn't exist but I will add it below
> "mipi_dsi_dcs_write_seq" in drm_mipi_dsi.h

It is now https://github.com/torvalds/linux/blob/master/include/drm/drm_mipi_dsi.h#L302 since a9015ce59320

> I must keep the return check to jump out of "stk_panel_init" if
> something goes wrong, but I can drop the error print.

The mipi_dsi_generic_write_seq & mipi_dsi_dcs_write_seq macros does the return check for free.

> 
>>> +static int stk_panel_enable(struct drm_panel *panel)
>>> +{
>>> +     struct stk_panel *stk = to_stk_panel(panel);
>>> +
>>> +     if (stk->enabled)
>>> +             return 0;
>>> +
>>> +     backlight_enable(stk->backlight);
>>> +
>>> +     stk->enabled = true;
>>> +
>>> +     return 0;
>>> +}
>>
>> Is this really needed ? the backlight core will enable it automatically.
> 
> Ok, it's managed by drm_panel.c driver.
> Then I can also remove stuff from stk_panel_disable.
> 
> 
> Regards,
> Alex


