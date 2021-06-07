Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45147C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 05:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F4239611CE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 05:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F4239611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sa6Hdkh2u4kUH5Tn0EpR1vWw8f+SgTpmjAYk+6wbLpo=; b=scd6+9E1RrC6zW
	MLqLxyULV10libFWf4lgjd/4Q09bvNETKqR1YDruv5qt2+2BU8RALvGgfTcyU2Z101JRCK4I7RQyc
	m8RUrAkgnIeafKxGIBG9bTKKLump71rXsQM3oozKPsmfhOHBM48gYye8PwE7vM0rO0f74FeAaFk9Z
	8026/FSe8hyNwBE7ALKiWKt8aQOxlZgjSMKPo5fCvrKUDVyXz4Dg/HJeOItj1z77FKGhQPqnB7fES
	a10bO5qGRIAmTSBkoUc59p4F/V1e+pK9JWvt6zDEmrW24U39kwTUVPWxhX3+tnSTF/cI4amQMTtkB
	L5h+Sg0lrnbLT2RlO31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq7h1-001YgN-IC; Mon, 07 Jun 2021 05:20:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq7gx-001YfY-I2; Mon, 07 Jun 2021 05:20:53 +0000
X-UUID: b1042f3246174436aef02d7b0eb2081e-20210606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DmcodQK5B9rdSagRlyQ6T+J2oEgd2at//Gi+EqIPmDM=; 
 b=TBxMYrJGqW3JOYq0EOhj8hZED0AvDJH+Dbzea1IKq79PHjdkJzT9k+XzWxZD2mXrKmhPRj/KAs9SZr1kMHFANNoLcg0hvivpRavTKQJGrtuohKFhFPwy8A71OwGoB64jCmlq7UmKhQ7X87D5Hy4zOXi2SOw28gFqIt3id3mVGPE=;
X-UUID: b1042f3246174436aef02d7b0eb2081e-20210606
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 815982004; Sun, 06 Jun 2021 22:20:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Jun 2021 22:20:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 13:20:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Jun 2021 13:20:44 +0800
Message-ID: <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
Date: Mon, 7 Jun 2021 13:20:43 +0800
In-Reply-To: <20210602171201.GA3566462@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_222051_627679_79ACA080 
X-CRM114-Status: GOOD (  23.56  )
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

On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
> On Mon, May 24, 2021 at 08:20:32PM +0800, Chun-Jie Chen wrote:
> > This patch adds the new binding documentation of imp i2c wrapper
> > controller
> > for Mediatek MT8192.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   | 80
> > +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wra
> > p.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
> > rap.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
> > rap.yaml
> > new file mode 100644
> > index 000000000000..fb6cb9e60ee2
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
> > rap.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek IMP I2C Wrapper Controller
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> > +  The Mediatek imp i2c wrapper controller provides functional
> > configurations and clocks to the system.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8192-imp_iic_wrap_c
> > +          - mediatek,mt8192-imp_iic_wrap_e
> > +          - mediatek,mt8192-imp_iic_wrap_s
> > +          - mediatek,mt8192-imp_iic_wrap_ws
> > +          - mediatek,mt8192-imp_iic_wrap_w
> > +          - mediatek,mt8192-imp_iic_wrap_n
> 
> Looks to me like these are all the same h/w, but just have differing 
> sets of clocks. That's not really a reason to have different 
> compatibles. 
> 
> If you need to know what clocks are present, you can walk the DT for 
> all 'clocks' properties matching this clock controller instance. Or
> use 
> 'clock-indices' to define which ones are present.
> 
> Rob

Some module is divided to sub-modules which are designed in different
h/w blocks for different usage, and if we want to use the same
compatible to present these h/w blocks, we need to move the clock data
provided by these h/w blocks to dts, but we usually use different
compatible to get the h/w blocks data in
Mediatek's clock driver, so do you suggest to register clock provided
by different h/w blocks using same compatible?

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
