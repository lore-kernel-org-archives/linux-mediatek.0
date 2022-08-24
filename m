Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1B7C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1Sal+zjZnkwoqGvQ6H8AHjXqyf22s9U5Nu3Rc+Vm0Q=; b=PUJDhzeGDBHTXXKR+iirPrYsyW
	T0++xnAXrY5BJIC0rX+jpu/WFZwvBivUb5AgiEyZ0YPGtoVHzUzf7kHTGcGoEQIo5MVta4tbw9kvn
	ZrGMvSee/FzkPYAm11598tRZDavGexmWE65Kg4biQRfZkMTjkn+vZ9uk8oVHy2qMVbYaovYPLjKLk
	a6PEvi+UBUymx2ndBKZyy0vU4FzZ9FVyUfjbRaU+vaRaP2hdq4opR8HezsWSPEPCBEq/7/qNfNd8n
	N1htDQq20WD2zzqKlSi9wTb7g5O+sYZsC7a7rB6J/YPa6ZwXrIxtaPk77kFxvxAP71qv4sxM8QLr6
	VdOiUgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqkn-00DNUO-7e; Wed, 24 Aug 2022 13:49:09 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqkZ-00DNNm-G9
	for linux-mediatek@lists.infradead.org; Wed, 24 Aug 2022 13:48:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id by6so16473679ljb.11
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=m1Sal+zjZnkwoqGvQ6H8AHjXqyf22s9U5Nu3Rc+Vm0Q=;
        b=rz/0RMC74FHYHj3NS10LPfVgVyQ9/TCifjML3uU7474anZc7xN0a8/ZVKRXpxE32g8
         AecxzU8h7lJ0/Iu+xHRbxAE+ncVKfsdp7vyimyT4ul4Of8DNa+gmKGHuIlM/aBbQkXFc
         Gd8IamyePt7Whc2bOz660bYhl5Ie5+sPG8rQ67SfA8k/TnZjK2sIu1YyzZ9Shet2+59p
         KY0ycP9vaURuhY3X6Af+Ao+Av0BN0Oeb/BYuAJ5YbobBECXTFDNteDyEhwYmh1BgXDjS
         DlZCs1G5mUCSy0QFKR18yDsHIB1d/32YmD0Bs5LBLApWe+rjacUi6GsoNICVlXaLGMGC
         ajqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=m1Sal+zjZnkwoqGvQ6H8AHjXqyf22s9U5Nu3Rc+Vm0Q=;
        b=gJUOf8qPfTSSFTUFMjRYJ3It/Yz9HHbELdX0nl0PlBO7eiq9oTa4biT3jb/ygM+yLS
         5AP1ygbi7SMJBGedG5pgWUn1SVfzafujh/K+KqAoFt+31f69gctTBhSGGzlhpwny56XD
         079vK5CySGJ/r0rVEIabcnlybR+JUjPdr8A0hIki7jAPdg7bEsEW1wosO4svDv+A9MeO
         eSACeUSqvoFSJ6/jHzxqQMgqF3g8KNRONk48TR/vwpOAumg1MCzWrxpEMizxlzv9CGgT
         q2y7zho1Doo5F/Lk0OruMrL2k+OPe5byTsK6ro/OiAtUkXiLTUSn6Sd3RIU50jF3g5kR
         I1Pg==
X-Gm-Message-State: ACgBeo0f+fcxjiGH6hdeir/ocPAhfgBdBss08ySGTRqU+Xyo6pwF84/C
	CNbCdPCBTr5tuLdNWdJ2Y7SyCA==
X-Google-Smtp-Source: AA6agR5ajdfKjHqC9MSRvD5WVvB29vhkN8j/6Wy4cmfzipDMPMFyEgCL9ozjFEdGvtJSe6rcyiqGAw==
X-Received: by 2002:a2e:b88b:0:b0:261:c9e7:fc59 with SMTP id r11-20020a2eb88b000000b00261c9e7fc59mr4821612ljp.120.1661348932352;
        Wed, 24 Aug 2022 06:48:52 -0700 (PDT)
Received: from [10.243.4.185] ([194.204.13.210])
        by smtp.gmail.com with ESMTPSA id d16-20020a0565123d1000b0048ae518364dsm2148435lfv.148.2022.08.24.06.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:48:51 -0700 (PDT)
Message-ID: <57d259cd-613b-a608-5b67-01aa72c2babb@linaro.org>
Date: Wed, 24 Aug 2022 16:48:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4] regulator: dt-bindings: mediatek: add mt6366
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_064855_551707_066D9F81 
X-CRM114-Status: GOOD (  20.11  )
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

On 23/08/2022 15:37, Zhiyong Tao wrote:
> Add mt6366 regulator document
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

https://lore.kernel.org/all/3a26be5c-04c5-cd67-1154-dfd7d99fb5d0@linaro.org/

Where is the driver?

This ended up in spam folder, so you might need to fix up your setup
just like other folks in Mediatek did.

> ---
> Changes in patch v4:
> 1)Add unevaluatedProperties in all places
> 2)Fix check warning and errors
> 3)remove "compatible="regulator-fixed"" properties for some ldo
> 
> Changes in patch v3:
> 1)change patch title
> 2)change "regulator.yaml#" to regulator.yaml#
> 3)remove regulator-name
> 4)fix 4 space for DTS example
> 
> Changes in patch v2:
> 1)fix patch title description.
> 2)fix patch maintainer description.
> 3)won't cc to srv_heupstream@mediatek.com
> 4)fix patch commit message description.
> 5)add properties node and compatible
> 6)put "unevaluatedProperties: false" after $ref
> 7)remove underscores in node names.
> 8)change Filename to "mediatek,mt6366-regulator.yaml"
> [Zhiyong Tao <zhiyong.tao@mediatek.com>]
> ---
> ---
>  .../regulator/mediatek,mt6366-regulator.yaml  | 279 ++++++++++++++++++
>  1 file changed, 279 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> new file mode 100644
> index 000000000000..8945bf20b574
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> @@ -0,0 +1,279 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6366 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> +
> +description: |
> +  List of regulators provided by this controller. It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6366 regulators node should be sub node of the MT6397 MFD node.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6366-regulator

This looks incomplete. How does it bind? Further pieces also suggest you
send something incomplete.

> +
> +  regulators:
> +    type: object
> +    description: List of regulators and its properties
> +
> +    patternProperties:
> +      "^buck-v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^buck-(vcore)-sshub$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-vcn(28|33)-bt$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-vcn(33)-wifi$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-vsram-(others)-sshub$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-vsram-(proc11|others|gpu|proc12)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-v(aud|bif|io|ldo)28$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-v(io|aux|rf)18$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-vsim[2]$":

I have now doubts whether you define generic regulators or quite
specific regulators you have on your board... Are the names used in the
device datasheet in register API description?


> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +        compatible = "mediatek,mt6366-regulator";
> +
> +        regulators {
> +            mt6366_vdram1_reg: buck-vdram1 {

Drop the labels here and further. Why you do not have here any regular
constraints like min/max voltage?

> +                regulator-ramp-delay = <12500>;
> +                regulator-enable-ramp-delay = <0>;
> +                regulator-allowed-modes = <0 1>;

Where do you explain the meaning of modes?

> +            };
> +
> +            mt6366_vcore_reg: buck-vcore {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <200>;
> +                regulator-allowed-modes = <0 1>;
> +            };
> +
> +           mt6366_vproc11_reg: buck-vproc11 {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <200>;
> +                regulator-allowed-modes = <0 1>;
> +            };
> +
> +            mt6366_vproc12_reg: buck-vproc12 {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <200>;
> +                regulator-allowed-modes = <0 1>;
> +            };
> +
> +            mt6366_vgpu_reg: buck-vgpu {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <200>;
> +                regulator-allowed-modes = <0 1>;
> +            };
> +
> +            mt6366_vs2_reg: buck-vs2 {
> +                regulator-ramp-delay = <12500>;
> +                regulator-enable-ramp-delay = <0>;
> +            };
> +
> +           mt6366_vmodem_reg: buck-vmodem {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <900>;
> +                regulator-allowed-modes = <0 1>;
> +            };
> +
> +            mt6366_vs1_reg: buck-vs1 {
> +                regulator-ramp-delay = <12500>;
> +                regulator-enable-ramp-delay = <0>;
> +            };
> +
> +            mt6366_vdram2_reg: ldo-vdram2 {
> +                regulator-enable-ramp-delay = <3300>;
> +            };
> +
> +            mt6366_vsim1_reg: ldo-vsim1 {
> +                regulator-enable-ramp-delay = <540>;
> +            };
> +
> +            mt6366_vibr_reg: ldo-vibr {
> +                regulator-enable-ramp-delay = <60>;
> +            };
> +
> +            mt6366_vrf12_reg: ldo-vrf12 {
> +                regulator-enable-ramp-delay = <120>;
> +            };
> +
> +            mt6366_vio18_reg: ldo-vio18 {
> +                regulator-enable-ramp-delay = <2700>;
> +            };
> +
> +            mt6366_vusb_reg: ldo-vusb {
> +                regulator-name = "vusb";
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vcamio_reg: ldo-vcamio {
> +                regulator-enable-ramp-delay = <325>;
> +            };
> +
> +            mt6366_vcamd_reg: ldo-vcamd {
> +                regulator-enable-ramp-delay = <325>;
> +            };
> +
> +            mt6366_vcn18_reg: ldo-vcn18 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vfe28_reg: ldo-vfe28 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vsram_proc11_reg: ldo-vsram-proc11 {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <240>;
> +            };
> +
> +            mt6366_vcn28_reg: ldo-vcn28 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vsram_others_reg: ldo-vsram-others {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <240>;
> +            };
> +
> +            mt6366_vsram_gpu_reg: ldo-vsram-gpu {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <240>;
> +            };
> +
> +            mt6366_vxo22_reg: ldo-vxo22 {
> +                regulator-enable-ramp-delay = <120>;
> +            };
> +
> +            mt6366_vefuse_reg: ldo-vefuse {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vaux18_reg: ldo-vaux18 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vmch_reg: ldo-vmch {
> +                regulator-enable-ramp-delay = <60>;
> +            };
> +
> +            mt6366_vbif28_reg: ldo-vbif28 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vsram_proc12_reg: ldo-vsram-proc12 {
> +                regulator-ramp-delay = <6250>;
> +                regulator-enable-ramp-delay = <240>;
> +            };
> +
> +            mt6366_vcama1_reg: ldo-vcama1 {
> +                regulator-enable-ramp-delay = <325>;
> +            };
> +
> +            mt6366_vemc_reg: ldo-vemc {
> +                regulator-enable-ramp-delay = <60>;
> +            };
> +
> +            mt6366_vio28_reg: ldo-vio28 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_va12_reg: ldo-va12 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vrf18_reg: ldo-vrf18 {
> +                regulator-enable-ramp-delay = <120>;
> +            };
> +
> +            mt6366_vcn33_bt_reg: ldo-vcn33-bt {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vcn33_wifi_reg: ldo-vcn33-wifi {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vcama2_reg: ldo-vcama2 {
> +                regulator-enable-ramp-delay = <325>;
> +            };
> +
> +            mt6366_vmc_reg: ldo-vmc {
> +                regulator-enable-ramp-delay = <60>;
> +            };
> +
> +            mt6366_vldo28_reg: ldo-vldo28 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vaud28_reg: ldo-vaud28 {
> +                regulator-enable-ramp-delay = <270>;
> +            };
> +
> +            mt6366_vsim2_reg: ldo-vsim2 {
> +                regulator-enable-ramp-delay = <540>;
> +            };
> +
> +            mt6366_vcore_sshub_reg: buck-vcore-sshub {

Empty node? What does it do?



Best regards,
Krzysztof

