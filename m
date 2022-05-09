Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYZ4/yb0UftIi3ZsBOo3gljYMyC3U9HkDu4F3GuZRYg=; b=GC+mhdqWBm+UFc
	F4QnVvgXMPScNTR5ZNoeMurz1r+a2OAaspP3f2UjreM/1vOQbAh4FfPm+YVXKnzMJ98asB9IL1K7E
	4P5GbF6p3hi011CVRepdkRPbSr4U0tNLgQSRAlMNQn6htvZo6tWgzl/n5wVN45KUxRwvD0YxNGCdb
	LEmpc5uGZGd3fOg7NuStRrPwQDXlbk06H7IiifzMm1TeGt3KnhGDqGX1vl7zIf8ipdQ1zmjVb0PHO
	OlW/e5FIn9YWzWaFYPMmUvifVy9RJh26gsY4fQPmGWSFRhfNnfYJgXnhBRdjz1IlK4NBLf1AwvQkm
	Ux/P4Dfbc7dNub6nHX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1TD-00E4Xp-6D; Mon, 09 May 2022 11:22:31 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1T7-00E4Uw-Ce; Mon, 09 May 2022 11:22:27 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ec42eae76bso140162717b3.10; 
 Mon, 09 May 2022 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JHcyRb0A9TdQ3ZPZeebW28t674FP8onCU6WazLElK4U=;
 b=Cg6+le4ubJ1hcAxrmpylHiTdhVQUuoVW9aEA+iFxxELX6T+A4h3sE6HzJqz6D1834F
 Vx852sLUvU75YM1EVCdR4NV8kKrypKVn92RyNlAOS9M/o44QTnUE20FPvKpm1XQxUYJW
 g//yWu3fDYLTb3vTadJXQak2SIfU1HZVuqSYA+8SMRH0lJUUni9hHCXB+GiXgxj30JQY
 MPMpNGvS1vf3cEx7wxeGs6k9pFp1EISW9qGofMa6X6OK8pYs754hPRo/DOu9uAAaW7jG
 NgZlSz7Ib0BwyYgSAhHCydm2MqJkySpOzsONRp9HWwW6epPyZkaSeuT7JdHX8TdYf29i
 NHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JHcyRb0A9TdQ3ZPZeebW28t674FP8onCU6WazLElK4U=;
 b=qMFfC8YIoU/L2oDlgv3uiYyMshJ1SLIbC5b9tssxxNosjSg6FmPMyLBwWDzw0h0yUl
 rv5krDRXh3VmIVXeHqFMc0L4g6Fhhdbo1IoCR5FKib3W2UCKX/x8uE8CqbkR/CeUUDK1
 rkplkYfeTV8QvXGAEwLqwX9W+iHuiH0YugMIY71Rs98yzJfFTMBH86XCoAfuLOyVutFY
 thXSf3iQSGFcvSxPEuwTwroddbIhH6XClUvs9SkCPhUEu+O2T/W7/gYe0KtNR9eoqgaS
 6tSs2d4qhvq+hatZblM/Yq2sLUrTqQzSL4pnMDRLJGSq5XDWwI70uWQpKgtkfT/Hu0qL
 O4yA==
X-Gm-Message-State: AOAM532zqbxEwHv9tZjkpDRdYpi1evhqIyJ8V0dqY7grupQn/JVw40WK
 EQkXIhHgaSur6qHINNNw8N5TMNKOMUQZAbsmrfM=
X-Google-Smtp-Source: ABdhPJz3TmYnVu7MVB0CYjUmpfm9sDvGiFsAxvCb7o+aew79C34oQx2aF8SKyaY9aCiZum4rKA8OI5Xm2KcEiO3AYls=
X-Received: by 2002:a05:690c:89:b0:2d7:fb7d:db7 with SMTP id
 be9-20020a05690c008900b002d7fb7d0db7mr14793757ywb.219.1652095341920; Mon, 09
 May 2022 04:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220507170440.64005-1-linux@fw-web.de>
 <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
 <DC0D3996-DFFE-4E71-B843-8D34C613D498@public-files.de>
 <2509116.Lt9SDvczpP@phil>
 <trinity-7f04b598-0300-4f3c-80e7-0c2145e8ba8f-1652011928036@3c-app-gmx-bap68>
 <CAMdYzYrG8bK-Yo15RjhhCQKS4ZQW53ePu1q4gbGxVVNKPJHBWg@mail.gmail.com>
 <41d6b00f-d8ac-ca54-99db-ea99c9049e0a@linaro.org>
In-Reply-To: <41d6b00f-d8ac-ca54-99db-ea99c9049e0a@linaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Mon, 9 May 2022 07:22:11 -0400
Message-ID: <CAMdYzYomJPxQ7cnUuP_T7-rVbYPeZwr13Dy6b=PP4ijqQfh5gg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: net: dsa: make reset optional and add
 rgmii-mode to mt7531
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_042225_527393_65FD8B8A 
X-CRM114-Status: GOOD (  34.89  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>, Florian Fainelli <f.fainelli@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 9, 2022 at 2:48 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/05/2022 19:04, Peter Geis wrote:
> > On Sun, May 8, 2022 at 8:12 AM Frank Wunderlich <frank-w@public-files.de> wrote:
> >>>
> >>> I think the issue is more for the description itself.
> >>>
> >>> Devicetree is only meant to describe the hardware and does in general don't
> >>> care how any firmware (Linux-kernel, *BSD, etc) handles it. So going with
> >>> "the kernel does it this way" is not a valid reason for a binding change ;-) .
>
> Exactly. The argument in commit msg was not matching the change, because
> driver implementation should not be (mostly) a reason for such changes.
>
> >>>
> >>> Instead in general want to reason that there are boards without this reset
> >>> facility and thus make it optional for those.
> >>
> >> if only the wording is the problem i try to rephrase it from hardware PoV.
> >>
> >> maybe something like this?
> >>
> >> https://github.com/frank-w/BPI-R2-4.14/commits/5.18-mt7531-mainline2/Documentation/devicetree/bindings/net/dsa/mediatek%2Cmt7530.yaml
>
> Looks ok.
>
> >>
> >> Another way is maybe increasing the delay after the reset (to give more time all
> >> come up again), but imho it is no good idea resetting the gmac/mdio-bus from the
> >> child device.
> >>
> >> have not looked into the gmac driver if this always  does the initial reset to
> >> have a "clean state". In this initial reset the switch will be resetted too
> >> and does not need an additional one which needs the gmac/mdio initialization
> >> to be done again.
> >
> > For clarification, the reset gpio line is purely to reset the phy.
> > If having the switch driver own the reset gpio instead of the gmac
> > breaks initialization that means there's a bug in the gmac driver
> > handling phy init.
> > In testing I've seen issues moving the reset line to the mdio node
> > with other phys and the stmmac gmac driver, so I do believe this is
> > the case.
>
> Yes, this seems reasonable, although Frank mentioned that reset is
> shared with gmac, so it resets some part of it as well?

No, the gpio-reset line is purely to reset the phy. The stmmac gmac
driver handles it because it seems initialization failures occur if
it's handled by the mdio drivers. I suspect this is due to a
difference between when the driver initializes the phy vs when the
driver triggers the reset.
They had tried to attach the gpio binding to both the gmac node and
the mdio node at the same time when only one can own it. Having it
owned by the switch driver on the mdio node leads to the same
initialization failures we see in other mdio drivers.

>
>
>
>
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
