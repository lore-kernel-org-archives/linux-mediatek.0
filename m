Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1404CC52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sf1S9oVkkutAs2zx8fudewRJ3coTfcL4YfvkKNpQpPA=; b=iSzhtvDp3Iqst+gmb5JESbvmXn
	s2R64LL8+ZMOPXQ78ts9/uRbT7GfUDtau9pXqNxJvhZCpb29kjqf3YXdrkOEmXaN9+UUcrDKc+vkf
	QkIftngbXkPKhgLzmvVOEyMWMP6c7f3JoSpV4WStQ64LkpNQbP1+p5FWoqZo1CmpJeSSsnbTwHrkE
	cZTOU9+8ikVJshC3rXFVwfIVGcDDlW/V8Hv7nFyg6P9zuvkOTrGWmLBZWuKSLzFs/FMFLO0KkGWe+
	E0FThQnFpcuPl0WcaWGHKF/s1cRHijx40cCNEMvir60ScAjggYY5hDdya4ylEJJDDm0lezuXVznG6
	sTYrcjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbdy0-00000004hvr-3J1Q;
	Wed, 07 Aug 2024 10:32:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbdxo-00000004hoi-2Ugk;
	Wed, 07 Aug 2024 10:32:27 +0000
X-UUID: 4d86c85254a811efa6c87f6b4542ff6b-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=sf1S9oVkkutAs2zx8fudewRJ3coTfcL4YfvkKNpQpPA=;
	b=hjIQp5q/IMlf5pV38H5mg9E5VGq+W7rD+QuXsUu4sMiZfZ9kUAf6aNIzuHdnOH7f+mYwH8H57Cn7JeD73M6y8DNBY59lUVncECIEfvAtBBVUKmas+fGftdUB4z/BisoViisiKEqUvrU2yIb81e25fmXbFOXWf53qohivt9OL6a8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5f17f623-3193-4427-b8eb-aae2230b9812,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b45cd73e-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4d86c85254a811efa6c87f6b4542ff6b-20240807
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1569552411; Wed, 07 Aug 2024 03:32:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 03:32:07 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 7 Aug 2024 18:32:06 +0800
Message-ID: <31f7251a-7759-1260-7cb7-e239c9baa0a7@mediatek.com>
Date: Wed, 7 Aug 2024 18:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	=?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>, Macpaul
 Lin <macpaul@gmail.com>, =?UTF-8?B?U2VuIENodSAo5YKo5qOuKQ==?=
	<Sen.Chu@mediatek.com>, =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>,
	=?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
	<Chris-qj.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
 <dcc40975-93f6-440e-8887-7a40a0cb3898@linaro.org>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <dcc40975-93f6-440e-8887-7a40a0cb3898@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_033216_743100_8DB75D1D 
X-CRM114-Status: GOOD (  17.92  )
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

On 8/6/24 21:41, Krzysztof Kozlowski wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On 06/08/2024 14:25, Macpaul Lin wrote:
>> Convert the MediaTek MT6397 regulator bindings to DT schema.
>> 
>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> 
> 
>> +
>> +patternProperties:
>> +  "^(buck_)?v(core|drm|gpu|io18|pca(7|15)|sramca(7|15))$":
>> +    description: Buck regulators
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    properties:
>> +      regulator-allowed-modes:
>> +        description: |
>> +          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
>> +          values specified in dt-bindings/regulator/mediatek,mt6397-regulator.h
>> +        items:
>> +          enum: [0, 1]
>> +      regulator-compatible:
>> +        pattern: "^(buck_)?v(core|drm|gpu|io18|pca(7|15)|sramca(7|15))$"
> 
> This should not be needed. Same in every other place.
> 
>> +    unevaluatedProperties: false
>> +
>> +  "^(ldo_)?v(tcxo|(a|io)28)$":
>> +    description: LDOs with fixed 2.8V output and 0~100/10mV tuning
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    properties:
>> +      regulator-allowed-modes: false
>> +      regulator-compatible:
>> +        pattern: "^(ldo_)?v(tcxo|(a|io)28)$"
>> +    unevaluatedProperties: false
>> +
>> +  "^(ldo_)?vusb$":
>> +    description: LDOs with fixed 3.0V output and 0~100/10mV tuning
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    properties:
>> +      regulator-allowed-modes: false
>> +      regulator-compatible:
>> +        pattern: "^(ldo_)?vusb$"
>> +    unevaluatedProperties: false
>> +
>> +  "^(ldo_)?v(cama|emc3v3|gp[123456]|ibr|mc|mch)$":
>> +    description: LDOs with variable output and 0~100/10mV tuning
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    properties:
>> +      regulator-allowed-modes: false
>> +      regulator-compatible:
>> +        pattern: "^(ldo_)?v(cama|emc3v3|gp[123456]|ibr|mc|mch)$"
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    pwrap {
>> +       pmic {
>> +            compatible = "mediatek,mt6397";
> 
> Messed indentation.
> 
> Use 4 spaces for example indentation.
> 
> Anyway, drop top node or better move the example to the parent device
> schema making it complete.
> 
>> +
>> +            mt6397regulator: mt6397regulator {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation  <https://urldefense.com/v3/__https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html*generic-names-recommendation__;Iw!!CTRNKA9wMg0ARbw!ngXiiQwr5k1xuQ409K5BEaN120H9jRtwvbdy_u_VFuelciqoBoAYCD6Pi09Sy5YS3wfeZ5m876QLGXgDi-Pm8V4O08-MZ7s$>
> 
> 
>> +                compatible = "mediatek,mt6397-regulator";
>> +
>> +                mt6397_vpca15_reg: buck_vpca15 {
>> +                    regulator-compatible = "buck_vpca15";
> 
> Drop, same in other places
> 
>> +                    regulator-name = "vpca15";
>> +                    regulator-min-microvolt = < 850000>;
>> +                    regulator-max-microvolt = <1350000>;
>> +                    regulator-ramp-delay = <12500>;
>> +                    regulator-enable-ramp-delay = <200>;
>> +                };
>> +
> 
> 
> ;
> 
> Best regards,
> Krzysztof
> 

Thanks for the review.
All above issues should be fixed in patch v2 [1]
[1] https://lkml.org/lkml/2024/8/7/520

Best regards,
Macpaul Lin

