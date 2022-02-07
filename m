Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C18C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVIWSPEI04q8UH4bhkgJ46snXNBfRlKQ/ptYvHqgKUc=; b=Cf1VQel6YKcyOh
	FkFWU23tMnCD09JH/EUnrvme3sifcyfv8Aqeb1/pOM70S0thMlIp/FlZpl2vRmBoxfKLcGgfp9JuO
	ThacBUghuuCqJfZ8MiV/+vV/qKx7HbeM8T9WDg5QIajB2VJdHcrxUiJWF/j7/kM/Io1qHY1mW2Lm/
	zjIpWCh/3Wrl4BXva4s6YvxC3mblycwPrTwZ6elDK6C0axnQ04GlkY4cJaxKDU10cKJeE2z2LWraR
	dwkED/rb95hVWUFKN4WuasX9uxmhCpglW0QFDS+6hQ4mAPfxVPeWc6RH0sE1elOqUJoAxBnuv7Dhh
	thLyTZxfrbLhuX3t3Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6WM-00AxkG-LK; Mon, 07 Feb 2022 16:05:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH62B-00Al3G-Qg; Mon, 07 Feb 2022 15:34:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 0227C1F43B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644248068;
 bh=ol3XokBITXIfyab5chsBQWUULIoTBvY1DDSR5rejgvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=obxfamCW4cnL3wy0ug3PFGL3p+Tuo+giscjZZG7Gp8W3+dak1a5dMCLmxytjSi3Zu
 +7qQH7krl7nFsswMvu2OmAanWP5sU1e3Qqi2/o+i+IrTiDsoE4OG5n6BMqW+1Oo5ER
 dM8v4gJfJDhlam8krFoExNK0TRnvFIzcCGDMaA1+y6+BYDOHlXxFrkiCf9ptWVe3Gw
 4o32biV2EuqM64q522rtN/Dq039d2I/CvSUOw4UwwMr9unwDv2QrtI5X92Wc9xUWPY
 i1kUSi5T9U+91w0sW2LK+/dNk2NkACnPJaGoT0Y8035wIr+rUwx2uCtNFboIJB3wMj
 4c5WiceFbJ4KQ==
Date: Mon, 7 Feb 2022 10:34:23 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v5] arm64: dts: mediatek: Add mt8192 power domains controller
Message-ID: <20220207153423.smz3636wk3hjk3b5@notapiano>
References: <20210825010426.30303-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825010426.30303-1-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073432_204111_AE66360B 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Jie,

thanks for the patch. Please see my comments below.

On Wed, Aug 25, 2021 at 09:04:26AM +0800, Chun-Jie Chen wrote:
> Add power domains controller node for SoC mt8192
> =

> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
> This patch is base on v5.14-rc1,
> series "Mediatek MT8192 clock support"[1] and [2].
> No changes compare v4
> =

> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D52=
1127
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023=
205.20319-2-chun-jie.chen@mediatek.com/

Those two patches are already merged in mainline, so this patch applies
cleanly on mainline without any other dependencies. Might be worth sending =
a new
version removing this text to make that clearer to the maintainers.

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 201 +++++++++++++++++++++++
>  1 file changed, 201 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index c7c7d4e017ae..a0084a7a5bcd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/power/mt8192-power.h>
>  =

>  / {
>  	compatible =3D "mediatek,mt8192";
> @@ -301,6 +302,206 @@
>  			#interrupt-cells =3D <2>;
>  		};
>  =

> +		scpsys: syscon@10006000 {
> +			compatible =3D "syscon", "simple-mfd";
> +			reg =3D <0 0x10006000 0 0x1000>;
> +			#power-domain-cells =3D <1>;
> +
> +			/* System Power Manager */
> +			spm: power-controller {
> +				compatible =3D "mediatek,mt8192-power-controller";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				#power-domain-cells =3D <1>;
> +
> +				/* power domain of the SoC */
> +				power-domain@MT8192_POWER_DOMAIN_AUDIO {
> +					reg =3D <MT8192_POWER_DOMAIN_AUDIO>;
> +					clocks =3D <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +						 <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +						 <&infracfg CLK_INFRA_AUDIO>;
> +					clock-names =3D "audio", "audio1", "audio2";
> +					mediatek,infracfg =3D <&infracfg>;
> +					#power-domain-cells =3D <0>;
> +				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_CONN {
> +					reg =3D <MT8192_POWER_DOMAIN_CONN>;
> +					clocks =3D <&infracfg CLK_INFRA_PMIC_CONN>;
> +					clock-names =3D "conn";
> +					mediatek,infracfg =3D <&infracfg>;
> +					#power-domain-cells =3D <0>;
> +				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_MFG0 {
> +					reg =3D <MT8192_POWER_DOMAIN_MFG0>;
> +					clocks =3D <&topckgen CLK_TOP_MFG_PLL_SEL>;
> +					clock-names =3D "mfg";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					#power-domain-cells =3D <1>;
> +
> +					power-domain@MT8192_POWER_DOMAIN_MFG1 {
> +						reg =3D <MT8192_POWER_DOMAIN_MFG1>;
> +						mediatek,infracfg =3D <&infracfg>;
> +						#address-cells =3D <1>;
> +						#size-cells =3D <0>;
> +						#power-domain-cells =3D <1>;
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG2 {
> +							reg =3D <MT8192_POWER_DOMAIN_MFG2>;
> +							#power-domain-cells =3D <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG3 {
> +							reg =3D <MT8192_POWER_DOMAIN_MFG3>;
> +							#power-domain-cells =3D <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG4 {
> +							reg =3D <MT8192_POWER_DOMAIN_MFG4>;
> +							#power-domain-cells =3D <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG5 {
> +							reg =3D <MT8192_POWER_DOMAIN_MFG5>;
> +							#power-domain-cells =3D <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG6 {
> +							reg =3D <MT8192_POWER_DOMAIN_MFG6>;
> +							#power-domain-cells =3D <0>;
> +						};
> +					};
> +				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_DISP {
> +					reg =3D <MT8192_POWER_DOMAIN_DISP>;
> +					clocks =3D <&topckgen CLK_TOP_DISP_SEL>,
> +						 <&mmsys CLK_MM_SMI_INFRA>,
> +						 <&mmsys CLK_MM_SMI_COMMON>,
> +						 <&mmsys CLK_MM_SMI_GALS>,
> +						 <&mmsys CLK_MM_SMI_IOMMU>;
> +					clock-names =3D "disp", "disp-0", "disp-1", "disp-2",
> +						      "disp-3";
> +					mediatek,infracfg =3D <&infracfg>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					#power-domain-cells =3D <1>;
> +
> +					power-domain@MT8192_POWER_DOMAIN_IPE {
> +						reg =3D <MT8192_POWER_DOMAIN_IPE>;
> +						clocks =3D <&topckgen CLK_TOP_IPE_SEL>,
> +							 <&ipesys CLK_IPE_LARB19>,
> +							 <&ipesys CLK_IPE_LARB20>,
> +							 <&ipesys CLK_IPE_SMI_SUBCOM>,
> +							 <&ipesys CLK_IPE_GALS>;
> +						clock-names =3D "ipe", "ipe-0", "ipe-1", "ipe-2",
> +							      "ipe-3";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#power-domain-cells =3D <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_ISP {
> +						reg =3D <MT8192_POWER_DOMAIN_ISP>;
> +						clocks =3D <&topckgen CLK_TOP_IMG1_SEL>,
> +							 <&imgsys CLK_IMG_LARB9>,
> +							 <&imgsys CLK_IMG_GALS>;
> +						clock-names =3D "isp", "isp-0", "isp-1";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#power-domain-cells =3D <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_ISP2 {
> +						reg =3D <MT8192_POWER_DOMAIN_ISP2>;
> +						clocks =3D <&topckgen CLK_TOP_IMG2_SEL>,
> +							 <&imgsys2 CLK_IMG2_LARB11>,
> +							 <&imgsys2 CLK_IMG2_GALS>;
> +						clock-names =3D "isp2", "isp2-0", "isp2-1";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#power-domain-cells =3D <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_MDP {
> +						reg =3D <MT8192_POWER_DOMAIN_MDP>;
> +						clocks =3D <&topckgen CLK_TOP_MDP_SEL>,
> +							 <&mdpsys CLK_MDP_SMI0>;
> +						clock-names =3D "mdp", "mdp-0";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#power-domain-cells =3D <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_VENC {
> +						reg =3D <MT8192_POWER_DOMAIN_VENC>;
> +						clocks =3D <&topckgen CLK_TOP_VENC_SEL>,
> +							 <&vencsys CLK_VENC_SET1_VENC>;
> +						clock-names =3D "venc", "venc-0";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#power-domain-cells =3D <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_VDEC {
> +						reg =3D <MT8192_POWER_DOMAIN_VDEC>;
> +						clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> +							 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +							 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +							 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
> +						clock-names =3D "vdec", "vdec-0", "vdec-1", "vdec-2";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#address-cells =3D <1>;
> +						#size-cells =3D <0>;
> +						#power-domain-cells =3D <1>;
> +
> +						power-domain@MT8192_POWER_DOMAIN_VDEC2 {
> +							reg =3D <MT8192_POWER_DOMAIN_VDEC2>;
> +							clocks =3D <&vdecsys CLK_VDEC_VDEC>,
> +								 <&vdecsys CLK_VDEC_LAT>,
> +								 <&vdecsys CLK_VDEC_LARB1>;
> +							clock-names =3D "vdec2-0", "vdec2-1",
> +								      "vdec2-2";
> +							#power-domain-cells =3D <0>;
> +						};
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_CAM {
> +						reg =3D <MT8192_POWER_DOMAIN_CAM>;
> +						clocks =3D <&topckgen CLK_TOP_CAM_SEL>,
> +							 <&camsys CLK_CAM_LARB13>,
> +							 <&camsys CLK_CAM_LARB14>,
> +							 <&camsys CLK_CAM_CCU_GALS>,
> +							 <&camsys CLK_CAM_CAM2MM_GALS>;
> +						clock-names =3D "cam", "cam-0", "cam-1", "cam-2",
> +							      "cam-3";
> +						mediatek,infracfg =3D <&infracfg>;
> +						#address-cells =3D <1>;
> +						#size-cells =3D <0>;
> +						#power-domain-cells =3D <1>;
> +
> +						power-domain@MT8192_POWER_DOMAIN_CAM_RAWA {
> +							reg =3D <MT8192_POWER_DOMAIN_CAM_RAWA>;
> +							clocks =3D <&camsys_rawa CLK_CAM_RAWA_LARBX>;
> +							clock-names =3D "cam_rawa-0";
> +							#power-domain-cells =3D <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_CAM_RAWB {
> +							reg =3D <MT8192_POWER_DOMAIN_CAM_RAWB>;
> +							clocks =3D <&camsys_rawb CLK_CAM_RAWB_LARBX>;
> +							clock-names =3D "cam_rawb-0";
> +							#power-domain-cells =3D <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_CAM_RAWC {
> +							reg =3D <MT8192_POWER_DOMAIN_CAM_RAWC>;
> +							clocks =3D <&camsys_rawc CLK_CAM_RAWC_LARBX>;
> +							clock-names =3D "cam_rawc-0";
> +							#power-domain-cells =3D <0>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		apmixedsys: syscon@1000c000 {
>  			compatible =3D "mediatek,mt8192-apmixedsys", "syscon";
>  			reg =3D <0 0x1000c000 0 0x1000>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
