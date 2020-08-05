Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15E2C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 03:19:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D5D207FC
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 03:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVJRD2AY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gmiGWcmv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D5D207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9N3kh4+dEp5FQeU3ao+HpEK3WRr6Kt0WJNyOnv8ZSE8=; b=GVJRD2AYIX9JixBKuA2K/+XKw
	E2EkmkYV22MsidA0SE4Ld/opm3oAZ4JW0RHMOGzsMVssBLx+tg5V6sRDr9kSV9gNu8f26tM0MRbEC
	Np23tzOzZQr/KcsooHBVf+gjh+yPT1Y3dbbaQedR9+HbPhySIREOxEI/blc84qLVJy9TeAyG6mka3
	I8Bp/32N5xSvUQEnM0o0PaG0uqDNrDHSzZFxeTsLMWJQ81C4wl84KmL/5TlhffZyQwTV1EcSBCAxb
	EkLjysJwfV6Iw/WXOyTqsAF3TqYbkz/s/RsXl534kQS8nHBPIL+BF6xzNBgZcgiuGw3P0HrX5bqad
	IJmduo5AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k39x5-0002Ii-Nw; Wed, 05 Aug 2020 03:18:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k39wz-0002GW-DD; Wed, 05 Aug 2020 03:18:46 +0000
X-UUID: 8771b0b32d0e4f0f94a33f08cc144739-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Y0nPay/vVeRwMMhJxIGsmWx8SurAeCIZx8d8IAlzBDs=; 
 b=gmiGWcmvj/7dkNQmbY+fk+bw/DaM4gZcIUyKfuNPIzzwktDwOlFhCwILpkxYHY8taNvnb3yNbarNjBVVHJivOiAfmYsJlRO8DeAS/GWHLynC3NjURBoFV0pZPutxkxrwd/begOHZ9OfyzqhkMSi4pEEfDjSYlLEk3W3zyywj0cs=;
X-UUID: 8771b0b32d0e4f0f94a33f08cc144739-20200804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 189703066; Tue, 04 Aug 2020 19:18:38 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 20:08:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 11:08:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Aug 2020 11:08:31 +0800
Message-ID: <1596596913.31794.5.camel@mtksdaap41>
Subject: Re: [v2,3/6] dt-binding: reset-controller: ti: add generic-reset to
 compatible
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 5 Aug 2020 11:08:33 +0800
In-Reply-To: <053da16ed682cc016b0a66a834fb58d4d9410dc2.camel@pengutronix.de>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-4-crystal.guo@mediatek.com>
 <053da16ed682cc016b0a66a834fb58d4d9410dc2.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A6D8B52AF94AFBD67EFCEA916BD1A5F6C364466DC6EC0F8CE75C27692907B962000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_231845_579877_28A3F420 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Crystal Guo <crystal.guo@mediatek.com>, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-08-04 at 10:15 +0200, Philipp Zabel wrote:
> On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
> > The TI syscon reset controller provides a common reset management,
> > and should be suitable for other SOCs. Add compatible "generic-reset",
> > which denotes to use a common reset-controller driver.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > index d551161ae785..e36d3631eab2 100644
> > --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > @@ -25,6 +25,7 @@ Required properties:
> >  			    "ti,k2l-pscrst"
> >  			    "ti,k2hk-pscrst"
> >  			    "ti,syscon-reset"
> > +			    "generic-reset", "ti,syscon-reset"
> >   - #reset-cells		: Should be 1. Please see the reset consumer node below
> >  			  for usage details
> >   - ti,reset-bits	: Contains the reset control register information
> > -- 
> > 2.18.0
> 
> My understanding is that it would be better to add a mtk specific
> compatible instead of adding this "generic-reset", especially since we
> can't guarantee this binding will be considered generic in the future.
> I think there is nothing wrong with specifying
> 	compatible = "mtk,your-compatible", "ti,syscon-reset";
> in your device tree if your hardware is indeed compatible with the
> specified "ti,syscon-reset" binding, but I may be wrong: Therefore,
> please add devicetree@vger.kernel.org to Cc: for binding changes.
> 

Hi Philipp,

This would work.
But having "ti" in mtk dts raise alarm for some people inside and
outside of MTK. It would save us some explanation if we could use a more
generic name.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
