Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AE4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqMvyew1VuvLR+5MrHi+CVRR54Ec9Hg3AWm5Uzuvhkk=; b=YeoqNGDldL8WnIk4Kgy7E9zBJ8
	RIPWXU1vrtZv3qTEbO5MHJvq4oR3lkHj27U+AUQMcV4oDHhrytlRs/ZvS6tbP9Kg9rHW8HvoGvfu4
	hlbFn+LBlEQv65gTuMDDk7Q1iShkskWpd/r9JSUMXCMku8e/601ueuRJvHuYwCO+Wb6Cy67UperUH
	TEwCYhHYNoRBgduzmJjcMrPwxdhQ04JxVVdtv+BtjxZT+Cg8lXizFCYGf1KE9/3EkhRcVOPxWFvgw
	9sQ7YS11hbvjEHaCtJVW8Couhlte7stSZP4xxM5wyHjb8ggs6IAUPI91fTKgyy21afvYqnvLRr/Tx
	fGCVIxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8Kx-00FoZN-K4; Thu, 23 Feb 2023 09:56:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8Kd-00FoMk-6g
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 09:56:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id v3so10108631wrp.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqMvyew1VuvLR+5MrHi+CVRR54Ec9Hg3AWm5Uzuvhkk=;
        b=y7DPYrkGk9xCwkGpaQAeXdWfCjSmojs2x7UvFOZ+JGW+Um8i0jZjaVS/JoDxV3yUZ0
         r2mzgdIy6vEOoh0l3o6m0w1lKsOZgXuQqbdwACzgM/m1DpSE+5//S4EF3vj81Dbd1bLm
         O4drKYRElSQ+HYorlA1n5JY9qwn/cNvnG0dTpi7UPGpPhIeDGCGUamJ8HfxuemB1tIsZ
         5NptNCmJtIF7INhKAxupGcRrEHkhAFbInzl5ei9Zqhy18pNNqLHEl5mIWMHcxWTaF7TL
         Lpib0IIgJrbiFYLDfpwk8fax+5qTX5rFXQOM1RvNC/rEYzOahY/lMrmWjmfm5Iwh/+xS
         BCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqMvyew1VuvLR+5MrHi+CVRR54Ec9Hg3AWm5Uzuvhkk=;
        b=aa/8MGHIx7lkIfmEeIQpTmwHQ1UtI1rTjrmfwvouM17+BOTU1fMbgymgJBwLedvKg0
         lNX+/cdkt1IOigV2Snj7l9SjtDLcFyzjT10ouEBQt5vA92N7kvtJv2+8GibHJEX11wIn
         1eh/5D15p8Yq4Vh+7uEiWNX3B3p7ApWvAdcWaoV/1cKRM7AuDhXQLnGIFSPKnVNIbghj
         cYGaE+PLEUVSWKkFpQlLqLEbOK7RTFVRd6k2iY6N8lHft+uoDWzVz+bugbO1KBaoHWlQ
         kZ8dG0ImiHwDKYIHF20re8dwVlJhJzxilUqWgt1jEA7LVLme8a7QrAqRgEikRaL1lejX
         0/GA==
X-Gm-Message-State: AO0yUKWecboo/XZsOVQy/vSDwTM6QPHw+CGTmE/tCS78Ge/Tqe2b/ZuV
	WH7IOCd8sdYt9+Oun6fTccEiuw==
X-Google-Smtp-Source: AK7set9wKGyiCs4mhXfwoAzjxI0hINeis8DMPCt/2knY34phjllU4IYlzLKUeg8KQ1/3trkYX25LXw==
X-Received: by 2002:a5d:4806:0:b0:2c5:5a68:958 with SMTP id l6-20020a5d4806000000b002c55a680958mr10075206wrq.33.1677146164810;
        Thu, 23 Feb 2023 01:56:04 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c265:a8c7:c71d:6e47? ([2a05:6e02:1041:c10:c265:a8c7:c71d:6e47])
        by smtp.googlemail.com with ESMTPSA id u4-20020adfed44000000b002c706c754fesm6399145wro.32.2023.02.23.01.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:56:04 -0800 (PST)
Message-ID: <2b843912-cc9b-f1ac-1f81-28e3ecf8daba@linaro.org>
Date: Thu, 23 Feb 2023 10:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal
 zone structure field
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Balsam CHIHI <bchihi@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ido Schimmel <idosch@nvidia.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-7-daniel.lezcano@linaro.org>
 <CAJZ5v0gTmi7ZeDDdHWGWju4m3bv2366oVqSP1dGOT+3jLV-jaw@mail.gmail.com>
 <0889767f-d187-0cb4-895e-c149517b6636@linaro.org>
 <CAJZ5v0h=UCOyJ88UgEdqch4NZK+DaT8jWnDaguQGNx-KOMhPPA@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAJZ5v0h=UCOyJ88UgEdqch4NZK+DaT8jWnDaguQGNx-KOMhPPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_015607_262010_42B75653 
X-CRM114-Status: GOOD (  21.54  )
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

On 22/02/2023 21:06, Rafael J. Wysocki wrote:
> On Wed, Feb 22, 2023 at 9:00 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On 22/02/2023 20:43, Rafael J. Wysocki wrote:
>>> On Tue, Feb 21, 2023 at 7:07 PM Daniel Lezcano
>>> <daniel.lezcano@linaro.org> wrote:
>>>>
>>>> Some drivers are directly using the thermal zone's 'device' structure
>>>> field.
>>>>
>>>> Use the driver device pointer instead of the thermal zone device when
>>>> it is available.
>>>>
>>>> Remove the traces when they are duplicate with the traces in the core
>>>> code.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS
>>>> ---
>>
>> [ ... ]
>>
>>>>           thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
>>>>
>>>> -       dev_dbg(&data->ti_thermal->device, "updated thermal zone %s\n",
>>>> +       dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
>>>>                   data->ti_thermal->type);
>>>
>>> The code before the change is more consistent, because it refers to
>>> the same object in both instances.
>>>
>>> It looks like a type field accessor is needed, eg. thermal_zone_device_type()?
>>>
>>> Or move the debug message to thermal_zone_device_update()?
>>
>> Actually it is done on purpose because the patch 9 replaces the accesses
>> to 'type' by 'id', the thermal_zone_device_type() accessor won't be needed.
> 
> Cool.
> 
> However, this is a change in behavior (albeit small) which doesn't
> appear to be necessary.
> 
> What would be wrong with having a tz->type accessor too?

I can add the 'type' accessor but from my point of view it is not 
correct because the information belongs to the thermal framework and it 
is used to export the information in the sysfs which is along with the 
directory name giving the id of the thermal zone.

Actually, the useful information is the id of the thermal zone, not the 
type. This one can be duplicate, for instance:

cat /sys/class/thermal/thermal_zone*/type
acpitz
acpitz

Given there are few places where 'type' is used in the drivers, I prefer 
to directly change that to 'id' in the next patch instead of creating 
the accessor for 'type', then send another series removing it.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


