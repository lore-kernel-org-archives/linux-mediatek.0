Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D5BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xhU3sQ6uV8SO2xioEXycClqxIeiAK3Wey+veZs7TJw=; b=nupJ1A5ba8idU5
	bam9aD4kys51wQmcH6YKRDSPgyDS1/feSkvZ3frxw/XeYZTS9O7dA7dWL/c9+aYR2dNm90jyM8aWW
	XicdkZpucN2Eer8JBjlSjCBlTFgOjqPhoItsLJmnM+O4kFHeBg8AwwDn3pK4GVZlPEE0kd48K7jkb
	T0jWhUK6hDZP1gAs3gKnsrPYbX1RYkDMi7pSu2+9Ao90YjtnCLKR53p4YiCHKT/gPighCm52sIJmw
	Va+ef+7Lrr0plIg6TJzMxQ5KHu4wmjh9UUI/Sxek8Sq6bPqaem7xwCYTncHcSSNEXKGZT8FkXQxAi
	Z73N0ekSmKcJRCYH3vYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXJzY-00G9lY-AF; Thu, 24 Mar 2022 09:42:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXJzM-00G9ih-0B; Thu, 24 Mar 2022 09:42:41 +0000
X-UUID: 54cd173994fe4e89828ee515a5cd62dd-20220324
X-UUID: 54cd173994fe4e89828ee515a5cd62dd-20220324
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 96259111; Thu, 24 Mar 2022 02:42:32 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 02:42:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 17:42:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 17:42:29 +0800
Message-ID: <c150e9ed7faa4c06f55f7d7623655b65c8575121.camel@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Thu, 24 Mar 2022 17:42:29 +0800
In-Reply-To: <d5c5e3f7-7f50-6c57-f82a-41d5494ea514@canonical.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-3-jia-wei.chang@mediatek.com>
 <d5c5e3f7-7f50-6c57-f82a-41d5494ea514@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_024240_082958_E64276AB 
X-CRM114-Status: GOOD (  21.10  )
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

On Mon, 2022-03-07 at 19:59 +0100, Krzysztof Kozlowski wrote:
> On 07/03/2022 13:21, Tim Chang wrote:
> > 1. add cci property.
> > 2. add example of MT8186.
> 
> One logical change at a time. Are these related? Why entirely new
> example just for "cci" node? Maybe this should be part of existing
> example?

Yes, the cci property is required in some SoC, e.g. mt8183 and mt8186,
because cpu and cci share the same power supplies.
I will update the commit message and add an example of mt8186 to
present usage of cci.

> 
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
> This does not look like a standard type, so you need type.

Sure, I will add the type for it in the next version.

> 
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
