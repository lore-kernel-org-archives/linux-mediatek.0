Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D43C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 02:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFhRJPlnrXhvvuzBWh5XQQ22jlg7j8R4VNSX3W6KchU=; b=x5OD2L7m0GeA/G
	X3SitKXr9PoUyfy/rQd+hAGpg7RpZkK204ap9PrT5TNsMyrWqxc1MlqQaEwu/Pv14fA91PfxnrF8u
	EIwvmxIr8F841G3Ahn9JQ4HYWhU18JYccbv7lEPosMaJa90r+hDfuzLNKu9i5N2LIxayR3b+Iywix
	fdOmQFqbp5S/qoS7kWF+ZgAXWQRRoo7eJgltl8Z4OXoiyLEwmGo95C1QN6Nq06O6zSKu1DtEieRWs
	2gRBl3QvZHq3HACdAlzvy70VFTCw6BrqzeiixfduCSOZtpRerKmgsl2AKblmDRzRk3DXJwWW51Y1L
	eWs8JcThv2I6VfMZs/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noc6N-004miv-S4; Wed, 11 May 2022 02:29:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noc6L-004mho-3e; Wed, 11 May 2022 02:29:22 +0000
X-UUID: 414737581cb4434888d71a3524053a79-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:36e828cd-6a56-432f-a610-f374087adec1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:109b04e6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 414737581cb4434888d71a3524053a79-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 237161349; Tue, 10 May 2022 19:29:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 19:29:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 11 May 2022 10:29:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 11 May 2022 10:29:13 +0800
Message-ID: <c0db4e1a720fe66d0c3ac4699cb4f5d34a3e6802.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: "airlied@linux.ie" <airlied@linux.ie>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Jason-JH Lin
 =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?= <Jason-JH.Lin@mediatek.com>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 11 May 2022 10:29:13 +0800
In-Reply-To: <f1d477d2-13c4-2914-e520-4b2778e52e35@linaro.org>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
 <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
 <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
 <f1d477d2-13c4-2914-e520-4b2778e52e35@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_192921_202332_66EC7828 
X-CRM114-Status: GOOD (  18.90  )
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

On Tue, 2022-05-10 at 19:19 +0800, Krzysztof Kozlowski wrote:
> On 10/05/2022 03:46, Rex-BC Chen wrote:
> > > 
> > > 
> > > That's mediatek-drm, and this refers to the HDR block in the
> > > display
> > > IP...
> > > 
> > > Though, I have no idea of what "ET" stands for in "ETHDR", so, it
> > > would be
> > > definitely nice if MediaTek can write the meaning in the
> > > description,
> > > like
> > > 
> > > description:
> > >    ETHDR (E??? T??? High Dynamic Range) is designed for HDR video
> > > and
> > > ...blah
> > > 
> > > Cheers,
> > > Angelo
> > 
> > Hello Krzysztof and Angelo,
> > 
> > "ET" is actually meaningless.
> > ET is one of mediatek departments and it's where the engine from.
> > Therefore, I think we will add description like this:
> > > ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine
> > > and
> > > designed for HDR video...
> 
> Sure, sounds good, but then the node name should not have it. Please
> try
> to find some more generic name (DT spec gives examples). Could be
> display-controller, "hdr-engine", "isp".
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your suggestion.
We will use hdr-engine to name this node.
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
