Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B130BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 03:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nN8VGEDsvFf2d4AamK/514+1B1BLcrNY46NuMfFfs/8=; b=Q8DZirck5BfeeT
	iHkhO177d686uX0DnTaYiAWFu3SPerVMIr1FpRvRTAVdovIdZOWlfRTgRiQDBa5RS1Y4Dg5MEAhv3
	wz3KWj0jsU5E/2CUn0WGiEdtd/ffGW5Q5NWB8NkhKDjk4TgIw0D6Q4XrFZp+u7mUj3heWQjJe0m+O
	gg8C63Skt5wWFaCwemMQLzYBvf937BTKrW53mRw4R2mJ/iRoBznknHdetGXhWnXaWY0S2wJYAIvOM
	+XjGij49zm8Yv19WDtGhZiDZz2igRa/fftJ7xI3APykF96vKRZSKAJGDwS/lgrNi3sBCW8wP4u5kb
	6H4sCH2tXPfu5/kL2mgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbwZA-003dOd-8j; Wed, 06 Apr 2022 03:42:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbwYz-003dMD-4B; Wed, 06 Apr 2022 03:42:34 +0000
X-UUID: b7177f57405948baa92c30eadba0c32c-20220405
X-UUID: b7177f57405948baa92c30eadba0c32c-20220405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1766666063; Tue, 05 Apr 2022 20:42:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 20:32:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Apr 2022 11:32:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 11:32:18 +0800
Message-ID: <41781640ceee45e763bb0f3d6c765fea76826fa5.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Wed, 6 Apr 2022 11:32:18 +0800
In-Reply-To: <ac0e3336-f9eb-def9-68ea-ab49e2c467a1@kernel.org>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-2-jia-wei.chang@mediatek.com>
 <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
 <13482b1b4244df5c0c0a4d6a60cdb2a7ba88500a.camel@mediatek.com>
 <aa34eccf-ef08-4a8f-7a6c-7fbd05bd54b6@kernel.org>
 <126e0905c2eb9f22a0be46dd7aa8ac891622346d.camel@mediatek.com>
 <ac0e3336-f9eb-def9-68ea-ab49e2c467a1@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_204233_258801_A3E7CF73 
X-CRM114-Status: GOOD (  27.28  )
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

On Sat, 2022-04-02 at 13:31 +0200, Krzysztof Kozlowski wrote:
> On 01/04/2022 15:39, Jia-Wei Chang wrote:
> > > > > 
> > > > > > +
> > > > > > +  operating-points-v2:
> > > > > > +    description:
> > > > > > +      For details, please refer to
> > > > > > +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> > > > > > +
> > > > > > +  opp-table: true
> > > > > 
> > > > > Same comments as your CPU freq bindings apply.
> > > > 
> > > > mtk-cci-devfreq is a new driver and its arch is same as
> > > > mediatek-
> > > > cpufreq so that the properties of mtk-cci are refer to
> > > > mediatek-
> > > > cpufreq 
> > > > bindings.
> > > > operating-point-v2 is used to determine the voltage and
> > > > frequency
> > > > of
> > > > dvfs which is further utilized by mtk-cci-devfreq.
> > > 
> > > "operating-point-v2" is understood, but the same as in cpufreq
> > > bindings,
> > > I am questioning why do you have "opp-table: true". It's a bit
> > > confusing, so maybe I miss something?
> > 
> > Yes, you're correct.
> > "opp-table: true" should be removed.
> > I messed it up.
> 
> No, I think I was wrong. The opp-table pretty frequently is embedded
> in
> the the device node itself. The operating-points-v2 references it.
> 
> You don't use it in the example, but it might be a valid usage, so it
> can stay. Sorry for the confusion, it passed some time since I looked
> at
> OPP bindings.

You remind me of "opp-table: true" and the reason why I use it here is
exactly as you mentioned. Sorry I was not familiar enough with this to
respond it clearly and confidently.

I think it is proper to keep "opp-table: true" and add a complete opp
table information in dts example here as well.

Thanks for your comments.

> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
