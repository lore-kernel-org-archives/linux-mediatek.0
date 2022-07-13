Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zby97TNc1ghpjXRqZzrsX3Uiwj/4uwx2MsSKfbl6g7E=; b=V+b12glohgEjYvKKfewotGK/xT
	xLxHlhLjp5sTeQwlzoDIO658gGmx9EwZAOSAo7PYqkzOvSfV5e3y0v2E3frzhxrcJFCnk32Z6YLA7
	PRCGnxHRGhwGdl1xpaqmcduc16rG2vgAbFHTSuYtvZz8WZyKnRSEPXTEFrjd6x5m3kq65eAJI9n5M
	ctXHcaMb44LDUHca4rrULv4eWZBghrOh6V4l8LysCCFd9rpI7rpz6J26VbAoftk7w4U1QMB7dFWlB
	ksbW9zUC7QpSx17zH4n5b3t2oydptAaXlT5Lzreldduz7fL6qTLeKAl4achD7OAlhgNawmL+BEcbW
	Zj3Vyjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBYUu-002CIH-Ee; Wed, 13 Jul 2022 09:17:32 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBYUi-002CCw-2P; Wed, 13 Jul 2022 09:17:21 +0000
Received: by mail-qk1-f171.google.com with SMTP id z11so6710301qkz.13;
        Wed, 13 Jul 2022 02:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zby97TNc1ghpjXRqZzrsX3Uiwj/4uwx2MsSKfbl6g7E=;
        b=D0nufrcaISfXqNzEkvtweuv1UNRJz5HOxLDktplnsEqgQD1od2S2fVdu3/6RJmGoiv
         E0M/XtmS37np9v/fyCRFDK6SVprwdDKld4drr6sXEqMh3CEIIU6fDosNyXWWT/uRElQN
         4NEO6SAd+fNmzSK9eYMZS5NKGReEmNDb9IV00WLSOa6klyhm68uxmBVgLyQTL/yghxVY
         x4+JMyMZlwjfTW4o7SYl/YkPcJd+xonchScPZHJ7KfLs6PMBMv9+BsXJcES/1JL8YhLp
         +Gx+bmiYDe6JkajudIlXSAy3Iwq2h75xSgjUXC7CnatQpeDLUVTUlc2BHLMkR8Ity3+Q
         G6Pg==
X-Gm-Message-State: AJIora/atNOTDnsNlIiWs+PXO8P/V3o9bl6hImyMFiUfrnCndZm/4DHT
	UPhtu4NfcepDVJIAzM+k9wXcBLX0oy2wBA==
X-Google-Smtp-Source: AGRyM1uk/3npCT3ZaSSvQxCFKyt0D6iOD6ykLGdEKr1iTbVpNPA9Vl3Cv7K8tH8mtJVjWXkwOKweng==
X-Received: by 2002:a05:620a:28c9:b0:6b5:76b4:e74a with SMTP id l9-20020a05620a28c900b006b576b4e74amr1631700qkp.98.1657703837109;
        Wed, 13 Jul 2022 02:17:17 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id w4-20020a05620a424400b006aedb35d8a1sm11853540qko.74.2022.07.13.02.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 02:17:16 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 6so18263913ybc.8;
        Wed, 13 Jul 2022 02:17:15 -0700 (PDT)
X-Received: by 2002:a25:bc8e:0:b0:66e:fe43:645c with SMTP id
 e14-20020a25bc8e000000b0066efe43645cmr2777562ybk.202.1657703835228; Wed, 13
 Jul 2022 02:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220712164235.40293-1-f.fainelli@gmail.com> <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
 <0131e1d6-09c0-31a4-5b9d-0e2fc49d61ac@linaro.org>
In-Reply-To: <0131e1d6-09c0-31a4-5b9d-0e2fc49d61ac@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Jul 2022 11:17:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDDY_72y3WYt401hG122xg1s7_VRCG9Vyhhkzco-nBYw@mail.gmail.com>
Message-ID: <CAMuHMdWDDY_72y3WYt401hG122xg1s7_VRCG9Vyhhkzco-nBYw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, william.zhang@broadcom.com, 
	anand.gore@broadcom.com, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Li Yang <leoyang.li@nxp.com>, Wei Xu <xuwei5@hisilicon.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Matthias Brugger <mbrugger@suse.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_021720_135229_4F391286 
X-CRM114-Status: GOOD (  40.93  )
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

Hi Krzysztof,

On Wed, Jul 13, 2022 at 10:40 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 13/07/2022 10:25, Arnd Bergmann wrote:
> > On Tue, Jul 12, 2022 at 6:42 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >> There are now multiple Broadcom SoCs supported so group them under their
> >> own menu such that the selection is visually more appealing and we can
> >> easily add new platforms there in the future. This allows us to move
> >> ARCH_BRCMSTB back to its siblings.
> >>
> >> No functional changes introduced.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>
> >> Note this is based on "arm64: bcmbca: add arch bcmbca machine entry"
> >
> > Hi Florian,
> >
> > So far, we have tried to keep the Kconfig.platforms file rather coarse-grained,
> > mainly limiting it to company names and high-level families, but avoiding
> > sub-menus or adding too many sub-families.
> >
> > If we add per-vendor submenus, we should probably first decide how we
> > want to structure this across vendors. I've added maintainers and lists to
> > Cc for a couple of the ones that are in a similar situation.
> >
> > I can see a couple of ways we can do this:
> >
> > a) keep the list of platforms as short as possible, combining related
> >   SoC families from a single vendor wherever possible, but no sub-menus
> >   (same as today)
> >
> > b) Always use sub-menus when there is more than one family, but
> >    keep relatively coarse platform selection.
> >
> > c) Use sub-menus and also move to a more fine-grained SoC
> >     selection, similar to what we have on 32-bit arm.
> >
> > I would not really want to go to c), but a) and b) both make sense to
> > me as long as do it consistently across all platforms.
> >
> > Any other ideas or opinions?
>
> Whatever we decide here, the SoC can override in drivers/soc, just like
> Renesas did. I think Renesas chose option c), but made it in
> drivers/soc. I would vote to have consistent policy, so if arch/arm64 is
> a) or b), sub-archs should not redefine it in drivers/soc.

We did so because of the "only a single symbol in
arch/arm64/Kconfig.platforms"-policy.

> Or we could choose d)
> d) keep arch/arm64 list of platforms as short as possible, but sub-archs
> can do whatever they like on drivers/soc.
>
> Personally, I find fine-grained SoC selection a bit ridiculous
> optimization, like compiling kernel, Glibc and userspace with -O3,
> -funroll-loops and many other flags. One gets smaller size but looses
> multi-platform and ability to test one kernel on different boards.
> Therefore I would vote for b) with disallowing drivers/soc defining more
> ARCH_ and more SOC_.

No one prevents you from selecting multiple SoCs, they are not
mutually-exclusive...

With arm64 (or risc-v ;-) instead of arm32 being used for all new
SoCs,  I expect the real small ones (with a few MiB of embedded
SRAM) to enter the arm64 realm soon.  No point in including e.g. all
pinctrl drivers from the vendor if you have barely enough RAM to run
Linux and your app...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

