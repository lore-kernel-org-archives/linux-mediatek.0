Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C87C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2m65ed+VKU46wmwzODUfX9pQpnIOrJsSOXJsW+RL10=; b=RJHfWxFzdTnQUHJ+69s5UbR2SU
	vU7kzDl/2oZoYf+rGDv8XtO0OPi6nzzlDza4STsKuI2sxiZgTix3mxEz/F4RY5YBiS6isEYCEijO2
	Zr++sza/mEw60JqMV0DA8j+PYaiPh4k4+9nOQoxhVhRnN8t0SUyUK1MjmLRhroamUZosuoNttm824
	bSwMH4a+Fc5HruP/bsk9Nqc83235lD3+GFGFpUDFVnbrhBer1fPoBfypLB1bioteEOrgHd1jkuz8B
	A7SDDof6wssNHBjxavcGPoUzWGJhw6pvKGn6++CFTG7hDD23aNS7REagxORoeV0grne0f6gKvs8KA
	2D5g2Phg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOwh-0095k3-Ky; Fri, 15 Jul 2022 17:17:43 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOwS-0095ZS-Rj; Fri, 15 Jul 2022 17:17:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id ss3so10058941ejc.11;
        Fri, 15 Jul 2022 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s2m65ed+VKU46wmwzODUfX9pQpnIOrJsSOXJsW+RL10=;
        b=l1dAKUUNH4z2PgburywrqoWlN4/1D2KO9fjGmRU/AzfzM+TZ37w05bSUN3k57gPspR
         O2aQUy0qwEmJiehFBpqQDNf5fDR0RITWMoSNoY9Rzj2uIfqt5243k3bIAYHZ96q/QbT1
         kOiCN/q/4n8dbGCQQlxXdlj9xfP5ba/CFNr03tTeVLAc4qQibW8EXPe+aAYSJ5ZRR6gC
         EcfJ9MnQ3Q7y/up8ohgUId6dheBfbvouEyHIhUzvnzK4r76ns5eLlQ1cKC+ujuYDzyLz
         BfdQKmbRvr1Dt6+s+VAMMdG0uYQc/axGtfxjRoCi/W7qOYhJ2I48PkcgphSnUdNZwwxy
         skxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s2m65ed+VKU46wmwzODUfX9pQpnIOrJsSOXJsW+RL10=;
        b=I8y1R4d9WWI9DqCYSgAuNfrJwuTIvwxVWoIj+9gElRXK7stRZEQtBuVlH0oN17h540
         r8Hr7265yrXXNzrcPWLm5EsZQOVPre8azWSKOqGfBn8c9cjWxLYP9yxHQ4zyv33xsCC0
         dXmxg4nWj3D1yvW0vXDZgBZ4cZR7HxfjUKAR/DJP49k1qPSpoTlrN51h/wY3Xl8lN0d/
         pV9A8KSgMvvU5tpjOqCEpuaJ06bBoJytcWQ82Z6coXgFBsrmKnQXu/rc0z94kORNVSlb
         lv6K047+5h6uz+9NILYaLn8b+zxa/AudkD/YX7qyhmrxpoFf5CHDRnc8Y/KzGYYNq+M9
         BvIg==
X-Gm-Message-State: AJIora+wbJvqZhDNPLJphEKsK/Hj9NLkgeSvzMA4rzkSF1vORE2EBMj/
	3vu+TbAzRLAwqyLmFehtTr4=
X-Google-Smtp-Source: AGRyM1sAWG7bL6CZyLOwnctXoLSDpqKUPYhVVJyLTDZ+mgM4ARRC7PcjVMARHOHBRrF5407oHABQXg==
X-Received: by 2002:a17:907:60c7:b0:72e:d01f:b884 with SMTP id hv7-20020a17090760c700b0072ed01fb884mr11047319ejc.550.1657905443553;
        Fri, 15 Jul 2022 10:17:23 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id p13-20020a05640210cd00b00435a62d35b5sm3153113edu.45.2022.07.15.10.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:17:22 -0700 (PDT)
Date: Fri, 15 Jul 2022 20:17:19 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marek =?utf-8?B?PT9pc28tODg1OS0xP1E/QmVoPUZBbj89?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220715171719.niqcrklpk4ittfvl@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_101728_917292_A97D5F8D 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Russell,

On Fri, Jul 15, 2022 at 05:00:59PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This is a re-hash of the previous RFC series, this time using the
> suggestion from Vladimir to create a swnode based fixed-link
> specifier.
> 
> Most of the changes are to DSA and phylink code from the previous
> series. I've tested on my Clearfog (which has just one Marvell DSA
> switch) and it works there - also tested without the fixed-link
> specified in DT.

I had some comments I wanted to leave on the previous RFC patch set
(which in turn is essentially identical to this one, hence they still
apply), but I held off because I thought you were waiting for some
feedback from Andrew. Has something changed?

I'm going to leave my comments anyway now.

