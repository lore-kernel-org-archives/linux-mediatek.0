Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D1EC4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 03:55:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 809272467A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 03:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m50HKIBa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jTEqC3T8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 809272467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0gVZYr2kvdpvsY6zvc0KLLP8N2UJrIyn8OzdRsWZWM=; b=m50HKIBa+vEhXZ
	+c6bLMji2+sAFcwKqh77YecNok+8rA1ROYOnyKpvW9pvKAZKXk/3kcZmYDLegD5ujBx0FDE6qGK0E
	wX9mRdvW95yyIxwHmu+Eva8VVPKwTwy7ERDoWe4ISmli2HdEU+tSDYPLtO324GsVBFvQJ9HcWU7zl
	jM9OC/PMY4gMKhIAHJMOQtCzNIE74hwKQMyvce/BiCnbQM4OgSwXBIj7dWYXxItFsumJ57Hiyi9ts
	eV9b1n7ZVPX2OjditKl2RJWkbkjIhspRQ2Ckb7U2c1rCnutXJIBbVllDHRtY9LkGWzwAmKE0//W7c
	f50/L9l4gekuefdRSHYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7AGc-0007I5-C5; Thu, 27 Feb 2020 03:55:18 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7AGZ-0007HN-CR
 for linux-mediatek@lists.infradead.org; Thu, 27 Feb 2020 03:55:17 +0000
Received: by mail-qk1-x741.google.com with SMTP id 145so1899231qkl.2
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Feb 2020 19:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e3jEhRMyMSDPIgF2MXY+K+s017u3bzyL9y4ZxjVIXsc=;
 b=jTEqC3T8CcQJPeSiwHCc/YZwirx3XPnoflpFRSjQZBUnVCcesZxb6Gwb67LaRk8RcS
 WyAXXTXseAYgek5tbQRPqpQFhcHSrp0NFfYlZm7O4c8Xa+VtKCgZrT6xhoOIxmMjDZFR
 1XOX6y1G35XkkzUulYH7lfDHrO9FN3TQhEm3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e3jEhRMyMSDPIgF2MXY+K+s017u3bzyL9y4ZxjVIXsc=;
 b=Nbc3GRalGoN8MfKeLQrgF/AEiKYw9e1qDGMcGObBjiLi1+17lG46AdjaYZosNhOwBT
 D3yJ952npm/uVwCQOpbfB7pfajdeKZm+pixFCJkbJIVTaKLT42GjPKzvFOUJKBhljOA7
 9ygIrADfGZ1CUtf/V4N4JcXB3OxzuZKzhRvGYzP1TQ7ck3f2T5pYuTZldy++kf3bcSpg
 iwvUeIBk6tpgmToC1zQ0EqR+jjjJ8wm5ORWLab77IfOskSl9fn7xxejUv0uhjcF0IoVU
 mvb/6SVGC2EyT5XfUucwhzxQCzSlRKvya1o5gdlZFfJLyGDj0iNq3NYH8hCIv6YiixmK
 +miQ==
X-Gm-Message-State: APjAAAWw8kRxZggyDzDY8cVywg3+7Zp8snSKnOlzYNH8JwKsUxszPegk
 DJP0tRtxMAhY2+ugRCpA4Ayfw3FUZhso9Mm7hFEPJg==
X-Google-Smtp-Source: APXvYqzq8jjaKKWzzTwUgKRVwAcuPnPzaoB4MtCOHKcEOOOAccafOg+X3EgaiSchf6kPph/ll1rJMnKFKvKFXXgpvME=
X-Received: by 2002:a05:620a:1435:: with SMTP id
 k21mr2787955qkj.299.1582775713747; 
 Wed, 26 Feb 2020 19:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20200107070154.1574-1-roger.lu@mediatek.com>
 <20200107070154.1574-2-roger.lu@mediatek.com>
 <20200108203829.GA18987@bogus>
 <CANMq1KBu-gFy701BgFcjEwyhV9GgCCU2mkT9c8LviOJKBF30UA@mail.gmail.com>
 <CAL_JsqLnVEhvAh_8DfGWRZa+MdPRpXc9sWEQ6-3HQAeUfvkOSg@mail.gmail.com>
 <1581406566.14120.46.camel@mtksdaap41>
In-Reply-To: <1581406566.14120.46.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 27 Feb 2020 11:55:02 +0800
Message-ID: <CANMq1KBVs7ZucNu9pTxXGZ0__E6tyxd1+mm2Zui81G=xQNtShA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: soc: add mtk svs dt-bindings
To: Roger Lu <roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_195515_481508_F29EB9E2 
X-CRM114-Status: GOOD (  38.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?QW5ndXMgTGluICjmnpfnkZvosaop?= <Angus.Lin@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?SGVucnlDIENoZW4gKOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>,
 =?UTF-8?B?WVQgTGVlICjmnY7ku7Dlk7Ip?= <yt.lee@mediatek.com>,
 =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?WGlhb3FpbmcgTGl1ICjliJjmmZPluoYp?= <Xiaoqing.Liu@mediatek.com>,
 =?UTF-8?B?Q2hhcmxlcyBZYW5nICjmpYrkuo7pgLIp?= <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 James Liao <jamesjj.liao@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Tue, Feb 11, 2020 at 3:36 PM Roger Lu <roger.lu@mediatek.com> wrote:
>
> Hi Rob & Nicolas,
>
> Sorry for the late reply.
>
> On Mon, 2020-01-13 at 23:50 +0800, Rob Herring wrote:
> > On Mon, Jan 13, 2020 at 12:44 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > On Thu, Jan 9, 2020 at 4:38 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Tue, Jan 07, 2020 at 03:01:52PM +0800, Roger Lu wrote:
> > > > > Document the binding for enabling mtk svs on MediaTek SoC.
> > > > >
> > > > > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > > > > ---
> > > > >  .../devicetree/bindings/power/mtk-svs.txt     | 76 +++++++++++++++++++
> > > > >  1 file changed, 76 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/power/mtk-svs.txt b/Documentation/devicetree/bindings/power/mtk-svs.txt
> > > > > new file mode 100644
> > > > > index 000000000000..9a3e81b9e1d2
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/power/mtk-svs.txt
> > > > > @@ -0,0 +1,76 @@
> > > > > +* Mediatek Smart Voltage Scaling (MTK SVS)
> > > > > +
> > > > > +This describes the device tree binding for the MTK SVS controller (bank)
> > > > > +which helps provide the optimized CPU/GPU/CCI voltages. This device also
> > > > > +needs thermal data to calculate thermal slope for accurately compensate
> > > > > +the voltages when temperature change.
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible:
> > > > > +  - "mediatek,mt8183-svs" : For MT8183 family of SoCs
> > > > > +- reg: Address range of the MTK SVS controller.
> > > > > +- interrupts: IRQ for the MTK SVS controller.
> > > > > +- clocks, clock-names: Clocks needed for the svs hardware. required
> > > > > +                       clocks are:
> > > > > +                    "main": Main clock for svs controller to work.
> > > > > +- nvmem-cells: Phandle to the calibration data provided by a nvmem device.
> > > > > +- nvmem-cell-names: Should be "svs-calibration-data" and "calibration-data"
> > > > > +
> > > > > +Subnodes:
> > > > > +- svs-cpu-little: SVS bank device node of little CPU
> > > > > +  compatible: "mediatek,mt8183-svs-cpu-little"
> > > > > +  operating-points-v2: OPP table hooked by SVS little CPU bank.
> > > > > +                    SVS will optimze this OPP table voltage part.
> > > > > +  vcpu-little-supply: PMIC buck of little CPU
> > > > > +- svs-cpu-big: SVS bank device node of big CPU
> > > > > +  compatible: "mediatek,mt8183-svs-cpu-big"
> > > > > +  operating-points-v2: OPP table hooked by SVS big CPU bank.
> > > > > +                    SVS will optimze this OPP table voltage part.
> > > > > +  vcpu-big-supply: PMIC buck of big CPU
> > > > > +- svs-cci: SVS bank device node of CCI
> > > > > +  compatible: "mediatek,mt8183-svs-cci"
> > > > > +  operating-points-v2: OPP table hooked by SVS CCI bank.
> > > > > +                    SVS will optimze this OPP table voltage part.
> > > > > +  vcci-supply: PMIC buck of CCI
> > > > > +- svs-gpu: SVS bank device node of GPU
> > > > > +  compatible: "mediatek,mt8183-svs-gpu"
> > > > > +  operating-points-v2: OPP table hooked by SVS GPU bank.
> > > > > +                    SVS will optimze this OPP table voltage part.
> > > > > +  vgpu-supply: PMIC buck of GPU
> > > > > +
> > > > > +Example:
> > > > > +
> > > > > +     svs: svs@1100b000 {
> > > > > +             compatible = "mediatek,mt8183-svs";
> > > > > +             reg = <0 0x1100b000 0 0x1000>;
> > > > > +             interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> > > > > +             clocks = <&infracfg CLK_INFRA_THERM>;
> > > > > +             clock-names = "main_clk";
> > > > > +             nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> > > > > +             nvmem-cell-names = "svs-calibration-data", "calibration-data";
> > > > > +
> > > > > +             svs_cpu_little: svs-cpu-little {
> > > > > +                     compatible = "mediatek,mt8183-svs-cpu-little";
> > > > > +                     operating-points-v2 = <&cluster0_opp>;
> > > > > +                     vcpu-little-supply = <&mt6358_vproc12_reg>;
> > > > > +             };
> > > >
> > > > I don't think this is a good binding. This information already exists
> > > > elsewhere in the DT, so your driver should just look in those nodes.
> > > > For example the regulator can be in the cpu nodes or the OPP table
> > > > itself.
> > >
> > > Roger, if that helps, without changing any other binding, on 8183,
> > > basically you could have:
> > >  - svs-cpu-little: Add a handle to &cpu0 and get the regulator/opp
> > > table from it.
> > >  - svs-cpu-big: Handle to &cpu4
> >
> > Why do you need those? Use the compatible of the cpus to determine big
> > and little cores. Or there's the cpu capacity property that could be
> > used instead.
> >
> > >  - svs-cci: Handle to &cci
> >
> > Is there more than 1 CCI? Just retrieve the node by the compatible.
> > There's no need to have nodes that simply serve as a collection of
> > data for some driver.
> >
> > >  - svs-gpu: Handle to &gpu (BTW, it is expected that SVS would only
> > > apply to vgpu/mali regulator, and not vsram regulator?)
>
> svs-gpu depends on vgpu power on for init (don't care vgpu_sram). After
> svs-gpu init is done, it doesn't need vgpu power on anymore. (vgpu can
> be turned off)
>
> Please allows me to introduce more about what svs-gpu device needs.
> 1. It needs gpu opp table from "gpu node" and gpu_core2 power-domains
> from "gpu_core2 node". When svs-gpu has those resources, it turns on
> gpu_core2 power-domain for svs-gpu-hw to have power (for calculating)
> and svs-gpu-sw will update gpu opp table voltages' part.
> 2. Therefore, if I retrieve gpu-related node from phandle or compatible,
> it means svs-gpu device in driver needs to attach two different gpu
> nodes for attaining gpu opp table and gpu_core2 power-domains. I think
> this architecture of svs-gpu confuses maintainer why it attaches two
> different nodes instead of having a device to describe what it needs.

> 3. Is it acceptable to have a Linux device attaching two different
> nodes? If yes, could you guide us some APIs for one device to attach two
> nodes? I don't know how to implement it. Thanks.

I'm also trying to understand how that would work. The way the code
works now (https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/power/avs/mtk_svs.c#1388):

The SVS driver creates a platform device for each sub-node, find the
sub-node that matches the compatible (pdev->dev.of_node):
for_each_child_of_node(svs->dev->of_node, np) {
  if (of_device_is_compatible(np, svsb->of_compatible)) {
    pdev->dev.of_node = np;
    break;
  }
}

Then, thanks to that, the 2 functions dev_pm_opp_of_add_table and
devm_regulator_get_optional "just work", as the get the opp table and
regulator from the device tree node.

So what you suggest is basically something like this:
pdev->dev.of_node = of_find_compatible_node(NULL, NULL, "mediatek,mt8183-cci");

I came up with a (very dirty) prototype here:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2076718
... and it doesn't really work
(https://gist.github.com/drinkcat/61e50eedbdc301d418c9cee3ee5b6b06, I
think the kernel is probing more than it should, like the DMA mask
errors should not happen...)

Before I dig further... I have the same concern as Roger, is it ok to
have 2 devices bound to the same device tree node/compatible? My
understanding was also that it's not.

> > >
> > > I'm not too sure how we'd fetch the right regulator name, however (for
> > > the first 3 the name is "proc", for the last one it's "mali"), maybe
> > > add a regulator-name list in the DT?
> >
> > To put this another way, write an SoC specific driver that understands
> > to some extent what exists in the SoC (and DT). I doubt something like
> > this is going to be generic across more than a few SoCs at most.
>
> >
> > Rob
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
