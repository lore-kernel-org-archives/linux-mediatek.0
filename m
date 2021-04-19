Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35959C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 23:43:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A9861104
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 23:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82A9861104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7sSve2lHbkq+WtfJ+KJ1xDiwmGqw0u58REtN3yq7Z0Q=; b=QdOh9NzDjUN4qRLA15s/JvF3t
	okz5XE9scn5Mbi+JNWG8b0GBz8oncTudvoc/4mfP7ytBJwKUCStQSjHV9kKhG/CvMHOKdFeGfzYnl
	1XUDAMXIyObzIyxrFzeZ0xf8T9K/VigYjwjVh91eS44TnEcqVKvDfIv/e4Xsfgi06p6JV2xz5NhUO
	4wcnDh5IMfiDPxe9IqBqZ3oWNvKBBRn3I1ruTdrvyAgnJszV5vGTuH/QHdZZh6iATmpqTJMmkI6JK
	9MCJQXbSSGtNSbDCjSHnCpAYkCBcXm3lf3kxF+qUWddKD+jgEwSqdtO2gp4PKnJ5VIowgWY2YTYCh
	kWVjUOX+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYdY1-00AoGc-PB; Mon, 19 Apr 2021 23:43:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYdXu-00AoFa-EQ
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 23:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YfTDNxUjME1kzwn4ONpBlmaWp5uEs0PGjlewRbiJ8O0=; b=y4LaUB7MiqEHNQI5aDYyFOqHhf
 Q4wHh75LMvt9Ywx3Z9IXQ6kcil0vo3uk6yhP17EW2yS7GlWuxzd8ZG2nESCzOmxDJZpMF8ktHLWo5
 a6zizZKSvuIyyuP0Hk3DOB25sZ4tYwjjVGtrftlDwI0ovsNE5HxQcU7oXDco3y6XUJ9DuDGvsy7Rp
 dmYLtuRst2CgS8CNVTeFOxgdDpFzlSzI29E0I4BYtO68iSSglWdJ+5EEAUx272fuZcm5qMsAhuI7U
 jm1/HcCFdm57VRr1o+/3fImAcV7wOZLTJm3xIOkfa6Bq2othVK6w7zIT/fUjbk7x3JTwqsXzGnoA9
 q/xw9zaw==;
Received: from gw.atmark-techno.com ([13.115.124.170])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYdXr-00Bj7v-17
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 23:43:13 +0000
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by gw.atmark-techno.com (Postfix) with ESMTPS id 57BF6804B5
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 08:43:09 +0900 (JST)
Received: by mail-oi1-f199.google.com with SMTP id
 a2-20020a544e020000b02901864ae76be1so2494859oiy.7
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 16:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YfTDNxUjME1kzwn4ONpBlmaWp5uEs0PGjlewRbiJ8O0=;
 b=K8zeCMgMK2RqKuhFSd4tyjIhFuArfU0PKODGQSBuTRmQKOXOTnHuQSPORNZP+eZRBx
 OVXL6Lk3weITimLIyxGAOBMQY2hS8bDwdTj2ZxDWAGmbRJeATc2u5lRTWE1K07SQg02I
 Rl/7M2gvMFT98nKFS/KSwoN/BlCpfHnns8RKEF/Csc2rq+1tPzq3pDvCSH4+bVBHCg6D
 gpSatFn5agkejQSqpL+anIQHfFp2ZzhujTWLMcfPhEI0c/wYUFUAEhiVi/kkzI5C+L8d
 4Foj7Lz7M4gzJAXToxN1okLkmBU6RF0iUhGU4WsENSzhc07qLLnFCSt1o1BYAemNUukZ
 mGgw==
X-Gm-Message-State: AOAM532f13C6mek8AWSIJkHupU6bzFKqbgmUK1o+Nc1yQiYmvymD8cGO
 nrysEJ8oJv9JgTlprnOnCnabbFCeE7bOt/HfrNqbzJtjJqHAmIVFB/NMlE2/Zzt3F0VSmiskT0+
 jW6/LDP+xFoHul5/S52DlHjl3XczCpeCLOjZA
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr1708186pjd.190.1618875776933; 
 Mon, 19 Apr 2021 16:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRGNIqy2AO5m9iOwuC4N09BxordE8LmUXYTIIeyniOtbCQKfA0MKaQl391n1ZLV3YIJOra8w==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr1708139pjd.190.1618875776711; 
 Mon, 19 Apr 2021 16:42:56 -0700 (PDT)
Received: from pc-0115 (76.125.194.35.bc.googleusercontent.com.
 [35.194.125.76])
 by smtp.gmail.com with ESMTPSA id r3sm8384971pgn.82.2021.04.19.16.42.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Apr 2021 16:42:55 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYdXa-002mPj-58; Tue, 20 Apr 2021 08:42:54 +0900
Date: Tue, 20 Apr 2021 08:42:44 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Alice Guo (OSS)" <alice.guo@oss.nxp.com>,
 gregkh <gregkh@linuxfoundation.org>, Rafael Wysocki <rafael@kernel.org>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 aymen.sghaier@nxp.com, Herbert Xu <herbert@gondor.apana.org.au>,
 David Miller <davem@davemloft.net>, Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 peter.ujfalusi@gmail.com, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, tomba@kernel.org,
 jyri.sarha@iki.fi, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Kishon <kishon@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Roy Pledge <Roy.Pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Felipe Balbi <balbi@kernel.org>, Tony Prisk <linux@prisktech.co.nz>,
 Alan Stern <stern@rowland.harvard.edu>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, dmaengine@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, linux-phy@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-staging@lists.linux.dev,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH4VdPNO9cdzc5MD@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
 <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_164311_202554_1598E4F7 
X-CRM114-Status: GOOD (  31.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arnd Bergmann wrote on Mon, Apr 19, 2021 at 02:16:36PM +0200:
> In some cases, you can use the device_link infrastructure to deal
> with dependencies between devices. Not sure if this would help
> in your case, but have a look at device_link_add() etc in drivers/base/core.c

I'll need to actually try to convince myself but if creating the link
forces driver registration then it should be workable.

> > In this particular case the problem is that since 7d981405d0fd ("soc:
> > imx8m: change to use platform driver") the soc probe tries to use the
> > nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
> > So soc loading gets pushed back to the end of the list because it gets
> > defered and other drivers relying on soc_device_match get confused
> > because they wrongly think a device doesn't match a quirk when it
> > actually does.
> >
> > If there is a way to ensure the nvmem driver gets loaded before the soc,
> > that would also solve the problem nicely, and avoid the need to mess
> > with all the ~50 drivers which use it.
> >
> > Is there a way to control in what order drivers get loaded? Something in
> > the dtb perhaps?
> 
> For built-in drivers, load order depends on the initcall level and
> link order (how things are lined listed in the Makefile hierarchy).
> 
> For loadable modules, this is up to user space in the end.
> 
> Which of the drivers in this scenario are loadable modules?

All the drivers involved in my case are built-in (nvmem, soc and final
soc_device_match consumer e.g. caam_jr that crashes the kernel if soc is
not identified properly).

I frankly don't like the idea of moving nvmem/ above soc/ in
drivers/Makefile as a "solution" to this (especially as there is one
that seems to care about what soc they run on...), so I'll have a look
at links first, hopefully that will work out.


Thanks,
-- 
Dominique

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
