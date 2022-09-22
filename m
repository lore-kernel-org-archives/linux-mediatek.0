Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD960C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6bsX4RBcjvTUrrlX0LGHcO1IxWp0f22mVXpMN7I5ks=; b=v9MJoQpz1llscALWwgxdECYtMJ
	Pd1MSIFsfbRoH1ogj9XBmidHTNGOKlca/uUytDEPGqwvnOtOAUEb30P0WXAvnNMz9v6zOTzhU9Vxr
	82bip3qXKtLWG8VJQxMod2kSFDiLw96075rQ6eeWGJliJj6GGRWMSxH45apgTFhEUtT1goPhLN0k4
	yW+Z6exJgHXhaeUwBuHmdbwy0ZJa+OjYyEUo5kfcNZTPWBc5RRwbmMHOx7UVVWT+WZwTonPf6Hvxi
	LKIBnoa1q1QaFcKLE7GZHENnBvlCjR7y/36+xZYF/UuDzhDeq2dgkSsj4oaOsj0xZvKubSM0oq2kh
	NmOLslMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGm4-00DtxS-LA; Thu, 22 Sep 2022 07:37:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGm2-00DtvH-Cr; Thu, 22 Sep 2022 07:37:31 +0000
X-UUID: c60163bd367544ab9b48fdfc84fc18e5-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/6bsX4RBcjvTUrrlX0LGHcO1IxWp0f22mVXpMN7I5ks=;
	b=ar6zWAYYBLJkZehh1Rk+l9JxNQIrLSyVL2GQNAbvS3Wk2n3eoU8VOOMLDhy95+P8CTZs8U+SX9xX2t7GqghmgsdwQqE+GWxqjGzCoMQrym2Ni6jhgvVhluDc3sFgJBo5mrDrnKDxI4Xa2h6ilprOxwznIxr3rjJGyXMNvEkp4nA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e1815bc7-01c7-4914-b749-85b72b7a3b94,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2d91b5a2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c60163bd367544ab9b48fdfc84fc18e5-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 834626580; Thu, 22 Sep 2022 00:37:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 22 Sep 2022 15:36:57 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Sep 2022 15:36:56 +0800
Message-ID: <9c28de4cef86d706baf92813f5d32cfd1630852e.camel@mediatek.com>
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
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, Biao Huang
	<biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 22 Sep 2022 15:36:56 +0800
In-Reply-To: <821b3c30-6f1f-17c1-061c-8d3b3add0238@linaro.org>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
	 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
	 <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
	 <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
	 <821b3c30-6f1f-17c1-061c-8d3b3add0238@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_003730_465602_B4D351DC 
X-CRM114-Status: GOOD (  24.86  )
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

On Thu, 2022-09-22 at 08:38 +0200, Krzysztof Kozlowski wrote:
> On 22/09/2022 04:15, Jianguo Zhang wrote:
> > Dear Krzysztof,
> > 
> > 	Thanks for your comment.
> > 
> > On Wed, 2022-09-21 at 10:24 +0200, Krzysztof Kozlowski wrote:
> > > On 21/09/2022 09:07, Jianguo Zhang wrote:
> > > > Add clk_csr property for snps,dwmac
> > > > 
> > > > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5
> > > > +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > index 491597c02edf..8cff30a8125d 100644
> > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > @@ -288,6 +288,11 @@ properties:
> > > >        is supported. For example, this is used in case of SGMII
> > > > and
> > > >        MAC2MAC connection.
> > > >  
> > > > +  clk_csr:
> > > 
> > > No underscores in node names. Missing vendor prefix.
> > > 
> > 
> > We will remane the property name 'clk_csr' as 'snps,clk-csr' and
> > another driver patch is needed to align the name used in driver
> > with
> > the new name. 
> 
> You did not say anything that you document existing property. Commit
> msg
> *must* explain why you are doing stuff in commit body.
> 
> We should not be asking for this and for reason of clk_csr.

We will explain the background that why we document 'clk_csr' property
in binding file in commit message in next version patches.
> 
> Best regards,
> Krzysztof
> 
BRS
Jianguo


