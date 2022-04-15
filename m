Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcqr6qex0C3B8yVo2H/+0ho+kptnL7XCI2IQolHwnpw=; b=Nr1aQrVEUCu5OH
	30z7zxg/gmW31b67xbdOvGpzIvcW6j4+W7JgH/MvlPDlwLDTXq7lU8Frxdsbk9KSMNWkiSgfb6hKQ
	I8rsB6cAAowlTUpc3nQUnTLtXU5pkAc8XJYcAAVZAjBz0n//ye4hjxzIAby78iEa5QlUG9Zln5jvu
	1nEdA/aGalbXoPWsY8b9OSHesL83gMFplNf3ZENw1TrCJUee8AC1e1gp4k3CagUVXmjdbEp3yLHau
	55tYj627KdlPznMLkBL3bDGpdEoF2+zZPKOP/jFV7D+IiQginHz/4zrK7u1WYkHnztJ2AYUYrqAqU
	fbi9WUVgiR3xKmlWMOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOe6-00AsCr-W1; Fri, 15 Apr 2022 16:18:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfOPr-00Am0y-GM; Fri, 15 Apr 2022 16:03:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id F26961F481A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650038601;
 bh=TK4L1RQq13E/GZlJ/Wh/rvinGwy2B3DcB8KhtlOOT6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/4QrexfPaGQ8b07q0ZSgcRXvYeIkYLZoSwNOIZxsjI5Rijc86hx7BhFJhWVERae9
 GPjnlcBOlm5VdmyC0TLuOSw96VI2XRy4fHsy3+6CBVKifWarDzb1wdNsizbt4r+agS
 OOWmb69cWxD+5NuB021KwD+hFLwlwnqHHWKfG3eb3+BY/+G057ej2P7geBcVWse2w8
 3vzY6oq0TJgPU/JwluNyZVqHIJrNeoliFc6R3bJc7mpo9Rc8QpMHxQxwF28xsfTf0B
 B6PItKjk18ro3nA0tPhiF1eIJEMS0X8RaFI4zN6S3pTIEK5NY0ODfL7feDREw9jAyc
 rk+eXeYYt4wsg==
Date: Fri, 15 Apr 2022 12:03:14 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Hui-Liu Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: mt6359: add PMIC MT6359 nodes
Message-ID: <20220415160314.fxdvwl2jx7u7vhgj@notapiano>
References: <20220328103729.25102-1-hui.liu@mediatek.com>
 <20220328103729.25102-2-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328103729.25102-2-hui.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_090323_937043_522212BC 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com,
 linux-rtc@vger.kernel.org, wen.su@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yuchen.huang@mediatek.com,
 devicetree@vger.kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 a.zummo@towertech.it, srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com,
 lgirdwood@gmail.com, broonie@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 28, 2022 at 06:37:29PM +0800, Hui-Liu Liu wrote:
> From: Hui Liu <hui.liu@mediatek.com>
> =

> MT6359 is the primary PMIC for MT8192.
> Add PMIC MT6359 related node which is used for MT8192 platform.
> =

> Signed-off-by: Hui Liu <hui.liu@mediatek.com>

Hi Hui,

as the pwrap node on mt8192.dtsi has now been merged [1], please add an inc=
lude
for this mt6359.dtsi in mt8192-evb.dtsi in the next version of this patch.

Thanks,
N=EDcolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/=
commit/?h=3Dv5.18-next/dts64&id=3D261691b40128e6b76bb94d562457d8a5236cc7fa

> ---
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi | 298 +++++++++++++++++++++++
>  1 file changed, 298 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6359.dtsi
> new file mode 100644
> index 000000000000..df3e822232d3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +
> +&pwrap {
> +	pmic: pmic {
> +		compatible =3D "mediatek,mt6359";
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +
> +		mt6359codec: mt6359codec {
> +		};
> +
> +		regulators {
> +			mt6359_vs1_buck_reg: buck_vs1 {
> +				regulator-name =3D "vs1";
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <2200000>;
> +				regulator-enable-ramp-delay =3D <0>;
> +				regulator-always-on;
> +			};
> +			mt6359_vgpu11_buck_reg: buck_vgpu11 {
> +				regulator-name =3D "vgpu11";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1193750>;
> +				regulator-ramp-delay =3D <5000>;
> +				regulator-enable-ramp-delay =3D <200>;
> +				regulator-allowed-modes =3D <0 1 2>;
> +			};
> +			mt6359_vmodem_buck_reg: buck_vmodem {
> +				regulator-name =3D "vmodem";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1100000>;
> +				regulator-ramp-delay =3D <10760>;
> +				regulator-enable-ramp-delay =3D <200>;
> +			};
> +			mt6359_vpu_buck_reg: buck_vpu {
> +				regulator-name =3D "vpu";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1193750>;
> +				regulator-ramp-delay =3D <5000>;
> +				regulator-enable-ramp-delay =3D <200>;
> +				regulator-allowed-modes =3D <0 1 2>;
> +			};
> +			mt6359_vcore_buck_reg: buck_vcore {
> +				regulator-name =3D "vcore";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-ramp-delay =3D <5000>;
> +				regulator-enable-ramp-delay =3D <200>;
> +				regulator-allowed-modes =3D <0 1 2>;
> +			};
> +			mt6359_vs2_buck_reg: buck_vs2 {
> +				regulator-name =3D "vs2";
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <1600000>;
> +				regulator-enable-ramp-delay =3D <0>;
> +				regulator-always-on;
> +			};
> +			mt6359_vpa_buck_reg: buck_vpa {
> +				regulator-name =3D "vpa";
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <3650000>;
> +				regulator-enable-ramp-delay =3D <300>;
> +			};
> +			mt6359_vproc2_buck_reg: buck_vproc2 {
> +				regulator-name =3D "vproc2";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1193750>;
> +				regulator-ramp-delay =3D <7500>;
> +				regulator-enable-ramp-delay =3D <200>;
> +				regulator-allowed-modes =3D <0 1 2>;
> +			};
> +			mt6359_vproc1_buck_reg: buck_vproc1 {
> +				regulator-name =3D "vproc1";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1193750>;
> +				regulator-ramp-delay =3D <7500>;
> +				regulator-enable-ramp-delay =3D <200>;
> +				regulator-allowed-modes =3D <0 1 2>;
> +			};
> +			mt6359_vcore_sshub_buck_reg: buck_vcore_sshub {
> +				regulator-name =3D "vcore_sshub";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1193750>;
> +			};
> +			mt6359_vgpu11_sshub_buck_reg: buck_vgpu11_sshub {
> +				regulator-name =3D "vgpu11_sshub";
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1193750>;
> +			};
> +			mt6359_vaud18_ldo_reg: ldo_vaud18 {
> +				regulator-name =3D "vaud18";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-enable-ramp-delay =3D <240>;
> +			};
> +			mt6359_vsim1_ldo_reg: ldo_vsim1 {
> +				regulator-name =3D "vsim1";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <3100000>;
> +			};
> +			mt6359_vibr_ldo_reg: ldo_vibr {
> +				regulator-name =3D "vibr";
> +				regulator-min-microvolt =3D <1200000>;
> +				regulator-max-microvolt =3D <3300000>;
> +			};
> +			mt6359_vrf12_ldo_reg: ldo_vrf12 {
> +				regulator-name =3D "vrf12";
> +				regulator-min-microvolt =3D <1100000>;
> +				regulator-max-microvolt =3D <1300000>;
> +			};
> +			mt6359_vusb_ldo_reg: ldo_vusb {
> +				regulator-name =3D "vusb";
> +				regulator-min-microvolt =3D <3000000>;
> +				regulator-max-microvolt =3D <3000000>;
> +				regulator-enable-ramp-delay =3D <960>;
> +				regulator-always-on;
> +			};
> +			mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
> +				regulator-name =3D "vsram_proc2";
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <1293750>;
> +				regulator-ramp-delay =3D <7500>;
> +				regulator-enable-ramp-delay =3D <240>;
> +				regulator-always-on;
> +			};
> +			mt6359_vio18_ldo_reg: ldo_vio18 {
> +				regulator-name =3D "vio18";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <1900000>;
> +				regulator-enable-ramp-delay =3D <960>;
> +				regulator-always-on;
> +			};
> +			mt6359_vcamio_ldo_reg: ldo_vcamio {
> +				regulator-name =3D "vcamio";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <1900000>;
> +			};
> +			mt6359_vcn18_ldo_reg: ldo_vcn18 {
> +				regulator-name =3D "vcn18";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-enable-ramp-delay =3D <240>;
> +			};
> +			mt6359_vfe28_ldo_reg: ldo_vfe28 {
> +				regulator-name =3D "vfe28";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +				regulator-enable-ramp-delay =3D <120>;
> +			};
> +			mt6359_vcn13_ldo_reg: ldo_vcn13 {
> +				regulator-name =3D "vcn13";
> +				regulator-min-microvolt =3D <900000>;
> +				regulator-max-microvolt =3D <1300000>;
> +			};
> +			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
> +				regulator-name =3D "vcn33_1_bt";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <3500000>;
> +			};
> +			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
> +				regulator-name =3D "vcn33_1_wifi";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <3500000>;
> +			};
> +			mt6359_vaux18_ldo_reg: ldo_vaux18 {
> +				regulator-name =3D "vaux18";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-enable-ramp-delay =3D <240>;
> +				regulator-always-on;
> +			};
> +			mt6359_vsram_others_ldo_reg: ldo_vsram_others {
> +				regulator-name =3D "vsram_others";
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <1293750>;
> +				regulator-ramp-delay =3D <5000>;
> +				regulator-enable-ramp-delay =3D <240>;
> +			};
> +			mt6359_vefuse_ldo_reg: ldo_vefuse {
> +				regulator-name =3D "vefuse";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <2000000>;
> +			};
> +			mt6359_vxo22_ldo_reg: ldo_vxo22 {
> +				regulator-name =3D "vxo22";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <2200000>;
> +				regulator-always-on;
> +			};
> +			mt6359_vrfck_ldo_reg: ldo_vrfck {
> +				regulator-name =3D "vrfck";
> +				regulator-min-microvolt =3D <1500000>;
> +				regulator-max-microvolt =3D <1700000>;
> +			};
> +			mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
> +				regulator-name =3D "vrfck";
> +				regulator-min-microvolt =3D <1240000>;
> +				regulator-max-microvolt =3D <1600000>;
> +			};
> +			mt6359_vbif28_ldo_reg: ldo_vbif28 {
> +				regulator-name =3D "vbif28";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +				regulator-enable-ramp-delay =3D <240>;
> +			};
> +			mt6359_vio28_ldo_reg: ldo_vio28 {
> +				regulator-name =3D "vio28";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};
> +			mt6359_vemc_ldo_reg: ldo_vemc {
> +				regulator-name =3D "vemc";
> +				regulator-min-microvolt =3D <2900000>;
> +				regulator-max-microvolt =3D <3300000>;
> +			};
> +			mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
> +				regulator-name =3D "vemc";
> +				regulator-min-microvolt =3D <2500000>;
> +				regulator-max-microvolt =3D <3300000>;
> +			};
> +			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
> +				regulator-name =3D "vcn33_2_bt";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <3500000>;
> +			};
> +			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
> +				regulator-name =3D "vcn33_2_wifi";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <3500000>;
> +			};
> +			mt6359_va12_ldo_reg: ldo_va12 {
> +				regulator-name =3D "va12";
> +				regulator-min-microvolt =3D <1200000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-always-on;
> +			};
> +			mt6359_va09_ldo_reg: ldo_va09 {
> +				regulator-name =3D "va09";
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <1200000>;
> +			};
> +			mt6359_vrf18_ldo_reg: ldo_vrf18 {
> +				regulator-name =3D "vrf18";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <1810000>;
> +			};
> +			mt6359_vsram_md_ldo_reg: ldo_vsram_md {
> +				regulator-name =3D "vsram_md";
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <1293750>;
> +				regulator-ramp-delay =3D <10760>;
> +				regulator-enable-ramp-delay =3D <240>;
> +			};
> +			mt6359_vufs_ldo_reg: ldo_vufs {
> +				regulator-name =3D "vufs";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <1900000>;
> +			};
> +			mt6359_vm18_ldo_reg: ldo_vm18 {
> +				regulator-name =3D "vm18";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <1900000>;
> +				regulator-always-on;
> +			};
> +			mt6359_vbbck_ldo_reg: ldo_vbbck {
> +				regulator-name =3D "vbbck";
> +				regulator-min-microvolt =3D <1100000>;
> +				regulator-max-microvolt =3D <1200000>;
> +			};
> +			mt6359_vsram_proc1_ldo_reg: ldo_vsram_proc1 {
> +				regulator-name =3D "vsram_proc1";
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <1293750>;
> +				regulator-ramp-delay =3D <7500>;
> +				regulator-enable-ramp-delay =3D <240>;
> +				regulator-always-on;
> +			};
> +			mt6359_vsim2_ldo_reg: ldo_vsim2 {
> +				regulator-name =3D "vsim2";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <3100000>;
> +			};
> +			mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
> +				regulator-name =3D "vsram_others_sshub";
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <1293750>;
> +			};
> +		};
> +
> +		mt6359rtc: mt6359rtc {
> +			compatible =3D "mediatek,mt6358-rtc";
> +		};
> +	};
> +};
> -- =

> 2.25.1
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
