Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ECFC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMiMQstmi4fye6rbDodGtDhr/+ccol51xooFH4Y/uFU=; b=FAznfxWYUdyvhJbR6ZRty9XbJi
	DDwUWZ+8NeTtxu/4F5SnCEsslgqWlZCb1735y84vJ0TqlKiMBAxTuQxmO3bGSbAiy0uerdMt5/NxU
	ZqrevWG81KcwGTpb1j3rq9rbRyQ80YmkHyckPP3vKTYFzEKPR5W2qm2MDdTNd9fN5iTr3V4gVRUFN
	VhYcLbx+puO4VTlLtmHp9hYvg54qpD1507s58po1jemNGVMLt50EZ/4nE5/d46mCl/KnI0Jn+1in7
	yrh0D2E/wmioKJJjbOzRa2gH/zgVJYt97ta8IsPrevt70b0wW0ifVOcGA/Yf12tsLTYJtDgt/p47K
	ZGUKQS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPLj-007ZLH-54; Wed, 15 Feb 2023 21:29:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPLY-007ZJE-UM; Wed, 15 Feb 2023 21:29:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF30561DD6;
	Wed, 15 Feb 2023 21:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E0BC433AA;
	Wed, 15 Feb 2023 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676496584;
	bh=uqSZ7JhhYwZJmyBtc9GnGBSgXvgF8klnsV6Bi3CE/70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HyzeZSYy1IGn0ylyeD9fHMqQtFPBtKi9dSmcfdlDTc2rPkFkVsD+itPzrBZj/iiFm
	 tAigRsnpNOOJwNgp35HQgsAsJ8kCasuHvf3Ogu2csYRq1CWtQa/mtOR+fhF/gfclEd
	 7n8ZEZ3GjE7EBXRm7sPGT9UrZ72pogYYwaWkirDzdf62Mfx3IRADvZkUialHq4PEt8
	 aAIFakiQ9bwEX2xcVx4nRkWEFg+1FvA96drKvkJ9Qf/kjeeG2tHQ1tCcqZ0wti0E0h
	 wn0miqLesWq7UEHRq5McoJ0hAUP0/mo81rWkw9SpDNURAWMAnYAKDiSr2iobXq/1Ba
	 JFld8y4pUPrRA==
Received: by mail-ua1-f46.google.com with SMTP id s21so1709775uac.13;
        Wed, 15 Feb 2023 13:29:44 -0800 (PST)
X-Gm-Message-State: AO0yUKWuzEM3z2/Cr/2FoAoC6ml/JaLtBEt/if5RzU70DLIWyGG7SlDE
	kmceMXoLORpJHBRablJlcaguDpPP39gtzydoTg==
X-Google-Smtp-Source: AK7set+StJDjHRVXGKtdcRc0C4Tb6EItbseWIV1tkuIT46rt0i13kIUZLMEc71oCmoEfVGed3op2pEZ5a9IxG+cz5tg=
X-Received: by 2002:a9f:3112:0:b0:689:cd52:101b with SMTP id
 m18-20020a9f3112000000b00689cd52101bmr576154uab.1.1676496583431; Wed, 15 Feb
 2023 13:29:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676323692.git.daniel@makrotopia.org> <f4b378f4b19064df85d529973ed6c73ae7aa9f2d.1676323692.git.daniel@makrotopia.org>
 <20230215204318.GA517744-robh@kernel.org> <Y+1Lm8XZVrtSGTLT@shell.armlinux.org.uk>
In-Reply-To: <Y+1Lm8XZVrtSGTLT@shell.armlinux.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Feb 2023 15:29:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYQo9ZbraiHAnb3z5O86Cv4JoKf5HSnhvrRn95HwGkHQ@mail.gmail.com>
Message-ID: <CAL_JsqLYQo9ZbraiHAnb3z5O86Cv4JoKf5HSnhvrRn95HwGkHQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] dt-bindings: arm: mediatek: sgmiisys: Convert to
 DT schema
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_132949_099724_E9684D8B 
X-CRM114-Status: GOOD (  46.29  )
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

On Wed, Feb 15, 2023 at 3:16 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Feb 15, 2023 at 02:43:18PM -0600, Rob Herring wrote:
> > On Mon, Feb 13, 2023 at 09:34:43PM +0000, Daniel Golle wrote:
> > > Convert mediatek,sgmiiisys bindings to DT schema format.
> > > Add maintainer Matthias Brugger, no maintainers were listed in the
> > > original documentation.
> > > As this node is also referenced by the Ethernet controller and used
> > > as SGMII PCS add this fact to the description.
> > >
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > ---
> > >  .../arm/mediatek/mediatek,sgmiisys.txt        | 27 ----------
> > >  .../arm/mediatek/mediatek,sgmiisys.yaml       | 49 +++++++++++++++++++
> > >  2 files changed, 49 insertions(+), 27 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> > >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
> >
> > If you respin or as a follow-up, can you move this to bindings/clock/?
>
> I'm not sure that's appropriate. Let's take the MT7622 as an example,
> here is the extract from the device tree for this:
>
>         sgmiisys: sgmiisys@1b128000 {
>                 compatible = "mediatek,mt7622-sgmiisys",
>                              "syscon";
>                 reg = <0 0x1b128000 0 0x3000>;
>                 #clock-cells = <1>;
>         };
>
> This makes it look primarily like a clock controller, but when I look
> at the MT7622 documentation, this region is described as the
> "Serial Gigabit Media Independent Interface".
>
> If we delve a little deeper and look at the code we have in the kernel,
> yes, there is a clock driver, but there is also the SGMII code which is
> wrapped up into the mtk_eth_soc driver - and the only user of the
> clocks provided by the sgmiisys is the ethernet driver.
>
> To me, this looks very much like a case of "lets use the clock API
> because it says we have clocks inside this module" followed by "now
> how can we make it work with DT with a separate clock driver".
>
> In other words, I believe that describing this hardware as something
> that is primarily to do with clocks is wrong. It looks to me more
> like the hardware is primarily a PCS that happens to provide some
> clocks to the ethernet subsystem that is attached to it.
>
> Why do I say this? There are 23 documented PCS registers in the
> 0x1b128000 block, and there is one single register which has a bunch
> of bits that enable the various clocks that is used by its clock
> driver.
>
> Hence, I put forward that:
>
> "The MediaTek SGMIISYS controller provides various clocks to the system."
>
> is quite misleading, and it should be described as:

Indeed I was...

>
> "The MediaTek SGMIISYS controller provides a SGMII PCS and some clocks
> to the ethernet subsystem to which it is attached."

+1

> and a PCS providing clocks to the ethernet subsystem is nothing
> really new - we just don't use the clk API to describe them, and
> thus don't normally need to throw a syscon thing in there to share
> the register space between two drivers.

Humm, yes. Just like phys that provide clocks.

If PCS is the main function, then it should go in the PCS directory:
bindings/net/pcs/

> So, in summary, I don't think moving this to "bindings/clock/" makes
> any sense what so ever, and that is probably being based on a
> misleading description of what this hardware is and the code structure
> adopted in the kernel.
>
> Yes, DT describes the hardware. That's exactly the point I'm making.
> It seems that the decision here to classify it has a clock driver is
> being made based off the kernel implementation, not what the hardware
> actually is.

Right. I'm just trying to get misc blocks out of bindings/arm/.

Rob

