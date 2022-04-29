Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 02:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPNk6Ly4jGahB2YRKVNFtesRCzVM9YCKfK9yVKxIXuY=; b=4gaJ6NZBnSpOA1
	qhy5sLeazMsN+P9Zvhd3W2ZE7LP9XyU7eXApt4lgDHrc+pfJo2r5AyFI4VbTXPnnPdP+4t+5tMj38
	IC+JUEaFsceOMffF/XmbLAANMujFDwGwvy+C6m+egE53Dr5T4rEJ38qaem4/TUVoPwXoDKhZW0PrN
	G0KYaJnIJGLayJpWOGPb/LYoTDWGPWMyfFbkCBJSCIrChVa63Ze2lW6ojfItI5UUGbOzLZS0ecbub
	/UtpKbGb1mmwZWZKN17O04Y58eD1j9wXJoHnBUH1yA3sIQoLUct+DtA0dS6UYEGvXFqsuRuzwj/+9
	DfXjmAALzZk8tKWCIS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkFwp-009HME-Iy; Fri, 29 Apr 2022 02:01:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkFwm-009HLg-GW; Fri, 29 Apr 2022 02:01:30 +0000
X-UUID: 63fe8daf60094ee89a246430d46b697e-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2044d8af-6f1c-4174-9a1c-50e26029bcb0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a4caed7c-22f1-4947-aff4-db35614e6753,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 63fe8daf60094ee89a246430d46b697e-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 761768941; Thu, 28 Apr 2022 19:01:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 18:55:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 09:55:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 09:55:37 +0800
Message-ID: <9f601c458bd3401b216992e8dd72485a10f34597.camel@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <airlied@linux.ie>,
 <krzysztof.kozlowski+dt@linaro.org>, <daniel@ffwll.ch>,
 <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <p.zabel@pengutronix.de>, <linux-mediatek@lists.infradead.org>,
 <robh+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <cellopoint.kai@gmail.com>
Date: Fri, 29 Apr 2022 09:55:37 +0800
In-Reply-To: <1651177993.334386.220464.nullmailer@robh.at.kernel.org>
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-2-rex-bc.chen@mediatek.com>
 <1651177993.334386.220464.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_190128_582638_967E868A 
X-CRM114-Status: GOOD (  17.86  )
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

On Thu, 2022-04-28 at 15:33 -0500, Rob Herring wrote:
> On Thu, 28 Apr 2022 21:37:50 +0800, Rex-BC Chen wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> >  .../display/mediatek/mediatek,dsi.yaml        | 122
> > ++++++++++++++++++
> >  2 files changed, 122 insertions(+), 62 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > l
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/__;!!CTRNKA9wMg0ARbw!wKbRsUmeUS_4mtOwj1t30buVNEilHYYhsUmEd5MvZ7P9VyDXg6cikERof47mkwETQzFL$
>  
> 
> 
> dsi@1400c000: compatible: ['mediatek,mt7623-dsi', 'mediatek,mt2701-
> dsi'] is too long
> 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
> 	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb
> 
> dsi@14014000: #address-cells:0:0: 2 was expected
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> sku2.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> 
> dsi@14014000: 'port' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> sku2.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> 
> dsi@14014000: #size-cells:0:0: 2 was expected
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> sku2.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> 
> dsi@1401b000: 'port' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> 

Hello Rob,

Thanks for your comments.
The purpose of this series is not to fix dts for previous SoCs.
Therefore, if there is a chance, we could send another series to fix
them.

Thanks.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
