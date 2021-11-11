Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BB7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 06:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8327E61212
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 06:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8327E61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3zeNwjvSl/9xddeA36KZ/xH0gx4zdh9IU5d67svID0=; b=0eAoxKc4MxhjZs
	W0KFZi+58CzSb+lTMx8bDt+Qrk8r22pkeu9FtGB0BdHytz2FZsm/Rg3nZGqufOsZbpLv6P28D4PcG
	Uodn6w2XakRM37fxoZ/II95BTd0XIkpYiSMayl4wFyahftSgyFwNc0WQvayozpNNzEST1ixDqcTpk
	bFpUuQUP406NCzG0gqwpKYDvcBIbhCsM2NmjDYEsTxIA/qSoeIythJ+sxuqejJ/PHxVhmdZuBlCK/
	X36BF9mcfcviisFB914pnRW3kqy24ihSDslSoZ1C9mvw/e+j3XdUCjHNnqme7RJt3Zfz7cRx1z+CS
	NSd6WYmS+mVOMxU0V+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml3NZ-007IHx-DN; Thu, 11 Nov 2021 06:16:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml3NR-007IGJ-VH; Thu, 11 Nov 2021 06:16:07 +0000
X-UUID: 9618e985f1f14af4988453dc426ca376-20211110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tHZR4ShgONrY1xlUrKSMoIV7qdy+WnxCRT5rQr7aNKg=; 
 b=AXypkWyzZ8T+5Xhbxi3j/hp1XjY94qr1XZyfZ6FI6buZRJY/nBAWGrytEpmzcR7H7w8Op8tWD2eRS37nUO8JtFNGQ5OQ51zcKR8IOKQ+m0hQNnEqR5phz2VHzEorka/4HK1ULoVzlb9AasCtv13+S6RVkeHXI3lLXcPPeNZk/B8=;
X-UUID: 9618e985f1f14af4988453dc426ca376-20211110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 250158438; Wed, 10 Nov 2021 23:15:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Nov 2021 22:15:57 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 11 Nov 2021 14:15:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 11 Nov 2021 14:15:55 +0800
Message-ID: <426d15179d7d79c3f3bd4774e23d4f5e384c7956.camel@mediatek.com>
Subject: Re: [PATCH 4/5] dt-bindings: net: dwmac: Convert mediatek-dwmac to
 DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <macpaul.lin@mediatek.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>
Date: Thu, 11 Nov 2021 14:15:55 +0800
In-Reply-To: <1636573460.872424.1783735.nullmailer@robh.at.kernel.org>
References: <20211110083948.6082-1-biao.huang@mediatek.com>
 <20211110083948.6082-5-biao.huang@mediatek.com>
 <1636573460.872424.1783735.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_221602_044433_ABE26BA5 
X-CRM114-Status: GOOD (  20.99  )
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

Dear Rob,
	Thanks for your comments~
	I'll check again with updated dtschema, and send in next
version.
	
Best Regards!
Biao

On Wed, 2021-11-10 at 13:44 -0600, Rob Herring wrote:
> On Wed, 10 Nov 2021 16:39:47 +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ---------
> >  .../bindings/net/mediatek-dwmac.yaml          | 179
> > ++++++++++++++++++
> >  2 files changed, 179 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:mediatek,tx-delay-ps: '$ref' should not be valid under
> {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:mediatek,rx-delay-ps: '$ref' should not be valid under
> {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:clocks: {'minItems': 5, 'maxItems': 6, 'items':
> [{'description': 'AXI clock'}, {'description': 'APB clock'},
> {'description': 'MAC clock gate'}, {'description': 'MAC Main clock'},
> {'description': 'PTP clock'}, {'description': 'RMII reference clock
> provided by MAC'}]} should not be valid under {'required':
> ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> ignoring, error in schema: properties: mediatek,tx-delay-ps
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> Documentation/devicetree/bindings/net/mediatek-
> dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to
> match any schema with compatible: ['mediatek,mt2712-gmac',
> 'snps,dwmac-4.20a']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1553304
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
