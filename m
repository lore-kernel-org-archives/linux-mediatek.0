Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C5CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvNePpe25ku4UesWYqS3YQEbu9VfdgAEtqYDLNKXD4M=; b=pUzNiu+jT6ZslyFSdZ/6+0gt46
	4jAm9UplSt35yEc80uaXapD43WYAWRr4Q33XlDnzsulYh7B+bKW9rIe7f5f3dRWW/cWPxyYG3Ikxh
	EwuKSNiuEL8RqY3xACmFFXx2KRKT2Tc0Z8uqk1c1E91GfU01gpF6EsRaiQWF0GqZWFoibcxI1lGNb
	mpYU38YJzUr4QRadiLdks4ntO0wIserrsODdlBcTFBT9tmE4cvM0d1DwzPiTDmI+4R8pVXd1aeb8P
	C5DMp6xqneeUkjzuSQ/7M0f7A1bZsvDkYb9fwMEB4r1Vkq3M0bZzC+wXsYnXM9c5EWUtZWOCezz4L
	eeWJXUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooSRA-000yqP-RC; Fri, 28 Oct 2022 16:42:28 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooSQz-000ynQ-DH; Fri, 28 Oct 2022 16:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1666975323;
	bh=ssFI465ybeaWGZ24izMnuugaOjPgpCJi0sJ7Awro/8A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L7h7yaCH+ZX6KIzfN/QjlVrNiWft678n9rDJukWkPOGZs0hckUzBdN3RAG6kQHPOm
	 Uyt2100T/cEoAIPmKt3TNoif1vS73t+j/o1D5hLCRtzG9w76qu7RjgsOe+Dpbm+qYn
	 vKSlbxwOwOfkNK1VYRm1zr92Ej2Ggb4CY9YjXZwPhrsPf30qTijqvv2vjsEF4bsk0P
	 kEkUZ6eOVbcckYUCCssvdpkAD2ga9FrB02dVTm1zyKx3u6ZmFnO9NDppgtj3oHgssX
	 yI4RSVDCVOHs7gF2AM6r/y9g8TPNyEEEi0EieZmwLVaRuS+LmT/V6BvLzHFWZsgXwN
	 pMgvV6dNL3Qwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.151.20] ([217.61.151.20]) by web-mail.gmx.net
 (3c-app-gmx-bs17.server.lan [172.19.170.69]) (via HTTP); Fri, 28 Oct 2022
 18:42:03 +0200
MIME-Version: 1.0
Message-ID: <trinity-a848b9af-2c0e-41fb-9073-97a7d05011c8-1666975323664@3c-app-gmx-bs17>
From: Frank Wunderlich <frank-w@public-files.de>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Aw: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: add SoC
 based clock config
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Oct 2022 18:42:03 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <61c0b62af62ddd0e98378159db2b7d94022c9bf5.camel@mediatek.com>
References: <20221025072837.16591-1-linux@fw-web.de>
 <20221025072837.16591-2-linux@fw-web.de>
 <61c0b62af62ddd0e98378159db2b7d94022c9bf5.camel@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:s7AmXG5Xr8qwlj5dxfm5hJbBhoA3/AEO3/SxR4wXpwOjNCAQHbsZmtVEjuv4MTB5JRd0b
 tHCV4fN8FwCO+TReRsMZYqOUTfNahi8Gqkd62rjJ4yeWl5fnqPCg8yV+X3IxqgRpiVIY9z2S1u+8
 v3bLyvhenwEuabCTRS3imH3c9VlOc2GP3smvs110Ak1r2ca+/Pm5nXVRSkOogE4sexIkiu+Iw0Kn
 xtOeugYhuCYeKu1ADsJWC2xeyHfAmdH4lWwTKX8Zu0nOE5cag2nkfqqFukZoa+IFjQTa1hrVS727
 Lw=
UI-OutboundReport: notjunk:1;M01:P0:FSSZZCPNFhs=;atXnM023B9CPS6D/dovlpObQPjn
 S5W0jCWtyn2g7hKo9n2ulhpfd3LdPphNES2mhXsdDti9xwz/kjiIHMqlY3FPccDTLlLCJF/Kb
 81tcuHi29/qFnJ0x97hKi8lYejF/q9Wze8ELBKq1BAp0tRjjeu1yiDTH8wVtqbuWNVfgOb21X
 ROKKo/q9T4M/lCJSXEltLiFYm28YCv9UX7QIh4VKn03q/+Vq/D8GYQqjVtgjokr4qMo49wwGw
 tsycnNcYClyM1wr9xaG7Whf9VOY3IDM4F6W4rJeAbLIR1T5iZTg53zDTZKp37klIwra0VaFaB
 H6aQRW490aqoGR63/+qiKxLNCw4hP+HSCvdO4/63Vi/M84m2UeFnznlDQTO+lZidWyPIAEjc0
 qHY6Cdvt5DmQyDQQqYSn4VB70S5DsIAtuttVUmNaH5vxDDxTVl6auZ8DzPqiRkiGcJFAZDA+x
 wgpQThlmFdg7nuMydrLhMdcvyGDala7rnFlbJjHeiGvm1LdFHMZX+V3N1+6mI+q+azXKFJEXp
 43qBxF4N9bCrOPstFmDZPAZT85E2F+hQbfx3c7o7h4NLS9/rM1cyZ4KB/pgSIw7Rkws086k6k
 Sh7WXL1DCuctnxxrGiQ+4o/+SpL+m1bPKxPfz7M66fr/xoDxWyuOnAVmSkkKeLxwo4fdM56X+
 H2lK/8OWEXKvUp5G3a3ecSUJ8ZFolfGcWGKB1YZJJJQAXaOBgHbJRlNSlmSADZ6Ab6iixJG5k
 2XcfgC7Ye1o/U1O3wzIJILRuyF0nvCP2biOWxPWQYONEGEf/uCyrLYWDC+e3CmOAUGxS9zTHm
 L5Mb6QqpSADy5V9JjQR6QehA==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_094217_751718_AE51CC75 
X-CRM114-Status: GOOD (  12.71  )
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

Hi
> Gesendet: Freitag, 28. Oktober 2022 um 11:24 Uhr
> Von: "Jianjun Wang" <jianjun.wang@mediatek.com>
> An: "Frank Wunderlich" <linux@fw-web.de>, linux-mediatek@lists.infradead=
.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Ryder Lee" <ryder.lee=
@mediatek.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Rob Herring" <robh=
+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>=
, "Matthias Brugger" <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, =
devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel=
@lists.infradead.org, "Rob Herring" <robh@kernel.org>
> Betreff: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: add SoC bas=
ed clock config
>
> Hi Frank,
>
> After apply this patch, we found some dtbs_check error with the
> following patch which adds the PCIe node for MT8195:
>
> https://lore.kernel.org/linux-pci/20221020111925.30002-3-tinghan.shen@me=
diatek.com/
>
> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pcie@112f0000
> : clock-names:        5: 'top_133m' was expected
>     From schema: Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml
> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pcie@112f8000
> : clock-names:        5: 'top_133m' was expected
>     From schema: Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml
>
> Did you get the same error when adding the PCIe node for MT7986?

i'm sure i had tested the yaml and did not get any error, but on my retest=
 i get same error for mt7986 too...

maybe the right way is to remove the contains in the mediatek,mt8192-pcie =
if condition (to match only if this condition is no fallback),
then it is clean for me. Can you test it with your patches?

allOf:
  - $ref: /schemas/pci/pci-bus.yaml#
  - if:
      properties:
        compatible:
          #contains:
          const: mediatek,mt8192-pcie
    then:
      properties:
        clock-names:
          items:
            - const: pl_250m
            - const: tl_26m
            - const: tl_96m
            - const: tl_32k
            - const: peri_26m
            - const: top_133m


regards Frank

regards Frank

