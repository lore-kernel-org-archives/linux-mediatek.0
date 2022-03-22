Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DirKvaCvD8I4ntdTIaN2U9tCcI2rtnZibjIfy7Aww00=; b=JHMRlZOoayjPz0
	Ymdm5KkAc+5OWSa+RV+dfFc29aheABy3KBRiBh5SDN7Kl88+i9x3OuVY2i3WC7kfAfvKs1CVXY8Y5
	c/cYNr2oQwxsnbE8T7Qml9RKLMHGmL+o5wu+Bt0D1fvpUKeWe0+2qnxpPKKnOaiUlI90ka1e1Ipcx
	yTNTwaaPiL93C7VBKX+kraCcWkxKjZJJ9pqyPIdJMEWJSxVrfyIW9CpgDLBN23odtzSBIjLlC1CrW
	k/FgTFKVfvzCaKzHE+iqiDSat1VemuWzZhjROgNk/04kC15ocphsveLXPoVeF22c04DtlnFLnzE5q
	z1E96Bs0uwILieMbKUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWmpk-00CKcl-3J; Tue, 22 Mar 2022 22:18:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWmpY-00CKbI-OM; Tue, 22 Mar 2022 22:18:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 2CA7C1F442A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647987499;
 bh=eWWNvfS4c7Pbd117rSjqnHFnvgl9cIGdel1xA62As0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kseM87wJJgeZx4HEvMRKmYMgWYyE482y/DcFndDYyS6DVTfxdQaPbA5VtKghu2BaU
 +BcMo1FseK8EEKCf4J3oQKlOUI2H9n5wglS8+7IpxsDmmpTdFSx2Qucb5sodOi02oz
 97YUND3jesIra3mnN5rEzQ5NyBO2J+htFc2Wzdq/DOUso1GmwUVDO6nQ5Ex4oOGIOO
 w1vrlNkI3VQk7JgotQcacWekzHV++gfxYfsDtNGtPt0BTAfe3Opbz7cXO5AKE9kTuL
 CtXnf5jEo9NwOyD+4Pr7DerSqFVtQNv/xNM+6RSuXF24j+BXAuz373ppq3qmRw5gYg
 DMdgayzVRZPDw==
Date: Tue, 22 Mar 2022 18:18:14 -0400
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
Subject: Re: [PATCH v4 09/22] arm64: dts: mt8192: Add PCIe node
Message-ID: <20220322221814.pwrqtvzlvrmwvloo@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_151820_948927_5471E48D 
X-CRM114-Status: GOOD (  14.51  )
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

On Fri, Mar 18, 2022 at 10:45:21PM +0800, Allen-KH Cheng wrote:
> Add PCIe node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 82de1af3f6aa..3a7f93d8eeaa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -884,6 +884,44 @@
>  			};
>  		};
>  =

> +		pcie: pcie@11230000 {
> +			compatible =3D "mediatek,mt8192-pcie";
> +			device_type =3D "pci";
> +			reg =3D <0 0x11230000 0 0x2000>;
> +			reg-names =3D "pcie-mac";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			clocks =3D <&infracfg CLK_INFRA_PCIE_TL_26M>,
> +				 <&infracfg CLK_INFRA_PCIE_TL_96M>,
> +				 <&infracfg CLK_INFRA_PCIE_TL_32K>,
> +				 <&infracfg CLK_INFRA_PCIE_PERI_26M>,
> +				 <&infracfg CLK_INFRA_PCIE_TOP_H_133M>,
> +				 <&infracfg CLK_INFRA_PCIE_PL_P_250M>;
> +			clock-names =3D "sys_ck0", "ahb_ck0", "aux_ck0",
> +				      "obff_ck0", "axi_ck0", "pipe_ck0";
> +			assigned-clocks =3D <&topckgen CLK_TOP_TL_SEL>;
> +			assigned-clock-parents =3D <&topckgen CLK_TOP_MAINPLL_D6_D4>;
> +			resets =3D <&infracfg_rst 2>,
> +				 <&infracfg_rst 3>;
> +			reset-names =3D "phy", "mac";
> +			interrupts =3D <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> +			bus-range =3D <0x00 0xff>;
> +			ranges =3D <0x82000000 0 0x12000000 0x0 0x12000000 0 0x0800000>,
> +				 <0x81000000 0 0x12800000 0x0 0x12800000 0 0x0800000>;
> +			#interrupt-cells =3D <1>;
> +			interrupt-map-mask =3D <0 0 0 7>;
> +			interrupt-map =3D <0 0 0 1 &pcie_intc0 0>,
> +					<0 0 0 2 &pcie_intc0 1>,
> +					<0 0 0 3 &pcie_intc0 2>,
> +					<0 0 0 4 &pcie_intc0 3>;
> +
> +			pcie_intc0: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells =3D <0>;
> +				#interrupt-cells =3D <1>;
> +			};
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
