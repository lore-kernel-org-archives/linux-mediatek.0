Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 May 2022 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GE3EwP0NwmfsIeX2W0kZMl2XGOKhSCDzncU4xt1VuCU=; b=1HCetPznAh0DFM
	0yhQuRlUusHvl8TgNuBqeySdre1Sut333XGXxkgrJ5m19/AVfOGfvfA+v+c0Z36ENWYch1HNWb7Bk
	IJLsdEbBRm8PNSWpCRCa4aWAWYQIRIdjYvCZLBS5dVu/cmVIXiz95iwTP4QQBbbSu9JXAkrFWFMDW
	Tb6l+Kn0b+gBei4S+oNqXxlv4P9Fp0ilZU6pjoSweKJMSNladyHLPnuO19v984uuuONnFTPd6Uibg
	Hbr6MmsQNB1h2MVIlYFHs2dFWqR+GeZ9ayxjb0qprU4Z2873vdXRjMch6WyutHwkuYaN35FqzpUG+
	+p6ImOJ99uyb3arg0GUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnkLI-00Ahkj-Mu; Sun, 08 May 2022 17:05:12 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnkLF-00Ahjl-TX; Sun, 08 May 2022 17:05:11 +0000
Received: by mail-yb1-xb36.google.com with SMTP id j2so21164928ybu.0;
 Sun, 08 May 2022 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W7Hl8BOx+adgs6geATfRW0o3lLPBvMogTGQ28EqLWaA=;
 b=lkgMS1iIMVf9Fy72wcDl3MPVgbNj/S+8G4i7KuAJf12aCIWl55+lPEek3+Cenow8nR
 9MKVshPKYtnCcMk0rVsRWXFDArby9lCwKFGx4DgqDTMfaDG5QVPNOwZkTwC9Jxkj/nIJ
 Fk8j//X0r1kVv6Hg9udaF6oXWF5ny36hAwfrx01HEKaXznS6k51vQHJcyrclwvM51Y4F
 P8dDk9/UJdLMJqBB3t106A3sIj91Zja4D7bj+rVDqRf4X/8WxBR2+t5oR05XYbHwr0OD
 gMrsjh8hipq/WHjgIOHvgegA/bDIyxTeulYWnzhA1fAHcwgksc4HHVHiPW2o6Mx4XIQL
 KsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7Hl8BOx+adgs6geATfRW0o3lLPBvMogTGQ28EqLWaA=;
 b=pTcPnZAhedekuvu04aqDUO3v9w8VbZHwfjJpZTZiYZIJ7lpfnlHZGv6WBco0AQzMGU
 IgYGoAK+BLlgm4LERfAbLlEBUSw0Ux4qoOtP77RPGT+jXQXFsQ+tGxWKadxdx+Q50VDo
 kx2iBF9cgXl7r19zOrIam4CYICMHMN08FFWhSbAS07rAbYmc9I4XEuRfvXO6i0bjViPd
 cjjm5xvZkguKq4z4CnzmBVID7z8yJk94jMAMPNuCCx1WwNVgcsOB7v5OKvGepYRNQbEg
 HrzPDgUqlQUXU3Jw0rRQpsI4zCcCW2YsEDwYNF2+/xNDD9lMxn2aex9oEWDIBsRwD3db
 sRmQ==
X-Gm-Message-State: AOAM533Mln4SLIu4YrUnr3fMrxhoeLpkG1f8vop2KdxzUfLRaXwI3bTE
 N+6KgTMTYi/odHxUsRLSCL2jsLNFPh44V0NsTEQ=
X-Google-Smtp-Source: ABdhPJy+9aAnBuxa0JfhTFZ4aaqwddQqqO8njeM70HqTBYBOqN1hLMd22aoooSxKWRQg+5rhDWM0uUI6VEpipsrsGMI=
X-Received: by 2002:a05:6902:143:b0:628:7cf1:f2a9 with SMTP id
 p3-20020a056902014300b006287cf1f2a9mr9464807ybh.51.1652029508882; Sun, 08 May
 2022 10:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220507170440.64005-1-linux@fw-web.de>
 <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
 <DC0D3996-DFFE-4E71-B843-8D34C613D498@public-files.de>
 <2509116.Lt9SDvczpP@phil>
 <trinity-7f04b598-0300-4f3c-80e7-0c2145e8ba8f-1652011928036@3c-app-gmx-bap68>
In-Reply-To: <trinity-7f04b598-0300-4f3c-80e7-0c2145e8ba8f-1652011928036@3c-app-gmx-bap68>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sun, 8 May 2022 13:04:56 -0400
Message-ID: <CAMdYzYrG8bK-Yo15RjhhCQKS4ZQW53ePu1q4gbGxVVNKPJHBWg@mail.gmail.com>
Subject: Re: Re: [PATCH v3 5/6] dt-bindings: net: dsa: make reset optional and
 add rgmii-mode to mt7531
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Frank Wunderlich <linux@fw-web.de>, 
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Ungerer <gerg@kernel.org>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_100509_998295_62C98750 
X-CRM114-Status: GOOD (  38.70  )
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

On Sun, May 8, 2022 at 8:12 AM Frank Wunderlich <frank-w@public-files.de> wrote:
>
> Hi Heiko
>
> > Gesendet: Sonntag, 08. Mai 2022 um 11:41 Uhr
> > Von: "Heiko Stuebner" <heiko@sntech.de>
> > Am Sonntag, 8. Mai 2022, 08:24:37 CEST schrieb Frank Wunderlich:
> > > Am 7. Mai 2022 22:01:22 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
> > > >On 07/05/2022 19:04, Frank Wunderlich wrote:
> > > >> From: Frank Wunderlich <frank-w@public-files.de>
> > > >>
> > > >> Make reset optional as driver already supports it,
> > > >
> > > >I do not see the connection between hardware needing or not needing a
> > > >reset GPIO and a driver supporting it or not... What does it mean?
> > >
> > > My board has a shared gpio-reset between gmac and switch, so both will resetted if it
> > > is asserted. Currently it is set to the gmac and is aquired exclusive. Adding it to switch results in 2 problems:
> > >
> > > - due to exclusive and already mapped to gmac, switch driver exits as it cannot get the reset-gpio again.
> > > - if i drop the reset from gmac and add to switch, it resets the gmac and this takes too long for switch
> > > to get up. Of course i can increase the wait time after reset,but dropping reset here was the easier way.
> > >
> > > Using reset only on gmac side brings the switch up.
> >
> > I think the issue is more for the description itself.
> >
> > Devicetree is only meant to describe the hardware and does in general don't
> > care how any firmware (Linux-kernel, *BSD, etc) handles it. So going with
> > "the kernel does it this way" is not a valid reason for a binding change ;-) .
> >
> > Instead in general want to reason that there are boards without this reset
> > facility and thus make it optional for those.
>
> if only the wording is the problem i try to rephrase it from hardware PoV.
>
> maybe something like this?
>
> https://github.com/frank-w/BPI-R2-4.14/commits/5.18-mt7531-mainline2/Documentation/devicetree/bindings/net/dsa/mediatek%2Cmt7530.yaml
>
> Another way is maybe increasing the delay after the reset (to give more time all
> come up again), but imho it is no good idea resetting the gmac/mdio-bus from the
> child device.
>
> have not looked into the gmac driver if this always  does the initial reset to
> have a "clean state". In this initial reset the switch will be resetted too
> and does not need an additional one which needs the gmac/mdio initialization
> to be done again.

For clarification, the reset gpio line is purely to reset the phy.
If having the switch driver own the reset gpio instead of the gmac
breaks initialization that means there's a bug in the gmac driver
handling phy init.
In testing I've seen issues moving the reset line to the mdio node
with other phys and the stmmac gmac driver, so I do believe this is
the case.

>
> > > >> allow port 5 as
> > > >> cpu-port
> > > >
> > > >How do you allow it here?
> > >
> > > Argh, seems i accidentally removed this part and have not recognized while checking :(
> > >
> > > It should only change description of reg for ports to:
> > >
> > > "Port address described must be 5 or 6 for CPU port and from 0 to 5 for user ports."
>
> noticed that the target-phase is not removed but squashed in the first bindings-patch.
> This was a rebasing error and not intented...will fix in next version.
>
> regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
