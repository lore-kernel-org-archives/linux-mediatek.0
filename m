Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4202EC5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGVlo+O+ebU/GFxqfUFQ4h31mc1K7cAiW2G4oCByTC0=; b=ZriOFwwMu/gjILMPddF8pSadmM
	z8H55+OQ/2UEN4tBtV8JEWlmAL1go43Jkh+KrHOyvInnUmggyAB4fqqWHC1KOa+E+L0eTj/+dqYBG
	+hTzCrtN6wtk+XBBIX8i84jr+J938OQwM23+DUvxJazIxyTuAmddUriq29AE3SdzSuoeSdOM7yitj
	d8zusTPE+QVeLbN1TGZ5q4ZXaCbtSH2MlAbm5n7Ddd32AqyGdkI/BLSSKlfOSODLUDDsLBSmAY8Z6
	3oo4DyABU4NvSuQ0uZK8V4mX0Tgx7+bTgJlvvyx/nhCEUCjPte7p+5f7WjKi0gmtpqqc8c25FExef
	/uUuTX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirvY-0000000ATUP-1A6S;
	Tue, 27 Aug 2024 08:51:48 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirr6-0000000ASCJ-3TUz;
	Tue, 27 Aug 2024 08:47:14 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso57372181fa.2;
        Tue, 27 Aug 2024 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724748430; x=1725353230; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fGVlo+O+ebU/GFxqfUFQ4h31mc1K7cAiW2G4oCByTC0=;
        b=UiREZ2aoPavooxhquBBC998EiH4sAOmj53xA6Yr0mYCe65QwVzYUsQI634VnYXKf+d
         T/f77iD2ZhR/xUP6Am6pLftw1z7jFUfOAOBJBSEIPQzJ7y/plfQg+X8jI8PAeL5uM67K
         1iy7P75D0TOJVHFY75mXBNcxVrYpi8gbtoh5DPTxp75r2mS8whRVwdXGXmuLEwiR8PLE
         1JkhZOVznOOaeq0VJ/jc9AgCoAtYV/na7D8mAAeG5Mpl55p50QTSLSusTP9JiKPGPSlK
         X6V753ExyFkXgvBrjytQvHkYLqbEr85/W/6A5+SjeEKfWBotGiNzRXhNJiJ5w8FFcOn6
         uGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748430; x=1725353230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGVlo+O+ebU/GFxqfUFQ4h31mc1K7cAiW2G4oCByTC0=;
        b=jxfqr1kyYZ9vIsST3Dqsr9e3jaIbtz0JDIfEOYEVzYUEn62eOQkWxz7oW2Gkrox53L
         H4T+TcGiw8kURlP7w8568Udw12KKIVGxKzobOUDojYDIwFqfglp9xQZQ9qIsdJbvZr1h
         spbE+a9KHxLUi7FoDZ/O5/YcBRVokcQG1WOtspQeP0qhdHpOvDrO2t6HhKe2QqK/ivJR
         MBz7PJDPDHZQkS2a0bLqZR7vTwtmmnjB+9u7jWS7P2zwliGHOcPcWUiPD9ncC1U2WKZp
         +zrizDpi7Zg5afFlQL8WQ/vIVH4YbFE8VWhVvGst2L5nM576jNns0GR86XbwFAU9MKJA
         yD0g==
X-Forwarded-Encrypted: i=1; AJvYcCVciDNk0ZKwaCV6Z4TSidJCNQ2ped026H1eCF2JOi1vPUFbBytTraKqafa1D8PX2ayWDtx4Xm/EaP0xM/4Wmu8v@lists.infradead.org, AJvYcCXC6C+yF22FE0aAtWFPoBPDyIOblJxsvfVXv4cO9FsaS4DrJaXOAzKJmrlJyXSBXuLJIywN5lBN8952dXDCwVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqCCxmGgbylCRjmsVj2HGcSV9nPjH4bBiFPGSPCDpw7KqWCyMQ
	sFAYpv1frPruFShASh5YDqfQlXPnro49JK/C2I3Eq0KB1AWGhuFYfi9V1+jsw1iOjgdK/+2NANc
	rDwT29hvC0pQHbn5BPVj8bQV2nnk=
X-Google-Smtp-Source: AGHT+IF+7bMAIBWpPp9ZpYwoa+Iv2SEaNFgur+pE6KunkOxacIkCMQdQ0TOsiUNbIEVl+RbrIkKRo9Ai58gvP8G+H1Q=
X-Received: by 2002:a2e:bc1f:0:b0:2f5:487:e87a with SMTP id
 38308e7fff4ca-2f50487eaa3mr51459021fa.18.1724748429619; Tue, 27 Aug 2024
 01:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org> <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu> <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com> <Zsj8bmBJhfUdH6qT@lore-desk> <20240826-kinsman-crunching-e3b75297088c@spud>
In-Reply-To: <20240826-kinsman-crunching-e3b75297088c@spud>
From: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Date: Tue, 27 Aug 2024 10:46:58 +0200
Message-ID: <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_014712_956347_591E70F1 
X-CRM114-Status: GOOD (  56.23  )
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

>
> On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > >
> > > > >
> > > > > Hi.
> > > > >
> > > > > > before looking at v1:
> > > > > > I would really like to see an explanation for why this is a correct
> > > > > > model of the hardware as part of the commit message. To me this screams
> > > > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > > > using regmap to access it you're doing whatever this is...
> > > > >
> > > > > Can you post a link to a good example dts that uses syscon/MFD ?
> > > > >
> > > > > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > > > > good example would help with developing a proper implementation.
> > > >
> > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > > > example. I would suggest to start by looking at drivers within gpio or
> > > > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > > > either of_node->parent or dev.parent->of_node (which you use depends on
> > > > whether or not you have a child node or not).
> > > >
> > > > I recently had some questions myself for Rob about child nodes for mfd
> > > > devices and when they were suitable to use:
> > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> > > >
> > > > Following Rob's line of thought, I'd kinda expect an mfd driver to create
> > > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > > pinctrl to have a child node.
> > >
> > > Just to not get confused and staring to focus on the wrong kind of
> > > API/too complex solution, I would suggest to check the example from
> > > Lorenzo.
> > >
> > > The pinctrl/gpio is an entire separate block and is mapped separately.
> > > What is problematic is that chip SCU is a mix and address are not in
> > > order and is required by many devices. (clock, pinctrl, gpio...)
> > >
> > > IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> > > single big region and in our case we need to map 2 different one (gpio
> > > AND chip SCU) (or for clock SCU and chip SCU)
> > >
> > > Similar problem is present in many other place and syscon is just for
> > > the task.
> > >
> > > Simple proposed solution is:
> > > - chip SCU entirely mapped and we use syscon
>
> That seems reasonable.

ack

>
> > > - pinctrl mapped and reference chip SCU by phandle
>
> ref by phandle shouldn't be needed here, looking up by compatible should
> suffice, no?

ack, I think it would be fine

>
> > > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
>
> The pwm is not a child of the pinctrl though, they're both subfunctions of
> the register region they happen to both be in. I don't agree with that
> appraisal, sounds like an MFD to me.

ack

>
> > > Hope this can clear any confusion.
> >
> > To clarify the hw architecture we are discussing about 3 memory regions:
> > - chip_scu: <0x1fa20000 0x384>
> > - scu: <0x1fb00020 0x94c>
>                   ^
> I'm highly suspicious of a register region that begins at 0x20. What is
> at 0x1fb00000?

sorry, my fault

>
> > - gpio: <0x1fbf0200 0xbc>
>
> Do you have a link to the register map documentation for this hardware?
>
> > The memory regions above are used by the following IC blocks:
> > - clock: chip_scu and scu
>
> What is the differentiation between these two different regions? Do they
> provide different clocks? Are registers from both of them required in
> order to provide particular clocks?

In chip-scu and scu memory regions we have heterogeneous registers.
Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
clock divider, switch clock source and divider, main bus clock source
and divider, ...) while in scu (regarding clock configuration) we have
pcie clock regs (e.g. reset and other registers). This is the reason
why, in en7581-scu driver, we need both of them, but we can access
chip-scu via the compatible string (please take a look at the dts
below).

>
> > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
>
> Ditto here. Are these actually two different sets of iomuxes, or are
> registers from both required to mux a particular pin?

Most of the io-muxes configuration registers are in chip-scu block,
just pwm ones are in gpio memory block.
Gpio block is mainly used for gpio_chip and irq_chip functionalities.

>
> > - pwm: gpio
> >
> > clock and pinctrl devices share the chip_scu memory region but they need to
> > access even other separated memory areas (scu and gpio respectively).
> > pwm needs to just read/write few gpio registers.
> > As pointed out in my previous email, we can define the chip_scu block as
> > syscon node that can be accessed via phandle by clock and pinctrl drivers.
> > clock driver will map scu area while pinctrl one will map gpio memory block.
> > pwm can be just a child of pinctrl node.
>
> As I mentioned above, the last statement here I disagree with. As
> someone that's currently in the process of fixing making a mess of this
> exact kind of thing, I'm going to strongly advocate not taking shortcuts
> like this.
>
> IMO, all three of these regions need to be described as syscons in some
> form, how exactly it's hard to say without a better understanding of the
> breakdown between regions.
>
> If, for example, the chip_scu only provides a few "helper" bits, I'd
> expect something like
>
> syscon@1fa20000 {
>         compatible = "chip-scu", "syscon";
>         reg = <0x1fa2000 0x384>;
> };
>
> syscon@1fb00000 {
>         compatible = "scu", "syscon", "simple-mfd";
>         #clock-cells = 1;
> };
>
> syscon@1fbf0200 {
>         compatible = "gpio-scu", "syscon", "simple-mfd";
>         #pwm-cells = 1;
>
>         pinctrl@x {
>                 compatible = "pinctrl";
>                 reg = x;
>                 #pinctrl-cells = 1;
>                 #gpio-cells = 1;
>         };
> };
>

ack, so we could use the following dts nodes for the discussed memory
regions (chip-scu, scu and gpio):

syscon@1fa20000 {
    compatible = "airoha,chip-scu", "syscon";
    reg = <0x0 0x1fa2000 0x0 0x384>;
};

clock-controller@1fb00000 {
    compatible = "airoha,en7581-scu", "syscon";
    reg = <0x0 0x1fb00000 0x0 0x94c>;
    #clock-cells = <1>;
    #reset-cells = <1>;
};

mfd@1fbf0200 {
    compatible = "airoha,en7581-gpio-mfd", "simple-mfd";
    reg = <0x0 0x1fbf0200 0x0 0xc0>;

    pio: pinctrl {
        compatible = "airoha,en7581-pinctrl"
        gpio-controller;
        #gpio-cells = <2>;

        interrupt-controller;
        #interrupt-cells = <2>;
        interrupt-parent = <&gic>;
        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
    }

    pwm: pwm {
        compatible = "airoha,en7581-pwm";
        #pwm-cells = <3>;
    }
};

What do you think?
If we all agree on the approach above, we can proceed with the
required changes in the clk/pinctrl and pwm drivers.

Regards,
Lorenzo

> And you could look up the chip-scu by its compatible from the clock or
> pinctrl drivers. Perhaps the "helper" bits assumption is incorrect
> however, and both the scu and chip scu provide independent clocks?
>
> > What do you think about this approach? Can we address the requirements above
> > via classic mfd driver?
>
>

