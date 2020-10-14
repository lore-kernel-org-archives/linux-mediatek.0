Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE2DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 02:11:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A352121775
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 02:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mX6jIz2Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SDuzqB+s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A352121775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5v9T/329odAE9qisZT30adEm48us0/k1+1j0V9b5C0=; b=mX6jIz2Z6DmhXzzUgTjY2kvFT
	rDHTPpojlapH+fSyys0bVTDnFAO08tMuYi9Zs+ooFPSKBhQieulo4yFsLuen5PFyAWtRX6KCndnnc
	RRiDhf02lhxS+Ke0kSn0/3BBSo6aCVhhDjm0Tvecxv6ZueMfz5LG/grSL0iGcnPwvJ6y9R38hCDOq
	72ETJWAAbzEL8TXsi5vMev2KOtpsZHPF0JRTe2dV1XBDuRWQOKp0UJL1L+93gEKwCJ6fmuDasIyjd
	Taqx4XXfRYk642wkZ+S2YQe+++vGFNmaapUm+npFzQ/0X3oGkkWQ+YhL0oOlPSQXPYl/dr5V4uvGy
	FKfKq3+bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSWG8-0001Iv-Q7; Wed, 14 Oct 2020 02:11:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSWG4-0001IA-DN; Wed, 14 Oct 2020 02:11:17 +0000
X-UUID: 552ad285ea324459999e15e7a2496017-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4Q2q9B+1WXxYA2muWdcDjPj8VFCNwkYxZxmEFcRvFfE=; 
 b=SDuzqB+sPWPu5KW0krE+LjpZ8qu6LuTn4udK1Ac+Z/hihj7AHkq3Qow2q7OjKW707IWdOYjRy3xLkzZHUaI15QCEezfeS/XyjVY5mFthJzlR/5ybepgJb99rz6VjHD5rYwasTUJQGe3GMNk3AjeEi37eCzhSPPWvwSHNuwulmm0=;
X-UUID: 552ad285ea324459999e15e7a2496017-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1342663194; Tue, 13 Oct 2020 18:11:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 19:10:21 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Oct 2020 10:10:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 10:10:18 +0800
Message-ID: <1602641418.4733.80.camel@mhfsdcap03>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 14 Oct 2020 10:10:18 +0800
In-Reply-To: <20201013161938.GE13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB1C224051110C1485A7323D0EF350AE1767638B0BFB10FB6D89B887DDD8727B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_221116_620674_1EAD4969 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Sakari,

Thanks for your timely review.

On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > relevant MAINTAINERS entries.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 169 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > 

[snip]...

> > +  ovti,mipi-clock-voltage:
> > +    description:
> > +      An array of 2-tuples items, and each item consists of link frequency and
> > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > +      dependent upon link speed, indicating MIPI transmission speed select that
> > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > +      the clock driver capability.
> > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > +    minItems: 2
> > +    default: [390000, 4]
> 
> Why do you have the link frequency here as well?
> 
> In principle this does belong to the endpoint as link frequencies are
> specific to that, but I don't mind; there's just a single port anyway.
> 

This is an optional property which we model as an array of <link speed,
clock voltage> pairs. An example to have all link speeds up to 390MHz
use the value 4 for current driver. If one wants to select different
voltage for different link, they could do so as well.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
