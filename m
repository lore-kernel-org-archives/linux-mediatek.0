Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EA9C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 02:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYdEvNcIoNtrzK+qZCUsxemvvUjcF/0Vx9OtE4IjY94=; b=HNHh/bMPOnVJkUCzdFzrBPxsiG
	NQDQ4AwXylnSKq633px7UXDjbbSltco4pT3oASAMYJRPr0tp0vGZAu46KjTiK/iWTK2N4YpmigO6f
	Oi0kn9s/o4Z8fqg0knLyBALsTLMO5Ac9quAYE0lOTKT20ml9sABftKOLEyYrsNBXSp2S/19tQnUag
	lMTNnhbEmvEl/Yb03ak7cQRbL1QWa/37Pg0ExeLl45I+kHJoM1Vdf4uXBnp5z/uWh4kryfitgMnmy
	9Bz3KHNzpMbEvnNp2lWSx7hFm33fdV29lH/5hlu+AwmyxiWRHFeH+7I1ZM5UzHbVJBMx8JvSP2YjF
	8qr/YhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQHX-00Djyp-1P; Thu, 04 Aug 2022 02:08:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQHM-00DjnN-3s; Thu, 04 Aug 2022 02:08:05 +0000
X-UUID: df3b17f5fb794cbda5395d5f3fb8dbdd-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1a03ca92-c125-4e53-afff-d2f9c98fab2e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:eeeb2bd1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: df3b17f5fb794cbda5395d5f3fb8dbdd-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340799206; Wed, 03 Aug 2022 19:06:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 4 Aug 2022 10:05:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 10:05:52 +0800
Message-ID: <b242d01196137023afe116a60233903ae5037d59.camel@mediatek.com>
Subject: Re: [PATCH v4 06/20] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 4 Aug 2022 10:05:52 +0800
In-Reply-To: <b265c106-373f-3850-2933-9418c2b515f0@linaro.org>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
	 <20220729063208.16799-7-tinghan.shen@mediatek.com>
	 <b265c106-373f-3850-2933-9418c2b515f0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_190804_173150_AC7F329F 
X-CRM114-Status: GOOD (  15.64  )
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

On Tue, 2022-08-02 at 10:58 +0200, Krzysztof Kozlowski wrote:
> On 29/07/2022 08:31, Tinghan Shen wrote:
> > The System Control Processor System (SCPSYS) has several power
> > management related tasks in the system. Add the bindings for it.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +
> > +    syscon@10006000 {
> > +      compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
> > +      reg = <0x10006000 0x100>;
> > +
> > +      spm: power-controller {
> > +        compatible = "mediatek,mt8195-power-controller";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        #power-domain-cells = <1>;
> > +
> > +        /* sample of power domain nodes */
> > +        power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
> > +                reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;
> 
> Wrong indentation.

I missed these lines...
I'll update in the next version.


Best regards,
TingHna


