Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC277C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JXY+OaJEr3wcIh1aTxBF6yZho7tLCr+Kjx9yWFtqyo=; b=T6AmXZDyT6ABDM
	6qm45/1X71T7oJHmqTMvqgQTYKI596JZChQKzWrue7CAVCC7nWcRgA0l4XLZOFfUlNkJi0TAWs7P9
	M1m6JeI1ntUmkan5Ulqg4T2+j1uVN8gbyjO2oSC94ObAkcASQE/OHHICQlJvzM78pG53VOLx3bhOA
	Yn98WWV4C+wmkwR03/mn649J6MbKy48vK0uvDNDyVkiPtoC1J3nuQ0mHCoW61A/GcRmQmzENMHg/6
	OC++UbwldsRhe9x7MZDdfEB9wwPEtfbRKTbXdhGcQ1CnSj961RqxS+oOoEyKwRAONw7TWTblm8Xl1
	eizwQUyArw45jHICm1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my22W-0088Xe-E9; Fri, 17 Dec 2021 01:28:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my22S-0088XB-9q; Fri, 17 Dec 2021 01:28:02 +0000
X-UUID: b7a1660b991f4d22a0f4022580c59bcb-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cMKFGO50Nijrd/zf0SyWIymRa4cZ18pTctDEuNU+t50=; 
 b=BQbQE8dhegxrx5xWHmhb4uiWxRp+otcMVObhgnwrTi15c7IaB9LU/SCee18HMcslmoyw79Hj9FiVmW1L4hrnnr599qX4gKjyliKeRWASQOFh7mXfP7GRNKYp7BYyTYoqzCF1zl5j6dnZ+MhpM+U+5XRXAyR7nUQqalJMKjwHCsw=;
X-UUID: b7a1660b991f4d22a0f4022580c59bcb-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 713521450; Thu, 16 Dec 2021 18:27:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 17:26:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Dec 2021 09:26:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 09:26:05 +0800
Message-ID: <c231ad91abe639a200b9a18835280c9ca28c771a.camel@mediatek.com>
Subject: Re: [PATCH net-next v10 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Fri, 17 Dec 2021 09:26:07 +0800
In-Reply-To: <Ybti2mNfEVNWQWgM@robh.at.kernel.org>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-5-biao.huang@mediatek.com>
 <Ybti2mNfEVNWQWgM@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_172800_374976_0F9669B9 
X-CRM114-Status: GOOD (  14.53  )
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
	Thanks for your comments.
On Thu, 2021-12-16 at 10:01 -0600, Rob Herring wrote:
> On Thu, Dec 16, 2021 at 01:53:26PM +0800, Biao Huang wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
I'll add reviewed-by in next send.
Regards!
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
