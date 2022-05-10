Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41249C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1L6496FMqLsyYGThrjPfFYtBj/MO1v/Rf2+RrZoihrU=; b=SWVeHkF38/Kh+U
	z7J4IpdLcfdyngNwwLBuHSelLjfBEyR06iUEzDtIClfrHPO0z9CWqr0NB+Fn6UMaMZzXGRU0giYSV
	6io21D8e9lJLjXVG79zM4k1rmE0cAVIP40pxMF4RLjosVachTyQj+fzp2Y9en5REViRvu+e4jPwAI
	h/UpEJFS0iqEVF2Jy2xiGAn6lXXbEFfoWdDqxsTDDhvlkbO6vzIa37ie995IZ3wkG2L2yh5LWPD7n
	jhZcgL/UYaao+qB23fN9TzYcBijBHV+aln3vy2L42KrdRiD65VQS8SfPEvwL/csnXh8Ar+I1CfQO7
	14+Ox/csl0jL8LrdkIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKqC-000VTO-VB; Tue, 10 May 2022 08:03:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKpa-000V9f-6o; Tue, 10 May 2022 08:02:58 +0000
X-UUID: c0e9e136ccef440f9471258ff5f122f2-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:efc6cdfc-b184-4c7f-9da8-af6f12cbd152, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:91d7df16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c0e9e136ccef440f9471258ff5f122f2-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 393436353; Tue, 10 May 2022 01:02:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 00:56:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 15:56:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 10 May 2022 15:56:39 +0800
Message-ID: <6614cd3783666caa529106464e7684caf16d6582.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
 <sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 10 May 2022 15:56:38 +0800
In-Reply-To: <20220510064603.15920-2-zhiyong.tao@mediatek.com>
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_010254_320039_AA5ECFC5 
X-CRM114-Status: GOOD (  17.94  )
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

On Tue, 2022-05-10 at 14:46 +0800, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 

I think "From: ..." can be removed?

> The commit adds mt6366 binding document.
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/regulator/mt6366-regulator.yaml  | 405
> ++++++++++++++++++
>  1 file changed, 405 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/regulator/mt6366-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6366-
> regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6366-
> regulator.yaml
> new file mode 100644
> index 000000000000..1f125f5ba860
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6366-
> regulator.yaml
> @@ -0,0 +1,405 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mt6366-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6366 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +

Hsing-Hsing is not responsible for regulator, so I think you can add
you as the maintainers.

> +description: |
> +  List of regulators provided by this controller. It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6366 regulators node should be sub node of the MT6397 MFD node.
> +
> +patternProperties:
> +  "^buck_v(dram1|core|pa|proc11|proc12|gpu|s2|modem|s1)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(dram1|core|pa|proc11|proc12|gpu|s2|modem|s1)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_v(fe|bif|io)28$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(fe|bif|io)28$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_v(aud|io|aux|rf|m)18$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^v(aud|io|aux|rf|m)18$"
> +
> +    unevaluatedProperties: false
> +
> +  "^ldo_vsim[12]$":
> +    type: object
> +    $ref: "regulator.yaml#"
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^vsim[12]$"
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      regulators {
> +        mt6366_vdram1_reg: buck_vdram1 {
> +            regulator-name = "vdram1";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <2087500>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-enable-ramp-delay = <0>;
> +            regulator-always-on;
> +            regulator-allowed-modes = <0 1>;

should be two space instead of 4 space?
mt6366_vdram1_reg: buck_vdram1 {
  regulator-name = "vdram1";
  ...
};

There is the same issue for this example.

> +        };
> +        mt6366_vcore_reg: buck_vcore {
> +            regulator-name = "vcore";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <200>;
> +            regulator-always-on;
> +            regulator-allowed-modes = <0 1>;
> +        };
> +       mt6366_vproc11_reg: buck_vproc11 {

one more space before mt6366_vproc11_reg?

> +            regulator-name = "vproc11";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <200>;
> +            regulator-always-on;
> +            regulator-allowed-modes = <0 1>;
> +        };
> +        mt6366_vproc12_reg: buck_vproc12 {
> +            regulator-name = "vproc12";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <200>;
> +            regulator-always-on;
> +            regulator-allowed-modes = <0 1>;
> +        };
> +        mt6366_vgpu_reg: buck_vgpu {
> +            regulator-name = "vgpu";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <200>;
> +            regulator-allowed-modes = <0 1>;
> +        };
> +        mt6366_vs2_reg: buck_vs2 {
> +            regulator-name = "vs2";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <2087500>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-enable-ramp-delay = <0>;
> +            regulator-always-on;
> +        };
> +       mt6366_vmodem_reg: buck_vmodem {

ditto.

> +            regulator-name = "vmodem";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <900>;
> +            regulator-always-on;
> +            regulator-allowed-modes = <0 1>;
> +        };
> +        mt6366_vs1_reg: buck_vs1 {
> +            regulator-name = "vs1";
> +            regulator-min-microvolt = <1000000>;
> +            regulator-max-microvolt = <2587500>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-enable-ramp-delay = <0>;
> +            regulator-always-on;
> +        };
> +        mt6366_vdram2_reg: ldo_vdram2 {
> +            regulator-name = "vdram2";
> +            regulator-min-microvolt = <600000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <3300>;
> +            regulator-always-on;
> +        };
> +        mt6366_vsim1_reg: ldo_vsim1 {
> +            regulator-name = "vsim1";
> +            regulator-min-microvolt = <1700000>;
> +            regulator-max-microvolt = <3100000>;
> +            regulator-enable-ramp-delay = <540>;
> +        };
> +        mt6366_vibr_reg: ldo_vibr {
> +            regulator-name = "vibr";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <60>;
> +        };
> +        mt6366_vrf12_reg: ldo_vrf12 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vrf12";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <1200000>;
> +            regulator-enable-ramp-delay = <120>;
> +        };
> +        mt6366_vio18_reg: ldo_vio18 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vio18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <2700>;
> +            regulator-always-on;
> +        };
> +        mt6366_vusb_reg: ldo_vusb {
> +            regulator-name = "vusb";
> +            regulator-min-microvolt = <3000000>;
> +            regulator-max-microvolt = <3100000>;
> +            regulator-enable-ramp-delay = <270>;
> +            regulator-always-on;
> +        };
> +        mt6366_vcamio_reg: ldo_vcamio {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vcamio";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <325>;
> +        };
> +        mt6366_vcamd_reg: ldo_vcamd {
> +            regulator-name = "vcamd";
> +            regulator-min-microvolt = <900000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <325>;
> +        };
> +        mt6366_vcn18_reg: ldo_vcn18 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vcn18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vfe28_reg: ldo_vfe28 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vfe28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vsram_proc11_reg: ldo_vsram_proc11 {
> +            regulator-name = "vsram_proc11";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <240>;
> +            regulator-always-on;
> +        };
> +        mt6366_vcn28_reg: ldo_vcn28 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vcn28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vsram_others_reg: ldo_vsram_others {
> +            regulator-name = "vsram_others";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <240>;
> +            regulator-always-on;
> +        };
> +        mt6366_vsram_gpu_reg: ldo_vsram_gpu {
> +            regulator-name = "vsram_gpu";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <240>;
> +        };
> +        mt6366_vxo22_reg: ldo_vxo22 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vxo22";
> +            regulator-min-microvolt = <2200000>;
> +            regulator-max-microvolt = <2200000>;
> +            regulator-enable-ramp-delay = <120>;
> +            regulator-always-on;
> +        };
> +        mt6366_vefuse_reg: ldo_vefuse {
> +            regulator-name = "vefuse";
> +            regulator-min-microvolt = <1700000>;
> +            regulator-max-microvolt = <1900000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vaux18_reg: ldo_vaux18 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vaux18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vmch_reg: ldo_vmch {
> +            regulator-name = "vmch";
> +            regulator-min-microvolt = <2900000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <60>;
> +        };
> +        mt6366_vbif28_reg: ldo_vbif28 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vbif28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vsram_proc12_reg: ldo_vsram_proc12 {
> +            regulator-name = "vsram_proc12";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <240>;
> +            regulator-always-on;
> +        };
> +        mt6366_vcama1_reg: ldo_vcama1 {
> +            regulator-name = "vcama1";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3000000>;
> +            regulator-enable-ramp-delay = <325>;
> +        };
> +        mt6366_vemc_reg: ldo_vemc {
> +            regulator-name = "vemc";
> +            regulator-min-microvolt = <2900000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <60>;
> +        };
> +        mt6366_vio28_reg: ldo_vio28 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vio28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_va12_reg: ldo_va12 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "va12";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <1200000>;
> +            regulator-enable-ramp-delay = <270>;
> +            regulator-always-on;
> +        };
> +        mt6366_vrf18_reg: ldo_vrf18 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vrf18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <120>;
> +        };
> +        mt6366_vcn33_bt_reg: ldo_vcn33_bt {
> +            regulator-name = "vcn33_bt";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3500000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vcn33_wifi_reg: ldo_vcn33_wifi {
> +            regulator-name = "vcn33_wifi";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3500000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vcama2_reg: ldo_vcama2 {
> +            regulator-name = "vcama2";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3000000>;
> +            regulator-enable-ramp-delay = <325>;
> +        };
> +        mt6366_vmc_reg: ldo_vmc {
> +            regulator-name = "vmc";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <60>;
> +        };
> +        mt6366_vldo28_reg: ldo_vldo28 {
> +            regulator-name = "vldo28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <3000000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vaud28_reg: ldo_vaud28 {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vaud28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <270>;
> +        };
> +        mt6366_vsim2_reg: ldo_vsim2 {
> +            regulator-name = "vsim2";
> +            regulator-min-microvolt = <1700000>;
> +            regulator-max-microvolt = <3100000>;
> +            regulator-enable-ramp-delay = <540>;
> +        };
> +        mt6366_vcore_sshub_reg: buck_vcore_sshub {
> +            regulator-name = "vcore_sshub";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +        };
> +        mt6366_vsram_others_sshub_reg: ldo_vsram_others_sshub {
> +            regulator-name = "vsram_others_sshub";
> +            regulator-min-microvolt = <500000>;
> +            regulator-max-microvolt = <1293750>;
> +        };
> +      };
> +    };
> +...


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
