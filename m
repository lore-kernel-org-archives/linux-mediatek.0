Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A19C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kzSDViAu9p2MGvjgoU/HPfpnUVYbRKEGuvR0HJUnMs=; b=CwJGZaxU1qFWjE
	W0VCtJAoX6oJ/ih773q5GOlGVquQGj2SfIOitDLRHMRTI0GERN2DeNPRSZpn0rtIYKd1atXbTkQ8Q
	+bTzLz7Clpb7fFLqAqrBd0cor/Es86xav0DwGxa2tq7mm8z10FHWKHzxVnOq53F+4SXxuR0CH2anL
	81b5yr6Oo80pclLmTtPHWVOrnE5EE3iBDXL3IBB4+17puA+yhZBJTiCCGGI0WksxJnwb6mYcTZPUB
	ezJ/xbmz9JddDZuEK+A4aZjkXcbSkhk0RPeSjjv/lm7wAQBDvdbzsyWwzLJraT4hiyTY9Md/QrqJy
	7s7t6VfkY/hlY8EHf3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt39U-002KET-L7; Mon, 23 May 2022 08:10:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2rr-002CDc-O4; Mon, 23 May 2022 07:52:45 +0000
X-UUID: 07216e755d78480c864a52c708ec6c3b-20220523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Fk4a6kF+Dqkix/WqJ973n4J5oYG0wG4FmfTGGgHBTUM=; 
 b=ksVLD9Y8i3svPE2nZ08uzEwt5ji4N8d5lxjdrKh+2ZW/eJ7FFLTyUgUAQxeXC2TvO3lV76f6pENFaRnMgJ/dpBNGoNDWidNHt7zzpY/ET5Jp+U+5l4W6sOzPf4VhGdlTKWnsZmJd/NTJsN8h5SMIV/ng5dt7FFaufO/hTttffls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a6bd96d3-cda5-4931-89cb-c5357a5c674c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:a74a437a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 07216e755d78480c864a52c708ec6c3b-20220523
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1538307738; Mon, 23 May 2022 00:52:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 00:52:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 15:52:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 15:52:29 +0800
Message-ID: <c6cca70d59ce38db24936fbcaf2d0ceb1d01727b.camel@mediatek.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Chaotian Jing" <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 15:52:28 +0800
In-Reply-To: <d8de6b98-23a3-1991-8ceb-24098c38c335@collabora.com>
References: <20220519111323.14586-1-axe.yang@mediatek.com>
 <20220519111323.14586-2-axe.yang@mediatek.com>
 <d8de6b98-23a3-1991-8ceb-24098c38c335@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_005243_843349_503AABF4 
X-CRM114-Status: GOOD (  21.53  )
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

On Thu, 2022-05-19 at 13:18 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/05/22 13:13, Axe Yang ha scritto:
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to
> > host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >   .../devicetree/bindings/mmc/mtk-sd.yaml       | 53
> > ++++++++++++++++++-
> >   1 file changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 2a2e9fa8c188..b068ab67a054 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -72,12 +72,26 @@ properties:
> >         - const: ahb_cg
> >   
> >     interrupts:
> > -    maxItems: 1
> > +    description:
> > +      Should at least contain MSDC GIC interrupt. To support SDIO
> > in-band wakeup, an extended
> > +      interrupt is required and be configured as wakeup source
> > irq.
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: msdc_irq
> >   
> 
> That ain't right. You have two interrupts, so you describe two
> interrupts:
> 
> interrupt-names:
>    minItems: 1
>    items:
>      - const: msdc
>      - const: sdio-wakeup
> 
Fixed in v11.

> ...also, I personally don't like the "_irq" suffix: we're specifying
> interrupts in
> interrupt-names, so it sounds a bit redundant.
> 
> You're free to keep it, if you really like it though.

Totally agree with that. The suffix is removed in v11.

Regards,
Axe
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
