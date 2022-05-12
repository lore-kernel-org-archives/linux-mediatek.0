Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB69C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDEMnw11qQXtjNaSF6FPUKrQWDjdJTVcU8pvwklRC5k=; b=yC1R8kNCsMACD/
	f8nD+Nh/lXDUz3x8WZL9YpsSBxEVcK3yLGawhUT3/ocOPIVFSsz6imYRHPx19O/boq3MN+v9AMGQo
	u5xtoInDaoKGLhOsmB6rty5HxssVv0zwtBYK6feFTnUjId4OvgtuPN8eZ+sHI01yhiO9AUveCkEKT
	H9NugfzllaYpCgDmExDFYVGy6rMuwdWfm4g+65Utq0SRVFwa6cX0DZOlIXRSYDuCY1+dw2i5dZztw
	Nd2xdlXitnhH1YUgQk+e1Ys35Hps77G0ADbVzsBmicM3l2uhAuQWJhuUuOzFxyKopLEmte4dQjGgJ
	LxzMDc/Ya2QHYyUwWFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyNC-009NJQ-GQ; Thu, 12 May 2022 02:16:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyMy-009NHf-GJ; Thu, 12 May 2022 02:16:05 +0000
X-UUID: d503fcb360e14ce886a9195d95bc8115-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:957cd7b5-4f80-40c6-adf7-39159f85a99e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:37f58727-a01c-4223-8f5a-12d972216e7b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d503fcb360e14ce886a9195d95bc8115-20220511
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 963534575; Wed, 11 May 2022 19:15:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:15:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 10:15:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:15:48 +0800
Message-ID: <cf30fef1db3f42f7c188f1488f5289517ff04844.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Zhiyong Tao
 <zhiyong.tao@mediatek.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
 <sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 12 May 2022 10:15:48 +0800
In-Reply-To: <3e5ddde1-9d0c-a5e8-1828-aef1d1165a3e@linaro.org>
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
 <6614cd3783666caa529106464e7684caf16d6582.camel@mediatek.com>
 <3e5ddde1-9d0c-a5e8-1828-aef1d1165a3e@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_191600_598129_092FBB2F 
X-CRM114-Status: GOOD (  12.58  )
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

On Wed, 2022-05-11 at 17:36 +0200, Krzysztof Kozlowski wrote:
> On 10/05/2022 09:56, Rex-BC Chen wrote:
> > > +examples:
> > > +  - |
> > > +    pmic {
> > > +      regulators {
> > > +        mt6366_vdram1_reg: buck_vdram1 {
> > > +            regulator-name = "vdram1";
> > > +            regulator-min-microvolt = <500000>;
> > > +            regulator-max-microvolt = <2087500>;
> > > +            regulator-ramp-delay = <12500>;
> > > +            regulator-enable-ramp-delay = <0>;
> > > +            regulator-always-on;
> > > +            regulator-allowed-modes = <0 1>;
> > 
> > should be two space instead of 4 space?
> > mt6366_vdram1_reg: buck_vdram1 {
> >   regulator-name = "vdram1";
> >   ...
> > };
> > 
> > There is the same issue for this example.
> 
> Indentation is four spaces.
> 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/writing-schema.rst?h=for-next&id=7a150b0d850e37e7bdfc87459edd0ff302f67478*n111__;Iw!!CTRNKA9wMg0ARbw!yGLurJNfCjmllj-0EbUwL_HZef0f6MlfC8U968TLmzDG13EL7BErcZjtKu9cf6MMcz-E$
>  
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your correction.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
