Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3622DC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 06:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B27C20738
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 06:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ECyILvKx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YyFwmFTK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B27C20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EPOViKL3lSNh2yoC29ejyEGuZN77vjNkimtl3Y8exD0=; b=ECyILvKxohcKI+RVXfrq3NTcQ
	RXm7zb6VT+TXfX1iYX5VDP1Y6a5ToRsKYa0tqqKJJq/AcZOnbs5X6uCBO6Sqm4AQyRn+mYaLJ/uxy
	AC1OTXY9U7Yzi6oByuKeFG3mLIIDdoM8HrciDTb5IG69o3TatOf50gMrM0crJcv0dH8gCRtGQ+0+y
	e6nT9S/UVfg9Dc3f8NyB8ETXxPNl7WLK/lPdJ5p7xk0cD49Y/KaUIYvKgBMKSnargWa3egw9FJju+
	7UmABxYNnL9zJl9BYUdhZpiCBy4bAos1vmOuUCATyFAU2yexfCZwiqXUIOU0pU3NJtv90EhGi8S8v
	PnYyjS7mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWvl5-00014f-IJ; Mon, 26 Oct 2020 06:13:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWvl0-00013C-Dn; Mon, 26 Oct 2020 06:13:27 +0000
X-UUID: 4d233ac5fb2b4b14a1310291f92d473a-20201025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tHaycWbdhS5D1KkhI22Nx0pfaOvhy8Oc/aWec7gTuqE=; 
 b=YyFwmFTKGgLIjLDBAKMMqQPog0qv0GDtAGU1mdTwjYt2f7bTji80ZsWUJ43X/o+th+matYOs8UxxVf2sZcVfR2BE50TfaMetgwV665pCyxQ8P/L8QqXHtiTY2Z0bqxJ7LXNR6+/sJSTRmVT+6hv+NTy7vw7gO5Oel/k3mscRo9Y=;
X-UUID: 4d233ac5fb2b4b14a1310291f92d473a-20201025
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 221695855; Sun, 25 Oct 2020 22:13:13 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 25 Oct 2020 23:13:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 14:12:56 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 14:12:56 +0800
Message-ID: <1603692776.20535.3.camel@mtkswgap22>
Subject: Re: [PATCH v1 2/6] dt-bindings: arm: cpus: Document
 'mtk,freq-domain' property
From: Hector Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 26 Oct 2020 14:12:56 +0800
In-Reply-To: <20201023162003.GB2800310@bogus>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <1603441493-18554-3-git-send-email-hector.yuan@mediatek.com>
 <20201023162003.GB2800310@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_021326_661207_6B6C10BA 
X-CRM114-Status: GOOD (  21.82  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Dave Gerlach <d-gerlach@ti.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 11:20 -0500, Rob Herring wrote:
> +Sudeep
> 
> On Fri, Oct 23, 2020 at 04:24:49PM +0800, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree documentation for 'mtk,freq-domain' property specific
> > to Mediatek CPUs. This property is used to reference the CPUFREQ node
> > along with the domain id.
> 
> Okay, now we've got the same thing being done for Mediatek, QCom, and 
> SCMI. This needs to be a common binding.
> 
OK, thank you. I will pay attention for this. But still
"mediatek,freq-domain" in v8.

> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > index 1222bf1..06a6f5b 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > @@ -255,6 +255,12 @@ properties:
> >  
> >        where voltage is in V, frequency is in MHz.
> >  
> > +  mtk-freq-domain:
> 
> I expect this to change, but still not right form: <vendor>,<prop name>
> 
> mtk is not the registered vendor.
> 
OK, will modify this in v8.(use the previous pacthset and merge all
changes)

> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > +    description:
> > +      CPUs supporting freq-domain must set their "mtk-freq-domain" property
> > +      with phandle to a cpufreq_hw node followed by the domain id.
> > +
> >    power-domains:
> >      $ref: '/schemas/types.yaml#/definitions/phandle-array'
> >      description:
> > -- 
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
