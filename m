Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE061098782
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=; b=3HEWAtW3It+30SggpJmXPGAhGl
	EGuBjT2uKSqqRtahsceH2Sh/my0OU0ZxwBI8pkYhY0sWLObeUKTox9CjDE/nEKE8EgrSv9QiQf58J
	iYbcJqVbeQ2X4f7m0yO33iQQmHCVEsbV7TDBHhe7EIqM9NQYnnSzETA8vIRJhHgmtgS1t/uw/ztV1
	RyYpgWfg8ld4tOZ34l6pqEU7YzDlFlPTTdIpZHXF/DpcgiR6qoqfivwD+iRbXmRwdGgS5jLjCwTuG
	S0ANyzMG3FbEN3Kwi5HvPVt2aXkOpKs3SU453ZpYkmJlwekcstbHn1aR8JrhiZJt79cgX7Sz/mmr6
	TBNt2pXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a1D-0000000CrWg-2MfO;
	Fri, 20 Mar 2026 13:36:03 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a19-0000000CrVp-0Ohf
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 13:36:01 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-40ede943bf0so304070fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774013756; x=1774618556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=;
        b=qAcC7XsKkFlz2ClXlvAo7agpXXN3WzghrjzZHFpA0ePE8TQY56spXh5naORaFe5Vx9
         8ligVVbeYYn6/lPrIfohpQ9NnF5293igzWL6g3pa0OhQRhS+d+vC1xiL0153piShME03
         OuZh0FHHdnXTOHal2GYzxYhdpPVcMh6Eqhx0+upscDtGgeHikuabKDeS83L4tDOM6OCl
         OscQfSBE98z0LsCrrpd+Q3FK74HTDoKxPYrU0CJAOi+Zw/iEYHE1TAdNE8AYonrSEeQ8
         LpgBCRzLnaAN/1hzTNdpqz68x60txpEes1egRx5CN0gEab3xs+/qydonUeNuolrAsJ4n
         ZdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013756; x=1774618556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk5S/NjC4u0xUL6oomLxP9g3uOp7kISttmV1Dk/7kAk=;
        b=raiJbDkMn2BB7WDuXeMxfKJNc6VZ9GNEjB8gihl0Fm5D0x+jHU0j1+5ASGg1L8lp7y
         9Z19kvaCzFYqXa6DYcW1rU3mKId0JAGc7fWqVYuXn+tz2b9dp75O81HgJ/aRy3cSdswb
         FTH2KUxg0mHeAPnVnx9ZEmdBz8CzElPWbrbD+rY3oFktMuDFOhtUMIF1R4YcV+f/bi8o
         zdCkcts2zveQ6c0/uMMUxF8kT9648jp7nHM9XDc1mBMDzoZgbutX8kLiUW7/iURuZwGv
         0sZQBQT+ND5R/E8bg9miv6pL8iG1heUom9t//nyIQikbcjYC9y1kO/7Qzf8/513Oe81E
         Af+w==
X-Forwarded-Encrypted: i=1; AJvYcCVDU6tdRuGT5RTFor80xTcqGr9ImhLX00Sj8/YAJtCEAo8N9CeZX8POIy5yhoieyI30BZRPA55ZIBRKEhNgFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwek7czTw/aeze5DPAyZ0zFMoI+uu94jmBcDi5cglUK7vSRUVf
	Me9u9hHPOXz+/YYd4mhLEs8NnjsaNLnxv6d59UpEMVeTThjw9G6JYGfztT2avwCm+y8=
X-Gm-Gg: ATEYQzyCmWvtMfW3GIppjaPQv5E6eXx8FntG4z7jo9U4Bs74Acu7g8VzrETNXiBK6Yq
	1OqYxXB9K6ID6+rg6MMi6L06ccawN/qV7mmXROzYX/3/CcvlSFvkYvDOel3Es2ZAZGKUIMuSi5q
	xR7x8AW7+SogVicpQGaoLR3vCTvKGptuiA7wX0p6+jQVcOogC1Uu3aG01Iy8ISBRhI3dSr3BOgM
	an9MnfKDovMAbDzWlSZXsMAnQZBZDIJaYdCKiVQMrx7UHCDarK9mjvfoDARykjfwt4jUthewdli
	j97wQuJJfb2G7jDNFWZOuwnoLSwGUzAZqvRNATmm6kFO7H5XF2kvSLhYtgPJIqMYb1jMKN/2v3A
	brQN8VrDMonmGoSdYfHWTZkV3D+7yO209d1BLn5E6xY0u/UDcmLzUTDGSiZVkPvJ6OCoj/K32e0
	rqIqqE3Q/rbSQbUuYkoTk3Ct+2ZS8DcOcovoeSVtcb1wkwbHm9/Nmcf1VgFJsVSyKuAkxFgpc=
X-Received: by 2002:a05:6870:e9aa:b0:417:23f2:6d77 with SMTP id 586e51a60fabf-41c10fd1b74mr1962084fac.16.1774013755741;
        Fri, 20 Mar 2026 06:35:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6a3c:6fc:3be2:208d? ([2600:8803:e7e4:500:6a3c:6fc:3be2:208d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c1497485esm2142629fac.8.2026.03.20.06.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:35:55 -0700 (PDT)
Message-ID: <9124e760-6e9e-4621-b684-071dbb271635@baylibre.com>
Date: Fri, 20 Mar 2026 08:35:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
 <c2618423-2466-47bb-a8cf-7c849e7e231e@baylibre.com>
 <7d1e52c0b9c3a6d30e9db617b9bcfa23ed9046b5.camel@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7d1e52c0b9c3a6d30e9db617b9bcfa23ed9046b5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_063600_163469_D1014060 
X-CRM114-Status: GOOD (  31.21  )
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

On 3/20/26 7:37 AM, Louis-Alexis Eyraud wrote:
> Hi David,
> 
> On Thu, 2026-03-12 at 19:26 -0500, David Lechner wrote:
>> On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
>>> Add support for MediaTek MT8189 SoC and its variants, and a device-
>>> tree
>>> for the basic hardware enablement of the Genio 720-EVK board, based
>>> on
>>> MT8391 SoC.
>>>
>>
>> ...
>>
>>> +	mmc0_default_pins: mmc0-default-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
>>> +			drive-strength = <6>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
>>> +				
>>> <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
>>> +				
>>> <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
>>> +				
>>> <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
>>> +				
>>> <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
>>> +				
>>> <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
>>> +				
>>> <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
>>> +				
>>> <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
>>> +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <6>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>
>> Should we also have pins-ds here to match mmc0-uhs-pins?
>>
> The data strobe pin is only used for the HS modes, that is why it is
> only declared for uhs state.
> No other mediatek board devicetrees have it for default state too, so I
> don't think it is needed here.
> 
>>> +
>>> +		pins-rst {
>>> +			pinmux =
>>> <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
>>> +			drive-strength = <6>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>>> +		};
>>> +	};
>>> +
>>> +	mmc0_uhs_pins: mmc0-uhs-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
>>> +			drive-strength = <8>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
>>> +				
>>> <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
>>> +				
>>> <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
>>> +				
>>> <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
>>> +				
>>> <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
>>> +				
>>> <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
>>> +				
>>> <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
>>> +				
>>> <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
>>> +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <8>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>> +
>>> +		pins-ds {
>>> +			pinmux = <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
>>> +			drive-strength = <8>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-rst {
>>> +			pinmux =
>>> <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>>> +		};
>>> +	};
>>> +
>>> +	mmc1_default_pins: mmc1-default-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
>>> +			drive-strength = <6>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
>>> +				
>>> <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
>>> +				
>>> <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
>>> +				
>>> <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
>>> +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <6>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>> +
>>> +		pins-insert {
>>> +			pinmux = <PINMUX_GPIO2__FUNC_GPIO2>;
>>> +			bias-pull-up;
>>> +		};
>>> +	};
>>> +
>>> +	mmc1_uhs_pins: mmc1-uhs-pins {
>>> +		pins-clk {
>>> +			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
>>> +			drive-strength = <8>;
>>> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>> +		};
>>> +
>>> +		pins-cmd-dat {
>>> +			pinmux =
>>> <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
>>> +				
>>> <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
>>> +				
>>> <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
>>> +				
>>> <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
>>> +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
>>> +			input-enable;
>>> +			drive-strength = <8>;
>>> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>> +		};
>>
>> Don't we also need pins-insert here? (to match mmc1-default-pins)
>>
> From what I've found, it was done this way for other board devicetrees
> to avoid possible reconfiguration happen for the card detection pin
> while switching to UHS and causing a switch failure.
> Also, what you declare in pinmux nodes is how the pin configuration
> should change in a specific mode and you declare only what changes, and
> not what stay the same.
> 
>> I was having trouble with the CD input pin not working in U-Boot
>> until I added it.
> I checked and debugged this on my board and did not get that kind of
> issue, whether this pin config is not present for uhs state or if I add
> it. 
> When inserting my sd card or when I boot with it already inserted, the
> mtk-sd driver first sets the pinctrl state to default before switching
> to ufs. The GPIO02 pin config is also OK in both states.
> The mt8189 pinctrl driver seems to apply a default config for this pin
> that is the same as the one that is set here.
> 
> There might be u-boot particularities that could explain it fixes your
> issue.
> 
> Regards,
> Louis-Alexis
>>
>>> +	};
>>> +

Thanks for having a look at this and taking the time to explain. I will
see what I can do to fix it in U-Boot.


