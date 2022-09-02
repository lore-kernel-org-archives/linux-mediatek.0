Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B385ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMxt2oT0D3MCbD0Lp6mcCwpaeEOxm0ZIUUd82Rv5VG0=; b=iRsKiySYyMel7bWWKZLZj0cB7D
	ZNcUEBkw3WzvpzZh4ZgAnhnLNBigNmBdGFySW8bHWlOAmvEIT59SIoJW39l7yzfjCJ2I0f0ytRA2N
	cKcUtOE/ykrTrplkYuaFl8twR5DSG3mYCR3RmQnnOsFkv5OFW/KM8CYbSTgPIKOQUgFzglgjXR1e/
	avjfXz3b9Kj0pXhrpjWm5RGFQ1tdKVaiUNnZHpnPjjWZisbJVwDY+YD6eM/oHmwEhQg5gmVlnNe3t
	Y2FbVbiUc++ucl7yXBAbaFASgSie268yskrhnP8d4/mGF8AflD8wbf2ALlqPOL8zVsrv9bQfhUQNt
	F3abYmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0oo-001AWz-VN; Fri, 02 Sep 2022 07:10:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0ol-001AUU-DU; Fri, 02 Sep 2022 07:10:21 +0000
X-UUID: 6595edd906dc4cb9953748f829855b90-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GMxt2oT0D3MCbD0Lp6mcCwpaeEOxm0ZIUUd82Rv5VG0=;
	b=TmeP9WsgGG0Tk0phqDb/xcB8YDQKXSe1Gm8bRtynzIcy+dAGAclXjX6rOKjA2hWGIFa5YnBcJNOIn2ZIjbhjHEXrXnq4/6cfLU0sTvH6dbPdCkVADVQAQ8Has/gR8zhVHpyg6D7HFxf1qNaod4FPTVX8BknQCPjs1BZNc08ccAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c7854011-ea20-43c1-8260-89dc1707dc99,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:8a39ec20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6595edd906dc4cb9953748f829855b90-20220902
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711253320; Fri, 02 Sep 2022 00:10:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 14:39:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 14:39:37 +0800
Message-ID: <67237f85d1c4bc72906848d811988209d0112c06.camel@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
From: Johnson Wang <johnson.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Edward-JW Yang
	<edward-jw.yang@mediatek.com>
Date: Fri, 2 Sep 2022 14:39:38 +0800
In-Reply-To: <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
	 <20220831124850.7748-3-johnson.wang@mediatek.com>
	 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_001019_493004_D3D07BE9 
X-CRM114-Status: GOOD (  24.17  )
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

On Wed, 2022-08-31 at 16:19 +0300, Krzysztof Kozlowski wrote:
> On 31/08/2022 15:48, Johnson Wang wrote:
> > Add the new binding documentation for MediaTek frequency hopping
> > and spread spectrum clocking control.
> > 
> > Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,fhctl.yaml | 49
> > +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
> > l
> > new file mode 100644
> > index 000000000000..c5d76410538b
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
> > l
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml*__;Iw!!CTRNKA9wMg0ARbw!ysl-bMp7yP9Ym70o6EVB8A36MBxcXGap8doEKR_SbaAQSy8-_RU5jvrWTjzETut_6eXNGut4j-3dY0q7xJdpQbmaOw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!ysl-bMp7yP9Ym70o6EVB8A36MBxcXGap8doEKR_SbaAQSy8-_RU5jvrWTjzETut_6eXNGut4j-3dY0q7xJezt7_RBw$
> >  
> > +
> > +title: MediaTek frequency hopping and spread spectrum clocking
> > control
> > +
> > +maintainers:
> > +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> > +
> > +description: |
> > +  Frequency hopping control (FHCTL) is a piece of hardware that
> > control
> > +  some PLLs to adopt "hopping" mechanism to adjust their
> > frequency.
> > +  Spread spectrum clocking (SSC) is another function provided by
> > this hardware.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,fhctl
> 
> You need SoC/device specific compatibles. Preferably only SoC
> specific,
> without generic fallback, unless you can guarantee (while
> representing
> MediaTek), that generic fallback will cover all of their SoCs?
> 

Hi Krzysztof,

At this moment, we plan to support FHCTL feature for MT8186 only.

If you prefer SoC-specific compatble, we will improve that in the next
version.

Thanks for your suggestion.

BRs,
Johnson Wang
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,hopping-ssc-percents:
> > +    description: |
> > +      Determine the enablement of frequency hopping feature and
> > the percentage
> > +      of spread spectrum clocking for PLLs.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    items:
> > +      items:
> > +        - description: PLL id that is expected to enable frequency
> > hopping.
> 
> So the clocks are indices from some specific, yet unnamed
> clock-controller? This feels hacky. You should rather take here clock
> phandles (1) or integrate it into specific clock controller (2). The
> reason is that either your device does something on top of existing
> clocks (option 1, thus it takes clock as inputs) or it modifies
> existing
> clocks (option 2, thus it is integral part of clock-controller).
> 
> 
> Best regards,
> Krzysztof


