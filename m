Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B2FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 03:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150BC60F4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 03:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 150BC60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoYcRAovjxlLKWBxasjAAyXT0LUcXuE0S3wTxCMFIuo=; b=Wy8EmACoCGETtH
	vMdFRzCbO7Y/BN5WvqTPhI1N+hNyCGe0EWMCr3u8rTi6jAOvZJw3fguiXLb2a2dJ8p0b0yvMg15v0
	qhVC6D/gD2eivite37l5Sp9dKT0ocmmu1gUGel6fNtQe7PILfAlMwUkxQ+rNegFie1BuiGHDAUeRs
	wsFWFgG+POlepaux1IsixKV6Dd7/05VXQig4RM71nnowvhjA0r3g/aTfSsi2AtzmY1gIa+mo9775T
	UrQ8zIB8D/c1D7m5THppLWkOW3FEZ8sF8hODkPX1Pg9TUti+ZD9IaSE8NpgEnnXmu8ECkS27tDCyM
	OB9udiVwAgrQP1sOX/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlMqA-009IGD-G1; Fri, 12 Nov 2021 03:02:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlMpx-009IEb-S1; Fri, 12 Nov 2021 03:02:47 +0000
X-UUID: aa866061fcff41cca14dbddc3ddf116b-20211111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VcNEpCuXHbGjzxYQZ8fWTghPoSSE5d5qJMlyOwvGVLU=; 
 b=Apw+BjyOhwLGw7ZwzAGczT5WI1WK7v3KzXv4EClm9RxNj9CjqjsZpG78wy0DpzNC+ZY3hlyCnMR4jEpIZK1CD0W5rXn6V+4aFDhnVqkVPDC3DE55WzkYbGAWYjMLDwd9urkfz0Eu9PtEwG5/MLNMHnJrjWwOOliFTb6yUOZSA0w=;
X-UUID: aa866061fcff41cca14dbddc3ddf116b-20211111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 884329058; Thu, 11 Nov 2021 20:02:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 19:01:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 11:01:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 11:01:44 +0800
Message-ID: <1c762a13ee1c73142771c4b409d7d678240ace67.camel@mediatek.com>
Subject: Re: [PATCH v2 2/5] net: stmmac: dwmac-mediatek: Reuse more common
 features
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
Date: Fri, 12 Nov 2021 11:01:44 +0800
In-Reply-To: <71620d46-c9d5-07cc-befd-da838f0dcd1f@collabora.com>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-3-biao.huang@mediatek.com>
 <71620d46-c9d5-07cc-befd-da838f0dcd1f@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_190245_960153_176E077E 
X-CRM114-Status: GOOD (  10.77  )
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

Dear Angelo,
	Thanks for your comments.
On Thu, 2021-11-11 at 14:28 +0100, AngeloGioacchino Del Regno wrote:
> Il 11/11/21 08:12, Biao Huang ha scritto:
> > This patch makes dwmac-mediatek reuse more features
> > supported by stmmac_platform.c.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 +++++++++-----
> > -----
> >   1 file changed, 15 insertions(+), 17 deletions(-)
> > 
> 
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
OK, will add this info in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
