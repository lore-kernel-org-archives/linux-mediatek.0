Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1651BC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:11:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D56C92080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2BKMR2h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nnIuJBO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D56C92080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hzMV9St2rUcJ9OnQjZvNCIejmLSSOtOSu1cs7deSROI=; b=H2BKMR2hKZffF920mn3QqfwzL
	RtnohZfWh2JewYK2fHGNvAEcQ/eEAJjcpWtXqJyaYLnLzz/wyfK3QIzLobgTS5vhkPqgYKFLuXY4E
	VWE3co7DAvHJWuhbphX2Px0kE+0LhzX2PXHrNXeHEvnau+/jmz6jfiQFF/X9NMLj/NK1rXsTkubrq
	kTgPf8MQvahOVegkeF5jC4KddYeltTJjZeH46//ctO2hALougIdZ0BPuntSa7QPyr9wrvUQacwWNU
	GSIqOY8eWy4TQSB6M/tPblGGIotpuEelkclHsIGyyyFrewyKC0NnEKHOCfh7/RfUV47p29nAf2Vjx
	9BHU6MVnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAtKV-0003hr-3D; Wed, 26 Aug 2020 11:10:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAtKQ-0003gp-38; Wed, 26 Aug 2020 11:10:55 +0000
X-UUID: 16c6b0728e4044e1bb92093fc6c4d1c4-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pnlfpEAFsOOmXFIeR1iCQGXMDaBl8g+2wdRlohePfrs=; 
 b=nnIuJBO324rDoCeil/c+H+QsWE21nPnyLgP/NhW7P0T5/pvghlHa5DT5QuKGOC2MH9WGQFQtbkI5pYzM5OiYEsn+pJsu/6s+rt2covtMNHXZihotQIaUsCCfwVAtSZWCCH4cFkJJxzd/CoVffeksJL1xkWkXtMJhpV9olDwwFDA=;
X-UUID: 16c6b0728e4044e1bb92093fc6c4d1c4-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 960856155; Wed, 26 Aug 2020 03:10:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 04:10:45 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Aug 2020 19:10:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 19:10:41 +0800
Message-ID: <1598440159.30048.13.camel@mhfsdcap03>
Subject: Re: [v4,1/4] dt-binding: reset-controller: ti: add
 reset-duration-us property
From: Crystal Guo <crystal.guo@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 26 Aug 2020 19:09:19 +0800
In-Reply-To: <20200825174215.GA999117@bogus>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-2-crystal.guo@mediatek.com>
 <20200825174215.GA999117@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CD4A58937EB8860E7A6649B1B9819A2D1F0714F405492412FB5A47804F237A782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_071054_361515_2F11D66D 
X-CRM114-Status: GOOD (  21.08  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Yong Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "afd@ti.com" <afd@ti.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, "s-anna@ti.com" <s-anna@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-26 at 01:42 +0800, Rob Herring wrote:
> On Mon, Aug 17, 2020 at 11:03:21AM +0800, Crystal Guo wrote:
> > introduce 'reset' method to allow device do serialized assert and
> > deassert operations in a single step, which needs a minimum delay
> > to be waited between assert and deassert.
> 
> Why is Mediatek adding to a TI binding?

TI reset-controller provides a common reset management,
and is suitable for Mediatek SoCs, thus Mediatek wants to reuse this
driver for reset.

> 
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > index 86945502ccb5..ab041032339b 100644
> > --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > @@ -59,6 +59,11 @@ Required properties:
> >  Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
> >  common reset controller usage by consumers.
> >  
> > +Optional properties:
> > +- reset-duration-us: When do serialized assert and deassert operations, minimum delay in microseconds
> > +is needed to be waited between an assert and a deassert to reset the device. This value can be 0, 0 means
> > +that such a delay is not needed.
> 
> This goes in the reset controller node or each consumer? For the latter, 
> it should be a cell in 'resets' if you need this. But really, I think 
> the reset controller should enforce some minimum time that works for all 
> consumers. Surely having a minimum time per reset isn't really needed.
> 
> Rob

'reset-duration-us' will be in the reset controller node, and it's
optional. If minimum delay is needed to be waited between an assert and
a deassert to reset the device, this property will be set.Otherwise no
need to set this property.

Best Regards
Crystal

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
