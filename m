Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73091C33CAE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 07:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44D0E2053B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 07:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iV3SVdp9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A/xMlDoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44D0E2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvMP/xOY6fRFxvLdJnJ42GOj73C49dF4WKT5qAAzGVM=; b=iV3SVdp9Rsekgg
	fjJ+Dk0WH3220vGIe48xELDpsHJKAog3KcIFtgzSuLJDwPcglt4XcKJW7MzZP/+L7j1W3s3/B5PVw
	g67ntR96jTjHPp2vbSwQtBrZxjIXHFy2VDNOuCwR+DeGTY16U4exnWdJsp/vJTmu5yBz892mi1hNU
	bmDiDvyT7yf7dfOvGBRvqvaBf67lAupwe5M3fW/REOhe/BWhOxO5lagW4+WZHvUSJqOEpaKToy7mJ
	0imV3YxrEY5efBiT4nshNhzg/GgsvfPMKQpqdWav6DPju33SANbTQp+baxs0WWi1zMitTVvxx36ah
	IeOyIarFBSQkdvhybnYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqtkc-0004iF-0R; Mon, 13 Jan 2020 07:03:02 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqtkY-0004hC-HT
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 07:03:00 +0000
Received: by mail-qk1-x743.google.com with SMTP id k6so7599531qki.5
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2020 23:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2K36+LY4tN/Cuk9TuKZ9obMWdWD2cQOBdE1ooq67vcY=;
 b=A/xMlDoReXGb70l5stlQeC5VS6KsRtK3WJhpU6b+scCfDM3Vf0zDYy+RAF+OIF4lrA
 fMSXjyto0aKufDajYSWeZzCh/lOr7eBgVuz3C3n1aNEXCmodW5s7FMPq2vhMpGeMawu5
 dM1ZJv50OY3YhDsvyyQCa9w5fBvuu34+PBwbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2K36+LY4tN/Cuk9TuKZ9obMWdWD2cQOBdE1ooq67vcY=;
 b=eskdEjMvPN+Fr7b+5Nn7AlEjlJZNvZFyQqej6c8OSEefnbKcVK0AbaWxqnK8blohv2
 n8Tg9FnpOM0mfHwDHK4sX20ZXz0xg1Xqop59so1WYBo33XM61i9RwX8VTuM0CHO7qqx6
 4hJZ6IAWFgCxCmLHGId/THhkMY3y4zdopC1f6htxjSso3mwqHIlRhHVUvfXCHFN5OoBR
 zfrQTLuGfWMly2gVLYmIGKXIc04d/qyXfCSlkbvXqkL+8PLU7WuVCyDNL8NZEoZtOwlZ
 x/+Qg4vGy7hA58Is9KQXmPKD0r77aPY6lzVx/9fItae64xY/Bs/TO/2BTfp5/FG/cYLi
 TIpQ==
X-Gm-Message-State: APjAAAUHmMWGUzPkVxF+RbRN1Fs7iTf7a4XGOCVLpddUiBxpG1nTKNsF
 KlLbHhYmK7tsuSl1Rb7a9hA7+ZPUT3T1f1b/Jz1cmA==
X-Google-Smtp-Source: APXvYqzyFcsTC6SV/9v+0c2iO5eTJ1fr5S8u1LUXKUfdU24tfRLPsnI2WnOV4KaJ6n0aX7Qh/FjTi4RgwzDmSx7ggc8=
X-Received: by 2002:a05:620a:6d7:: with SMTP id
 23mr14161009qky.299.1578898977343; 
 Sun, 12 Jan 2020 23:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20190906100514.30803-1-roger.lu@mediatek.com>
 <20190906100514.30803-2-roger.lu@mediatek.com>
 <20190930133548.GA24574@bogus> <1577429450.10290.47.camel@mtksdaap41>
In-Reply-To: <1577429450.10290.47.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 15:02:46 +0800
Message-ID: <CANMq1KDHPA9eOufL5X9OLfQESL=MdHvuQfQkyJ1Q381MeDkSQQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: soc: add mtk svs dt-bindings
To: Roger Lu <roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_230258_603330_1BB1755B 
X-CRM114-Status: GOOD (  29.55  )
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
 Angus Lin <Angus.Lin@mediatek.com>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, YT Lee <yt.lee@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 27, 2019 at 2:51 PM Roger Lu <roger.lu@mediatek.com> wrote:
>
> Dear Rob,
>
> Sorry for the late reply.
>
> On Mon, 2019-09-30 at 08:35 -0500, Rob Herring wrote:
> > On Fri, Sep 06, 2019 at 06:05:13PM +0800, Roger Lu wrote:
> > > Document the binding for enabling mtk svs on MediaTek SoC.
> > >
> > > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/power/mtk-svs.txt     | 88 +++++++++++++++++++
> > >  1 file changed, 88 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/power/mtk-svs.txt b/Documentation/devicetree/bindings/power/mtk-svs.txt
> > > new file mode 100644
> > > index 000000000000..6a71992ef162
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/power/mtk-svs.txt
> > > @@ -0,0 +1,88 @@
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
> > > +- clocks, clock-names: Clocks needed for the svs controller. required
> > > +                       clocks are:
> > > +                  "main_clk": Main clock needed for register access
> >
> > '_clk' is redundant.
>
> Oh Okay. I'll remove _clk. Thanks.
>
> >
> > > +- nvmem-cells: Phandle to the calibration data provided by a nvmem device.
> > > +- nvmem-cell-names: Should be "svs-calibration-data" and "calibration-data"
> > > +
> > > +Subnodes:
> > > +- svs_cpu_little: SVS bank device node of little CPU
> > > +  compatible: "mediatek,mt8183-svs-cpu-little"
> > > +  operating-points-v2: OPP table hooked by SVS little CPU bank.
> > > +                  SVS will optimze this OPP table voltage part.
> > > +  vcpu-little-supply: PMIC buck of little CPU
> > > +- svs_cpu_big: SVS bank device node of big CPU
> > > +  compatible: "mediatek,mt8183-svs-cpu-big"
> > > +  operating-points-v2: OPP table hooked by SVS big CPU bank.
> > > +                  SVS will optimze this OPP table voltage part.
> > > +  vcpu-big-supply: PMIC buck of big CPU
> > > +- svs_cci: SVS bank device node of CCI
> > > +  compatible: "mediatek,mt8183-svs-cci"
> > > +  operating-points-v2: OPP table hooked by SVS CCI bank.
> > > +                  SVS will optimze this OPP table voltage part.
> > > +  vcci-supply: PMIC buck of CCI
> > > +- svs_gpu: SVS bank device node of GPU
> > > +  compatible: "mediatek,mt8183-svs-gpu"
> > > +  operating-points-v2: OPP table hooked by SVS GPU bank.
> > > +                  SVS will optimze this OPP table voltage part.
> > > +  vgpu-spply: PMIC buck of GPU
> > > +
> > > +Example:
> > > +
> > > +   svs: svs@1100b000 {
> > > +           compatible = "mediatek,mt8183-svs";
> > > +           reg = <0 0x1100b000 0 0x1000>;
> > > +           interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW 0>;
> >
> > GIC interrupts are 3 cells, you have 4.
>
> Oops, I'll remove the fourth parameter. Thanks a lot.
>
> >
> > > +           clocks = <&infracfg CLK_INFRA_THERM>;
> > > +           clock-names = "main_clk";
> > > +           nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> > > +           nvmem-cell-names = "svs-calibration-data", "calibration-data";
> > > +
> > > +           svs_cpu_little: svs_cpu_little {
> >
> > Don't use '_' in node names.
>
> Okay. I'll replace it with '-'. Thanks.
>
> >
> > > +                   compatible = "mediatek,mt8183-svs-cpu-little";
> > > +                   operating-points-v2 = <&cluster0_opp>;
> > > +           };
> > > +
> > > +           svs_cpu_big: svs_cpu_big {
> > > +                   compatible = "mediatek,mt8183-svs-cpu-big";
> > > +                   operating-points-v2 = <&cluster1_opp>;
> > > +           };
> > > +
> > > +           svs_cci: svs_cci {
> > > +                   compatible = "mediatek,mt8183-svs-cci";
> > > +                   operating-points-v2 = <&cci_opp>;
> > > +           };
> > > +
> > > +           svs_gpu: svs_gpu {
> > > +                   compatible = "mediatek,mt8183-svs-gpu";
> > > +                   power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> > > +                   operating-points-v2 = <&gpu_opp_table>;
> > > +           };
> > > +   };
> > > +
> > > +   &svs_cpu_little {
> > > +           vcpu-little-supply = <&mt6358_vproc12_reg>;
> >
> > It's already defined to have OPP and supply in the cpu nodes. Parse them
> > to get this information rather than duplicating it here.
> >
> > The same should apply to the CCI and GPU.
>
> Please let me explain the reason why I add SVS sub-nodes. I ever try to
> parse other nodes to get desired power-domains/OPP table. However, it
> makes SVS driver harder to develop and maintain.
>
> 1. When a SVS-controller-init wants GPU_CORE0's OPP table in one node
> but it needs power-domains(GPU_MFG_2D) in another node, it becomes
> complicated and confusing when SVS sub-node tries to parse many nodes.
> Therefore, we want SVS sub-node to focus on what SVS bank requires by
> how we do in this patch.
>
> 2. In hardware point of view, SVS controller depends on other hardware's
> power only. All the SVS controller registers are in SVS hardware. So, we
> think It's good that SVS sub-node describes what SVS controller requires
> instead of linking other subsys nodes and parse the property that SVS
> controller needs.
>
> 3. We want SVS driver to have a generic way to attain subsys device for
> using "pm_runtime and OPP framework" API. If SVS driver tries to parse
> CPU(little/big core) and other subsys device node(e.g cci/gpu), it means
> SVS driver has to maintain different methodologies(cpu-specific?
> devfreq? others?) in order to get CPU(little/big core) and other subsys
> device(e.g cci/gpu) for using "pm_runtime and OPP framework" API.

(Didn't see this more complete reply before replying to v6, I can see
your argument, but if we wanted to push further to have the sub-device
node in the DT)

From what I see, the SVS driver for node x (cpu/cci/gpu) requires only 3 things:
 - An OPP table => that should always be "operating-points-v2"
property of the node x.
 - A power domain => that should always be power-domains property of node x.
 - A regulator. That one is a bit tricky as the cpu/cci uses "proc",
but gpu uses "mali" (at least on 8183). But maybe you can add a
child-regulator-name property or something to the DT so that the SVS
driver can find the correct regulator?

Seems like the solution could be quite generic?

> >
> > Rob
>
> Sincerely,
> Roger Lu.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
