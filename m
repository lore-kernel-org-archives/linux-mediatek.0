Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FB0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPMTiREpH/Df3NZCKHTlKTh2R54/xEmjH9I8g+NM+/4=; b=fEhEzZv21L3mt3RBfh4wVwngFm
	+dmY3CFh91UyNgXQapSvZIRA9bM8nGw9q6mbF2XCSMzxjs2Ut5LbI5wJmFMe1TMdOjD9dO29EU093
	qXsWYc1bcspBDg4KFto/udFhHykQWHAoLjehP1M+QOhYaWoH5YA3VHIxRuWu7hc3R37NPI/e3NShL
	ojHC0elCT5k7FPZQGnZtzAFiUolZA+N5DbYAQYrYU+5+nn8SGswFH48/XqdOMoUUCDfHQfUDJhCqm
	cw1JFySDhBld6jIH6hq2bcJXWrHp8k9iXGaGUf3iJCj8q34PfZ4RCr1Ayhpiv/sYNeU/Njnn9dsge
	yuvLIsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaECI-00BMxX-T8; Mon, 19 Sep 2022 10:40:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaE9M-00BMo0-Lx; Mon, 19 Sep 2022 10:37:18 +0000
X-UUID: 1d845cda46df4371bdd0d78005ecf6c2-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=dPMTiREpH/Df3NZCKHTlKTh2R54/xEmjH9I8g+NM+/4=;
	b=KE0V/xRyxbGADXlo3T21L8BshSv1CfdKR5VJRseYYDa4VRdcgdwxJryrF8WI9mAPfbKjzSJXhHAB9ZRxJzVJ6MmJKSBMGRepnJYO6uAVf7rW1NPhRmNqp54v5PCjguDf5Pz/qLba533JCqcNGGWC7EBiQqgwwDPfi8AGWf5Y+Mk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:afb2e6b2-da2d-4ae6-a949-3052f9f0644f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:198bdd18-0314-4ae7-b2d1-7295be49255e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1d845cda46df4371bdd0d78005ecf6c2-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1073289098; Mon, 19 Sep 2022 03:37:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 17:56:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Sep 2022 17:56:31 +0800
Message-ID: <f72e133e9aec70724702054e5f6a8712b649d34f.camel@mediatek.com>
Subject: Re: [PATCH 1/2] stmmac: dwmac-mediatek: add support for mt8188
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Biao
 Huang" <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 19 Sep 2022 17:56:30 +0800
In-Reply-To: <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
	 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
	 <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
	 <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
	 <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_033716_821026_FAB72270 
X-CRM114-Status: GOOD (  26.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Krzysztof,

On Mon, 2022-09-19 at 11:27 +0200, Krzysztof Kozlowski wrote:
> On 19/09/2022 10:37, Jianguo Zhang wrote:
> > Dear Krzysztof,
> > 
> > 	Thanks for your comments.
> > 
> > 
> > On Mon, 2022-09-19 at 10:19 +0200, Krzysztof Kozlowski wrote:
> > > On 19/09/2022 10:04, Jianguo Zhang wrote:
> > > > Add ethernet support for MediaTek SoCs from mt8188 family.
> > > > As mt8188 and mt8195 have same ethernet design, so private data
> > > > "mt8195_gmac_variant" can be reused for mt8188.
> > > > 
> > > > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > > > ---
> > > >  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-
> > > > mediatek.c
> > > > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > > > index d42e1afb6521..f45be440b6d0 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > > > @@ -720,6 +720,8 @@ static const struct of_device_id
> > > > mediatek_dwmac_match[] = {
> > > >  	  .data = &mt2712_gmac_variant },
> > > >  	{ .compatible = "mediatek,mt8195-gmac",
> > > >  	  .data = &mt8195_gmac_variant },
> > > > +	{ .compatible = "mediatek,mt8188-gmac",
> > > > +	  .data = &mt8195_gmac_variant },
> > > 
> > > It's the same. No need for new entry.
> > > 
> > 
> > mt8188 and mt8195 are different SoCs and we need to distinguish
> > mt8188
> > from mt8195, so I think a new entry is needed for mt8188 with the
> > specific "compatiable".
> 
> No, this does not justify new entry. You need specific compatible,
> but
> not new entry.
> 
> > On the other hand, mt8188 and mt8195 have same ethernet design, so
> > the
> > private data "mt8195_gmac_variant" can be resued to reduce
> > redundant
> > info in driver.
> 
> And you do not need new entry in the driver.
Do you mean that I can use "mediatek,mt8195-gmac" as compatible for
ethernet in mt8188 DTS file?
> 
> Best regards,
> Krzysztof

BRS
Jianguo


