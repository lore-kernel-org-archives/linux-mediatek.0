Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BFBCA0FE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OziwRUxyC3j96mdMIIg3OavGqoxpdJQW/+7PEbH1cs=; b=rOdrwIL+GLKuCaFLOQjfkKA017
	qbJQwtraT+t1ED8FKG4l4Pk5ieWE8wKA0kel5TgNpTdfkk30jMbvARFtweED+wfr8/RrHrKA33Htv
	756Y7VEnxyc/9JEOGvMeWGs27xfr1HT5xhbeDeJlakHeU4ktAclbAvMIpEg3bfLl5d2y6gEgeRe/R
	gq282YhMlzYcrTc2WmIuV6Bt/mSrut+f8+AjeIZukiyarpMIk47CCaM5gCrZjrRNa1iQp3UE8Hy7A
	VafHFOkF9XvwVoSmW6k79JPEj3EXjoBo9VEuqAGDC9o8vafNBsR+DMFMh+gL9VHnnXYeHL67xNOe0
	m4b1dSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyRV-00000005gNb-3MQS;
	Fri, 30 Aug 2024 10:01:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxLQ-00000005RB7-3n5x;
	Fri, 30 Aug 2024 08:51:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3718cd91185so911903f8f.2;
        Fri, 30 Aug 2024 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725007858; x=1725612658; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OziwRUxyC3j96mdMIIg3OavGqoxpdJQW/+7PEbH1cs=;
        b=WjeAAHpLHlHLXau5rZpX853us8Wp4jTQhI/gmZncl1FFrBmkhHuzhXcEcOlmkNvYOS
         1qmJeFMdoulhlmxUypkHhCjsITNHe+P8h2TiBcWBVP312Vrvy4WaS9BE0kzVNpEV1QEr
         AQI9gJb3Vg/zYdtYFhBlnXFQ67bJcZPKK8KYUoRs2W88s7UsCd6/VRM7KTe4dWeDMLum
         Njy6c2qNx78GNv2TL+NqUu2pRitaroydrFIv66XJnNN0MEP2hEvBTIu6cv5yVNP8rGZN
         iVrUrpasGYjLF92BKCsxBWAvYrF25WqcFy1WxAYHHy8htWkq7EoPSKZzuLxZI8hLc7mn
         oCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007858; x=1725612658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OziwRUxyC3j96mdMIIg3OavGqoxpdJQW/+7PEbH1cs=;
        b=S0uHz8Pwaizbdayl/A12Wo6F0DgOFsogan2wpxjDxCSoPfPepccvppMDR0bjChDhP6
         XwegZ0AGjvzPA/mv2pIFnozSX7+MPDZfp99j4P73SRy36tlzU3gBs/dAkD5NFk1Yp7c9
         Ng0OweQd/Wu5qPXe82XImK+gIAMA3glEbM1zU3DqdbdfcRC5r5cALLOVzGOm9pzl4udG
         9VbNbC3IxW+nL1AyvsX+e59HLOOrPFh4C1zM+shUBox43ocl1kIIpNdw40y8j6cnSzum
         tSmRdoZ7zUeCzSh+mEUQQwGPA0uheNKa+WFcou8yVv9ghYJQxtC7C1gVvPcgOkjGisEu
         zxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2dgrA+ZyT4T/8G78ypMHK7xcCnRHZWhF7zfG5e4Cc7dgvifnDFBmoIdYpM7rQ2KZyeHe9mDva3mzV9iMZDBy/@lists.infradead.org, AJvYcCXo1FEakb5o1uRVswhUY+YF1iMbheo6MIEXoAtW2UYAVMnfM35wlg7LWjgi0a5DFsRt1TEGDbtMm8n8k4+FBtA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZc6Mc67RBWoAW+BkY5K/Ib4N/dlStXYFDLaO37H5M3PBEC9o8
	1Kv65uBhtPZD693oDklznyAbg8DBAsD5Apw7VdIdvuqBilRnb6+3
X-Google-Smtp-Source: AGHT+IHgZbN8ZqJx1LvmgAxQTgs7uHddgyhTVi3ZKrzZDekElTu7KefeyK2c9KlgWOrf7/rK3c5CyQ==
X-Received: by 2002:adf:e641:0:b0:368:12ef:92cf with SMTP id ffacd0b85a97d-3749b5896a6mr3908959f8f.48.1725007858115;
        Fri, 30 Aug 2024 01:50:58 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-209-141.retail.telecomitalia.it. [87.1.209.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a42sm38775625e9.11.2024.08.30.01.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:50:57 -0700 (PDT)
Message-ID: <66d187f1.050a0220.3213d8.ad53@mx.google.com>
X-Google-Original-Message-ID: <ZtGH745nmIMYZFEb@Ansuel-XPS.>
Date: Fri, 30 Aug 2024 10:50:55 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
References: <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_015101_015778_69EF821D 
X-CRM114-Status: GOOD (  66.33  )
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

On Thu, Aug 29, 2024 at 08:20:10AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 27, 2024 at 08:29:20PM +0200, Christian Marangi wrote:
> > On Tue, Aug 27, 2024 at 09:35:07AM -0500, Rob Herring wrote:
> > > On Tue, Aug 27, 2024 at 3:47 AM Lorenzo Bianconi
> > > <lorenzo.bianconi83@gmail.com> wrote:
> > > >
> > > > >
> > > > > On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > > > > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > > > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > > > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hi.
> > > > > > > > >
> > > > > > > > > > before looking at v1:
> > > > > > > > > > I would really like to see an explanation for why this is a correct
> > > > > > > > > > model of the hardware as part of the commit message. To me this screams
> > > > > > > > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > > > > > > > using regmap to access it you're doing whatever this is...
> > > > > > > > >
> > > > > > > > > Can you post a link to a good example dts that uses syscon/MFD ?
> > > > > > > > >
> > > > > > > > > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > > > > > > > > good example would help with developing a proper implementation.
> > > > > > > >
> > > > > > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > > > > > > > example. I would suggest to start by looking at drivers within gpio or
> > > > > > > > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > > > > > > > either of_node->parent or dev.parent->of_node (which you use depends on
> > > > > > > > whether or not you have a child node or not).
> > > > > > > >
> > > > > > > > I recently had some questions myself for Rob about child nodes for mfd
> > > > > > > > devices and when they were suitable to use:
> > > > > > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> > > > > > > >
> > > > > > > > Following Rob's line of thought, I'd kinda expect an mfd driver to create
> > > > > > > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > > > > > > pinctrl to have a child node.
> > > > > > >
> > > > > > > Just to not get confused and staring to focus on the wrong kind of
> > > > > > > API/too complex solution, I would suggest to check the example from
> > > > > > > Lorenzo.
> > > > > > >
> > > > > > > The pinctrl/gpio is an entire separate block and is mapped separately.
> > > > > > > What is problematic is that chip SCU is a mix and address are not in
> > > > > > > order and is required by many devices. (clock, pinctrl, gpio...)
> > > > > > >
> > > > > > > IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> > > > > > > single big region and in our case we need to map 2 different one (gpio
> > > > > > > AND chip SCU) (or for clock SCU and chip SCU)
> > > > > > >
> > > > > > > Similar problem is present in many other place and syscon is just for
> > > > > > > the task.
> > > > > > >
> > > > > > > Simple proposed solution is:
> > > > > > > - chip SCU entirely mapped and we use syscon
> > > > >
> > > > > That seems reasonable.
> > > >
> > > > ack
> > > >
> > > > >
> > > > > > > - pinctrl mapped and reference chip SCU by phandle
> > > > >
> > > > > ref by phandle shouldn't be needed here, looking up by compatible should
> > > > > suffice, no?
> > > >
> > > > ack, I think it would be fine
> > > >
> > > > >
> > > > > > > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
> > > > >
> > > > > The pwm is not a child of the pinctrl though, they're both subfunctions of
> > > > > the register region they happen to both be in. I don't agree with that
> > > > > appraisal, sounds like an MFD to me.
> > > >
> > > > ack
> > > >
> > > > >
> > > > > > > Hope this can clear any confusion.
> > > > > >
> > > > > > To clarify the hw architecture we are discussing about 3 memory regions:
> > > > > > - chip_scu: <0x1fa20000 0x384>
> > > > > > - scu: <0x1fb00020 0x94c>
> > > > >                   ^
> > > > > I'm highly suspicious of a register region that begins at 0x20. What is
> > > > > at 0x1fb00000?
> > > >
> > > > sorry, my fault
> > > >
> > > > >
> > > > > > - gpio: <0x1fbf0200 0xbc>
> > > > >
> > > > > Do you have a link to the register map documentation for this hardware?
> > > > >
> > > > > > The memory regions above are used by the following IC blocks:
> > > > > > - clock: chip_scu and scu
> > > > >
> > > > > What is the differentiation between these two different regions? Do they
> > > > > provide different clocks? Are registers from both of them required in
> > > > > order to provide particular clocks?
> > > >
> > > > In chip-scu and scu memory regions we have heterogeneous registers.
> > > > Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
> > > > clock divider, switch clock source and divider, main bus clock source
> > > > and divider, ...) while in scu (regarding clock configuration) we have
> > > > pcie clock regs (e.g. reset and other registers). This is the reason
> > > > why, in en7581-scu driver, we need both of them, but we can access
> > > > chip-scu via the compatible string (please take a look at the dts
> > > > below).
> > > >
> > > > >
> > > > > > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> > > > >
> > > > > Ditto here. Are these actually two different sets of iomuxes, or are
> > > > > registers from both required to mux a particular pin?
> > > >
> > > > Most of the io-muxes configuration registers are in chip-scu block,
> > > > just pwm ones are in gpio memory block.
> > > > Gpio block is mainly used for gpio_chip and irq_chip functionalities.
> > > >
> > > > >
> > > > > > - pwm: gpio
> > > > > >
> > > > > > clock and pinctrl devices share the chip_scu memory region but they need to
> > > > > > access even other separated memory areas (scu and gpio respectively).
> > > > > > pwm needs to just read/write few gpio registers.
> > > > > > As pointed out in my previous email, we can define the chip_scu block as
> > > > > > syscon node that can be accessed via phandle by clock and pinctrl drivers.
> > > > > > clock driver will map scu area while pinctrl one will map gpio memory block.
> > > > > > pwm can be just a child of pinctrl node.
> > > > >
> > > > > As I mentioned above, the last statement here I disagree with. As
> > > > > someone that's currently in the process of fixing making a mess of this
> > > > > exact kind of thing, I'm going to strongly advocate not taking shortcuts
> > > > > like this.
> > > > >
> > > > > IMO, all three of these regions need to be described as syscons in some
> > > > > form, how exactly it's hard to say without a better understanding of the
> > > > > breakdown between regions.
> > > > >
> > > > > If, for example, the chip_scu only provides a few "helper" bits, I'd
> > > > > expect something like
> > > > >
> > > > > syscon@1fa20000 {
> > > > >         compatible = "chip-scu", "syscon";
> > > > >         reg = <0x1fa2000 0x384>;
> > > > > };
> > > > >
> > > > > syscon@1fb00000 {
> > > > >         compatible = "scu", "syscon", "simple-mfd";
> > > > >         #clock-cells = 1;
> > > > > };
> > > > >
> > > > > syscon@1fbf0200 {
> > > > >         compatible = "gpio-scu", "syscon", "simple-mfd";
> > > > >         #pwm-cells = 1;
> > > > >
> > > > >         pinctrl@x {
> > > > >                 compatible = "pinctrl";
> > > > >                 reg = x;
> > > > >                 #pinctrl-cells = 1;
> > > > >                 #gpio-cells = 1;
> > > > >         };
> > > > > };
> > > > >
> > > >
> > > > ack, so we could use the following dts nodes for the discussed memory
> > > > regions (chip-scu, scu and gpio):
> > > >
> > > > syscon@1fa20000 {
> > > >     compatible = "airoha,chip-scu", "syscon";
> > > >     reg = <0x0 0x1fa2000 0x0 0x384>;
> > > > };
> > > >
> > > > clock-controller@1fb00000 {
> > > >     compatible = "airoha,en7581-scu", "syscon";
> > > >     reg = <0x0 0x1fb00000 0x0 0x94c>;
> > > >     #clock-cells = <1>;
> > > >     #reset-cells = <1>;
> > > > };
> > > >
> > > > mfd@1fbf0200 {
> > > >     compatible = "airoha,en7581-gpio-mfd", "simple-mfd";
> > > >     reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > > >
> > > >     pio: pinctrl {
> > > >         compatible = "airoha,en7581-pinctrl"
> > > >         gpio-controller;
> > > >         #gpio-cells = <2>;
> > > >
> > > >         interrupt-controller;
> > > >         #interrupt-cells = <2>;
> > > >         interrupt-parent = <&gic>;
> > > >         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > >     }
> > > >
> > > >     pwm: pwm {
> > > >         compatible = "airoha,en7581-pwm";
> > > >         #pwm-cells = <3>;
> > > >     }
> > > > };
> > > 
> > > I think this can be simplified down to this:
> > > 
> > > mfd@1fbf0200 {
> > >     compatible = "airoha,en7581-gpio-mfd";  // MFD is a Linuxism. What
> > > is this h/w block called?
> > >     reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > >     gpio-controller;
> > >     #gpio-cells = <2>;
> > >     interrupt-controller;
> > >     #interrupt-cells = <2>;
> > >     interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > 
> > >     #pwm-cells = <3>;
> > > 
> > >     pio: pinctrl {
> > >         foo-pins {};
> > >         bar-pins {};
> > >     };
> > > };
> > > 
> > > Maybe we keep the compatible in 'pinctrl'...
> > >
> > 
> > Hi Rob, thanks a lot for the hint, I hope we can finally find a solution
> > on how to implement this.
> > 
> > In Documentation the block is called GPIO Controller. As explained it does
> > expose pinctrl function AND pwm (with regs in the middle)
> > 
> > Is this semplification really needed? It does pose some problem driver
> > wise (on where to put the driver, in what subsystem) and also on the
> 
> Sorry, but no, dt-bindings do not affect the driver at all in such way.
> Nothing changes in your driver in such aspect, no dilemma where to put
> it (the same place as before).
>

Ok, from the proposed node structure, is it problematic to move the
gpio-controller and -cells in the pinctrl node? And also the pwm-cells
to the pwm node?
This is similar to how it's done by broadcom GPIO MFD [1] that also
expose pinctrl and other device in the same register block as MFD
childs.

This would be the final node block.

                mfd@1fbf0200 {
                        compatible = "airoha,en7581-gpio-mfd";
                        reg = <0x0 0x1fbf0200 0x0 0xc0>;

                        interrupt-parent = <&gic>;
                        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

                        pio: pinctrl {
                                compatible = "airoha,en7581-pinctrl";

                                gpio-controller;
                                #gpio-cells = <2>;

                                interrupt-controller;
                                #interrupt-cells = <2>;
                        };

                        pwm: pwm {
                                compatible = "airoha,en7581-pwm";

                                #pwm-cells = <3>;
                                status = "disabled";
                        };
                };

I also link the implementation of the MFD driver [2]

[1] https://elixir.bootlin.com/linux/v6.10.7/source/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
[2] https://github.com/Ansuel/linux/blob/airoha-mfd/drivers/mfd/airoha-en7581-gpio-mfd.c

> > yaml side with mixed property for pinctrl and pwm controller.
> 
> Hardware people mixed it, not we...
> 
> > 
> > I feel mixing the 2 thing might cause some confusion on the 2 block
> > device that are well separated aside from the unlucky position of the
> > regs.
> 
> I think the feedback you got is that essentially these are parts of the
> same device. Are you saying that hardware is really two separate
> devices?
> 
> > 
> > The suggested MFD implementation would consist of
> > - main node with MFD (map the entire GPIO controller regs)
> > -   2 child for PWM and pinctrl (no regs)
> > 
> > - driver in mfd/
> > - driver in pinctrl/
> > - driver in pwm/
> 
> This has nothing to do with bindings, except that you will need one
> driver somewhere which adds child devices, but you still could do
> everything as two drivers (as before).
> 
> Anyway how to structure drivers is rarely good argument about bindings.
> 
> > 
> > An alternative is the previous solution with pinctrl mapping all the
> > GPIO controller regs and PWM a child but Conor suggested that a MFD
> > structure might be better suited for the task. We have both implemented
> > and ready to be submitted. Hope we can find a common decision on how to
> > implement this simple but annoying block of devices.
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel

