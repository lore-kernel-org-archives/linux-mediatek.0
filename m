Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF349C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0XJaE3hqBa0kCvw/MH6zVKOCsSN4KmP1tRfklWEdNs=; b=sOHglZabCkuHBqso/qAkHws/Ym
	WmINbGiIQbYbnTG3vhKm0Gft/pRUYHr1ycGcSq3R1WilgPFsdZ2nZ5VPmPf1ZBcZWQ6bfA3LNPhyj
	t6CSBLYfvE/gx8eZ5XcWwRAD/BPwe2Pu0Q9kHcVev1Xq5+mXu+zAAjktb165UU0D3RafyfTgOZuL7
	fH+puIkpTlO5/mGv+VIxNtqSNY0wnCIx72lCRFrHOnY/jez1ZRI7mqtIyw1Oo9BOxdsO8y70fPRFw
	4eEGr6prkA/CjxGTUW9CXZFePUJoHVeCZKnHKwJC+6qMyVjIUwlr9mh7bCTAg/jKaYy/8mWDcV0wp
	J9mB24BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXhF-001dYX-2g; Wed, 13 Jul 2022 08:26:13 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXhA-001dTj-Kv; Wed, 13 Jul 2022 08:26:10 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4K6z-1oBofy39rV-000Hqg; Wed, 13 Jul 2022 10:26:03 +0200
Received: by mail-yb1-f176.google.com with SMTP id h62so15457762ybb.11;
        Wed, 13 Jul 2022 01:26:03 -0700 (PDT)
X-Gm-Message-State: AJIora/9tVciiPnuuxmzGCnOQz0ReeSSOVCFT+NsNRtaG5Nrbin7+65J
	SgrQwd2BAkhRPmZeebXJuCZLKi+LvmWLkP0klzY=
X-Google-Smtp-Source: AGRyM1s5ctXDWESPghTwunvKDjAPfvsYu2kacgrA/MPXviowltYXdPpskedj7zs4LJm1sUX08EXGIUpvgkI0AhSfMmA=
X-Received: by 2002:a5b:b47:0:b0:66e:3617:d262 with SMTP id
 b7-20020a5b0b47000000b0066e3617d262mr2405858ybr.106.1657700762384; Wed, 13
 Jul 2022 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220712164235.40293-1-f.fainelli@gmail.com>
In-Reply-To: <20220712164235.40293-1-f.fainelli@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Jul 2022 10:25:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
Message-ID: <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, william.zhang@broadcom.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, anand.gore@broadcom.com, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
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
X-Provags-ID: V03:K1:rNDY+L3mNU4oJVt0rspegD82Vs97fFVR8nIQbir43sG3mD5ClWw
 WrZaogYiYBosYwTNU6Pt01Rt/WGVio++RcNIvZkZk/lZzVbhW1VgIcIy6pWqbuPHPjYg/Hd
 3YUYktbHDNV+NU9IrZNsDNBcb1RHZSQ6+HosI5jZ6EqeOgjG6h680SI8g/T3+Ry8w7Spxr2
 k5vFSBLiQ3bpIGJeu5cNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h9PXQuNHk/w=:KjxqWXqPm0bRnFczDwuJLW
 m2TZHnk8vUyt+Uw5iRJ5nrs9+Zm/ljlWdms6JXKfPYL5xxG+f8vZoolHggIcyQK98f0cz24r/
 aYpFR1AkhmNXymj2joI8oEKVNLGZztdqb/dmcs/ba+XD3Y1EtMx9Z4WC3OF8+Ns+kisZ8LXS/
 sqZfcSxpbSNn/GYGO3n92FFCF5oXrj75VfbCr2Ndiuk0A4Wy0j01l/aJCE6Y/bYSdadoBL+nj
 1zFvp8mF0bq20hfclqjfiZLFO9+PL7SyDZ3wNjKUAWJi1jUEo1FjH4MIb+YlGpEpP/uu/MFlb
 xu+Ysb5a6sp8aPbuDv9pbzDuT2GT/mjH4XmdCX2S7qj/SYKCzTtBOYBq486PLaNyrlsqKGky8
 FwZYuLJ7Q+umM8nXvIV1dpl/sJfX7Pn4Rmyo4xf1+XM7JhCyZyWTK4YKnoEsrk/Upp16Xh0Qz
 mpzNQ2hUCtbSWGHTezRd/U7gzxW2K9FsUKiIxsubicjxQ19jF8DRHvPy879Qtf2ZMTuZ531ey
 Igya9mGf4HtNprc+GBy1YnD+YWxeHuZHbEjkXjNq6X4wj9ePs7sStBXGJ9tMEoCm/6skjxX0v
 /q/P4OYqMniNSfM14DsVk7l/GLEsYIdKc9+zB1zoWCIpYNkTVZc7m70PvccSoz6XrFenFS3TB
 9szCvG6PKZxjUNTketwODUdSTblL4vEfdCUD/vgRprL2g2SOPn0M7sV9l6bVVBAhIn6XO3N1t
 EnCCdT/aPh+UJ5w0Qqu54QdenYlrPYBPHeN1z1A7n7vsX/i1f+hJWL99ZGZDT23PPJA5m1u7I
 tvI35MAdk5P31wbB5k/Ieauz6gHP7l6iLX2dX01hRq1woG6OBmFi+BI05gYM/Ary3A2adf2tO
 Ma4HMZvzzFsHs4TSO/dg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_012609_225384_A6373777 
X-CRM114-Status: GOOD (  17.17  )
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

On Tue, Jul 12, 2022 at 6:42 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> There are now multiple Broadcom SoCs supported so group them under their
> own menu such that the selection is visually more appealing and we can
> easily add new platforms there in the future. This allows us to move
> ARCH_BRCMSTB back to its siblings.
>
> No functional changes introduced.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>
> Note this is based on "arm64: bcmbca: add arch bcmbca machine entry"

Hi Florian,

So far, we have tried to keep the Kconfig.platforms file rather coarse-grained,
mainly limiting it to company names and high-level families, but avoiding
sub-menus or adding too many sub-families.

If we add per-vendor submenus, we should probably first decide how we
want to structure this across vendors. I've added maintainers and lists to
Cc for a couple of the ones that are in a similar situation.

I can see a couple of ways we can do this:

a) keep the list of platforms as short as possible, combining related
  SoC families from a single vendor wherever possible, but no sub-menus
  (same as today)

b) Always use sub-menus when there is more than one family, but
   keep relatively coarse platform selection.

c) Use sub-menus and also move to a more fine-grained SoC
    selection, similar to what we have on 32-bit arm.

I would not really want to go to c), but a) and b) both make sense to
me as long as do it consistently across all platforms.

Any other ideas or opinions?

        Arnd

