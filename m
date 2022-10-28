Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C4FC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ0ls0S2a/efmbZzUvXCvMEN9e16JQ1qjyHBOdmh020=; b=QK5eIUcqi2eIuy
	1d2FMrQEUFzXUFqciTCnVLV1Xi+OqKaEM5H5o+l8yI3l+xAKBI0Ju3el//vqJKulZQsEoYYJKggQK
	3zsIidERejSklm4IjlvMeA0xRvxkN98RqeVpDAsZ6lS4cGXDLr5KKHQdGTZRSfXf382OkRJDaZGmj
	+RlgkQoOuJn+fTasN/Os/Uu6Iy9ogGVabnfPbMKDNqdTbi4WPBOe7Ycn/f8sbMXiXU4vhN+r9tirS
	q+di2wPN7Y/1pDilgKsLqyV5QmGChvy9ZKa8jNF2oxbmC0BWEnEmxBSz45xTbvt+xdPrK3LX71G2y
	X4G1ssO1/WjXvmmN5y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMe4-00GfeP-WF; Fri, 28 Oct 2022 10:31:25 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMdt-00Gfb3-64; Fri, 28 Oct 2022 10:31:14 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 8C9711009AC;
	Fri, 28 Oct 2022 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666953067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZ0ls0S2a/efmbZzUvXCvMEN9e16JQ1qjyHBOdmh020=;
	b=q/RpwxhgGQQKA4BlPp0SXwD0QqTgV22m63u0T6sflNbxvZ2Bl3rC7pIfeYtzoL+d/4Plka
	nBg6YbaIChu3PVgt3ComMofjBxmlFS7aqsmm4CuOe4xJ6V3NH1sROoElX+hnt7Y2gGo4df
	5eOGIGoevtqDdSR2d1qRfR8CY7ETwkQ=
Received: from [127.0.0.1] (fttx-pool-217.61.151.20.bambit.de [217.61.151.20])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id BBF444071F;
	Fri, 28 Oct 2022 10:31:06 +0000 (UTC)
Date: Fri, 28 Oct 2022 12:31:00 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Jianjun Wang <jianjun.wang@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_dt-bindings=3A_PCI=3A_me?= =?US-ASCII?Q?diatek-gen3=3A_add_SoC_based_clock_config?=
User-Agent: K-9 Mail for Android
In-Reply-To: <61c0b62af62ddd0e98378159db2b7d94022c9bf5.camel@mediatek.com>
References: <20221025072837.16591-1-linux@fw-web.de> <20221025072837.16591-2-linux@fw-web.de> <61c0b62af62ddd0e98378159db2b7d94022c9bf5.camel@mediatek.com>
Message-ID: <29E908AC-3313-4A12-BD98-362803D51C12@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: f37f2ece-abf2-4114-81ef-4a8ba4b5b03d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_033113_407423_8B982A19 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 28=2E Oktober 2022 11:24:36 MESZ schrieb Jianjun Wang <jianjun=2Ewang@me=
diatek=2Ecom>:
>Hi Frank,
>
>After apply this patch, we found some dtbs_check error with the
>following patch which adds the PCIe node for MT8195:
>
>https://lore=2Ekernel=2Eorg/linux-pci/20221020111925=2E30002-3-tinghan=2E=
shen@mediatek=2Ecom/
>
>arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2=2Edtb: pcie@112f0000
>: clock-names:        5: 'top_133m' was expected
>    From schema: Documentation/devicetree/bindings/pci/mediatek-pcie-
>gen3=2Eyaml
>arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2=2Edtb: pcie@112f8000
>: clock-names:        5: 'top_133m' was expected
>    From schema: Documentation/devicetree/bindings/pci/mediatek-pcie-
>gen3=2Eyaml
>
>Did you get the same error when adding the PCIe node for MT7986?
>
>Thanks=2E=20
>
>On Tue, 2022-10-25 at 09:28 +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20

As far as i see the problem is the fallback-node which requires different =
clockconfig than the main compatible=2E

6th clock was defined as this enum
  - top_133m        # for MT8192
  - peri_mem        # for MT8188/MT8195

By using lower compatible as main compatible and first one as fallback you=
 cannot success all parts of allOf=2E

>>    clock-names:
>> -    items:
>> -      - const: pl_250m
>> -      - const: tl_26m
>> -      - const: tl_96m
>> -      - const: tl_32k
>> -      - const: peri_26m
>> -      - enum:
>> -          - top_133m        # for MT8192
>> -          - peri_mem        # for MT8188/MT8195

From=20my PoV the dts is wrong as the 2 SoC are not compatible to each other=
=2E=2E=2Emt8192 needs top_133m as 6th clock whereas mt8195 needs peri_mem=
=2E Of course we can change it back to enum in both branches,but imho fallb=
ack does not match to main compatible in the dts=2E

>> +allOf:
>> +  - $ref: /schemas/pci/pci-bus=2Eyaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8192-pcie
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: pl_250m
>> +            - const: tl_26m
>> +            - const: tl_96m
>> +            - const: tl_32k
>> +            - const: peri_26m
>> +            - const: top_133m
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt8188-pcie
>> +              - mediatek,mt8195-pcie
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: pl_250m
>> +            - const: tl_26m
>> +            - const: tl_96m
>> +            - const: tl_32k
>> +            - const: peri_26m
>> +            - const: peri_mem
>> +
>>  unevaluatedProperties: false
>> =20
>>  examples:
>


regards Frank

