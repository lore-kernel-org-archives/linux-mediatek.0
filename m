Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56850C32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSyECJmHSA/82hGI9rjL6xr8zQtVBlH0c/3uRbHeI0I=; b=Q3yizOxgc3wvjDUHqNhKJRX0JB
	g/WzK6MoYMsQVudb7HiGAZmYMNP/SaC9xBiM5NlAyEhmfAV+QYD5BqZknyOTGHC8DDoLtx+N/sPBf
	nojujBED3ubno7N9nyljJdKLwzM05m+tdmoHQt6o11CzFQbU6fSSNVlZGCYvq/PAqpNLIU9y75AF7
	CrrOFhd8gaQJRzO42nsj1mw6QfgjjARCqvEdj0k0Zv4RREDhtcQLsa3bTNmRESVrmS/xqyT9/Yn4s
	eSK9uYXh3BxQzKxKvXtBsLRBSP1JADW88oDEHmiRXJyZ6+KHoz+IMxlubWBVwFcckyZHw/IOMhih0
	oMBVx7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBrO-00D8bl-K3; Thu, 22 Sep 2022 02:22:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBrL-00D8ap-NX; Thu, 22 Sep 2022 02:22:41 +0000
X-UUID: dd963132da304a5fb879541ce7c84bda-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jSyECJmHSA/82hGI9rjL6xr8zQtVBlH0c/3uRbHeI0I=;
	b=p+lf44+Lio1fo5R0xsSI1aO1zk+It3e1WbfJLnCdI6QJBcdjStsbwMdGKuzdWkvAOgWy6YUE3NqpH58xbWFd+r3h6LSehecE9dYYRe/Zv26JQGpu1+6S2aRVXvjh3WXJjNthAT7sbpkquuGHNPhBuye7sVc90Vzg3/HAUENerKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:238cd724-6052-4897-b0c7-c2e700b07c5d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:238cd724-6052-4897-b0c7-c2e700b07c5d,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:09c1795e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:220921162412WQNVHANJ,BulkQuantity:70,Recheck:0,SF:28|17|19|48,TC:nil
	,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: dd963132da304a5fb879541ce7c84bda-20220921
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1237428568; Wed, 21 Sep 2022 19:15:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 10:15:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 22 Sep 2022 10:15:22 +0800
Message-ID: <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: snps,dwmac: add clk_csr
 property
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 22 Sep 2022 10:15:22 +0800
In-Reply-To: <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
	 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
	 <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_192239_810314_46B09765 
X-CRM114-Status: GOOD (  19.83  )
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

	Thanks for your comment.

On Wed, 2022-09-21 at 10:24 +0200, Krzysztof Kozlowski wrote:
> On 21/09/2022 09:07, Jianguo Zhang wrote:
> > Add clk_csr property for snps,dwmac
> > 
> > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 491597c02edf..8cff30a8125d 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -288,6 +288,11 @@ properties:
> >        is supported. For example, this is used in case of SGMII and
> >        MAC2MAC connection.
> >  
> > +  clk_csr:
> 
> No underscores in node names. Missing vendor prefix.
> 
We will remane the property name 'clk_csr' as 'snps,clk-csr' and
another driver patch is needed to align the name used in driver with
the new name. 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Frequency division factor for MDC clock.
> 
> Can't common clock framework do the job? What is the MDC clock?
> 
MDC clock is used for ethernet MAC accessing PHY register by MDIO bus.
There is frequency divider designed in ethernet internal HW to ensure
that ethernet can get correct frequency of MDC colck and the vlaue of
frequency divider can be got from DTS.
> Best regards,
> Krzysztof

BRS
Jianguo


