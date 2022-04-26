Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFhfPuV9mlxDbizDzDmq4k3Ysn27cDTvZiuvZPJesEY=; b=CezgYobc0Ji1XD
	n3VB6alrN4njuc8O4cuajOQnhHYSYG6sC0E0Fh3Y1tZcmC+m7ai0zRy9o+POEsUygKfkYWYAaUg7W
	KKpqS1VN16cHDjvWiZ5DJQO9W9Vi2MTEJGnOjSQDsWxti204/NDxH5vQoHfY0c8XTCwtlImYP7PYd
	1NQSMNPS7f1SPJt9j002TMO0C2iZ0NaMPvzJkTBezOYhBHSzD/ph3puFM1tycpsqQyoVhoDQL2yvJ
	l9dGpIkSSvua7/LSFcVQN8n1PCTmISPthI34UrXH/IHCEtpVwACYDc3qIbQNDUUWO23NKaxrrhTv7
	Kd8kHJQECvciAEQXwhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njGVc-00DGvW-IB; Tue, 26 Apr 2022 08:25:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njGVM-00DGng-Qr; Tue, 26 Apr 2022 08:25:06 +0000
X-UUID: 22383ae91056404e8060e37354b465c8-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fc41ccd3-71e2-4d36-87cd-b126a9c82d71, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:5ec183c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 22383ae91056404e8060e37354b465c8-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 651739141; Tue, 26 Apr 2022 01:24:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 01:24:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Apr 2022 16:24:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 16:24:54 +0800
Message-ID: <edaf444b9c45e5f36757116fe098749348cb54b7.camel@mediatek.com>
Subject: Re: [PATCH V3 11/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192-sys-clock
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
Date: Tue, 26 Apr 2022 16:24:54 +0800
In-Reply-To: <64411bc7-ce4d-9f85-be8f-c93d6b2a0360@linaro.org>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-12-rex-bc.chen@mediatek.com>
 <288f55f3-b3ed-32b8-9a44-652f3d53617d@linaro.org>
 <fdedea6f20738bfe2ede7e526aa653af1ac35768.camel@mediatek.com>
 <64411bc7-ce4d-9f85-be8f-c93d6b2a0360@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_012504_939952_3390CC4E 
X-CRM114-Status: GOOD (  25.62  )
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

On Mon, 2022-04-25 at 15:44 +0800, Krzysztof Kozlowski wrote:
> On 25/04/2022 04:37, Rex-BC Chen wrote:
> > > > +  '#reset-cells':
> > > > +    maximum: 2
> > > 
> > > Why this is a maximum? Usually this is const, so how do you use
> > > it
> > > (with
> > > what values)?
> > > 
> > 
> > We need to let the driver compatible with previous setting in
> > drivers/clk/mediatek/reset.c
> 
> Then it should be enum [1, 2], because '0' is not valid.
> 
> > There are two use cases in our reset driver:
> > (Refer to [1])
> > 
> > 1. #reset-cells = <1>
> >    When we input the argument, the older driver
> > use is to calculate  
> >    bank and bit by different method. From the implementation of
> >    reset_xlate(), we can see if the argument number is 1, it will
> >    return directly.
> 
> I understand this is an old binding with older compatibles, so this
> should be restricted per each variant (allOf:if:then)... but wait,
> old
> binding did not allow any reset-cells! You add an entirely new
> binding
> property and already want to support some older (deprecated?) way.
> 
> > 
> > 2. #reset-cells = <2>
> >    The input arguments is offset and bit. When we input two
> > arguments,
> >    we can use reset_xlate() to calculate the corresponding id to
> > assert
> >    and deassert.
> > 
> > [1]:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20220422060152.13534-10-rex-bc.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!0U0Yrp6WQxZ0YNMjaLJbAdq6Zyc524B4CY57-TP7QJ5FoSkCM72VI7mHJyWa1SZCnYTK$
> >  
> > 
> > If it's acceptable, I will add this in commit message.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

I will let #reset-cells = <1> in next version and abandon the
modification of reset_xlate().

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
