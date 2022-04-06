Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gt2gc3Ia2celcUzZE/HZxks6lkVbaAHNdUHXNZjuKjA=; b=hHticzj27Rc16O
	z/TutER/BTBTjtP5/tAC1K1qAWjB6YXr0owLsWMF0lv0aEhbUJCLigduB3qSMcAO9965xZgPBgNco
	o47k7f4+1btmo5ZkUoe4pOxZ7YSrmULoH1R7Pa4COqMdLZ9Y+sdaO7gO2+ncN7VLjTMuBtDS08oJn
	DpUY1Y+E+ACEsY9WIZfcAYnl8/ErzBpYahNE6D5fyd1LcfkGGQMpDxwiiH80xDZw4BQidS87gRz62
	hS49Gnjj1FxXlnW0AWxAmwRKoxbIF4Jk9lKGa/Fp8n8itcutpZgxNLiHH+jpMJ9dAsUevyfDCA6QG
	v1QdtBE3eJSGTDCQKnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc56l-0066t0-LK; Wed, 06 Apr 2022 12:49:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc56Y-0066mv-82; Wed, 06 Apr 2022 12:49:49 +0000
X-UUID: 2e7018a9f506461aa7a258b9c8991058-20220406
X-UUID: 2e7018a9f506461aa7a258b9c8991058-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 909661398; Wed, 06 Apr 2022 05:49:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 05:49:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 6 Apr 2022 20:49:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 20:49:32 +0800
Message-ID: <bf6d645d9c8d0cc0ada530d9a3ebf27df838cc52.camel@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Wed, 6 Apr 2022 20:49:32 +0800
In-Reply-To: <YipjOXdCNUxdy+ey@robh.at.kernel.org>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-3-jia-wei.chang@mediatek.com>
 <YipjOXdCNUxdy+ey@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_054946_339725_8559C649 
X-CRM114-Status: GOOD (  18.80  )
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

On Thu, 2022-03-10 at 14:44 -0600, Rob Herring wrote:
> On Mon, Mar 07, 2022 at 08:21:49PM +0800, Tim Chang wrote:
> > 1. add cci property.
> > 2. add example of MT8186.
> > 
> > Signed-off-by: Jia-Wei Chang <
> > jia-wei.chang@mediatek.corp-partner.google.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek.yaml    | 41
> > +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml
> > index 584946eb3790..d3ce17fd8fcf 100644
> > --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml
> > @@ -48,6 +48,10 @@ properties:
> >        When absent, the voltage scaling flow is handled by
> > hardware, hence no
> >        software "voltage tracking" is needed.
> >  
> > +  cci:
> > +    description:
> > +      Phandle of the cci to be linked with the phandle of CPU if
> > present.
> 
> We already have a binding for this. See cci-control-port.

Hi Rob,

Pardon me for my late reply.

It seems that "cci-control-port" is hardware IP from ARM.
But mediatek-cpufreq uses MTK internal CCI hardware IP.
I think I should keep this change here.

Thanks.

> 
> > +
> >    "#cooling-cells":
> >      description:
> >        For details, please refer to


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
