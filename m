Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A261DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kq+coO4k2TTg2MgXWgiSeZQf8SL7Ih2mByq1r/J+5jI=; b=nATg9IYXEa1yGb
	03k0SCo2XNlseulbVJ43XP+7iT1dc9tvG65ZE765ZZfnrKmDQY/w3B08VUHkIWuEIO2Pw3L0W6z0f
	bA9DcAAKOI0yr6EuBTD+wwhGATz6rl1wc94sx7mHL538f74+zqAS7/2boP/HZZokiaz0hFbPQK8PZ
	EYGkB37yFsrDXTIyemOyOxfRIj9n9+yqHke/snwFwvcsVxQw7+SVC1JAsDtXDHz5etwThKNfzK9VW
	AA3dRM5KsgOG/UQcRRs/1W6AeGBeAZpqDXqgqgy5xssZmkthL5VIxkA8m0dWLc7HIIak2i8jBqETG
	8k0MrzDAwVFRFP4Amwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nir17-008EQd-Tl; Mon, 25 Apr 2022 05:12:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nir0o-008EHD-VS; Mon, 25 Apr 2022 05:11:53 +0000
X-UUID: b45a88c6992e46acbd8cf8267003d7eb-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:42d100a4-f924-4dfe-96ca-be0aa64c3732, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c570d0f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b45a88c6992e46acbd8cf8267003d7eb-20220424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1051723211; Sun, 24 Apr 2022 22:11:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 22:01:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Apr 2022 13:01:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 13:01:42 +0800
Message-ID: <5ec37a01b0b84140a7d171b9a5cff7ad8f9fbe87.camel@mediatek.com>
Subject: Re: [PATCH V3 12/17] dt-binding: mt8192: Add infra_ao reset bit
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 25 Apr 2022 13:01:42 +0800
In-Reply-To: <e5b18654-ce83-44ee-e4c8-4cdfc4ceaa1d@linaro.org>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-13-rex-bc.chen@mediatek.com>
 <e5b18654-ce83-44ee-e4c8-4cdfc4ceaa1d@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_221151_049202_155E85C9 
X-CRM114-Status: GOOD (  18.47  )
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

On Sat, 2022-04-23 at 18:28 +0800, Krzysztof Kozlowski wrote:
> On 22/04/2022 08:01, Rex-BC Chen wrote:
> > To support reset of infra_ao, add the bit definition for
> > thermal/PCIe/SVS.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  include/dt-bindings/reset/mt8192-resets.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset/mt8192-resets.h
> > b/include/dt-bindings/reset/mt8192-resets.h
> > index be9a7ca245b9..d5f3433175c1 100644
> > --- a/include/dt-bindings/reset/mt8192-resets.h
> > +++ b/include/dt-bindings/reset/mt8192-resets.h
> > @@ -27,4 +27,14 @@
> >  
> >  #define MT8192_TOPRGU_SW_RST_NUM				23
> >  
> > +/* INFRA RST0 */
> > +#define MT8192_INFRA_RST0_LVTS_AP_RST				
> > 0
> > +/* INFRA RST2 */
> > +#define MT8192_INFRA_RST2_PCIE_PHY_RST				
> > 15
> > +/* INFRA RST3 */
> > +#define MT8192_INFRA_RST3_PTP_RST				5
> > +/* INFRA RST4 */
> > +#define MT8192_INFRA_RST4_LVTS_MCU				12
> > +#define MT8192_INFRA_RST4_PCIE_TOP				1
> 
> These should be the IDs of reset, not some register values/offsets.
> Therefore it is expected to have them incremented by 1.
> 
> 

Hello Krzysztof,

This is define bit.

There is serveral reset set for infra_ao while it's not serial.
For MT8192, it's 0x120/0x130/0x140/0x150/0x730.
We are implement #reset-cells = <2>, and we can use this reset drive
more easier.

For example, in dts, we can define
infra_ao: syscon {
	compatible = "mediatek,mt8192-infracfg", "syscon";
 	reg = <0 0x10001000 0 0x1000>;
 	#clock-cells = <1>;
	#reset-cells = <2>;
};

thermal {
	...
	resets = <&infra_ao 0x730 MT8192_INFRA_RST4_LVTS_MCU>;
	...
};

If it's acceptabel, I can update all bit difinition from 0 to 15 for
all reset set.

BRs,
Rex
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
