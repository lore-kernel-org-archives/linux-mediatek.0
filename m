Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8663C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:11:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6BC246B8
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="po2TKR7W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BiqLvSYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6BC246B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KHnScFzoxgTbhD8TBcjpdjLVXuooOVWn0LNrOyIkJkc=; b=po2TKR7W9yy2pQGptBAFPMzS0
	OPGcdLmIsNb9mcFkW/xFf5kqLHyjw6W7hpMOCIinDKcLOF/GzZDv4u5svj1evre8Gd/AQuHAC/8r5
	skUiL51eIYw2bwjEjC0VFcj863r9/9zUuGhYcCYvQoYJXqrk8rlp6BYNYb7kL64byhxm9rtK2AidS
	ao9VuImaFaBBUoi6nQU8LDyHwa8nnEQn068/9CMWBKDnr9WxzcqKFgxtlqNP8RfZdW39tyFYA5Xz5
	UmJCAMLi71ilifjAr2TGsC/7GNEoXdlo3NLlX5BPpEjzYjqR0vNiS7rBQVVxYlsWlSDd5TPC3BzqE
	KxInTF/sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfjiS-0004LH-9V; Thu, 19 Nov 2020 13:11:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfjhj-0004AG-F6; Thu, 19 Nov 2020 13:10:33 +0000
X-UUID: 66837fa420324a6fbab728c38d3bbb59-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eATmIcAu8mnngDtKC17o0OXO7zw2+X3r5vG7d2gZqyo=; 
 b=BiqLvSYDzkAb10LjpUWW0c34M0Ko8SjrZ81RVyLvmf4rrisqCS6NShMYy6VhMFXNEVP6Xq/oAXULXXXdrlVepitrnSAVomIsKnmNYjqK4a+t7avebzTDoLP/qFRmnVR1ZapNopjNDtHhv+WSN4rn+z+fdXBF0ovriauyczgcxzQ=;
X-UUID: 66837fa420324a6fbab728c38d3bbb59-20201119
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1502304416; Thu, 19 Nov 2020 05:10:22 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 05:10:20 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 21:10:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 21:10:18 +0800
Message-ID: <1605791419.19819.4.camel@mtksdaap41>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add mt8192 power domains
 controller
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 19 Nov 2020 21:10:19 +0800
In-Reply-To: <CAFqH_522NuGY9c-_XWhHxoa3QkrdoM92qTOLxgM8PpOU=-ttbw@mail.gmail.com>
References: <1605782884-19741-1-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_522NuGY9c-_XWhHxoa3QkrdoM92qTOLxgM8PpOU=-ttbw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_081027_817521_20CA39FF 
X-CRM114-Status: GOOD (  22.05  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-19 at 13:13 +0100, Enric Balletbo Serra wrote:
> Hi Weiyi,
> 
> Thank you for the patch
> 
> Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
> 2020 a les 11:48:
> >
> > Add power domains controller node for SoC mt8192
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >
> > Change in v3: None, just rebase dts onto v5.10-rc1 and
> >        V4 of series "Add new driver for SCPSYS power domains controller"[1]
> >
> > [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013
> >
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 201 +++++++++++++++++++++++++++++++
> >  1 file changed, 201 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 69d45c7..08449eb 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -9,6 +9,7 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > +#include <dt-bindings/power/mt8192-power.h>
> >
> >  / {
> >         compatible = "mediatek,mt8192";
> > @@ -257,6 +258,206 @@
> >                         #interrupt-cells = <2>;
> >                 };
> >
> > +               scpsys: syscon@10006000 {
> > +                       compatible = "syscon", "simple-mfd";
> > +                       reg = <0 0x10006000 0 0x1000>;
> > +                       #power-domain-cells = <1>;
> > +
> > +                       /* System Power Manager */
> > +                       spm: power-controller {
> > +                               compatible = "mediatek,mt8192-power-controller";
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                               #power-domain-cells = <1>;
> > +
> > +                               /* power domain of the SoC */
> > +                               audio@MT8192_POWER_DOMAIN_AUDIO {
> 
> If you run the dt_bindings_check it should return some errors, as all
> these node names should be 'power-domain@'. Which is a bit annoying
> because then you will get a bunch of errors like this:
> 
> [    1.969110] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    1.976997] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    1.984828] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    1.992657] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.000685] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.008566] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.016395] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.024221] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.032049] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.039874] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.047699] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.055524] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.063352] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> [    2.071176] debugfs: Directory 'power-domain' with parent
> 'pm_genpd' already present!
> 
> But that's another problem that should be handled in debugfs system.
> 

Indeed...so I chose to use different name in dts to avoid problems in
debugfs. It does violate the naming rules.

> > +                                       reg = <MT8192_POWER_DOMAIN_AUDIO>;
> > +                                       clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> > +                                                <&infracfg CLK_INFRA_AUDIO_26M_B>,
> > +                                                <&infracfg CLK_INFRA_AUDIO>;
> > +                                       clock-names = "audio", "audio1", "audio2";
> > +                                       mediatek,infracfg = <&infracfg>;
> > +                                       #power-domain-cells = <0>;
> > +                               };
> > +
> > +                               conn@MT8192_POWER_DOMAIN_CONN {
> > +                                       reg = <MT8192_POWER_DOMAIN_CONN>;
> > +                                       clocks = <&infracfg CLK_INFRA_PMIC_CONN>;
> > +                                       clock-names = "conn";
> > +                                       mediatek,infracfg = <&infracfg>;
> > +                                       #power-domain-cells = <0>;
> > +                               };
> > +
> > +                               mfg@MT8192_POWER_DOMAIN_MFG0 {
> > +                                       reg = <MT8192_POWER_DOMAIN_MFG0>;
> > +                                       clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>;
> > +                                       clock-names = "mfg";
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       #power-domain-cells = <1>;
> > +
> > +                                       mfg1@MT8192_POWER_DOMAIN_MFG1 {
> > +                                               reg = <MT8192_POWER_DOMAIN_MFG1>;
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #address-cells = <1>;
> > +                                               #size-cells = <0>;
> > +                                               #power-domain-cells = <1>;
> > +
> > +                                               mfg2@MT8192_POWER_DOMAIN_MFG2 {
> > +                                                       reg = <MT8192_POWER_DOMAIN_MFG2>;
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +
> > +                                               mfg3@MT8192_POWER_DOMAIN_MFG3 {
> > +                                                       reg = <MT8192_POWER_DOMAIN_MFG3>;
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +
> > +                                               mfg4@MT8192_POWER_DOMAIN_MFG4 {
> > +                                                       reg = <MT8192_POWER_DOMAIN_MFG4>;
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +
> > +                                               mfg5@MT8192_POWER_DOMAIN_MFG5 {
> > +                                                       reg = <MT8192_POWER_DOMAIN_MFG5>;
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +
> > +                                               mfg6@MT8192_POWER_DOMAIN_MFG6 {
> > +                                                       reg = <MT8192_POWER_DOMAIN_MFG6>;
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +                                       };
> > +                               };
> > +
> > +                               disp@MT8192_POWER_DOMAIN_DISP {
> > +                                       reg = <MT8192_POWER_DOMAIN_DISP>;
> > +                                       clocks = <&topckgen CLK_TOP_DISP_SEL>,
> > +                                                <&mmsys CLK_MM_SMI_INFRA>,
> > +                                                <&mmsys CLK_MM_SMI_COMMON>,
> > +                                                <&mmsys CLK_MM_SMI_GALS>,
> > +                                                <&mmsys CLK_MM_SMI_IOMMU>;
> > +                                       clock-names = "disp", "disp-0", "disp-1", "disp-2",
> > +                                                     "disp-3";
> > +                                       mediatek,infracfg = <&infracfg>;
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       #power-domain-cells = <1>;
> > +
> > +                                       ipe@MT8192_POWER_DOMAIN_IPE {
> > +                                               reg = <MT8192_POWER_DOMAIN_IPE>;
> > +                                               clocks = <&topckgen CLK_TOP_IPE_SEL>,
> > +                                                        <&ipesys CLK_IPE_LARB19>,
> > +                                                        <&ipesys CLK_IPE_LARB20>,
> > +                                                        <&ipesys CLK_IPE_SMI_SUBCOM>,
> > +                                                        <&ipesys CLK_IPE_GALS>;
> > +                                               clock-names = "ipe", "ipe-0", "ipe-1", "ipe-2",
> > +                                                             "ipe-3";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #power-domain-cells = <0>;
> > +                                       };
> > +
> > +                                       isp@MT8192_POWER_DOMAIN_ISP {
> > +                                               reg = <MT8192_POWER_DOMAIN_ISP>;
> > +                                               clocks = <&topckgen CLK_TOP_IMG1_SEL>,
> > +                                                        <&imgsys CLK_IMG_LARB9>,
> > +                                                        <&imgsys CLK_IMG_GALS>;
> > +                                               clock-names = "isp", "isp-0", "isp-1";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #power-domain-cells = <0>;
> > +                                       };
> > +
> > +                                       isp2@MT8192_POWER_DOMAIN_ISP2 {
> > +                                               reg = <MT8192_POWER_DOMAIN_ISP2>;
> > +                                               clocks = <&topckgen CLK_TOP_IMG2_SEL>,
> > +                                                        <&imgsys2 CLK_IMG2_LARB11>,
> > +                                                        <&imgsys2 CLK_IMG2_GALS>;
> > +                                               clock-names = "isp2", "isp2-0", "isp2-1";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #power-domain-cells = <0>;
> > +                                       };
> > +
> > +                                       mdp@MT8192_POWER_DOMAIN_MDP {
> > +                                               reg = <MT8192_POWER_DOMAIN_MDP>;
> > +                                               clocks = <&topckgen CLK_TOP_MDP_SEL>,
> > +                                                        <&mdpsys CLK_MDP_SMI0>;
> > +                                               clock-names = "mdp", "mdp-0";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #power-domain-cells = <0>;
> > +                                       };
> > +
> > +                                       venc@MT8192_POWER_DOMAIN_VENC {
> > +                                               reg = <MT8192_POWER_DOMAIN_VENC>;
> > +                                               clocks = <&topckgen CLK_TOP_VENC_SEL>,
> > +                                                        <&vencsys CLK_VENC_SET1_VENC>;
> > +                                               clock-names = "venc", "venc-0";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #power-domain-cells = <0>;
> > +                                       };
> > +
> > +                                       vdec@MT8192_POWER_DOMAIN_VDEC {
> > +                                               reg = <MT8192_POWER_DOMAIN_VDEC>;
> > +                                               clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +                                                        <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > +                                                        <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > +                                                        <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
> > +                                               clock-names = "vdec", "vdec-0", "vdec-1", "vdec-2";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #address-cells = <1>;
> > +                                               #size-cells = <0>;
> > +                                               #power-domain-cells = <1>;
> > +
> > +                                               vdec2@MT8192_POWER_DOMAIN_VDEC2 {
> > +                                                       reg = <MT8192_POWER_DOMAIN_VDEC2>;
> > +                                                       clocks = <&vdecsys CLK_VDEC_VDEC>,
> > +                                                                <&vdecsys CLK_VDEC_LAT>,
> > +                                                                <&vdecsys CLK_VDEC_LARB1>;
> > +                                                       clock-names = "vdec2-0", "vdec2-1",
> > +                                                                     "vdec2-2";
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +                                       };
> > +
> > +                                       cam@MT8192_POWER_DOMAIN_CAM {
> > +                                               reg = <MT8192_POWER_DOMAIN_CAM>;
> > +                                               clocks = <&topckgen CLK_TOP_CAM_SEL>,
> > +                                                        <&camsys CLK_CAM_LARB13>,
> > +                                                        <&camsys CLK_CAM_LARB14>,
> > +                                                        <&camsys CLK_CAM_CCU_GALS>,
> > +                                                        <&camsys CLK_CAM_CAM2MM_GALS>;
> > +                                               clock-names = "cam", "cam-0", "cam-1", "cam-2",
> > +                                                             "cam-3";
> > +                                               mediatek,infracfg = <&infracfg>;
> > +                                               #address-cells = <1>;
> > +                                               #size-cells = <0>;
> > +                                               #power-domain-cells = <1>;
> > +
> > +                                               cam_rawa@MT8192_POWER_DOMAIN_CAM_RAWA {
> > +                                                       reg = <MT8192_POWER_DOMAIN_CAM_RAWA>;
> > +                                                       clocks = <&camsys_rawa CLK_CAM_RAWA_LARBX>;
> > +                                                       clock-names = "cam_rawa-0";
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +
> > +                                               cam_rawb@MT8192_POWER_DOMAIN_CAM_RAWB {
> > +                                                       reg = <MT8192_POWER_DOMAIN_CAM_RAWB>;
> > +                                                       clocks = <&camsys_rawb CLK_CAM_RAWB_LARBX>;
> > +                                                       clock-names = "cam_rawb-0";
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +
> > +                                               cam_rawc@MT8192_POWER_DOMAIN_CAM_RAWC {
> > +                                                       reg = <MT8192_POWER_DOMAIN_CAM_RAWC>;
> > +                                                       clocks = <&camsys_rawc CLK_CAM_RAWC_LARBX>;
> > +                                                       clock-names = "cam_rawc-0";
> > +                                                       #power-domain-cells = <0>;
> > +                                               };
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +
> >                 apmixedsys: syscon@1000c000 {
> >                         compatible = "mediatek,mt8192-apmixedsys", "syscon";
> >                         reg = <0 0x1000c000 0 0x1000>;
> > --
> > 1.8.1.1.dirty
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
