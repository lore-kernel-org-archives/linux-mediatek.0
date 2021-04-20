Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2356C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:08:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A9706101E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A9706101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tSc41Tk/uz0Vndr0hVkGFUq7V18s4zyoG6Nqgbw1Y0s=; b=VhKc2CO2A4qsmEQTJngx90seg
	8xwQ7pa6dwFGEyFEgpAmZ03PcNp8yXJ3nHdl+7TSCCRYsLOsfQuzG+j5VyQD7+DGDtGm3OdpOpERe
	TDcKCpHk8Sc+EZZkVTQu4XTv5JeNTf6keRkgdKmmHyLU4+q+qEcLmqNF44StjO2n0cXzYmCaBZ1Zl
	3hMTQ2rYsJpX8mKe3BRgRaj8H13iMaq8nJXWl4wRNZcgLZX/MqemCMG+cDOaOem+1JwLA0cyyD9kw
	LzHJNeBRsvQ3Cdn/M9mBff7PP9EEAcMgCicxHaiAG94nBCxcqr7/i3hiId4bLYnG0AEXwbmDfWS/f
	bb/FlxK7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYmMV-00BfkH-EM; Tue, 20 Apr 2021 09:08:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmMP-00Bfj8-Lr; Tue, 20 Apr 2021 09:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c2AVdai4BL/owZZ4etPrGHyWpLyjk0ZB86A88EL3k+c=; b=P4QZnUljTQykXJIMVzH6RqZxLB
 dRjPDkZfVMolZpzNn34uFJdazYngH2q06jwzjkc/5X1lW34+1w+LA8c8mj/I1LCx/vLaIxEEi9E1k
 7yzf6drkmNNqiHEaTc7wQVfOqeJN/QWEzo3JkZe8i9fu++RFJFXmKN6ZePd6RxCbN4D/bk6qNdxxO
 oZ8NigGL2NuLgMaI++NRrWh3abIbz2jxvBmQpVXo/C6s7kBkASTL4B8oTQn1j3W5105fnae2d49uS
 40vY8mK7BJeRG1x75JRZjBZR91nUIThST0dsOpGWn6eH7DyIqx6THK+okBNlubz41N3p0Z0UEgDwG
 /SVHWalg==;
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmMJ-00BxJi-QX; Tue, 20 Apr 2021 09:07:56 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M2wbS-1lVTV51RqG-003KPP; Tue, 20 Apr 2021 11:07:43 +0200
Received: by mail-ed1-f42.google.com with SMTP id j7so7214310eds.8;
 Tue, 20 Apr 2021 02:07:43 -0700 (PDT)
X-Gm-Message-State: AOAM532rE1Rx9swKpidi4hArrm3V2W/OycGVgDBUdV3tpkgQ/J45EnuP
 fyEq1d9KH6KsH1Pgzv2inucBSznv01p26u8RgDk=
X-Google-Smtp-Source: ABdhPJwSiNwlZ27l6d0oeVOJMjBIBpaEf6fV+Kr02yQOCGa6DdHdokE+eIs4+TiyDD+ybgS8jO4hGYikHl0QAhmuRDs=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr19571156wrj.99.1618909652608; 
 Tue, 20 Apr 2021 02:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
 <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
 <YH4VdPNO9cdzc5MD@atmark-techno.com>
In-Reply-To: <YH4VdPNO9cdzc5MD@atmark-techno.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 11:07:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1GjeHyMCworQYVtp5U0uu2B9VBHmf9y0hGn-o8aKSJZw@mail.gmail.com>
Message-ID: <CAK8P3a1GjeHyMCworQYVtp5U0uu2B9VBHmf9y0hGn-o8aKSJZw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, 
 gregkh <gregkh@linuxfoundation.org>, Rafael Wysocki <rafael@kernel.org>, 
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, aymen.sghaier@nxp.com, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, 
 Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, peter.ujfalusi@gmail.com, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 tomba@kernel.org, jyri.sarha@iki.fi, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Kishon <kishon@ti.com>, 
 Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Roy Pledge <Roy.Pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Felipe Balbi <balbi@kernel.org>, 
 Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
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
 Linux PM list <linux-pm@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
X-Provags-ID: V03:K1:tAJdx7VczOYWC0DXQ1M9Q6KHIEo3nDPDigKI29IOaYi8K7DG46U
 Ezx1c1iQDVUybkBHgdu8ephr6qs4jWonH7Dv5yEA4SZ6ui9XRct1IC94omUQAa3LRWz2diS
 tGh7P23biWZo73umacfPi1S1OXgxmXXO2MrSZO6lKCeFddAMZU7n986+s6OF5y1/ZtOiJNH
 8VxrWLAQ3eW9PXYgsRNsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jlUKshQuJnM=:TkZU3lP+sNZOQme8rUpryi
 XMG/yMzbmAWqNPRdqMBxduci/y6EI0Nc4X0eRwPJcqNWTpxIPidSOy/TywDUViQ3Su6517DpJ
 1jxq9p52Tgu5tsRvjziLFg9t7HZWpQAr8scs2BvzUA9oeMX36TFllYxj53EPmG/9FN7W2NnlH
 pEXEWd+7D+1zRgVnBU3Qmp7Fs7DgjDaw6RlJ8LzC/pHwj75NzAZXgkq2tjV0TfSA0aVv04rlY
 qQ1EfONymOkFOzHB6tBZVMmUAmcD6nw7BHNjx7/NQnmuds3rQNf29pnYN/bvzknEVC7m4XRwP
 tHVhTCXhdxPuSHnpx4cc1CjItRFzAN7hvzhXQRozySjh88M7rQMAI0KNhcGkZ5HzIpsPvT5UR
 5H5BnPPqqEvKCMLWLP9bnCGM1GKJhQ4mP3O9dVKlwEPXQNbxcq4MvtMKWzXUJZsrm29WASGcs
 qHICDLCW3jeO2vHv297bmz/stPCOo36xn9c1e9rug8uF33k8W4ouGVS/PA8OmgW9e63ENPR6f
 4XXcqkgNh+vNZOcpxKt1gvPhR6tkHlPGOzkLyaN9A9pu54SqL2aRvFvZJJbZh2exc9U2uKtn2
 b7zW2kvhapX7bVjT8lmyzfnaP0kD/tPDbTovEe0Uw6+FzCACZ2wR6sxscKTOLN/xdIMrs76P3
 G96Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_020752_164823_82CF35AA 
X-CRM114-Status: GOOD (  29.16  )
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

On Tue, Apr 20, 2021 at 1:44 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Arnd Bergmann wrote on Mon, Apr 19, 2021 at 02:16:36PM +0200:
> > For built-in drivers, load order depends on the initcall level and
> > link order (how things are lined listed in the Makefile hierarchy).
> >
> > For loadable modules, this is up to user space in the end.
> >
> > Which of the drivers in this scenario are loadable modules?
>
> All the drivers involved in my case are built-in (nvmem, soc and final
> soc_device_match consumer e.g. caam_jr that crashes the kernel if soc is
> not identified properly).

Ok, in that case you may have a chance to just adapt the initcall
levels. This is somewhat fragile if someone else already relies
on a particular order, but it's an easy one-line change to change
a driver e.g. from module_init() or device_initcall() to arch_initcall().

> I frankly don't like the idea of moving nvmem/ above soc/ in
> drivers/Makefile as a "solution" to this (especially as there is one
> that seems to care about what soc they run on...), so I'll have a look
> at links first, hopefully that will work out.

Right, that would be way more fragile.

I think the main problem in this case is the caam driver that really
should not look into the particular SoC type or even machine
compatible string. This is something we can do as a last resort
for compatibility with busted devicetree files, but it appears that
this driver does it as the primary method for identifying different
hardware revisions. I would suggest fixing the binding so that
each SoC that includes one of these devices has a soc specific
compatible string associated with the device that the driver can
use as the primary way of identifying the device.

We probably need to keep the old logic around for old dtb files,
but there can at least be a comment next to that table that
discourages people from adding more entries there.

      Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
