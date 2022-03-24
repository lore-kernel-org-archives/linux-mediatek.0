Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B537C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQhyvjAvbzJI5lFLZYwUpvu17AvVcBOe84AcxKPsnI4=; b=ZSOcoTRtp7fM0F
	kLyJdVKasuR18+OwI/x+UY2l66/oyKqOWNclZAjrKNUydpxEcCt0UeBVs3ArJOoF+LSBVp2DKoGD+
	nOjcal6VTt/gTz8XNFtyZlrWYG1LY5HdDwW0/+a7kT4f3jvvjEjwH3HH75QlvQVtJvRQIaMEJrFmy
	DSapm6tdpZHqom83zYVEHXZnU65d9sORme0yXUiH1D4vH93R8aIeyZ5exIkIeKxd4OrUf1+bVY4XU
	iR8A9D18rlRpXY48WHaz9Tba5eucbKT6SaNUleV9wDO4cmfmF3nbS/B6OJbqutnSBNZHlp77r4ZSf
	yarBoVOccA+ODGqWTs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXBiF-00FEwN-6e; Thu, 24 Mar 2022 00:52:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXBi7-00FEuF-9B; Thu, 24 Mar 2022 00:52:22 +0000
X-UUID: a5a87dda25034570bc25bed84a23440d-20220323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aNZDrEDS9Osj5nxfxUzP/lzyFK6B/ZSH1K3GOURVRdE=; 
 b=lLcm9oU7gM7Djx6A5V9937qn+tW7VatJuskyxBhBoBtLdgkFloN1IuOFAG7axFd0HZ+e91kh2sN0tJMJM6X3c1AakDMdktx4OSopDE/XFR0iBDz91P0c83ui6+moEBpDaN/4odaouSIjvzZgEZLNItkWzboF+nDIdJWv/XmhGRg=;
X-UUID: a5a87dda25034570bc25bed84a23440d-20220323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 414698096; Wed, 23 Mar 2022 17:52:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 17:52:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 24 Mar 2022 08:52:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 08:52:08 +0800
Message-ID: <6a2f52d2a173a9127ea517c81c3c1c5fe7b2b009.camel@mediatek.com>
Subject: Re: [PATCH net-next v13 5/7] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
CC: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, srv_heupstream
 <srv_heupstream@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 <dkirjanov@suse.de>
Date: Thu, 24 Mar 2022 08:52:08 +0800
In-Reply-To: <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
References: <20220314075713.29140-1-biao.huang@mediatek.com>
 <20220314075713.29140-6-biao.huang@mediatek.com>
 <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_175220_758671_2A806AC2 
X-CRM114-Status: GOOD (  17.90  )
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

	Sorry for the failings.

	"snps,txpbl"/"snps,rxpbl" are limited to enum [2,4,8] in
snps,dwmac.yaml, but the hardware allows 1,2,4,8,16 or 32 according to
datasheet.

	I'll submit another patch to modify enum in snps,dwmac.yaml.

Regards!
Biao

On Wed, 2022-03-23 at 09:00 -0500, Rob Herring wrote:
> On Mon, Mar 14, 2022 at 2:57 AM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > And there are some changes in .yaml than .txt, others almost keep
> > the same:
> >   1. compatible "const: snps,dwmac-4.20".
> >   2. delete "snps,reset-active-low;" in example, since driver
> > remove this
> >      property long ago.
> >   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
> >   4. the example is for rgmii interface, keep related properties
> > only.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
> >  .../bindings/net/mediatek-dwmac.yaml          | 155
> > ++++++++++++++++++
> >  2 files changed, 155 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> 
> Now failing in linux-next:
> 
> /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
> ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
>  From schema: /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
> ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
>  From schema: /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 
> 
> Rob
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
