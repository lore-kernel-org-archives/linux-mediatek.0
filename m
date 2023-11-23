Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95072C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+47/8CIqHGYdq/sfFIoPGjTRwH4Xn5HRY4OZWTE1ww=; b=PzfuK8WAlreXUeZyZH7OADxNZ+
	xN3NL0siJN4fUjFhWRkJts8my/E0XAmp0wnsyv2VUTsOqKoLK/PCnEQSsTX01m8bzsdmZQ4KjpNzc
	kfyNII8XQjZ17DeER9ZPF/sP6LUSq+0ZPJL8wfbnpzZx1UdiKOyC+LD0xNRyUtI6hwA6n0zwOgi0q
	NTsl+XAdSBgk2oncy8lp68cbySiSGKTnRfl7WOVUY0GiMzuEXrw2MQBgHHFYWZGiA8Vcfv4r8CEtM
	lqYh1VZBshxAPhQc030g9QmUt5IwY27Lev5vXKxxPG3U9s6MB7L2pHI4792VphrtZ4ouGTbbtaqut
	gMPGUtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r65Ae-0049pk-1p;
	Thu, 23 Nov 2023 08:34:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r65Aa-0049nb-0R;
	Thu, 23 Nov 2023 08:34:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-548d60a4d60so770246a12.2;
        Thu, 23 Nov 2023 00:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700728481; x=1701333281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+47/8CIqHGYdq/sfFIoPGjTRwH4Xn5HRY4OZWTE1ww=;
        b=LdasA+IubU1IMCeKjccfQIu993eJhBYg6euZ3SSd4w4hDAcl6H/cqTB8QB0F4PLBb9
         TjELFLbdAUGdXyftuB4/wUa2Pw98bcjX4JP8YEf9pUID9EsV6gzdlFj7zpwB2vsAfypI
         5I7+AYSczZMunNYvmmhkSzAu7rsl26KTeL70q4bdCrXiumSmCvF4rLj5wMKh6LGdLxeC
         3DpcTBrqeDGZCjB0UsCikiiZ9a5TZeVNVVZnNMQDYZL0q81R+skYQuFyo99UV+zTSd4Y
         n4hFwiWZWcfoEhNxJknh/oz33+WV/m0U4zw/criKIy8RmqL/5jz41mtG00Ynlv9XSkJ6
         pL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700728481; x=1701333281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+47/8CIqHGYdq/sfFIoPGjTRwH4Xn5HRY4OZWTE1ww=;
        b=CU+HXPi0aPAswkE66JxLcIvWvblcKSXTkEbTqmR1eDw+cGiSE/sKRtN+l0pd3/n2Y+
         p0ojzL2wWV1WZkcWYKFjSnBsSKfOt9kT6Ds5xHQyp1QNDprBZmsc/tmdl9yaSnPmQ4Rh
         fWF28fIMB5iPjaNF0wfDzBKkHYAdQj14WFTQ4ze0f6/hBm2u57QBNrczYfc4XvK0Q8Xx
         U1a6E4jY5OIjYZaNfPcj7AFV6vBcWVEuDMrshdgyo/abPcBV/YEqHX6BejV8X8oiJ3dp
         dcjK3aN6+WVPuxZGOyG+BWsro6Nr/QNRSXPCf5HeFO1u/98QMjAQMeTCZWIAINdWyWkD
         OFJg==
X-Gm-Message-State: AOJu0Yy6tffAlcDDWY4Rrd9ULPkNcvi6/8ptq0gm5pbiBQl4TNYGj4U3
	BUYAMwdk2KCH3O+DR7fMgz4=
X-Google-Smtp-Source: AGHT+IFNYbN1XOm9KzA7Lq8aiS9svVmcYvh53558Azn026CoMOIdCl33Wf0B1a31MMVckvjtYn4DXA==
X-Received: by 2002:a17:906:c7c5:b0:9e2:bbc4:16cb with SMTP id dc5-20020a170906c7c500b009e2bbc416cbmr3489650ejb.49.1700728480582;
        Thu, 23 Nov 2023 00:34:40 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0f2:3200:59ae:788f:5985:cbec? (dynamic-2a01-0c23-c0f2-3200-59ae-788f-5985-cbec.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:59ae:788f:5985:cbec])
        by smtp.googlemail.com with ESMTPSA id gr19-20020a170906e2d300b009de11bcbbcasm479640ejb.175.2023.11.23.00.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 00:34:40 -0800 (PST)
Message-ID: <266d2141-4615-4fd8-b603-aabb0e6e6860@gmail.com>
Date: Thu, 23 Nov 2023 09:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
 <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
 <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
 <c4c0a79d-4e0a-41c1-89b9-8df71ae6335c@suse.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <c4c0a79d-4e0a-41c1-89b9-8df71ae6335c@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_003444_181334_5F6F23B9 
X-CRM114-Status: GOOD (  15.25  )
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

On 23.11.2023 09:19, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.11.23 um 08:16 schrieb Heiner Kallweit:
>> On 23.11.2023 07:56, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.11.23 um 22:46 schrieb Heiner Kallweit:
>>>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>>>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>>>> Class-based device auto-detection is a legacy mechanism and shouldn't
>>>> be used in new code. So we can remove this class completely now.
>>>>
>>>> Preferably this series should be applied via the i2c tree.
>>>>
>>>> v2:
>>>> - change tag in commit subject of patch 03
>>>> - add ack tags
>>>> v3:
>>>> - fix a compile error in patch 5
>>>> v4:
>>>> - more ack and review tags
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> for the patches that don't already have my r-b.
>>>
>> This refers to which patches of the series?
>> Patches 8, 16, 18 are the remaining ones w/o A-b or R-b.
> 
> I've looked through the patchset. Feel free to add my a-b to patches 1 to 19; except for 2 and 17, which already have my r-b.
> 
> BTW I only received 19 patches. is there a patch 20/20?
> 
Yes, see here:
https://patchwork.ozlabs.org/project/linux-i2c/patch/20231120214624.9378-21-hkallweit1@gmail.com/
If you're subscribed to linux-i2c or linux-kernel list you should have received it.

> Best regards
> Thomas
> 
>>
>>> Best regards
>>> Thomas
>>>
>> Thanks, Heiner
>>
>>>>
>>>> ---
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
>>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
>>>>    drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
>>>>    drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
>>>>    drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
>>>>    drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
>>>>    drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
>>>>    drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
>>>>    drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
>>>>    drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
>>>>    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
>>>>    drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
>>>>    drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
>>>>    drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
>>>>    drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
>>>>    drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
>>>>    drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
>>>>    drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
>>>>    drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
>>>>    drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
>>>>    drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
>>>>    drivers/video/fbdev/core/fb_ddc.c                 |    1 -
>>>>    drivers/video/fbdev/cyber2000fb.c                 |    1 -
>>>>    drivers/video/fbdev/i740fb.c                      |    1 -
>>>>    drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
>>>>    drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
>>>>    drivers/video/fbdev/s3fb.c                        |    1 -
>>>>    drivers/video/fbdev/tdfxfb.c                      |    1 -
>>>>    drivers/video/fbdev/tridentfb.c                   |    1 -
>>>>    drivers/video/fbdev/via/via_i2c.c                 |    1 -
>>>>    include/linux/i2c.h                               |    1 -
>>>>    31 files changed, 9 insertions(+), 47 deletions(-)
>>>
>>
> 


