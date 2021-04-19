Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0845C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 12:17:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350B2611F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 12:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 350B2611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ELCUgU4sIC9lhiC5aW3pCH+28hm5Gox5kYM3LF77ZRE=; b=gMqoH2byDDMpYTkdMgPGWTK39
	XCLZv/iWB1m0i6UKBCxyQoalr1DxpbIFv9tdfJdajnl16XN+J7BhhCHr9H+Aqo+oAYwYzA6wvjlmx
	51Pgfa2OkO4D7Y6DAecJYaI37Rv4elD5c7Z73xOeXdQ91cWHpmff7ATDYAIEpzgVVsSPj6g++fk8A
	eFgWpCPM+/sZFAaiIbXApWmsnQoWwoHMPNMuIIaFRJr+N3LX16/LlCg7r7Q8jIe7h892sTFJZIzaG
	sZKe1UAnW6wrIn1qkVhrNSdNy/9NrzMYJksUUIZopWX4u8QRRKF+bFiEsA+fATpfMja+9RSoYQ37s
	CDAUffrpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSq6-009prm-5c; Mon, 19 Apr 2021 12:17:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSpz-009ppm-HL; Mon, 19 Apr 2021 12:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jte4PESVCyOxZgmueTIRmzESggoF2gOLGuf4QLB+EB0=; b=dEjx4FacO0Qc/yqZrU0+Ht6nuo
 4/uFe56LP3DgbOdG1Glqe3iWmnIq1uxlsb0OUk/vfGdWwLqpuNEZtgkOlqg8ecMIhgAJZHK3+0/oT
 BdcE2fQD1zeTv6H8izVXUXj/VKNA1HT8U/3e7NfVmrVA811MEgAIL5pGkeHeb1ZyW9zi6x5dF0SRC
 8tPaIgMDnG3dN0JerVPyaaIH5EHVdy0dgvyF9zqxpP6kik14qHqwnRKrlefZbNQfRro81ajsKMqaK
 O59IPz5s177J3PFXPdWhZw5u739vpeVDSE1zg6R7arSpswMcmkVuLCvWPd3UxgO8QMlQ6DKEOUVzW
 aJw6q1sw==;
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSpv-00BLMA-AV; Mon, 19 Apr 2021 12:17:10 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Ma1wY-1l2RQy3Y8K-00W0u9; Mon, 19 Apr 2021 14:17:04 +0200
Received: by mail-ed1-f43.google.com with SMTP id j7so3488470eds.8;
 Mon, 19 Apr 2021 05:17:03 -0700 (PDT)
X-Gm-Message-State: AOAM530E08lvsRHMRNDydOZidFtApXVQ9lG+sKzfZ4kuuw7KmIVAJbRD
 Jvyapn36T22Tt77rVib32sw0LpT5rgiC5zZAu/0=
X-Google-Smtp-Source: ABdhPJw4F20QerTwfst1rAMwc6NWiXDSUWeUkZ8E4j2sezaYrIv6atAni45jIwUzsYws7AyLO9D3pu8QFGIGztgXd7o=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr14679907wri.361.1618834612186; 
 Mon, 19 Apr 2021 05:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
In-Reply-To: <YH1OeFy+SepIYYG0@atmark-techno.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 14:16:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
Message-ID: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
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
X-Provags-ID: V03:K1:g/QI9y9oQjjikvBQx8Nmh/qtx5Rfg/NuQCZqr/O03hRfwIE0GyD
 F3w4+EGg9GUaJHQlTjxVPX/0008CCVaqT1gHII/tbpbWzu7rMV/mHgswtMWuEvgVIVa0XqO
 XS0Jk7hAZUDhBP17ugBGfsLkDFI7TOGNXMrXnURMRWSZPYcujxBaF4LEGwH6jBCpXzgh+LG
 W+hlgWEp/+a8n/biU8XHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fj3kO2X5yGs=:r4DRa7oPbhL2Cp/tMsxLri
 0UXNSBm5TFCw6p+MqcLW5k8ejukcMbKjXlbd94/KtlzQTBrXXcWsWDXmPS6ncAsJI/gRBgYN4
 O2+rYdvaBYfvSus6eJgdSQkmHU0twbJ66r+efv2Tmd26CHfLv9IvnC6rUHRElo4ctzldbLMWy
 GTTe/6fuv1tGNLcHPfZHSL7/roKq4yDMeaDpzgAajuK7OgdYKrcdB0MrUdc8EK2tSdDXt7xti
 fAG35cuWVr6jNZGzlFqRlLJNvuVlZUQp2H/WvnMgu4WINKSq5VkThVw77cQ0JQsf1aETyVAOA
 UCUcmUaKVS/UqkLJ2M4VC+aXORwr3Q3mbahhYfSHUfb6U6c9jRaJn+3E7Q3sXeuG1PsexhbCw
 90pWRbH8j5Enw7LhVinWavvXgo4GMbtB0v5ZdVbmYXfoaJt/wJy/JXZ7BykePlZOhwJr2uaP+
 wzHMnhH0PKdQLzRIUXcUs2rZDZ4qQRXgbx3fzBCfBrIsJVpaqJeECt89e3tIbJRflgCgTN0nV
 M0h4M+57ycRVc4VpG6rAhdA0PU3usjjdawrRLRjcXx/W+e85jvRsqHXOhzSLZKGpRtRHHd9sV
 qGAurZ8DiwqxiEIJM9RvEOXZuCUEXSBPPYRS0IbdsitnQZWIsMXU3dDQs6esoGesTtPCz1/bY
 7w3s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_051707_671018_F06B008E 
X-CRM114-Status: GOOD (  29.72  )
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

On Mon, Apr 19, 2021 at 11:33 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Geert Uytterhoeven wrote on Mon, Apr 19, 2021 at 11:03:24AM +0200:
>
> > soc_device_match() should only be used as a last resort, to identify
> > systems that cannot be identified otherwise.  Typically this is used for
> > quirks, which should only be enabled on a very specific subset of
> > systems.  IMHO such systems should make sure soc_device_match()
> > is available early, by registering their SoC device early.
>
> I definitely agree there, my suggestion to defer was only because I know
> of no other way to influence the ordering of drivers loading reliably
> and gave up on soc being init'd early.

In some cases, you can use the device_link infrastructure to deal
with dependencies between devices. Not sure if this would help
in your case, but have a look at device_link_add() etc in drivers/base/core.c

> In this particular case the problem is that since 7d981405d0fd ("soc:
> imx8m: change to use platform driver") the soc probe tries to use the
> nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
> So soc loading gets pushed back to the end of the list because it gets
> defered and other drivers relying on soc_device_match get confused
> because they wrongly think a device doesn't match a quirk when it
> actually does.
>
> If there is a way to ensure the nvmem driver gets loaded before the soc,
> that would also solve the problem nicely, and avoid the need to mess
> with all the ~50 drivers which use it.
>
> Is there a way to control in what order drivers get loaded? Something in
> the dtb perhaps?

For built-in drivers, load order depends on the initcall level and
link order (how things are lined listed in the Makefile hierarchy).

For loadable modules, this is up to user space in the end.

Which of the drivers in this scenario are loadable modules?

        Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
