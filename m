Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLxuyklC0Z7iml/ksSQYe1DeafX43pbTIjDNNAg5waQ=; b=1TTJuIXpPSviq0DFYtaGyf08FK
	EVzfYd8YbKSdzqdiEIzxxSy99U+0cFB31QXLcq5NV5f6fz0DRsHX+SWZSNQAxHCB7DX9uZt4gExP2
	j9wac2o9/1gFphhhEEV0+ZS84qDdNBR0nIC+yXMmoJEMjKt58OKPtD0XX/ND6xGuBWJ50+4RMUazv
	upn91yrsoXL7ir7IQ9piFOEFdYc7ru4czYnRrwIknMeylm5IlFL5T8RwyEI2EU4fAeEtv++W2rmGM
	Cdax99fKqQSxqZFnIlQ7ZC9WGHfFbyJT64wVDpMSPlydpNSt+Y/P1IJWq/43t7sMhJl3lOcYSjcc2
	ZDKI+yLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ALQ-00C8ZZ-B1; Wed, 06 Jul 2022 19:05:52 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ALD-00C8WT-H9; Wed, 06 Jul 2022 19:05:42 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LdTWs17Ljz9sWt;
	Wed,  6 Jul 2022 21:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1657134329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLxuyklC0Z7iml/ksSQYe1DeafX43pbTIjDNNAg5waQ=;
	b=H+ddahvO/iCAE4BAUNiDslqXdPqRz80YgzRdqppXb4q4W726+hz2cl3mcRFbKWuZRr3ta3
	hPLVvw3gB4g1laCKHc1hZHA48Myufd14c9BvHdtaGp/F32CQkFVRIs5leYaoeR03doB1X3
	lMbzLBxl+qO+dXDUcebcOkQRW9Pv+sx7F7BJ19+P3aE0HPPhdRGA9fJB+9IgkrkJ03169D
	4XtLbTCi/8zNwIqLiQ4N+L4xK4kw/fqsxxXMYXDq8HgUljemIXUcYWJQX4yBD/TdLuyDNO
	s5drMOe8CYMGAf0eF84ha+K1weIoq8XBvfRNkZwb/S0FRxrwlxrfp4jaGKca+Q==
Message-ID: <4ec0461c-0000-ff8c-4368-5d68d70b894e@hauke-m.de>
Date: Wed, 6 Jul 2022 21:05:22 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 George McCollister <george.mccollister@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <7fe6b661-06b9-96dd-e064-1db23a9eaae7@gmail.com>
 <20220706101459.tahby2xpm3e7okjz@skbuf>
 <d65824fc-a139-0430-5550-481dd202ad34@gmail.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH RFC net-next v2 0/5] net: dsa: always use phylink
In-Reply-To: <d65824fc-a139-0430-5550-481dd202ad34@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_120539_757502_3F919F3B 
X-CRM114-Status: GOOD (  18.74  )
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

On 7/6/22 18:27, Florian Fainelli wrote:
> On 7/6/22 03:14, Vladimir Oltean wrote:
>> Hi Florian,
>>
>> On Tue, Jul 05, 2022 at 09:42:33AM -0700, Florian Fainelli wrote:
>>> On 7/5/22 02:46, Russell King (Oracle) wrote:
>>>> A new revision of the series which incorporates changes that Marek
>>>> suggested. Specifically, the changes are:
>>>>
>>>> 1. Patch 2 - use the phylink_get_caps method in mv88e6xxx to get the
>>>>      default interface rather than re-using port_max_speed_mode()
>>>>
>>>> 2. Patch 4 - if no default interface is provided, use the supported
>>>>      interface mask to search for the first interface that gives the
>>>>      fastest speed.
>>>>
>>>> 3. Patch 5 - now also removes the port_max_speed_mode() method
>>>
>>> This was tested with bcm_sf2.c and b53_srab.b and did not cause 
>>> regressions,
>>> however we do have a 'fixed-link' property for the CPU port (always 
>>> have had
>>> one), so there was no regression expected.
>>
>> What about arch/arm/boot/dts/bcm47189-tenda-ac9.dts?
> 
> You found one of the devices that I do not have access to and did not 
> test, thanks. We do expect to run the port at 2GBits/sec on these 
> devices however there is no "official" way to advertise that a port can 
> run at 2Gbits/sec, as this is not even a "sanctioned" speed. I do have a 
> similar device however, so let me run some more tests, we won't see a 
> regression however since we do not use the NATP accelerator which would 
> be the reason to run the port at 2Gbits/sec.

I will try this change on some devices with the lantiq gswip driver at 
the weekend.

On the SoC supported by the lantiq gswip driver the switch is integrated 
in the SoC and there is a internal link with more than 1GBit/s 
connecting the switch to the rest of the system. I think it is also 
around 2GBit/s. We can not configure the interface speed or many other 
interface settings for the link between the switch and the CPU. How 
should the device tree ideally look for this setup?

Hauke

