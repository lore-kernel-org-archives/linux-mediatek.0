Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F04C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 09:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 862EE61054
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 09:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 862EE61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7zQkh+EV4I8e8TAWGD1ew/m+CtMhxKo/CVokm5SSNc=; b=Pp0r0MIZhXPPmu
	yp0BOJlpFpKYZkvaTrsZOENHKI8FY80FPzJppzkLQ9jXWP3fato+XQqCzOcko4ZbJHpKbW3PsSMKl
	ymYDmj1b4PD1bUBTdQ45IvKsjqiKNNIfV9466UkGR1oT4V9uPTc6Cen0klDZ3GCvlFwRawALL87xC
	8On805pOdv0hLVwFvLt6+ApvaYpko/Qjk3ta/QuVxGPAcXnp8aXWfSKSJgJiuFhYE5OUNGvX4NjxH
	95LQ2w2wq8bnQkV3sDc9J8dNcTEgQn8JCKmF2QLSvgPBlFUAeYeSznxYH4U+BxHooIZP1bsst/307
	8xetAPAGTfw7/QW1NDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m92OB-003eL6-5Z; Thu, 29 Jul 2021 09:31:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m92Nv-003eIB-Av; Thu, 29 Jul 2021 09:31:25 +0000
X-UUID: 04a624defbc54403a3a02135b513bf66-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=58wHSuP4xelT+9n+FUdGokfORJ3tpoWX0PlqDrg48R8=; 
 b=FoYeCU4Wz9/2zlhZEYChfuEuKipyhyHSVRtNoB0myzXrSPXFaUUQjnhHfvsxmgYahIlDr+Us7U96lPq6VHMT3/Fj1rZa6jlhnS6LRI0fmGSP2CvfuNB/Hg7PH7A83IMOdsSyWqVdShuqnBBhTYGO5gkMpxfzhvQFi/cP2UslXT0=;
X-UUID: 04a624defbc54403a3a02135b513bf66-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1680571403; Thu, 29 Jul 2021 02:31:19 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 02:31:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 17:31:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 17:31:16 +0800
Message-ID: <b944cf4a9d7499913d31d2599d841124d74a24cf.camel@mediatek.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree
 <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 <singo.chang@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Fabien Parent
 <fparent@baylibre.com>, Nancy.Lin <nancy.lin@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 29 Jul 2021 17:31:16 +0800
In-Reply-To: <CAFqH_51_Ns-ZLqwaj+_8P_49rGse0h9GTu4Jk6R+0FVO8Rq1pw@mail.gmail.com>
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
 <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
 <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
 <CAFqH_512RCNBufS=zL5hQSQJya3565dm2D3zznWie9rKUN_sAw@mail.gmail.com>
 <a0e5322bdde4d1b51de57cbfe98e9d9ed64490ed.camel@mediatek.com>
 <CAFqH_51_Ns-ZLqwaj+_8P_49rGse0h9GTu4Jk6R+0FVO8Rq1pw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_023123_434622_5CD7391A 
X-CRM114-Status: GOOD (  51.60  )
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

Hi Enric,

Thanks for your review.

On Wed, 2021-07-28 at 12:56 +0200, Enric Balletbo Serra wrote:
> Hi Jason,
> 
> Missatge de Jason-JH Lin <jason-jh.lin@mediatek.com> del dia dt., 27
> de jul. 2021 a les 4:53:
> > 
> > Hi Enric,
> > 
> > On Mon, 2021-07-26 at 12:08 +0200, Enric Balletbo Serra wrote:
> > > Hi Jason,
> > > 
> > > Missatge de Jason-JH Lin <jason-jh.lin@mediatek.com> del dia dl.,
> > > 26
> > > de jul. 2021 a les 9:02:
> > > > 
> > > > On Fri, 2021-07-23 at 13:13 +0200, Enric Balletbo Serra wrote:
> > > > > Hi Jason,
> > > > > 
> > > > > Thank you for your patch.
> > > > > 
> > > > > Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia
> > > > > dj.,
> > > > > 22
> > > > > de jul. 2021 a les 11:26:
> > > > > > 
> > > > > > There are 2 display hardware path in mt8195, namely vdosys0
> > > > > > and
> > > > > > vdosys1, so add their definition in mtk-mmsys
> > > > > > documentation.
> > > > > > 
> > > > > 
> > > > > Just having 2 display hardware paths is not a reason to have
> > > > > two
> > > > > compatibles, isn't the IP block the same? Why do you need to
> > > > > introduce
> > > > > the two compatibles?
> > > > > 
> > > > > Thanks,
> > > > >   Enric
> > > > > 
> > > > 
> > > > Hi Enric,
> > > > 
> > > > Thanks for reviewing my patch.
> > > > 
> > > > The reason for using two compatibles is that vdosys0 and
> > > > vdosys1
> > > > are
> > > > different IP blocks.
> > > > 
> > > 
> > > With that there are different IP blocks, what do you mean? Do you
> > > mean
> > > that there are two completely different blocks with completely
> > > different functionalities?
> > > 
> > > Or that there is the same IP block twice? I mean, of course, the
> > > registers are different but has exactly the same functionality.
> > > 
> > 
> > They are not the same IP block twice.
> > Although both vdosys0 and vdosys1 will probe meiatek-drm driver,
> > but
> > the components on their hardware path are different and their
> > output
> > panel are also different.
> > 
> > > > Because mmsys provides clock control, other display function
> > > > blocks
> > > > may
> > > > use them as clock provider.
> > > > 
> > > > E.g.
> > > > 1. mmsys with compatible="mediatek,mt8195-vdosys0"
> > > > [v4,1/6] arm64: dts: mt8195: add display node for vdosys0
> > > > 
> > > > 
> > 
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!xHjKwv34W7ETFcmQPXRViylF2LbV7C7pE8OeJeNvA93jDdzr_ZBRRm8aIUCvAHSD_qGo$
> > > > 
> > > > 
> > > > ovl0: disp_ovl@1c000000 {
> > > >         ...
> > > >         clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> > > >         ...
> > > > };
> > > > 
> > > > 2. mmsys with compatible="mediatek,mt8195-vdosys1"
> > > > [v2,06/14] arm64: dts: mt8195: add display node for vdosys1
> > > > 
> > > > 
> > 
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-7-nancy.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!xHjKwv34W7ETFcmQPXRViylF2LbV7C7pE8OeJeNvA93jDdzr_ZBRRm8aIUCvAP0FOfkc$
> > > > 
> > > > 
> > > > vdo1_rdma0: vdo1_rdma@1c104000 {
> > > >         ...
> > > >         clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > > >         ...
> > > > };
> > > > 
> > > 
> > > Note that I am talking without knowing the hardware in detail,
> > > but I
> > > am wondering why I can't have something like this, where every
> > > mmsys
> > > is a clock and reset controller provider.
> > > 
> > > vdosys0: syscon@14000000 {
> > >           compatible = "mediatek,mt8195-mmsys", "syscon";
> > >           reg = <0 0x14000000 0 0x1000>;
> > >           #clock-cells = <1>;
> > >           #reset-cells = <1>;
> > > };
> > > 
> > > vdosys1: syscon@15000000 {
> > >           compatible = "mediatek,mt8195-mmsys", "syscon";
> > >           reg = <0 0x15000000 0 0x1000>;
> > >           #clock-cells = <1>;
> > >           #reset-cells = <1>;
> > > };
> > > 
> > > ovl0: disp_ovl@1c000000 {
> > >         ...
> > >        clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> > >         ...
> > > };
> > > 
> > > vdo1_rdma0: vdo1_rdma@1c104000 {
> > >         ...
> > >         clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > >         ...
> > > };
> > > 
> > > What are the differences between vdosys0 and vdosys1 from a
> > > hardware
> > > point of view?
> > > 
> > > Cheers,
> > >   Enric
> > > 
> > > > Regards,
> > > > Jason-JH.Lin
> > > > 
> > 
> > From a hardware point of view, the components and the ouptut panel
> > of
> > vdosys0 and vdosys1:
> > 1. The components on meiatek-drm of vdosys0 are OVL0, RDMA0,
> > COLOR0,
> > CCORR, AAL0, GAMMA, DITHER, DSC0, MERGE0, DP_INTF0 and its output
> > panel
> > is eDP.
> > 
> > 2. The components on meiatek-drm of vdosys1 are PSEUDO_OVL, MERGE5,
> > DP_INTF1 and its ouptut panel is DP.
> > 
> > 
> > The resaon for using two compatibales is that we use different
> > driver
> > data in mtk-mmsys.c and mtk_drm_drv.c to identify the corresponding
> > mmsys is vdosys0 or vdosys1.
> > 
> 
> So IIUC the two mmsys block ares basically the same, they provide the
> same, a reset controller, a clock controller and being able to write
> to the routing registers, and what you only need to identify is which
> one is is vdosys0 and which one is vdosys1 to apply different routing
> tables? Can these routing tables change at runtime? Or are they
> hardware fixed?
> 
> Regards,
>  Enric
> 
In the case of vdosys1 DP_TX switch to HDMI_TX, routing tables will
change at runtime.

Refer to mt8173.dtsi:

https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt8173.dtsi
I forgot to put the power domain property in vdosys0 dts node.
So I'll add this into DRM vdosys0 series at the next version:
vdosys0: syscon@1c01a000 {
 	compatible = "mediatek,mt8195-vdosys0", "syscon";
 	reg = <0 0x1c01a000 0 0x1000>;
	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
	...
};
I'll also tell Nancy to add this:
vdosys1: syscon@1c100000 {
	compatible = "mediatek,mt8195-vdosys1", "syscon";
	reg = <0 0x1c100000 0 0x1000>;
	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;	...
};
I'll also add the power-domian description into this yaml.
power-domains:
description: A phandle and PM domain specifier as defined by bindings
of the power controller specified by phandle. See
Documentation/devicetree/bindings/power/power-domain.yaml for details.

In the SoC before, such as mt8173, it has 2 pipelines binding to one
mmsys with the same clock driver and the same power domain.

In mt8195, 2 pipelines are binding to different mmsys, such as vdosys0
and vdosys1. Each mmsys uses different clock drivers and different
power domain.
So I think it is more appropriate to use 2 compatibles to identify
which mmsys represents the pipeline.


Regards,
Jason-JH.Lin

> > Their driver data in mtk_drm_drv.c is defined here:
> > [v4,4/6] drm/mediatek: add mediatek-drm of vdosys0 support for
> > mt8195
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-5-jason-jh.lin@mediatek.com/
> >  
> > [v2,14/14] drm/mediatek: add mediatek-drm of vdosys1 support for
> > MT8195
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-15-nancy.lin@mediatek.com
> > 
> > 
> > I think using the same compatible is unable to do this. Or do you
> > have
> > other suggestions to do this with the same compatibe?
> > 
> > Regards,
> > Jason-JH.Lin
> > 
> > > > > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > > > > ---
> > > > > > this patch is base on [1][2]
> > > > > > 
> > > > > > [1] dt-bindings: arm: mediatek: mmsys: convert to YAML
> > > > > > format
> > > > > > -
> > > > > > 
> > 
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/
> > > > > > 
> > > > > > [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC
> > > > > > binding
> > > > > > -
> > > > > > 
> > 
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/
> > > > > > 
> > > > > > ---
> > > > > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> > > > > >   |
> > > > > > 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > > 
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,m
> > > > > > msys
> > > > > > .yam
> > > > > > l
> > > > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,m
> > > > > > msys
> > > > > > .yam
> > > > > > l
> > > > > > index 2d4ff0ce387b..0789a9614f12 100644
> > > > > > ---
> > > > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,m
> > > > > > msys
> > > > > > .yam
> > > > > > l
> > > > > > +++
> > > > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,m
> > > > > > msys
> > > > > > .yam
> > > > > > l
> > > > > > @@ -30,6 +30,8 @@ properties:
> > > > > >                - mediatek,mt8173-mmsys
> > > > > >                - mediatek,mt8183-mmsys
> > > > > >                - mediatek,mt8365-mmsys
> > > > > > +              - mediatek,mt8195-vdosys0
> > > > > > +              - mediatek,mt8195-vdosys1
> > > > > >            - const: syscon
> > > > > >        - items:
> > > > > >            - const: mediatek,mt7623-mmsys
> > > > > > --
> > > > > > 2.18.0
> > > > > > 
> > > > 
> > > > --
> > 
> > --
> > Jason-JH Lin <jason-jh.lin@mediatek.com>
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
