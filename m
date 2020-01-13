Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F907C33CA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 15:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1063C21556
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 15:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sYDmv0vW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmSTR/vd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1063C21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q9bMoNcfFg0ygElNc449kanxGylJF5lpf6Pn58QL/I=; b=sYDmv0vWR/IvKY
	nAF6wWNoR3h8JjLAYqDYxOojrQakqN90pMSUFYjktBOR0JTc+jyg1/XvtCSCqeABYeQN0eaCO5egx
	Mc4K+NpdxiWunQPaBJecu4dgxJjoDvYGjIs98KyEYCugBaN2bTkwSzIhioLNxucTfSBd7I5U4NDqp
	Nagh5lNxQVA6BUFLPG451tSRwtGMtqktln+WTBhydy2dwPJLkqMuZz0mOo6TI+kxPxvlcN9o6FsHD
	KqPwjAWTN6xITF3i3fwcA/KssGdWzTn8kEOgDf+OlgpG3cn8qqrVunuZvlxsonjehC1DiW5gPWPWE
	q8ScpXmf4a1TI6DYqF+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir1zy-0004Ep-Hi; Mon, 13 Jan 2020 15:51:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir1zj-000448-7w; Mon, 13 Jan 2020 15:51:12 +0000
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B04F021739;
 Mon, 13 Jan 2020 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578930670;
 bh=rD4hU2QqJoSErZl4UuTT2zPbb7QwaT2/PFJkW2k69y8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pmSTR/vd3mg8eR1cW5YBs7g4oPeTSfDybSWz+8KoUME7c/ctOmWtOhUy/WNQZlDaZ
 fajBNja4kq5mrRKZNvMx6l2pMtgKHEnpKncpsy662u4pU3Fuw51btDKxvDXkU+l135
 r+pN3hJ7tATHZlpyrNYoCyeYQTVBud8A47X+4AoI=
Received: by mail-qk1-f169.google.com with SMTP id 21so8912178qky.4;
 Mon, 13 Jan 2020 07:51:10 -0800 (PST)
X-Gm-Message-State: APjAAAWoQeQ3RBgQr9vW6QrLIjYfxgo/C+NJ31NlZ/Gim7FDRCoNdiaI
 qzzMSXkSnWzY4g6RBfd3jPtQGUsylas5RLR8iQ==
X-Google-Smtp-Source: APXvYqxu73YIMoP9uqRC4HzO0JTlnG/L6A5l+pEvaDbz1NNmXMAtPsneSeN1KwdYZ6T0MMijcnS7tLhwhir05gbrTwY=
X-Received: by 2002:a05:620a:1eb:: with SMTP id
 x11mr17408883qkn.254.1578930669733; 
 Mon, 13 Jan 2020 07:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20200107070154.1574-1-roger.lu@mediatek.com>
 <20200107070154.1574-2-roger.lu@mediatek.com>
 <20200108203829.GA18987@bogus>
 <CANMq1KBu-gFy701BgFcjEwyhV9GgCCU2mkT9c8LviOJKBF30UA@mail.gmail.com>
In-Reply-To: <CANMq1KBu-gFy701BgFcjEwyhV9GgCCU2mkT9c8LviOJKBF30UA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jan 2020 09:50:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLnVEhvAh_8DfGWRZa+MdPRpXc9sWEQ6-3HQAeUfvkOSg@mail.gmail.com>
Message-ID: <CAL_JsqLnVEhvAh_8DfGWRZa+MdPRpXc9sWEQ6-3HQAeUfvkOSg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: soc: add mtk svs dt-bindings
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_075111_328057_32AD4F61 
X-CRM114-Status: GOOD (  28.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Roger Lu <roger.lu@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, YT Lee <yt.lee@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2020 at 12:44 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Thu, Jan 9, 2020 at 4:38 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Jan 07, 2020 at 03:01:52PM +0800, Roger Lu wrote:
> > > Document the binding for enabling mtk svs on MediaTek SoC.
> > >
> > > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/power/mtk-svs.txt     | 76 +++++++++++++++++++
> > >  1 file changed, 76 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/power/mtk-svs.txt b/Documentation/devicetree/bindings/power/mtk-svs.txt
> > > new file mode 100644
> > > index 000000000000..9a3e81b9e1d2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/power/mtk-svs.txt
> > > @@ -0,0 +1,76 @@
> > > +* Mediatek Smart Voltage Scaling (MTK SVS)
> > > +
> > > +This describes the device tree binding for the MTK SVS controller (bank)
> > > +which helps provide the optimized CPU/GPU/CCI voltages. This device also
> > > +needs thermal data to calculate thermal slope for accurately compensate
> > > +the voltages when temperature change.
> > > +
> > > +Required properties:
> > > +- compatible:
> > > +  - "mediatek,mt8183-svs" : For MT8183 family of SoCs
> > > +- reg: Address range of the MTK SVS controller.
> > > +- interrupts: IRQ for the MTK SVS controller.
> > > +- clocks, clock-names: Clocks needed for the svs hardware. required
> > > +                       clocks are:
> > > +                    "main": Main clock for svs controller to work.
> > > +- nvmem-cells: Phandle to the calibration data provided by a nvmem device.
> > > +- nvmem-cell-names: Should be "svs-calibration-data" and "calibration-data"
> > > +
> > > +Subnodes:
> > > +- svs-cpu-little: SVS bank device node of little CPU
> > > +  compatible: "mediatek,mt8183-svs-cpu-little"
> > > +  operating-points-v2: OPP table hooked by SVS little CPU bank.
> > > +                    SVS will optimze this OPP table voltage part.
> > > +  vcpu-little-supply: PMIC buck of little CPU
> > > +- svs-cpu-big: SVS bank device node of big CPU
> > > +  compatible: "mediatek,mt8183-svs-cpu-big"
> > > +  operating-points-v2: OPP table hooked by SVS big CPU bank.
> > > +                    SVS will optimze this OPP table voltage part.
> > > +  vcpu-big-supply: PMIC buck of big CPU
> > > +- svs-cci: SVS bank device node of CCI
> > > +  compatible: "mediatek,mt8183-svs-cci"
> > > +  operating-points-v2: OPP table hooked by SVS CCI bank.
> > > +                    SVS will optimze this OPP table voltage part.
> > > +  vcci-supply: PMIC buck of CCI
> > > +- svs-gpu: SVS bank device node of GPU
> > > +  compatible: "mediatek,mt8183-svs-gpu"
> > > +  operating-points-v2: OPP table hooked by SVS GPU bank.
> > > +                    SVS will optimze this OPP table voltage part.
> > > +  vgpu-supply: PMIC buck of GPU
> > > +
> > > +Example:
> > > +
> > > +     svs: svs@1100b000 {
> > > +             compatible = "mediatek,mt8183-svs";
> > > +             reg = <0 0x1100b000 0 0x1000>;
> > > +             interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> > > +             clocks = <&infracfg CLK_INFRA_THERM>;
> > > +             clock-names = "main_clk";
> > > +             nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> > > +             nvmem-cell-names = "svs-calibration-data", "calibration-data";
> > > +
> > > +             svs_cpu_little: svs-cpu-little {
> > > +                     compatible = "mediatek,mt8183-svs-cpu-little";
> > > +                     operating-points-v2 = <&cluster0_opp>;
> > > +                     vcpu-little-supply = <&mt6358_vproc12_reg>;
> > > +             };
> >
> > I don't think this is a good binding. This information already exists
> > elsewhere in the DT, so your driver should just look in those nodes.
> > For example the regulator can be in the cpu nodes or the OPP table
> > itself.
>
> Roger, if that helps, without changing any other binding, on 8183,
> basically you could have:
>  - svs-cpu-little: Add a handle to &cpu0 and get the regulator/opp
> table from it.
>  - svs-cpu-big: Handle to &cpu4

Why do you need those? Use the compatible of the cpus to determine big
and little cores. Or there's the cpu capacity property that could be
used instead.

>  - svs-cci: Handle to &cci

Is there more than 1 CCI? Just retrieve the node by the compatible.
There's no need to have nodes that simply serve as a collection of
data for some driver.

>  - svs-gpu: Handle to &gpu (BTW, it is expected that SVS would only
> apply to vgpu/mali regulator, and not vsram regulator?)
>
> I'm not too sure how we'd fetch the right regulator name, however (for
> the first 3 the name is "proc", for the last one it's "mali"), maybe
> add a regulator-name list in the DT?

To put this another way, write an SoC specific driver that understands
to some extent what exists in the SoC (and DT). I doubt something like
this is going to be generic across more than a few SoCs at most.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
