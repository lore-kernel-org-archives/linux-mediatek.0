Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F29C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2ycAwB9AKCUd7Ti9SviyeWVoLkbuLNtdC5n82XdxWg=; b=gJpOLgMVZGMAae
	llZ6Cudz4xQ6pgaX70CaIMWnu7BuPPElgcXmiomp3MtguxMWUMMFyPrLqGfKT47oChW0kwt85JZ6R
	E1HwvBtzQOPkSa9hCYecqKUfN1E6KGHHJfNQ93oQk7Nh05wWktqWQdmcZ22Pg+AkqxpWcXmKBYnCt
	mFg1NzdX7wz1DKrbqQ2pDfdzztC7F9D/GOb8okU+21Lcu1oNQRIZJbMNoKciIiM1FqSk/XAR98mlU
	JzYAIDRDROPfxHxsxe5FyyAGuJngCnsl/5Wa++OVD/5rpelgK91I/+2PE0whGfKICLtbRrgcUgY4L
	w/e5Ox+npNwEpki1c+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQUBF-006Ot8-VI; Tue, 23 Aug 2022 13:42:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQUBC-006Orb-K2; Tue, 23 Aug 2022 13:42:56 +0000
X-UUID: d5d4b6409af6408baa45b0c0b1e1909d-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=T2ycAwB9AKCUd7Ti9SviyeWVoLkbuLNtdC5n82XdxWg=;
	b=M1wZOywpS+oDpY42X/sIuhXLumRtRtCI5SOrVnx9j8yNmKn0Ii40TL6lmZYWisaXbsDFA4D623uIViR+8Hk0ukb1iHhIoeRCyMpgszOb35dIE3gTxcTpN2r7FPpDc0+94xjg2EyIH1fnBKBXCrukE7gtJ6vAY64RdYU2x44yj50=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e84499f8-bfb2-4e91-80cc-e137c57b3ad1,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:4d201068-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d5d4b6409af6408baa45b0c0b1e1909d-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1548419458; Tue, 23 Aug 2022 06:42:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 20:42:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 23 Aug 2022 20:42:10 +0800
Message-ID: <9cea272d0bc50930b13ce8ce21fa474750b57fe1.camel@mediatek.com>
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 23 Aug 2022 20:42:10 +0800
In-Reply-To: <1349b271-796b-c9d2-a568-f9be84926ed4@linaro.org>
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
	 <20220812092901.6429-2-zhiyong.tao@mediatek.com>
	 <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
	 <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
	 <CAGE=qrohYZ6f9bbEuYfF=2Rz21nbW_8ho3rBQmHt1D+kQG2-jA@mail.gmail.com>
	 <9bc148119fc36c34f404091ca0f5a2e37727c285.camel@mediatek.com>
	 <1349b271-796b-c9d2-a568-f9be84926ed4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_064254_733613_656A2EF5 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com, broonie@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-08-16 at 15:57 +0300, Krzysztof Kozlowski wrote:
> On 16/08/2022 15:54, zhiyong.tao wrote:
> > On Fri, 2022-08-12 at 15:55 +0300, Krzysztof Kozlowski wrote:
> > > On Fri, 12 Aug 2022 at 15:52, zhiyong.tao <
> > > zhiyong.tao@mediatek.com>
> > > wrote:
> > > > 
> > > > On Fri, 2022-08-12 at 13:55 +0300, Krzysztof Kozlowski wrote:
> > > > > On 12/08/2022 12:29, Zhiyong Tao wrote:
> > > > > > Add mt6366 regulator document
> > > > > > 
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: mediatek,mt6366-regulator
> > > > > > +
> > > > > > +  regulators:
> > > > > > +    type: object
> > > > > > +    description: List of regulators and its properties
> > > > > > +
> > > > > > +    patternProperties:
> > > > > > +      "^buck-
> > > > > > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > > > > > +        type: object
> > > > > > +        $ref: regulator.yaml#
> > > > > > +        unevaluatedProperties: false
> > > > > > +
> > > > > > +      "^ldo-
> > > > > > v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> > > > > > +        type: object
> > > > > > +        $ref: regulator.yaml#
> > > > > 
> > > > > You miss unevaluatedProperties in most of the places.
> > > > 
> > > > Hi Krzysztof,
> > > >    Thanks for your suggestion,
> > > >    Do you mean that all places should have the
> > > > unevaluatedProperties
> > > > Properties ?
> > > 
> > > Yes. You put it in some of the places which does not really make
> > > sense...
> > 
> > Hi Krzysztof,
> >    Thanks for your suggestion,
> >    We find that if there is a properties "compatible = "regulator-
> > fixed";" in ldo-vrf12, we should set unevaluatedProperties as true.
> > or it will check yaml warning "Unevaluated Properties are not
> > allowed('compatible' was unexpected)". is it right?
> >    There is a properties "compatible = "regulator-fixed";"in ldo-
> > vrf12.
> > It will cause the checking yaml error "ldo-vrf12: 'regulator-name'
> > is a
> > required property". Can you help to give a suggestion to fix the
> > warning? Add regulator-name for ldo-vrf12 or other suggestion?
> > 
> 
> And how this regulator is supposed to work? Are you populating DT
> children in your driver?
==>
Hi Krzysztof, we will remove the properties "compatible = "regulator-
fixed" for some ldo. It won't any check error.

Thanks

> 
> Best regards,
> Krzysztof


