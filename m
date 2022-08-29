Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A114C0502A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 03:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3qhVqwNLk6fHw/JLoulaoGZiv9lKRPO0WvZZvSzGW0=; b=K1CFZe1neUlLosRLK+JyAkDbE6
	xbvnK2d5z11EEQHCKybebyKeZ6gbCR1mFyEfxJ+ANLwTe84fAyuOmNZir0VIoEalZfxOHZTXTYCKL
	bzREm/XGJljlySMTb03KRDI649q+XQqFM56qyVO7qtW2e8VZL5Vw0INX712Qg+Oal8rrATvficlMv
	tpwGdkJ4ciPnP+oxbLDC+VY5U7gXcPaDWgj1q79j+AKGf0r8xxV6oR1gqHS/48EhxqteCzn0HuEWu
	7T5uL4YFlQn2JXEdxnaxcsBcRhvOVpbm4wG5bIBbSyYrC101ejleBO4guhL8ZpodSRb6KC+TLETpA
	BOZbDlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSVPc-0046nm-Oh; Mon, 29 Aug 2022 03:26:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSVPZ-0046jt-7A; Mon, 29 Aug 2022 03:26:07 +0000
X-UUID: 38104ad41c0f413096d63fa2737d35f3-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=q3qhVqwNLk6fHw/JLoulaoGZiv9lKRPO0WvZZvSzGW0=;
	b=JhnR7QtBUCaE5j6WwqC7l7Ms2GzYFM0aqi/IVvvtY3k8OYLKPAt3Ct3cjuXm1ck8ZPYk2GJSwt7rfHu2ncr6CoTlkEPaowq252g8Y1SQNMJs33TVP1s9gDCm6UhsgU4T9w7J0CXti98yppL5/Mc5Y77R8igFcPLixbj4/Q6oLdE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d20bf69a-fd41-4005-9c02-5e369f809d2b,OB:0,L
	OB:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:25
X-CID-META: VersionHash:84eae18,CLOUDID:df2c5f20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 38104ad41c0f413096d63fa2737d35f3-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2021387941; Sun, 28 Aug 2022 20:25:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 11:25:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 29 Aug 2022 11:25:22 +0800
Message-ID: <93bb8a3f7f5567cfe427ed067f68d5c8b6db776d.camel@mediatek.com>
Subject: Re: [PATCH v4] regulator: dt-bindings: mediatek: add mt6366
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
	<sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 29 Aug 2022 11:25:22 +0800
In-Reply-To: <57d259cd-613b-a608-5b67-01aa72c2babb@linaro.org>
References: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
	 <57d259cd-613b-a608-5b67-01aa72c2babb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_202605_387768_2D746C0F 
X-CRM114-Status: GOOD (  29.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2022-08-24 at 16:48 +0300, Krzysztof Kozlowski wrote:
> On 23/08/2022 15:37, Zhiyong Tao wrote:
> > Add mt6366 regulator document
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> 
> 
https://lore.kernel.org/all/3a26be5c-04c5-cd67-1154-dfd7d99fb5d0@linaro.org/
> 
> Where is the driver?
Hi krzysztof,
==>
The driver is included, You can see the file:

https://elixir.bootlin.com/linux/v6.0-rc2/source/drivers/regulator/mt6358-regulator.c

> 
> This ended up in spam folder, so you might need to fix up your setup
> just like other folks in Mediatek did.
> 
==> we will try to fix it.

> > ---
> > Changes in patch v4:
> > 1)Add unevaluatedProperties in all places
> > 2)Fix check warning and errors
> > 3)remove "compatible="regulator-fixed"" properties for some ldo
> > 
> > Changes in patch v3:
> > 1)change patch title
> > 2)change "regulator.yaml#" to regulator.yaml#
> > 3)remove regulator-name
> > 4)fix 4 space for DTS example
> > 
> > Changes in patch v2:
> > 1)fix patch title description.
> > 2)fix patch maintainer description.
> > 3)won't cc to srv_heupstream@mediatek.com
> > 4)fix patch commit message description.
> > 5)add properties node and compatible
> > 6)put "unevaluatedProperties: false" after $ref
> > 7)remove underscores in node names.
> > 8)change Filename to "mediatek,mt6366-regulator.yaml"
> > [Zhiyong Tao <zhiyong.tao@mediatek.com>]
> > ---
> > ---
> >  .../regulator/mediatek,mt6366-regulator.yaml  | 279
> > ++++++++++++++++++
> >  1 file changed, 279 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > new file mode 100644
> > index 000000000000..8945bf20b574
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> > @@ -0,0 +1,279 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml*__;Iw!!CTRNKA9wMg0ARbw!zfqocy5mKWyTKAejVLu3IZvaIy0NqTGM5T_myKrjADh1JovpafcfAhyTtLOTDhh6fpI$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zfqocy5mKWyTKAejVLu3IZvaIy0NqTGM5T_myKrjADh1JovpafcfAhyTtLOT82kIons$
> >  
> > +
> > +title: MT6366 Regulator from MediaTek Integrated
> > +
> > +maintainers:
> > +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> > +
> > +description: |
> > +  List of regulators provided by this controller. It is named
> > +  according to its regulator type, buck_<name> and ldo_<name>.
> > +  MT6366 regulators node should be sub node of the MT6397 MFD
> > node.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6366-regulator
> 
> This looks incomplete. How does it bind? Further pieces also suggest
> you
> send something incomplete.
==>

The project dts file(such as 8186-evb.dts) will add the compatible.
The project dts file is examining.


> 
> > +
> > +  regulators:
> > +    type: object
> > +    description: List of regulators and its properties
> > +
> > +    patternProperties:
> > +      "^buck-
> > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^buck-(vcore)-sshub$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-vcn(28|33)-bt$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-vcn(33)-wifi$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-vsram-(others)-sshub$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-vsram-(proc11|others|gpu|proc12)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-v(aud|bif|io|ldo)28$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-v(io|aux|rf)18$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-vsim[2]$":
> 
> I have now doubts whether you define generic regulators or quite
> specific regulators you have on your board... Are the names used in
> the
> device datasheet in register API description?
==>yes, the names is used in the device datasheet in register API
description. We will add the regulator-name on project dts.
> 
> 
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - regulators
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pmic {
> > +        compatible = "mediatek,mt6366-regulator";
> > +
> > +        regulators {
> > +            mt6366_vdram1_reg: buck-vdram1 {
> 
> Drop the labels here and further. Why you do not have here any
> regular
> constraints like min/max voltage?

we will add properties min/max voltag on project dts file.

> 
> > +                regulator-ramp-delay = <12500>;
> > +                regulator-enable-ramp-delay = <0>;
> > +                regulator-allowed-modes = <0 1>;
> 
> Where do you explain the meaning of modes?
support pwm mode.
> 
> > +            };
> > +
> > +            mt6366_vcore_reg: buck-vcore {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <200>;
> > +                regulator-allowed-modes = <0 1>;
> > +            };
> > +
> > +           mt6366_vproc11_reg: buck-vproc11 {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <200>;
> > +                regulator-allowed-modes = <0 1>;
> > +            };
> > +
> > +            mt6366_vproc12_reg: buck-vproc12 {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <200>;
> > +                regulator-allowed-modes = <0 1>;
> > +            };
> > +
> > +            mt6366_vgpu_reg: buck-vgpu {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <200>;
> > +                regulator-allowed-modes = <0 1>;
> > +            };
> > +
> > +            mt6366_vs2_reg: buck-vs2 {
> > +                regulator-ramp-delay = <12500>;
> > +                regulator-enable-ramp-delay = <0>;
> > +            };
> > +
> > +           mt6366_vmodem_reg: buck-vmodem {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <900>;
> > +                regulator-allowed-modes = <0 1>;
> > +            };
> > +
> > +            mt6366_vs1_reg: buck-vs1 {
> > +                regulator-ramp-delay = <12500>;
> > +                regulator-enable-ramp-delay = <0>;
> > +            };
> > +
> > +            mt6366_vdram2_reg: ldo-vdram2 {
> > +                regulator-enable-ramp-delay = <3300>;
> > +            };
> > +
> > +            mt6366_vsim1_reg: ldo-vsim1 {
> > +                regulator-enable-ramp-delay = <540>;
> > +            };
> > +
> > +            mt6366_vibr_reg: ldo-vibr {
> > +                regulator-enable-ramp-delay = <60>;
> > +            };
> > +
> > +            mt6366_vrf12_reg: ldo-vrf12 {
> > +                regulator-enable-ramp-delay = <120>;
> > +            };
> > +
> > +            mt6366_vio18_reg: ldo-vio18 {
> > +                regulator-enable-ramp-delay = <2700>;
> > +            };
> > +
> > +            mt6366_vusb_reg: ldo-vusb {
> > +                regulator-name = "vusb";
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vcamio_reg: ldo-vcamio {
> > +                regulator-enable-ramp-delay = <325>;
> > +            };
> > +
> > +            mt6366_vcamd_reg: ldo-vcamd {
> > +                regulator-enable-ramp-delay = <325>;
> > +            };
> > +
> > +            mt6366_vcn18_reg: ldo-vcn18 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vfe28_reg: ldo-vfe28 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vsram_proc11_reg: ldo-vsram-proc11 {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <240>;
> > +            };
> > +
> > +            mt6366_vcn28_reg: ldo-vcn28 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vsram_others_reg: ldo-vsram-others {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <240>;
> > +            };
> > +
> > +            mt6366_vsram_gpu_reg: ldo-vsram-gpu {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <240>;
> > +            };
> > +
> > +            mt6366_vxo22_reg: ldo-vxo22 {
> > +                regulator-enable-ramp-delay = <120>;
> > +            };
> > +
> > +            mt6366_vefuse_reg: ldo-vefuse {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vaux18_reg: ldo-vaux18 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vmch_reg: ldo-vmch {
> > +                regulator-enable-ramp-delay = <60>;
> > +            };
> > +
> > +            mt6366_vbif28_reg: ldo-vbif28 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vsram_proc12_reg: ldo-vsram-proc12 {
> > +                regulator-ramp-delay = <6250>;
> > +                regulator-enable-ramp-delay = <240>;
> > +            };
> > +
> > +            mt6366_vcama1_reg: ldo-vcama1 {
> > +                regulator-enable-ramp-delay = <325>;
> > +            };
> > +
> > +            mt6366_vemc_reg: ldo-vemc {
> > +                regulator-enable-ramp-delay = <60>;
> > +            };
> > +
> > +            mt6366_vio28_reg: ldo-vio28 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_va12_reg: ldo-va12 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vrf18_reg: ldo-vrf18 {
> > +                regulator-enable-ramp-delay = <120>;
> > +            };
> > +
> > +            mt6366_vcn33_bt_reg: ldo-vcn33-bt {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vcn33_wifi_reg: ldo-vcn33-wifi {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vcama2_reg: ldo-vcama2 {
> > +                regulator-enable-ramp-delay = <325>;
> > +            };
> > +
> > +            mt6366_vmc_reg: ldo-vmc {
> > +                regulator-enable-ramp-delay = <60>;
> > +            };
> > +
> > +            mt6366_vldo28_reg: ldo-vldo28 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vaud28_reg: ldo-vaud28 {
> > +                regulator-enable-ramp-delay = <270>;
> > +            };
> > +
> > +            mt6366_vsim2_reg: ldo-vsim2 {
> > +                regulator-enable-ramp-delay = <540>;
> > +            };
> > +
> > +            mt6366_vcore_sshub_reg: buck-vcore-sshub {
> 
> Empty node? What does it do?
just define here, we will add properties on project dts file.

Thanks
> 
> 
> 
> Best regards,
> Krzysztof


