Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC59C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 07:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6470B6101B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 07:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6470B6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iflJ6OZXQL80qp2ApZE+5y0ViRkAmjnw8knY6mArZ5M=; b=q0GjcL6wTbrY4Z
	Fg0qg/Lqx0CFNG76otLZEXafMPQTZn5vV7i5UhpyLtKQ7GhKbSQKHXmaTBVVyiH6hRaGX0YWGUmWl
	aJ2FYNY3tpt9/tsLIhw2LEu3lUZu1p3hPK9oahHbFBpxfHFIKMZTDyE4CcU+wSt+7ni2MnxM6eTas
	IZwr3B2jYbrbuUEImTiLQaciqO6sStmWtP1DzOzRDPTfMHQvvZmDSd1/C+V78z3HW37GVzpnEKZWV
	y3fGtr0NFC3+ZV0RH8GawKYeM5P6pJ4QKrFUMPBAwPADiepmFE6YLBxxF3iXbFzahOruxabO/BYRX
	1R315i/28uLAttVK/hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Zeg-00CYCg-Gy; Wed, 14 Jul 2021 07:50:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ZeU-00CYB5-8N; Wed, 14 Jul 2021 07:49:55 +0000
X-UUID: 675b5ec8bfa5408293dc203dff560080-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2/O2pQ4HOC6eVJtd8Q1VhIMzPQ0HWNoStIpcHrk56vk=; 
 b=i+4WAhn3U+4xtlazIPxo5WsoE8uIfn8ka8+MK/d3EUf958blfDVZht7t+4FyJguNc0JdsLXnKOfXQYLlgI8my12oLD1lF4hOQwXOhaKYkGllWUW1F0zA7HvIHrJYrs4bgya2g0naPHqI+uSSfjU7bEMz9H78jqXac5tiGvceXoA=;
X-UUID: 675b5ec8bfa5408293dc203dff560080-20210714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1325202774; Wed, 14 Jul 2021 00:49:47 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 00:49:46 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 15:49:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 15:49:39 +0800
Message-ID: <1626248978.8985.4.camel@mhfsdcap03>
Subject: Re: [PATCH V3 2/3] dt-bindings: i2c: add attribute
 default-timing-adjust
From: Kewei Xu <kewei.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <wsa@the-dreams.de>, <bbrezillon@kernel.org>, <matthias.bgg@gmail.com>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <xinping.qian@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>
Date: Wed, 14 Jul 2021 15:49:38 +0800
In-Reply-To: <20210712205342.GA2469648@robh.at.kernel.org>
References: <1624271985-23591-1-git-send-email-kewei.xu@mediatek.com>
 <1624271985-23591-3-git-send-email-kewei.xu@mediatek.com>
 <20210712205342.GA2469648@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F8EAEF2BEC1C758AA1F1F56F12303E5B8C124DDF5593E1195846295ACC508F7A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_004954_346252_890DD204 
X-CRM114-Status: GOOD (  20.53  )
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

On Mon, 2021-07-12 at 14:53 -0600, Rob Herring wrote:
> On Mon, Jun 21, 2021 at 06:39:44PM +0800, kewei.xu@mediatek.com wrote:
> > From: Kewei Xu <kewei.xu@mediatek.com>
> > 
> > Add attribute default-timing-adjust for DT-binding document.
> > 
> > Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> 
> You want to fix a kernel change with a DT change? That's not a 
> compatible change (and I guess neither was the kernel change). Sounds 
> like the above commit should be reverted and rethink how to add a new 
> feature...
> 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > index 7c4915bc..7b80a11 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > @@ -33,6 +33,8 @@ Optional properties:
> >    - mediatek,have-pmic: platform can control i2c form special pmic side.
> >      Only mt6589 and mt8135 support this feature.
> >    - mediatek,use-push-pull: IO config use push-pull mode.
> > +  - mediatek,default-timing-adjust: use default timing calculation, no timing
> > +    adjustment.
> >  
> >  Example:
> >  
> > -- 
> > 1.9.1
> > 
> > 

Hi Rob,

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), the I2C timing calculation has been revised to support
ac-timing adjustment.But in our design, it will make
tSU,STA/tHD,STA/tSU,STO shorter when the slave device have
clock-stretching feature.
Then we upload the commit a80f24945fcf ("i2c: mediatek: Use
scl_int_delay_ns to compensate clock-stretching") to support adjusting
tSU,STA/tHD,STA/tSU,STO when the slave device clock-stretching. But if
the slave device stretch the SCL line for too long time, our design
still cannot make tSU,STA/tHD,STA/tSU,STO meet spec.
However in the old (default) timing algorithm before the commit
be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
setting "default-adjust-timing" for using the old (default) timing
algorithm.

thanks
kewei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
