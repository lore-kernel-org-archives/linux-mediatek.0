Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC23DCA0EFB
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc/M3G2hqWMPy42J47BpVbH3O7dgG1RzWDBRsA25T2s=; b=OdA+ac8QnEdetYCPOVrM91cV6x
	NBtlntDYP75DGDevZchwj2lowtYKcX67Tnb6O0Gkq+oRUiEO0IJW/hpQjkY8LiYz1w8dLneTRaThT
	zYAGBzx1sGjvGv6FCO7EWM7TAuS0fBDNm3mKpEXhffnV03Mg5I8dFY8mS+EzKpoeF6EJidFf9eR5R
	HVSVCr4hkcLuCyaWc2AjpxCNHPeQ7w+RzoPfl0JOPirwiPTcIKM/YfHKenuZhFDx6sfBw55grIIJq
	LedkZTTAFMxUiEfZdBSBpu5z8wiu5TjRBzTAaOwt00Y7FTcMv/gnkgvYQJh6mWm9nXsl0puf9aIk+
	mguPzySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyun-00000005qAH-1dqp;
	Fri, 30 Aug 2024 10:31:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyrw-00000005owW-1fD1;
	Fri, 30 Aug 2024 10:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D656A44591;
	Fri, 30 Aug 2024 10:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6628EC4CEE0;
	Fri, 30 Aug 2024 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725013718;
	bh=dZ8CQV9ldkyefyzvTOcSfiZvMemx5KWDS9clqXl5m7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j9CEJVM2oMi9/FECOWP02t94vvItgPv0PO1i53qimpn8RlpBg9C0OkRWDvrgThr0b
	 k/Xw+2nHMNPv9Qder2cCPxyyWXoTycOSJA7X2x1rm1v8PsAFeffDEZoCa8JkESs/XF
	 1Ixm9wEy/rOC8Strrf0KvKDkcgfwp12obimc26wp83WeU22lmMF6juUKVQ3Zl3hJx+
	 pszdFs/GgNMwI+oHI6W0eV5EBLCZLiJSfio+gKASZkNFZWNMhJiT0P0pV3Aa3vUQnu
	 BDgqw7N+TyZdnJHNAAPoA4we4vrLEEOsqHMkC12yx2ON1mlwwjbXiQNITKovMMnARa
	 jj30XET/pkj8A==
Message-ID: <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>
Date: Fri, 30 Aug 2024 12:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Conor Dooley <conor@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com
References: <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com> <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
 <66d187f1.050a0220.3213d8.ad53@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <66d187f1.050a0220.3213d8.ad53@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_032840_622614_44617CED 
X-CRM114-Status: GOOD (  37.13  )
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

On 30/08/2024 10:50, Christian Marangi wrote:
> On Thu, Aug 29, 2024 at 08:20:10AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Aug 27, 2024 at 08:29:20PM +0200, Christian Marangi wrote:
>>> On Tue, Aug 27, 2024 at 09:35:07AM -0500, Rob Herring wrote:
>>>> On Tue, Aug 27, 2024 at 3:47 AM Lorenzo Bianconi
>>>> <lorenzo.bianconi83@gmail.com> wrote:
>>>>>
>>>>>>
>>>>>> On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
>>>>>>>> On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
>>>>>>>>> On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
>>>>>>>>>> On 22/08/2024 18:06, Conor Dooley wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Hi.
>>>>>>>>>>
>>>>>>>>>>> before looking at v1:
>>>>>>>>>>> I would really like to see an explanation for why this is a correct
>>>>>>>>>>> model of the hardware as part of the commit message. To me this screams
>>>>>>>>>>> syscon/MFD and instead of describing this as a child of a syscon and
>>>>>>>>>>> using regmap to access it you're doing whatever this is...
>>>>>>>>>>
>>>>>>>>>> Can you post a link to a good example dts that uses syscon/MFD ?
>>>>>>>>>>
>>>>>>>>>> It is not only pinctrl, pwm and gpio that are entangled in each other. A
>>>>>>>>>> good example would help with developing a proper implementation.
>>>>>>>>>
>>>>>>>>> Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
>>>>>>>>> example. I would suggest to start by looking at drivers within gpio or
>>>>>>>>> pinctrl that use syscon_to_regmap() where the argument is sourced from
>>>>>>>>> either of_node->parent or dev.parent->of_node (which you use depends on
>>>>>>>>> whether or not you have a child node or not).
>>>>>>>>>
>>>>>>>>> I recently had some questions myself for Rob about child nodes for mfd
>>>>>>>>> devices and when they were suitable to use:
>>>>>>>>> https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
>>>>>>>>>
>>>>>>>>> Following Rob's line of thought, I'd kinda expect an mfd driver to create
>>>>>>>>> the devices for gpio and pwm using devm_mfd_add_devices() and the
>>>>>>>>> pinctrl to have a child node.
>>>>>>>>
>>>>>>>> Just to not get confused and staring to focus on the wrong kind of
>>>>>>>> API/too complex solution, I would suggest to check the example from
>>>>>>>> Lorenzo.
>>>>>>>>
>>>>>>>> The pinctrl/gpio is an entire separate block and is mapped separately.
>>>>>>>> What is problematic is that chip SCU is a mix and address are not in
>>>>>>>> order and is required by many devices. (clock, pinctrl, gpio...)
>>>>>>>>
>>>>>>>> IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
>>>>>>>> single big region and in our case we need to map 2 different one (gpio
>>>>>>>> AND chip SCU) (or for clock SCU and chip SCU)
>>>>>>>>
>>>>>>>> Similar problem is present in many other place and syscon is just for
>>>>>>>> the task.
>>>>>>>>
>>>>>>>> Simple proposed solution is:
>>>>>>>> - chip SCU entirely mapped and we use syscon
>>>>>>
>>>>>> That seems reasonable.
>>>>>
>>>>> ack
>>>>>
>>>>>>
>>>>>>>> - pinctrl mapped and reference chip SCU by phandle
>>>>>>
>>>>>> ref by phandle shouldn't be needed here, looking up by compatible should
>>>>>> suffice, no?
>>>>>
>>>>> ack, I think it would be fine
>>>>>
>>>>>>
>>>>>>>> - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
>>>>>>
>>>>>> The pwm is not a child of the pinctrl though, they're both subfunctions of
>>>>>> the register region they happen to both be in. I don't agree with that
>>>>>> appraisal, sounds like an MFD to me.
>>>>>
>>>>> ack
>>>>>
>>>>>>
>>>>>>>> Hope this can clear any confusion.
>>>>>>>
>>>>>>> To clarify the hw architecture we are discussing about 3 memory regions:
>>>>>>> - chip_scu: <0x1fa20000 0x384>
>>>>>>> - scu: <0x1fb00020 0x94c>
>>>>>>                   ^
>>>>>> I'm highly suspicious of a register region that begins at 0x20. What is
>>>>>> at 0x1fb00000?
>>>>>
>>>>> sorry, my fault
>>>>>
>>>>>>
>>>>>>> - gpio: <0x1fbf0200 0xbc>
>>>>>>
>>>>>> Do you have a link to the register map documentation for this hardware?
>>>>>>
>>>>>>> The memory regions above are used by the following IC blocks:
>>>>>>> - clock: chip_scu and scu
>>>>>>
>>>>>> What is the differentiation between these two different regions? Do they
>>>>>> provide different clocks? Are registers from both of them required in
>>>>>> order to provide particular clocks?
>>>>>
>>>>> In chip-scu and scu memory regions we have heterogeneous registers.
>>>>> Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
>>>>> clock divider, switch clock source and divider, main bus clock source
>>>>> and divider, ...) while in scu (regarding clock configuration) we have
>>>>> pcie clock regs (e.g. reset and other registers). This is the reason
>>>>> why, in en7581-scu driver, we need both of them, but we can access
>>>>> chip-scu via the compatible string (please take a look at the dts
>>>>> below).
>>>>>
>>>>>>
>>>>>>> - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
>>>>>>
>>>>>> Ditto here. Are these actually two different sets of iomuxes, or are
>>>>>> registers from both required to mux a particular pin?
>>>>>
>>>>> Most of the io-muxes configuration registers are in chip-scu block,
>>>>> just pwm ones are in gpio memory block.
>>>>> Gpio block is mainly used for gpio_chip and irq_chip functionalities.
>>>>>
>>>>>>
>>>>>>> - pwm: gpio
>>>>>>>
>>>>>>> clock and pinctrl devices share the chip_scu memory region but they need to
>>>>>>> access even other separated memory areas (scu and gpio respectively).
>>>>>>> pwm needs to just read/write few gpio registers.
>>>>>>> As pointed out in my previous email, we can define the chip_scu block as
>>>>>>> syscon node that can be accessed via phandle by clock and pinctrl drivers.
>>>>>>> clock driver will map scu area while pinctrl one will map gpio memory block.
>>>>>>> pwm can be just a child of pinctrl node.
>>>>>>
>>>>>> As I mentioned above, the last statement here I disagree with. As
>>>>>> someone that's currently in the process of fixing making a mess of this
>>>>>> exact kind of thing, I'm going to strongly advocate not taking shortcuts
>>>>>> like this.
>>>>>>
>>>>>> IMO, all three of these regions need to be described as syscons in some
>>>>>> form, how exactly it's hard to say without a better understanding of the
>>>>>> breakdown between regions.
>>>>>>
>>>>>> If, for example, the chip_scu only provides a few "helper" bits, I'd
>>>>>> expect something like
>>>>>>
>>>>>> syscon@1fa20000 {
>>>>>>         compatible = "chip-scu", "syscon";
>>>>>>         reg = <0x1fa2000 0x384>;
>>>>>> };
>>>>>>
>>>>>> syscon@1fb00000 {
>>>>>>         compatible = "scu", "syscon", "simple-mfd";
>>>>>>         #clock-cells = 1;
>>>>>> };
>>>>>>
>>>>>> syscon@1fbf0200 {
>>>>>>         compatible = "gpio-scu", "syscon", "simple-mfd";
>>>>>>         #pwm-cells = 1;
>>>>>>
>>>>>>         pinctrl@x {
>>>>>>                 compatible = "pinctrl";
>>>>>>                 reg = x;
>>>>>>                 #pinctrl-cells = 1;
>>>>>>                 #gpio-cells = 1;
>>>>>>         };
>>>>>> };
>>>>>>
>>>>>
>>>>> ack, so we could use the following dts nodes for the discussed memory
>>>>> regions (chip-scu, scu and gpio):
>>>>>
>>>>> syscon@1fa20000 {
>>>>>     compatible = "airoha,chip-scu", "syscon";
>>>>>     reg = <0x0 0x1fa2000 0x0 0x384>;
>>>>> };
>>>>>
>>>>> clock-controller@1fb00000 {
>>>>>     compatible = "airoha,en7581-scu", "syscon";
>>>>>     reg = <0x0 0x1fb00000 0x0 0x94c>;
>>>>>     #clock-cells = <1>;
>>>>>     #reset-cells = <1>;
>>>>> };
>>>>>
>>>>> mfd@1fbf0200 {
>>>>>     compatible = "airoha,en7581-gpio-mfd", "simple-mfd";
>>>>>     reg = <0x0 0x1fbf0200 0x0 0xc0>;
>>>>>
>>>>>     pio: pinctrl {
>>>>>         compatible = "airoha,en7581-pinctrl"
>>>>>         gpio-controller;
>>>>>         #gpio-cells = <2>;
>>>>>
>>>>>         interrupt-controller;
>>>>>         #interrupt-cells = <2>;
>>>>>         interrupt-parent = <&gic>;
>>>>>         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>>>>>     }
>>>>>
>>>>>     pwm: pwm {
>>>>>         compatible = "airoha,en7581-pwm";
>>>>>         #pwm-cells = <3>;
>>>>>     }
>>>>> };
>>>>
>>>> I think this can be simplified down to this:
>>>>
>>>> mfd@1fbf0200 {
>>>>     compatible = "airoha,en7581-gpio-mfd";  // MFD is a Linuxism. What
>>>> is this h/w block called?
>>>>     reg = <0x0 0x1fbf0200 0x0 0xc0>;
>>>>     gpio-controller;
>>>>     #gpio-cells = <2>;
>>>>     interrupt-controller;
>>>>     #interrupt-cells = <2>;
>>>>     interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>>>>
>>>>     #pwm-cells = <3>;
>>>>
>>>>     pio: pinctrl {
>>>>         foo-pins {};
>>>>         bar-pins {};
>>>>     };
>>>> };
>>>>
>>>> Maybe we keep the compatible in 'pinctrl'...
>>>>
>>>
>>> Hi Rob, thanks a lot for the hint, I hope we can finally find a solution
>>> on how to implement this.
>>>
>>> In Documentation the block is called GPIO Controller. As explained it does
>>> expose pinctrl function AND pwm (with regs in the middle)
>>>
>>> Is this semplification really needed? It does pose some problem driver
>>> wise (on where to put the driver, in what subsystem) and also on the
>>
>> Sorry, but no, dt-bindings do not affect the driver at all in such way.
>> Nothing changes in your driver in such aspect, no dilemma where to put
>> it (the same place as before).
>>
> 
> Ok, from the proposed node structure, is it problematic to move the
> gpio-controller and -cells in the pinctrl node? And also the pwm-cells
> to the pwm node?

The move is just unnecessary and not neat. You design DTS based on your
drivers architecture and this is exactly what we want to avoid.

> This is similar to how it's done by broadcom GPIO MFD [1] that also

There are 'reg' fields, which is the main problem here. I don't like
that arguments because it entirely misses the discussions - about that
binding or other bindings - happening prior to merge.

> expose pinctrl and other device in the same register block as MFD
> childs.
> 
> This would be the final node block.
> 
>                 mfd@1fbf0200 {
>                         compatible = "airoha,en7581-gpio-mfd";
>                         reg = <0x0 0x1fbf0200 0x0 0xc0>;
> 
>                         interrupt-parent = <&gic>;
>                         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> 
>                         pio: pinctrl {
>                                 compatible = "airoha,en7581-pinctrl";
> 
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
> 
>                                 interrupt-controller;
>                                 #interrupt-cells = <2>;

No resources here...

>                         };
> 
>                         pwm: pwm {
>                                 compatible = "airoha,en7581-pwm";
> 
>                                 #pwm-cells = <3>;
>                                 status = "disabled";

And why is it disabled? No external resources. There is no benefit of
this node.

>                         };
>                 };
> 
> I also link the implementation of the MFD driver [2]
> 
> [1] https://elixir.bootlin.com/linux/v6.10.7/source/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> [2] https://github.com/Ansuel/linux/blob/airoha-mfd/drivers/mfd/airoha-en7581-gpio-mfd.c


Best regards,
Krzysztof


