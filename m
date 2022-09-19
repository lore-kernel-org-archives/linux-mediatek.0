Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27FFECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdUEu1fQsGtzQ+XxXa8k3lP/oiajX1dl1+hD3ovqtYY=; b=AMNCyXPKvdAzfmaLJVMs56J+Tz
	u6R3H0FjZwG9ja/Wu4JwxOJys1HtLdd+cktS/tU/NfW9S+KBaab992x1L+2tH7tkwd0JeSlnHx8RS
	QFzuglX9pAT14A0WRkrBcUbVBzmMoIcSPAV55U7Md0DPYztyPdDC49pY5t0f6EsfIOvIpaEJmb3RA
	7D4G2hpCA4D8+uPpaJ8vXcJBAUEzLN6e42Ma/r8cOYV18Bt8kP/z8SR6pLlj/kW3fIBJmH1HzC5If
	GztOiI9qbshUTuLM7lmDSg0mWZ77rOiLXW/522GVV5DpzXV+4+hm8Z5BryPi3oJ5SyNnP/89sxUlE
	GdL2SLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCIV-00ACZq-D9; Mon, 19 Sep 2022 08:38:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCIO-00ACNW-Fx; Mon, 19 Sep 2022 08:38:33 +0000
X-UUID: bbf9a1c0a4e14add9c70e88350929cdb-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mdUEu1fQsGtzQ+XxXa8k3lP/oiajX1dl1+hD3ovqtYY=;
	b=qCnGERSEKmeg4T1Af69maJALmas9iobV7cOdrigtqLAcJ0CrFRrw82B/nvWTgmg/vhYRGXlIB/TcVVh59uVl1yg9mro/Vqtwr+vqiFORfZPFeOZk3KhaDZlMx8Mz1KmqJs49WTLqK5jkOIoYeLcoyeQIKbnei4zKdgGmdjgUWag=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:464ce067-e648-46d3-bfb5-61c356004f04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:5667d918-0314-4ae7-b2d1-7295be49255e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bbf9a1c0a4e14add9c70e88350929cdb-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1253738005; Mon, 19 Sep 2022 01:38:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 16:37:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 16:37:44 +0800
Message-ID: <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
Subject: Re: [PATCH 1/2] stmmac: dwmac-mediatek: add support for mt8188
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Biao
 Huang <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 19 Sep 2022 16:37:44 +0800
In-Reply-To: <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
	 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
	 <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_013828_694316_0FC92B65 
X-CRM114-Status: GOOD (  20.37  )
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

	Thanks for your comments.


On Mon, 2022-09-19 at 10:19 +0200, Krzysztof Kozlowski wrote:
> On 19/09/2022 10:04, Jianguo Zhang wrote:
> > Add ethernet support for MediaTek SoCs from mt8188 family.
> > As mt8188 and mt8195 have same ethernet design, so private data
> > "mt8195_gmac_variant" can be reused for mt8188.
> > 
> > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index d42e1afb6521..f45be440b6d0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -720,6 +720,8 @@ static const struct of_device_id
> > mediatek_dwmac_match[] = {
> >  	  .data = &mt2712_gmac_variant },
> >  	{ .compatible = "mediatek,mt8195-gmac",
> >  	  .data = &mt8195_gmac_variant },
> > +	{ .compatible = "mediatek,mt8188-gmac",
> > +	  .data = &mt8195_gmac_variant },
> 
> It's the same. No need for new entry.
> 
mt8188 and mt8195 are different SoCs and we need to distinguish mt8188
from mt8195, so I think a new entry is needed for mt8188 with the
specific "compatiable".
On the other hand, mt8188 and mt8195 have same ethernet design, so the
private data "mt8195_gmac_variant" can be resued to reduce redundant
info in driver.

> 
> Best regards,
> Krzysztof


