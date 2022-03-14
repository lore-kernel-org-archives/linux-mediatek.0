Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37711C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoFSoA2dxXlQqsPVvER3EM/W91rEK/eDk06AqJQahy4=; b=XTUCo9SB2nQSg9
	nwjh5gjcQdG04bMJJ5F3FH6no0i+CBCH28CS1ITrONZ+YCAae9xZfwQ0j2wIuVGEUw9u9yeGmAXVq
	wJ55yogaD7yB6gYb7ZEjzLUhXWI/s1FBrkXrPjqUdFj8ucSTrSsrsj6cx8LiMJ/8KdvahzQEkioFV
	y+6fjhgEbchCrCqFnQvUbI7zSi/8cZhRAsmzBtnMCrlA5yncRyZedo86oQP7HQ4X6p9378sjK5V2U
	gpoTW8qfGx8FXGUnoaI5YpKoupzsD+DDC9vHrsCBU5snvmn5wtjyE895jTjX2ypMM6lHLtGRZqY42
	dp/SMMgtFB+1sSD6BO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTezs-0042u2-Qf; Mon, 14 Mar 2022 07:20:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTezp-0042sX-Ft; Mon, 14 Mar 2022 07:20:02 +0000
X-UUID: 6eab24f6ab234b32abe5451b192b38b1-20220314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gadxA4WqHuC7Yp01X0wjvHYTdFrs9t87TuwoMG+5a74=; 
 b=gkGeTZXeFwSRPLzJdZGueapNAtH+XXTrQeU2qcmR9qHCQF+clTohD+XABc1CETk2+/tvIfT37rsI8KxO2UAnPvmA3Y/JerBdSKUVQcsa85COh/OWp+pY6edTUVzhFtL9VCIiv1iZdKi9ThAF4vTjqsabOpMt+tfgEhocyr0Li20=;
X-UUID: 6eab24f6ab234b32abe5451b192b38b1-20220314
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1563339291; Mon, 14 Mar 2022 00:19:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 00:13:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Mar 2022 15:13:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 15:13:18 +0800
Message-ID: <2d4eb06df105eb378b0404f4aa49f438f09642d0.camel@mediatek.com>
Subject: Re: [PATCH net-next v12 7/7] net: dt-bindings: dwmac: add support
 for mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <angelogioacchino.delregno@collabora.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 Jose Abreu <joabreu@synopsys.com>, <devicetree@vger.kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <macpaul.lin@mediatek.com>,
 <dkirjanov@suse.de>, <netdev@vger.kernel.org>, <srv_heupstream@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 <linux-mediatek@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <davem@davemloft.net>
Date: Mon, 14 Mar 2022 15:13:18 +0800
In-Reply-To: <YfnGtWZLujX6SWQD@robh.at.kernel.org>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-8-biao.huang@mediatek.com>
 <YfnGtWZLujX6SWQD@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_002001_557920_69A36751 
X-CRM114-Status: GOOD (  10.15  )
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

On Tue, 2022-02-01 at 17:48 -0600, Rob Herring wrote:
> On Mon, 17 Jan 2022 15:07:06 +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 28
> > ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

I'll add reviewed-by info in next send.

Regards~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
