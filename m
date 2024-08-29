Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D9C761AE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 06:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSg7FgZrl+0TZoMrdPwfSEDXu5nZQxXAW4V0oMcqqTk=; b=oXuWJN++y8d4nDyouS+nm0Y4CP
	5qJ+zO9rFmPDX9PWVAHAuw5vEGaQnSiby/oEBeaeWuEghgVUXaSeUAkH1cjs0dBHCZoeirIVaxg3N
	mI6mcHPGYNfQl/v7wNlnoirJRbTlb4iLhSc+QwyuexS2Kd0tLKiiuybqWo4EiAyZkrTHhZ5pv/B5k
	0Y2dKMp2CwKradF/p1rEAb3E6WtXaBHXXYBNeHmvBCnbWQESUjRJE8XV4Z2Ewm5MDU3SWwAl85KRc
	Vcw/fDaDeN/CYom79eTP9m5boA5Qpu9SGxdqrZ2VXGTEjY9DG1ZyLu05ZZoeyDOQb/HY4MteyVKmm
	19stQ1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYWs-00000000jl1-2rK1;
	Thu, 29 Aug 2024 06:21:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYW0-00000000jZI-1MsG;
	Thu, 29 Aug 2024 06:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 11AA4AE4153;
	Thu, 29 Aug 2024 06:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C3BC4CEC1;
	Thu, 29 Aug 2024 06:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912414;
	bh=58lmr6YjTburQUPJP7wVkSN6Eu5yKHTMOISVX6yg84c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfsLm79VL5fpl/vH08EN7WQbu/nSIGmFJ9/3BGk550Fas0We7v9xKgCKBbboRBEnL
	 gHyr/Cy2PPGjV1ORCkj3t0mc0rLTAUDi6L1zqUqyB/QGtrURuXHvr5F2JIXEilqTK2
	 FieKpRVJ6buDOXZXhzIha7PVhz90FGmplzkWzBc8TCcZ78l7cxEBBqqxXF3eT2YvKg
	 urJkX3W2J4Drpm393Nzws7pidLWIV99uXQIqM8So0hdhnnb9r97WFxbJoQStRIa48H
	 VKAEXO6BkM6O52q2AvrFKztwoxWLOvP6DEpq0KzNuwLoR0dqOt1N+8ddxUzuCtgOHu
	 1huHfZr5+U9yw==
Date: Thu, 29 Aug 2024 08:20:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Conor Dooley <conor@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
References: <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <66ce1b04.df0a0220.a2131.6def@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_232016_676024_4CCA6C7E 
X-CRM114-Status: GOOD (  65.22  )
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

On Tue, Aug 27, 2024 at 08:29:20PM +0200, Christian Marangi wrote:
> On Tue, Aug 27, 2024 at 09:35:07AM -0500, Rob Herring wrote:
> > On Tue, Aug 27, 2024 at 3:47=E2=80=AFAM Lorenzo Bianconi
> > <lorenzo.bianconi83@gmail.com> wrote:
> > >
> > > >
> > > > On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > > > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wr=
ote:
> > > > > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > Hi.
> > > > > > > >
> > > > > > > > > before looking at v1:
> > > > > > > > > I would really like to see an explanation for why this is=
 a correct
> > > > > > > > > model of the hardware as part of the commit message. To m=
e this screams
> > > > > > > > > syscon/MFD and instead of describing this as a child of a=
 syscon and
> > > > > > > > > using regmap to access it you're doing whatever this is...
> > > > > > > >
> > > > > > > > Can you post a link to a good example dts that uses syscon/=
MFD ?
> > > > > > > >
> > > > > > > > It is not only pinctrl, pwm and gpio that are entangled in =
each other. A
> > > > > > > > good example would help with developing a proper implementa=
tion.
> > > > > > >
> > > > > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk h=
ave a good
> > > > > > > example. I would suggest to start by looking at drivers withi=
n gpio or
> > > > > > > pinctrl that use syscon_to_regmap() where the argument is sou=
rced from
> > > > > > > either of_node->parent or dev.parent->of_node (which you use =
depends on
> > > > > > > whether or not you have a child node or not).
> > > > > > >
> > > > > > > I recently had some questions myself for Rob about child node=
s for mfd
> > > > > > > devices and when they were suitable to use:
> > > > > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@ker=
nel.org/
> > > > > > >
> > > > > > > Following Rob's line of thought, I'd kinda expect an mfd driv=
er to create
> > > > > > > the devices for gpio and pwm using devm_mfd_add_devices() and=
 the
> > > > > > > pinctrl to have a child node.
> > > > > >
> > > > > > Just to not get confused and staring to focus on the wrong kind=
 of
> > > > > > API/too complex solution, I would suggest to check the example =
=66rom
> > > > > > Lorenzo.
> > > > > >
> > > > > > The pinctrl/gpio is an entire separate block and is mapped sepa=
rately.
> > > > > > What is problematic is that chip SCU is a mix and address are n=
ot in
> > > > > > order and is required by many devices. (clock, pinctrl, gpio...)
> > > > > >
> > > > > > IMHO a mfd is overkill and wouldn't suite the task. MDF still s=
upport a
> > > > > > single big region and in our case we need to map 2 different on=
e (gpio
> > > > > > AND chip SCU) (or for clock SCU and chip SCU)
> > > > > >
> > > > > > Similar problem is present in many other place and syscon is ju=
st for
> > > > > > the task.
> > > > > >
> > > > > > Simple proposed solution is:
> > > > > > - chip SCU entirely mapped and we use syscon
> > > >
> > > > That seems reasonable.
> > >
> > > ack
> > >
> > > >
> > > > > > - pinctrl mapped and reference chip SCU by phandle
> > > >
> > > > ref by phandle shouldn't be needed here, looking up by compatible s=
hould
> > > > suffice, no?
> > >
> > > ack, I think it would be fine
> > >
> > > >
> > > > > > - pwm a child of pinctrl as it's scrambled in the pinctrl mappe=
d regs
> > > >
> > > > The pwm is not a child of the pinctrl though, they're both subfunct=
ions of
> > > > the register region they happen to both be in. I don't agree with t=
hat
> > > > appraisal, sounds like an MFD to me.
> > >
> > > ack
> > >
> > > >
> > > > > > Hope this can clear any confusion.
> > > > >
> > > > > To clarify the hw architecture we are discussing about 3 memory r=
egions:
> > > > > - chip_scu: <0x1fa20000 0x384>
> > > > > - scu: <0x1fb00020 0x94c>
> > > >                   ^
> > > > I'm highly suspicious of a register region that begins at 0x20. Wha=
t is
> > > > at 0x1fb00000?
> > >
> > > sorry, my fault
> > >
> > > >
> > > > > - gpio: <0x1fbf0200 0xbc>
> > > >
> > > > Do you have a link to the register map documentation for this hardw=
are?
> > > >
> > > > > The memory regions above are used by the following IC blocks:
> > > > > - clock: chip_scu and scu
> > > >
> > > > What is the differentiation between these two different regions? Do=
 they
> > > > provide different clocks? Are registers from both of them required =
in
> > > > order to provide particular clocks?
> > >
> > > In chip-scu and scu memory regions we have heterogeneous registers.
> > > Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
> > > clock divider, switch clock source and divider, main bus clock source
> > > and divider, ...) while in scu (regarding clock configuration) we have
> > > pcie clock regs (e.g. reset and other registers). This is the reason
> > > why, in en7581-scu driver, we need both of them, but we can access
> > > chip-scu via the compatible string (please take a look at the dts
> > > below).
> > >
> > > >
> > > > > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> > > >
> > > > Ditto here. Are these actually two different sets of iomuxes, or are
> > > > registers from both required to mux a particular pin?
> > >
> > > Most of the io-muxes configuration registers are in chip-scu block,
> > > just pwm ones are in gpio memory block.
> > > Gpio block is mainly used for gpio_chip and irq_chip functionalities.
> > >
> > > >
> > > > > - pwm: gpio
> > > > >
> > > > > clock and pinctrl devices share the chip_scu memory region but th=
ey need to
> > > > > access even other separated memory areas (scu and gpio respective=
ly).
> > > > > pwm needs to just read/write few gpio registers.
> > > > > As pointed out in my previous email, we can define the chip_scu b=
lock as
> > > > > syscon node that can be accessed via phandle by clock and pinctrl=
 drivers.
> > > > > clock driver will map scu area while pinctrl one will map gpio me=
mory block.
> > > > > pwm can be just a child of pinctrl node.
> > > >
> > > > As I mentioned above, the last statement here I disagree with. As
> > > > someone that's currently in the process of fixing making a mess of =
this
> > > > exact kind of thing, I'm going to strongly advocate not taking shor=
tcuts
> > > > like this.
> > > >
> > > > IMO, all three of these regions need to be described as syscons in =
some
> > > > form, how exactly it's hard to say without a better understanding o=
f the
> > > > breakdown between regions.
> > > >
> > > > If, for example, the chip_scu only provides a few "helper" bits, I'd
> > > > expect something like
> > > >
> > > > syscon@1fa20000 {
> > > >         compatible =3D "chip-scu", "syscon";
> > > >         reg =3D <0x1fa2000 0x384>;
> > > > };
> > > >
> > > > syscon@1fb00000 {
> > > >         compatible =3D "scu", "syscon", "simple-mfd";
> > > >         #clock-cells =3D 1;
> > > > };
> > > >
> > > > syscon@1fbf0200 {
> > > >         compatible =3D "gpio-scu", "syscon", "simple-mfd";
> > > >         #pwm-cells =3D 1;
> > > >
> > > >         pinctrl@x {
> > > >                 compatible =3D "pinctrl";
> > > >                 reg =3D x;
> > > >                 #pinctrl-cells =3D 1;
> > > >                 #gpio-cells =3D 1;
> > > >         };
> > > > };
> > > >
> > >
> > > ack, so we could use the following dts nodes for the discussed memory
> > > regions (chip-scu, scu and gpio):
> > >
> > > syscon@1fa20000 {
> > >     compatible =3D "airoha,chip-scu", "syscon";
> > >     reg =3D <0x0 0x1fa2000 0x0 0x384>;
> > > };
> > >
> > > clock-controller@1fb00000 {
> > >     compatible =3D "airoha,en7581-scu", "syscon";
> > >     reg =3D <0x0 0x1fb00000 0x0 0x94c>;
> > >     #clock-cells =3D <1>;
> > >     #reset-cells =3D <1>;
> > > };
> > >
> > > mfd@1fbf0200 {
> > >     compatible =3D "airoha,en7581-gpio-mfd", "simple-mfd";
> > >     reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> > >
> > >     pio: pinctrl {
> > >         compatible =3D "airoha,en7581-pinctrl"
> > >         gpio-controller;
> > >         #gpio-cells =3D <2>;
> > >
> > >         interrupt-controller;
> > >         #interrupt-cells =3D <2>;
> > >         interrupt-parent =3D <&gic>;
> > >         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > >     }
> > >
> > >     pwm: pwm {
> > >         compatible =3D "airoha,en7581-pwm";
> > >         #pwm-cells =3D <3>;
> > >     }
> > > };
> >=20
> > I think this can be simplified down to this:
> >=20
> > mfd@1fbf0200 {
> >     compatible =3D "airoha,en7581-gpio-mfd";  // MFD is a Linuxism. What
> > is this h/w block called?
> >     reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> >     gpio-controller;
> >     #gpio-cells =3D <2>;
> >     interrupt-controller;
> >     #interrupt-cells =3D <2>;
> >     interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> >=20
> >     #pwm-cells =3D <3>;
> >=20
> >     pio: pinctrl {
> >         foo-pins {};
> >         bar-pins {};
> >     };
> > };
> >=20
> > Maybe we keep the compatible in 'pinctrl'...
> >
>=20
> Hi Rob, thanks a lot for the hint, I hope we can finally find a solution
> on how to implement this.
>=20
> In Documentation the block is called GPIO Controller. As explained it does
> expose pinctrl function AND pwm (with regs in the middle)
>=20
> Is this semplification really needed? It does pose some problem driver
> wise (on where to put the driver, in what subsystem) and also on the

Sorry, but no, dt-bindings do not affect the driver at all in such way.
Nothing changes in your driver in such aspect, no dilemma where to put
it (the same place as before).

> yaml side with mixed property for pinctrl and pwm controller.

Hardware people mixed it, not we...

>=20
> I feel mixing the 2 thing might cause some confusion on the 2 block
> device that are well separated aside from the unlucky position of the
> regs.

I think the feedback you got is that essentially these are parts of the
same device. Are you saying that hardware is really two separate
devices?

>=20
> The suggested MFD implementation would consist of
> - main node with MFD (map the entire GPIO controller regs)
> -   2 child for PWM and pinctrl (no regs)
>=20
> - driver in mfd/
> - driver in pinctrl/
> - driver in pwm/

This has nothing to do with bindings, except that you will need one
driver somewhere which adds child devices, but you still could do
everything as two drivers (as before).

Anyway how to structure drivers is rarely good argument about bindings.

>=20
> An alternative is the previous solution with pinctrl mapping all the
> GPIO controller regs and PWM a child but Conor suggested that a MFD
> structure might be better suited for the task. We have both implemented
> and ready to be submitted. Hope we can find a common decision on how to
> implement this simple but annoying block of devices.

Best regards,
Krzysztof


