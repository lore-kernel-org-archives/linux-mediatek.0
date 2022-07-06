Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B18AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfBOZ4y4VnJEQETKJF+v25EGknGkkpD71yB8k2rSVjs=; b=bwv5ytl5ONTPF9YXcmkMKswGdQ
	ljhNzpAb18XUror0y8YMXooKxLd5fWeVn/bQmP4V+PxvYZE12YBkrFZjCt+y9HDfpjihO3Zf4MM/T
	E92QBmRJG1EjDQJMHxTfAbv5ZNDDOCtD1AUaIZqmnNvEzfR01Y9LUt6dkZfJB/sNK5m90R1XtN3KD
	QESLTa7gpoeczs85I4w5WsZAitzLT+RB5DaktM6ea0qKFOnJrj6HBIVDeRmeE/NH3HKXV4QUCaSoi
	K6TIUFXI13rh5hsKz5ur3RrsYosvdowdKQ/FetgjMnO3uH2+V4DzukZ4Iaqzc2GR5Nv9Z4QQzyZRI
	GD8Wvn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97sj-00BLUH-1C; Wed, 06 Jul 2022 16:28:05 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97sB-00BLEP-C5; Wed, 06 Jul 2022 16:27:32 +0000
Received: by mail-qt1-x833.google.com with SMTP id ay10so18944393qtb.1;
        Wed, 06 Jul 2022 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OfBOZ4y4VnJEQETKJF+v25EGknGkkpD71yB8k2rSVjs=;
        b=Yfd6+mK6INo6uKnYDW80dmEpedZOkuslw2TkBnxzeEW6OORavuQnZURlsBlpBEQNm7
         9+YWS0ILQ3wvudBDbglPFLtAA6tE/u0wOCZ75+XjYtjBTRwSODMobr0sWCAK8yvUgdCg
         KcoDvJY7WgVLn86syRy2yMRLMJ1rHyp9cmhjFj0uRueEKAi2fhe2eaQHPtMXDl9QzwgD
         MMuQcx0TAC/lRM663n/GJ/10eHOhJdoVJURqmO0KLr02ccEpcsLB2O8i/wVxXHxhc9zl
         r+2RAQMsZJgmk+/e45R9BzXyyVtpCIk1mvKPai60Tth9QxhpNiPl0o7/OseY/Hmhc2j0
         x+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OfBOZ4y4VnJEQETKJF+v25EGknGkkpD71yB8k2rSVjs=;
        b=YFtj/xLDvibO5GiVJX5IwKrsybiyAQF5tjaKLjgangDQI/GwY0TNUvlQR32TM2nZqK
         7VkJTTshQO43XMTZ1457ec/1sIdnMAsVf1bXoTUOAVdSwTKD31hQZt7tg6o8rwYxoWxv
         EDMkiSP/pLsaNM7u4z0uMmCEdLiWxkdwsvjI1GFns5P3v5Oe/tJXoNGs0+jZMZ7DAf+n
         kOzTyDshDpUQYEr9LOJFrr5tM446DzZVC+dSon1nUDtcnqfE0RP6ZAFFHToLTvXq7ZbA
         4VjJgrtzUvD7fyKnPZ1/1MXOOYmSzLboIu/w+PMSVQoJ7pZ2gFJtplUMvrPRjyMNU9C2
         p0Ug==
X-Gm-Message-State: AJIora/SJ5MQ7X9vfqxFkx3ZqA6GkyEZSWh5xhKjmrNFEw7az2ypwpig
	Yltl/HWiNSCuVT/aLkxz7j0=
X-Google-Smtp-Source: AGRyM1tAF5bodD68xq2eUzGaMDiXpqw7KsTWSdoSBoqsGCJmgiwePaU5v3cgVMfITlfbVFQAUUpBgA==
X-Received: by 2002:ac8:570d:0:b0:31d:3d2a:c4b8 with SMTP id 13-20020ac8570d000000b0031d3d2ac4b8mr20898986qtw.61.1657124847975;
        Wed, 06 Jul 2022 09:27:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id dt51-20020a05620a47b300b006b539412be3sm1678621qkb.26.2022.07.06.09.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 09:27:27 -0700 (PDT)
Message-ID: <d65824fc-a139-0430-5550-481dd202ad34@gmail.com>
Date: Wed, 6 Jul 2022 09:27:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC net-next v2 0/5] net: dsa: always use phylink
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 George McCollister <george.mccollister@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <7fe6b661-06b9-96dd-e064-1db23a9eaae7@gmail.com>
 <20220706101459.tahby2xpm3e7okjz@skbuf>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220706101459.tahby2xpm3e7okjz@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_092731_505671_3C5DCF63 
X-CRM114-Status: GOOD (  17.08  )
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

On 7/6/22 03:14, Vladimir Oltean wrote:
> Hi Florian,
> 
> On Tue, Jul 05, 2022 at 09:42:33AM -0700, Florian Fainelli wrote:
>> On 7/5/22 02:46, Russell King (Oracle) wrote:
>>> A new revision of the series which incorporates changes that Marek
>>> suggested. Specifically, the changes are:
>>>
>>> 1. Patch 2 - use the phylink_get_caps method in mv88e6xxx to get the
>>>      default interface rather than re-using port_max_speed_mode()
>>>
>>> 2. Patch 4 - if no default interface is provided, use the supported
>>>      interface mask to search for the first interface that gives the
>>>      fastest speed.
>>>
>>> 3. Patch 5 - now also removes the port_max_speed_mode() method
>>
>> This was tested with bcm_sf2.c and b53_srab.b and did not cause regressions,
>> however we do have a 'fixed-link' property for the CPU port (always have had
>> one), so there was no regression expected.
> 
> What about arch/arm/boot/dts/bcm47189-tenda-ac9.dts?

You found one of the devices that I do not have access to and did not 
test, thanks. We do expect to run the port at 2GBits/sec on these 
devices however there is no "official" way to advertise that a port can 
run at 2Gbits/sec, as this is not even a "sanctioned" speed. I do have a 
similar device however, so let me run some more tests, we won't see a 
regression however since we do not use the NATP accelerator which would 
be the reason to run the port at 2Gbits/sec.
-- 
Florian

