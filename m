Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5908DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:48:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06B836103A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06B836103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xxXRbh4dksgiHxsWbUZLDMabLL2GhdC1PejIQwz4ss=; b=1QkrHmI3FN97oB
	CSwmvkE8J8dErscFifr2odUX0c12NvdqhUFzqxeKEbk/vQJr1xu+El2u+Id5FxIwG+0dtyBV/MyS/
	lXr2sNu+BN9B4qog2FL0ZcLVfcWh3L9prTwlxoGHpMMsfSCEomX7Gx6CZTZFbsmZaGdqVrP97hFqW
	oDvj7xP7TT+GqEunpCc6X/NNPgPjm4p2ob1rNMS2FMNR5ocF+FZMRrU7kIicUtd/28TEnFvVOUIXL
	MKt7SbwnTJJm2Da7ssqbDzwLovXxAp5zSeRC7Yhio7GP9VLOmUItY8CUSUvyzNl4ncL/Gya5Ja9JB
	B8Sxq2sUeSXTycjFz09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlLfZ-009Ceh-Ie; Fri, 12 Nov 2021 01:47:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlLfM-009CcY-B7; Fri, 12 Nov 2021 01:47:45 +0000
X-UUID: a3b31fef083a4b2782d1d180a22947c5-20211111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FsPSBY4kE9j2LqywphopQINupDGKsKOuuiiMQfxWJjs=; 
 b=rTtWc29ZVadOEIJKiHfF8btthiJhwuWbag7WgmNWt8BvdCAwGu9fXE/2XW4PgLGG4MJ+pOFrrRrA1G5eK/O6Z9xow8ESXlodDltTfSLUp2+KA1p9kQpVaqYz/tcQNKKHY2OFBZ/RVxU2syqa3xh1x6cNor/T4IMuzhreZY/C6mw=;
X-UUID: a3b31fef083a4b2782d1d180a22947c5-20211111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 550689048; Thu, 11 Nov 2021 18:47:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 17:47:38 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 09:47:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 09:47:36 +0800
Message-ID: <9df428e1f09fd25573eac78646d74699bd2c5712.camel@mediatek.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: net: dwmac: Convert mediatek-dwmac
 to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>
Date: Fri, 12 Nov 2021 09:47:36 +0800
In-Reply-To: <4214b222-6c43-3132-bcfe-07c43d29f5f9@collabora.com>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
 <4214b222-6c43-3132-bcfe-07c43d29f5f9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_174744_415839_6EDC4AC5 
X-CRM114-Status: GOOD (  13.14  )
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

Dear AngeloGioacchino,
	Thanks for your comments~

On Thu, 2021-11-11 at 14:30 +0100, AngeloGioacchino Del Regno wrote:
> Il 11/11/21 08:12, Biao Huang ha scritto:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   .../bindings/net/mediatek-dwmac.txt           |  91 --------
> >   .../bindings/net/mediatek-dwmac.yaml          | 211
> > ++++++++++++++++++
> >   2 files changed, 211 insertions(+), 91 deletions(-)
> >   delete mode 100644
> > Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> >   create mode 100644
> > Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > 
> 
> Thanks for the DT schema conversion!
> 
> Anyway, you should split this in two commits: in the first one, you
> convert the
> txt documentation to schema, as it is... and in the second one, you
> add mt8195
> bindings.
OK, I'll split it in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
