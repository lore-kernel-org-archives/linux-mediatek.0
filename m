Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1F6C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 22:05:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ADD261428
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 22:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ADD261428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XM3F6eaTPfpdUaSqzt81ExHjCMkgiBqCBFCIdrWkHe0=; b=oml0RqFDSVVuLHswYm9SnNtZF
	0Hsn5MUUghGC38urvmpu7bM0ReREj5DVZvxZXb7moCUKzSi22Bq44h13ts8KyOX+AI0/AlLZiOvIp
	nCmH31kRa0K79/NBkrJUjTwpxwgAy55GVhWXpBXULCU009lwUkCT6+65EW0+O6c4LY9c4yMW515Ao
	AKW7iptBA4lnt/ltbjGh2X6mIdqwqQxn3mSKhloyrCWHzCaRfGYIt9OYjB0VQ/mU/DunlMlZ5Hnyt
	LOQPZEZI1a0e/lGeNQidj4UPg91OMff4+SVIelEgwnsfJj6vJ97oknEhgCyE9KvkhE/GpXuAXQuYM
	TGFacEp9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZKyU-00FGFg-Vl; Wed, 21 Apr 2021 22:05:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZKyB-00FGEG-19; Wed, 21 Apr 2021 22:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rAa4AoVI0mgDiNi0ZbvS/C0L5MD8lJf8UDLKotBP8xg=; b=ia0pz8BR3MI4Xf2wQaRRBL9HDt
 5gExhz4SP1SY9UUuryfGXLUi5dWjpBQOAOqCU29KzzYD6eVBfyU4d9NcMzi+t36tqXgtDikdo9lb/
 siqBkW3ILxNpaZkuC3TbuIOiqfjsTyaIaUG+sUEaPONOSoFfzuP/kwyWxoVF6c0HaaAYsRacyizrX
 p7y2WdJcW/pWhCnvjHxeCmFZQL+gxEmT9hKbIBi/6Hk4d/0b8SRVVcsNdcgtxfAtqnC0qk18IEeL7
 BIXv/ACt1ILvmdfoOeciyYm7pGDU5QTiv3FWQaKYJTJNBvMZ6C0fYVc1jHJxOnyveGu5/00QNBfN0
 FRwhwxkg==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZKy8-00DDca-5C; Wed, 21 Apr 2021 22:05:13 +0000
Received: by mail-il1-x129.google.com with SMTP id i22so31449458ila.11;
 Wed, 21 Apr 2021 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rAa4AoVI0mgDiNi0ZbvS/C0L5MD8lJf8UDLKotBP8xg=;
 b=NgfkNeqlHpLkUliop4vSn2+q3bezFt4oUiYnYkVpX01B4brnA9l6x+juMYSzOtTB48
 BKseTAOyeV6JlEJoUJ28mLgIPB2Qo7n24pmw1/FEn+K5OSvM0CYu/pOsdArZgjitUR+I
 uqNePPO7zltP7rdrn0QB8a5KdE8xoyDTQAPOUmAMq0PZDq3trnFEJn8gcRXDxR0uDsLz
 Bxg0yyma+8GHPbMabPll4tYUQfkwnjxY4be5vAKuQfqTyjDqFroVyiNPWrcwY2nEvmtL
 Rb/6fV2HOo3x1vEp8skjD+hCwsE+jb50gNMMgzYEebAV34lB+BFQulUjsG2TX7Yn1PwH
 EtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAa4AoVI0mgDiNi0ZbvS/C0L5MD8lJf8UDLKotBP8xg=;
 b=KolkaH5eOqsEO1s6/pMWWOwhKv4GMk6Wn4KArnx8nIPE4nASynbPYZUWKzwNN1gZUK
 6N5IUiqlV8ThNT4RX5U5euc/JdUtC4/Hm99p1/wmjVVdC7OPtHk3SsgSJqqyte4fVCVP
 1iFo3ZcKP01FtL2oLbZxhL75BHgxUXZUso3bRjFrfKIG05ckHdCMnOJpuagPvYS+JYQm
 kGBhfcLqtAgrqDjLUA87iAJxK467IVWnz08Mz2SF6pu+GtVQVFcl5auvGO3NWyeb0u1z
 qhXvLsSTdlhMOGVzx43W74bRRU2jnF8DEq2WRqTqiXq07gl+BMTREINmzwNzn/wA5kJo
 ewkw==
X-Gm-Message-State: AOAM531eHtlPLh70aAbmpvaAqr7wjuKQ66YzHwIzt7z4G/5SmgSEAZ7V
 HZYFgyhBpAlD2n0WE4ef87Hg7DszV+0ndCDkFEU=
X-Google-Smtp-Source: ABdhPJyy8zjyVhV7MgOS92BeZ44BHIMqlDzDWnyjkS+KK4s+CWFrwXkjY7c42OJE4rzEu6qf4Z8SjZFA58w0xTdd5bM=
X-Received: by 2002:a05:6e02:cad:: with SMTP id 13mr136419ilg.77.1619042710645; 
 Wed, 21 Apr 2021 15:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210420024222.101615-1-ilya.lipnitskiy@gmail.com>
 <20210421220302.GA1637795@robh.at.kernel.org>
In-Reply-To: <20210421220302.GA1637795@robh.at.kernel.org>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Wed, 21 Apr 2021 15:04:59 -0700
Message-ID: <CALCv0x2oSXBT-6LteYtr9J5XmmDuer_=sbCgB5CBXWe_cKk2sA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: mediatek/ralink: remove unused bindings
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Crispin <john@phrozen.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_150512_227674_88D4B363 
X-CRM114-Status: GOOD (  30.04  )
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

Hi Rob,

On Wed, Apr 21, 2021 at 3:03 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 19, 2021 at 07:42:22PM -0700, Ilya Lipnitskiy wrote:
> > Revert commit 663148e48a66 ("Documentation: DT: net: add docs for
> > ralink/mediatek SoC ethernet binding")
> >
> > No in-tree drivers use the compatible strings present in these bindings,
> > and some have been superseded by DSA-capable mtk_eth_soc driver, so
> > remove these obsolete bindings.
>
> Looks like maybe OpenWRT folks are using these. If so, you can't revert
> them.
Indeed, there are out of tree drivers for some of these. I wasn't sure
what the dt-binding policy was for such use cases - can you point me
to a definitive reference?

Ilya
>
> >
> > Cc: John Crispin <john@phrozen.org>
> > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > ---
> >  .../bindings/net/mediatek,mt7620-gsw.txt      | 24 --------
> >  .../bindings/net/ralink,rt2880-net.txt        | 59 -------------------
> >  .../bindings/net/ralink,rt3050-esw.txt        | 30 ----------
> >  3 files changed, 113 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
> >  delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
> >  delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> >
> > diff --git a/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt b/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
> > deleted file mode 100644
> > index 358fed2fab43..000000000000
> > --- a/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -Mediatek Gigabit Switch
> > -=======================
> > -
> > -The mediatek gigabit switch can be found on Mediatek SoCs (mt7620, mt7621).
> > -
> > -Required properties:
> > -- compatible: Should be "mediatek,mt7620-gsw" or "mediatek,mt7621-gsw"
> > -- reg: Address and length of the register set for the device
> > -- interrupts: Should contain the gigabit switches interrupt
> > -- resets: Should contain the gigabit switches resets
> > -- reset-names: Should contain the reset names "gsw"
> > -
> > -Example:
> > -
> > -gsw@10110000 {
> > -     compatible = "ralink,mt7620-gsw";
> > -     reg = <0x10110000 8000>;
> > -
> > -     resets = <&rstctrl 23>;
> > -     reset-names = "gsw";
> > -
> > -     interrupt-parent = <&intc>;
> > -     interrupts = <17>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt b/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
> > deleted file mode 100644
> > index 9fe1a0a22e44..000000000000
> > --- a/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -Ralink Frame Engine Ethernet controller
> > -=======================================
> > -
> > -The Ralink frame engine ethernet controller can be found on Ralink and
> > -Mediatek SoCs (RT288x, RT3x5x, RT366x, RT388x, rt5350, mt7620, mt7621, mt76x8).
> > -
> > -Depending on the SoC, there is a number of ports connected to the CPU port
> > -directly and/or via a (gigabit-)switch.
> > -
> > -* Ethernet controller node
> > -
> > -Required properties:
> > -- compatible: Should be one of "ralink,rt2880-eth", "ralink,rt3050-eth",
> > -  "ralink,rt3050-eth", "ralink,rt3883-eth", "ralink,rt5350-eth",
> > -  "mediatek,mt7620-eth", "mediatek,mt7621-eth"
> > -- reg: Address and length of the register set for the device
> > -- interrupts: Should contain the frame engines interrupt
> > -- resets: Should contain the frame engines resets
> > -- reset-names: Should contain the reset names "fe". If a switch is present
> > -  "esw" is also required.
> > -
> > -
> > -* Ethernet port node
> > -
> > -Required properties:
> > -- compatible: Should be "ralink,eth-port"
> > -- reg: The number of the physical port
> > -- phy-handle: reference to the node describing the phy
> > -
> > -Example:
> > -
> > -mdio-bus {
> > -     ...
> > -     phy0: ethernet-phy@0 {
> > -             phy-mode = "mii";
> > -             reg = <0>;
> > -     };
> > -};
> > -
> > -ethernet@400000 {
> > -     compatible = "ralink,rt2880-eth";
> > -     reg = <0x00400000 10000>;
> > -
> > -     #address-cells = <1>;
> > -     #size-cells = <0>;
> > -
> > -     resets = <&rstctrl 18>;
> > -     reset-names = "fe";
> > -
> > -     interrupt-parent = <&cpuintc>;
> > -     interrupts = <5>;
> > -
> > -     port@0 {
> > -             compatible = "ralink,eth-port";
> > -             reg = <0>;
> > -             phy-handle = <&phy0>;
> > -     };
> > -
> > -};
> > diff --git a/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt b/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> > deleted file mode 100644
> > index 87e315856efa..000000000000
> > --- a/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -Ralink Fast Ethernet Embedded Switch
> > -====================================
> > -
> > -The ralink fast ethernet embedded switch can be found on Ralink and Mediatek
> > -SoCs (RT3x5x, RT5350, MT76x8).
> > -
> > -Required properties:
> > -- compatible: Should be "ralink,rt3050-esw"
> > -- reg: Address and length of the register set for the device
> > -- interrupts: Should contain the embedded switches interrupt
> > -- resets: Should contain the embedded switches resets
> > -- reset-names: Should contain the reset names "esw"
> > -
> > -Optional properties:
> > -- ralink,portmap: can be used to choose if the default switch setup is
> > -  llllw or wllll
> > -- ralink,led_polarity: override the active high/low settings of the leds
> > -
> > -Example:
> > -
> > -esw@10110000 {
> > -     compatible = "ralink,rt3050-esw";
> > -     reg = <0x10110000 8000>;
> > -
> > -     resets = <&rstctrl 23>;
> > -     reset-names = "esw";
> > -
> > -     interrupt-parent = <&intc>;
> > -     interrupts = <17>;
> > -};
> > --
> > 2.31.1
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
