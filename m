Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC87C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iR1PVTYigSsX/lfBBb8BrTI0Bk6Qcqxklf6J6zVF8SI=; b=d5F1u74Q+hjKXhxPgp3lM0gxTP
	is/PEKY8/EoZAdLu37n1I9FixgYQ9Xgv7iLjRnkw08KFRVGGwJ0HjuY7dTxOTpE0T/LKlWgaczeE8
	xdb1m0eLkVUHiw1408msSi7nEJO1d8ZLx1WzHfXLAz8cGBMVyx6zXbpLcC123AqjvrNjHRQ3ZAWlc
	hrYR6ITCRiBBtm2MpvxJtbpmKWMZswWsybWWowDSBn1rVLH5P8GD9OqJwpLxUaHfDfebdHCaS1M8q
	gCHtqcH0UY6xHpbQdLhbzz3iapoMOGuPHwtKdAUJ7AALGOUcBVkI7pgdv3i8kNaBoesGtGcFxIUeA
	8q8gA1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCmW-00000008ccS-13kB;
	Mon, 18 Mar 2024 13:12:00 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCmS-00000008cbs-1rrf;
	Mon, 18 Mar 2024 13:11:58 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6962950c6bfso1919696d6.2;
        Mon, 18 Mar 2024 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710767515; x=1711372315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iR1PVTYigSsX/lfBBb8BrTI0Bk6Qcqxklf6J6zVF8SI=;
        b=ml2QgdAlc0yDLUXOB7C5j2gqyqE2HwvKbpPnLHMYPLQ0VXRlWsG6ZLRgjBotmPOET3
         2ggRerKheIa3A1TwNaPu9x5PL+EUYYqsdylOpNzG6KtndU5wXFEyI/htTBKZy++9VBoq
         L6Wylb0uW/PvR6fXC9l1aYrzEvUm3Z8ZWY/1sN1nfIM91wOD7VwW8GBeRaj8Xz8LMy6W
         6oWn4uduZMtqE9Xx1cCBFs4zC2g62zNHNgsAB5MxmHfXZAamTbLrp+MdCC9IL1AlcGar
         2ZA9CX9Tus+Hk9eckfqXLtzc1YhQyI0maUAepj1ctb/fAsp5bR5oDGlg6TzFqLjUqcUJ
         3R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767515; x=1711372315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iR1PVTYigSsX/lfBBb8BrTI0Bk6Qcqxklf6J6zVF8SI=;
        b=krsy1QEEEOnb/sfn/39EnDrP3+0tnWze5MKzUFoc49j5Kj2mQ5Rw7nAGxQ4oQDjNb9
         Erj7P0sFDeZWESjbkNvDGM+AqdzwcE6jsVpixq0cnFr+14iVDrLkspI+0Qtr04wVOLlu
         MfbA82b1hS2VXQqGmY1g3tTJHeiBvrg6X4lf2meBMuFQ1IExj9B8OicQgrw7mVr05MM2
         Bgc6UCqyLkMZZiyl3N9qwJrcodBS5zp142xT4ccchLxSvwK9s6DAbN8OhDIWTZN6BHal
         goAbnXelbmX2ZHzRgv6+UjQEMPO51aGrupdgR2uWpVjip1h6Rm39Q/34VRfVryTI3ecO
         ZsDA==
X-Forwarded-Encrypted: i=1; AJvYcCXi7+jlYE93AYpEyt8nSiAchiJr8YTQyfxd4nsJvsO2tQLZ04bdIgCB7CmnxfGoMj8qAkmC5bK3IQCWpUpKPXWadYOWXMW760MLUNeKHcTr8BuAhYfWaDrAM2KS0k6seuei7HQXqHTMpm3p4n4daaU6wTGG0bF06aI=
X-Gm-Message-State: AOJu0YwTBOaFlUvUJWBHHVYcTIN6DstJaV8SoRcdd401BbISOeBoAJJY
	CSO6w+mtnfY6E5IEkeV8g+1OFjTlnhAS2doH0KpevBAAIVoH/jpS
X-Google-Smtp-Source: AGHT+IEyZvLimIql/3umoWPezmAL/scvy5OqI+bhWQ0vzUndpy1LV31gNE1h9DgMDwYY3wJZJqyCsA==
X-Received: by 2002:ad4:550d:0:b0:691:5c3:bdcb with SMTP id pz13-20020ad4550d000000b0069105c3bdcbmr11468009qvb.32.1710767514642;
        Mon, 18 Mar 2024 06:11:54 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 4-20020a0562140dc400b006940b9ec66fsm2381423qvt.82.2024.03.18.06.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 06:11:54 -0700 (PDT)
Message-ID: <85bc49e5-a086-4484-86d2-bc2c3829de87@gmail.com>
Date: Mon, 18 Mar 2024 06:11:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] net: dsa: mt7530: fix enabling EEE on MT7531 switch
 on all boards
Content-Language: en-US
To: arinc.unal@arinc9.com, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <65f7f17d.050a0220.7383e.5eeeSMTPIN_ADDED_BROKEN@mx.google.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 xsDiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyR
 xGlkaOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQ
 X3IzRnWoqlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0E
 AICDzi3l7pmC5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0d
 ZdWX6fqkJJlu9cSDvWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAX
 SAgsrBhcgGl2Rl5gh/jkeA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYc
 nzJJ63ng3tHhnwHXZOu8hL4nqwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbh
 qIWgvr3SIEuR6ayY3f5j0f2ejUMYlYYnKdiHXFlF9uXm1ELrb0YX4GMHz80nRmxvcmlhbiBG
 YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+wmYEExECACYCGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBhV5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS
 6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSDOw00ESM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3
 WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqOvdi7YidfBVdKi0wxHhSuRBfuOppu
 pdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qXY5Dcagk9LqFNGhJQzUGHAsIs
 hap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXGuVtZLT52nK6Wv2EZ1TiT
 OiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/TowdieF1rWN/MYHlkpyj9c
 Rpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKmYwZgA8DrrB0M
 oaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBoBwE3Z3MY
 31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3mFrRO
 BbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsE
 FRuiSVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo
 7IiYaNssCS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48m
 vIyQ4Ijnb6GTrtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4P
 WU11Nr9i/qoV8QCo12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+
 HZA8SL54j479ubxhfuoTu5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjW
 HaKaX23Awt97AqQZXegbfkJwX2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mz
 Joil+u3k01ofvJMK0ZdzGUZ/aPMZ16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKy
 kuVag+IijCIom78P9jRtB1q1Q5lwZp2TLAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9
 aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTC
 y5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6DChDrguup2aJVU8JPBBgRAgAPAhsMBQJU
 X9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMeqX5aD/aq/dsbXSfyAKC45Go0YyxV
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <65f7f17d.050a0220.7383e.5eeeSMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_061156_511686_319BDD60 
X-CRM114-Status: GOOD (  15.59  )
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



On 3/18/2024 12:46 AM, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
> brought EEE support but did not enable EEE on MT7531 switch MACs. EEE is
> enabled on MT7531 switch MACs either by pulling the LAN2LED0 pin low on the
> board (bootstrapping), or unsetting the EEE_DIS bit on the trap register.
> 
> There are existing boards that were not designed to pull the pin low.
> Therefore, unset the EEE_DIS bit on the trap register.
> 
> Unlike MT7530, the modifiable trap register won't be populated identical to
> the trap status register after reset. Therefore, read from the trap status
> register, modify the bits, then write to the modifiable trap register.
> 
> The disable EEE bit on the trap pertains to the LAN2LED0 pin which is
> usually used to control an LED. Once the bit is unset, the pin will be low.
> That will make the active low LED turn on.
> 
> The pin is controlled by the switch PHY. It seems that the PHY controls the
> pin in the way that it inverts the pin state. That means depending on the
> wiring of the LED connected to LAN2LED0 on the board, the LED may be on
> without an active link.
> 
> Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

