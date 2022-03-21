Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0387C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oF/8+yU6JJJa9apE8slAYoeQzldTyeU+xuk30XDggc=; b=PuqNlNKWX7MiCF
	MtcimeQNx8ThqzDy0tdyK0oiKYGmUfhjtLETii1PaQQwZeL6JUkxME4eqM5H9xR469cjQiC7/jo7d
	+Op6Xbi8mtOyzlaK3oQqZv8WVPsBd/w/C3EoepqLO3AljVlbnneGNzVtlFmQI7UkVpsgpnA5Rpkn0
	Tqzublnq1OqYET49+VciEjCEcp1CFunMnySds8/RonNK3yNyEN6ZxX1g85Qi9LE5bk1GlZPzmHn0q
	uOb9j9lhnj3Z6sbFxjrcc9YLyV2RKfatA8b6aM6mR3H5SVS2plpXLPVPU727syjvI5rVGSrzO+Id8
	JFa36j5sClVkkiW/HoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQTw-009Ean-4o; Mon, 21 Mar 2022 22:26:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQTk-009EZ6-9V; Mon, 21 Mar 2022 22:26:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 77B891F43C7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647901578;
 bh=B8Pb07hkCfW+xPaMdiwdl2p2fFiGYRzPCnnydlob/vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tr6qLx7D1I+cpf7Bg25M1DfpHYW3LmJzrS546wmKykxyPgOQv1Df3Rntju+oWv201
 1Ra/PeOakKqLV/N3BEUPbzEaYb0wn1biZgAZA65z7cMHgQsuxjTGm3bpqjzW59xCGk
 5jhd37GA0/JDDEMVWyMozFZN9JK48X3vUMl+o8x/BB1h00W5ATPRwwTdYFbXNLc9ep
 RF5R5bwIIjsOsc+qU22Boj5yX79cEyZo4KS94s1yRpcME8W8RJ4VU7JDonUHzP2zr3
 LGR7UELzrHvuqenyN4atQ0SwuxsVfoD3SIGKIZANQ2uKd+Tscr4Miw5sZXKZ/l+G1Q
 n99LtvS7z+gkw==
Date: Mon, 21 Mar 2022 18:26:13 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 06/22] arm64: dts: mt8192: Add xhci node
Message-ID: <20220321222613.aro6m72hoyubsggg@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-7-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-7-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_152620_480858_F359D4CE 
X-CRM114-Status: GOOD (  14.10  )
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

On Fri, Mar 18, 2022 at 10:45:18PM +0800, Allen-KH Cheng wrote:
> Add xhci node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 28b93b76fe17..6bc36a4076f4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8192-power.h>
>  =

>  / {
> @@ -718,6 +719,29 @@
>  			status =3D "disabled";
>  		};
>  =

> +		xhci: usb@11200000 {
> +			compatible =3D "mediatek,mt8192-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg =3D <0 0x11200000 0 0x1000>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names =3D "mac", "ippc";
> +			interrupts-extended =3D <&gic GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =3D "host";
> +			phys =3D <&u2port0 PHY_TYPE_USB2>,
> +			       <&u3port0 PHY_TYPE_USB3>;
> +			assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_SEL>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_SEL>;
> +			assigned-clock-parents =3D <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks =3D <&infracfg CLK_INFRA_SSUSB>,
> +				 <&infracfg CLK_INFRA_SSUSB_XHCI>,
> +				 <&apmixedsys CLK_APMIXED_USBPLL>;
> +			clock-names =3D "sys_ck", "xhci_ck", "ref_ck";
> +			wakeup-source;
> +			mediatek,syscon-wakeup =3D <&pericfg 0x420 102>;
> +			status =3D "disabled";
> +		};
> +
>  		nor_flash: spi@11234000 {
>  			compatible =3D "mediatek,mt8192-nor";
>  			reg =3D <0 0x11234000 0 0xe0>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
