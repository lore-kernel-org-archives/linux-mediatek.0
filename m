Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC0CC388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 08:35:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819D2206F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 08:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbCHSplb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="krMF2l+n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 819D2206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8hI5aztfCpZoNiRjWNg02hm3Go2g+vseZcNSR0VmgEA=; b=DbCHSplbRsLGnPn27k3qp0G2O
	dAIqHqRoKhLOKA7Alng5ThapBctG+NJwJa/opbLPpAh8e7se0kAgx3loD4UQd3O+iVCA8cczsyYuF
	6gvYJxxiIlABTiTpoN7Q+YMJl21gh+3Jo/RpfSrvMvdSVMSqCHz6zGXu8BJbNsb6T10j2VZCS9RvD
	yLBotIdXTIqQTMAXTRn/bkhltPxnQ1hLksDcbtrF/oqMaojIC6vdKLaSSVH8mey4KRRyY78ErFwvs
	5lfKqyG+w6zlD2zNXrclHYqfWY2oUryR6iWriKqZPG4o4+cE3UmIv/GUgCOdGBpO+FTafpLIoyIm5
	LJgrWyuQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclbV-0000NA-K7; Wed, 11 Nov 2020 08:35:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclUo-0004Td-Bc; Wed, 11 Nov 2020 08:28:54 +0000
X-UUID: 4480063ff2cc4ece87e05aa7c8b4cb6e-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=d6BGvimYsRbgD3d8ny44iq6sJXu6PegVN2AnQ3w5TEc=; 
 b=krMF2l+neXNuWnq+t2dSN+R1efZ7F0OyfD/KdgBWx37QI7IgEoUgjJhwu5J6DyDGSqGSPSOhL8Lt9HfHNGMjohnQz6kGiyxzrr8zi+qPavffW+/nTuY+zZU6U8PzrGo9nWVaChjtSB1eLoG+kWzn1zDeZHMKEDCzXvz0pBrqMos=;
X-UUID: 4480063ff2cc4ece87e05aa7c8b4cb6e-20201111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2106747318; Wed, 11 Nov 2020 00:28:39 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 00:28:37 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 16:28:35 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 16:28:36 +0800
Message-ID: <1605083317.32073.5.camel@mtkswgap22>
Subject: Re: [v6,1/3] dt-binding: reset-controller: mediatek: add YAML schemas
From: Stanley Chu <stanley.chu@mediatek.com>
To: Crystal Guo <crystal.guo@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Suman Anna <s-anna@ti.com>
Date: Wed, 11 Nov 2020 16:28:37 +0800
In-Reply-To: <1602682204.14806.53.camel@mhfsdcap03>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-2-crystal.guo@mediatek.com>
 <1602682204.14806.53.camel@mhfsdcap03>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_032850_763435_C55EB179 
X-CRM114-Status: GOOD (  20.11  )
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, "s-anna@ti.com" <s-anna@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias, Philipp, Suman,

Since almost one month pending with this patch series, just a gentle
ping that would you have further suggestions on this series?

We are looking for this series being merged soon.

Thanks

On Wed, 2020-10-14 at 21:30 +0800, Crystal Guo wrote:
> Hi Maintainers,
> 
> Gentle ping for this patch set.
> 
> Many thanks
> Crystal
> 
> On Wed, 2020-09-30 at 10:21 +0800, Crystal Guo wrote:
> > Add a YAML documentation for Mediatek, which uses ti reset-controller
> > driver directly. The TI reset controller provides a common reset
> > management, and is suitable for Mediatek SoCs.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > new file mode 100644
> > index 000000000000..7871550c3c69
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/mediatek-syscon-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Reset Controller
> > +
> > +maintainers:
> > +  - Crystal Guo <crystal.guo@mediatek.com>
> > +
> > +description:
> > +  The bindings describe the reset-controller for Mediatek SoCs,
> > +  which is based on TI reset controller. For more detail, please
> > +  visit Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,syscon-reset
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +  mediatek,reset-bits:
> > +    description: >
> > +      Contains the reset control register information, please refer to
> > +      Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
> > +
> > +required:
> > +  - compatible
> > +  - '#reset-cells'
> > +  - mediatek,reset-bits
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/reset/ti-syscon.h>
> > +    infracfg: infracfg@10001000 {
> > +        compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
> > +        reg = <0 0x10001000>;
> > +        #clock-cells = <1>;
> > +
> > +        infracfg_rst: reset-controller {
> > +            compatible = "mediatek,syscon-reset";
> > +            #reset-cells = <1>;
> > +            mediatek,reset-bits = <
> > +               0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> > +            >;
> > +        };
> > +    };
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
