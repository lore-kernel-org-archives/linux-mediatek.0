Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A869C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSa/p/zpHyX4lGO/pfARnTvy0LVC/OySswcI+oOiq+w=; b=dOcAtCCNd+tddisLI+H2zqSioA
	y5jXj05vnxYSkd6kBNyWSQ/xIAVw4+e2qF0mKGsLuDYAoIbxD7XdmCjEF6SIB9cQ5Zq0NZzbRCo0+
	6MqQpkRRyLAGVvlzEbtKAtHcZ6xGfO2ZggI7VYdgFw9BzPLcDnflrqr1fGgHI8cBBYkkb6/XeIe7h
	cK+ysAa1D4xl1INiomzPM7RgIvfbUiihq+0gAGWjHY0FQ+8yJVyWLorhkT5UrOhaPCCjoUEoIPEaD
	0K4y7f0mOA0CFVlMcI/1dIDlDuhAz2nQ17M3+qMq6+sK6SyVRdzbQbIWXMbcDQWjGwO1C6CfUVYuU
	kXUsM3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6Ex-009HPp-2i; Tue, 27 Sep 2022 08:46:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6Cm-009G0s-RB; Tue, 27 Sep 2022 08:44:42 +0000
X-UUID: 754b163061984b04b2f549543b19cbe1-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=CSa/p/zpHyX4lGO/pfARnTvy0LVC/OySswcI+oOiq+w=;
	b=o/60iJHrOk9YoguZchqif/wc6aJLOzd7K7XAhtR4J8THKkgxNZkBVo23xWnuPck2ZpNMAfzwtcWWxWhWT+gTOTKuZvL0V9UqF8UxnmQYsKc9WaF87I+RIBi47y0ZqehxSjidPHgPEazf95yzjyUZvesMN5MroXiWJu/nD/xIBtU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:4ebd57f7-1f1f-4e71-9e9e-f62532ced255,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:4ebd57f7-1f1f-4e71-9e9e-f62532ced255,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:ec4f5ee4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:2209271643576FUGZFGP,BulkQuantity:4,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 754b163061984b04b2f549543b19cbe1-20220927
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2065645319; Tue, 27 Sep 2022 01:44:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 16:43:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 16:43:53 +0800
Message-ID: <5d0980dd11afdd948059bcf9afa2484e5ee97bec.camel@mediatek.com>
Subject: Re: [PATCH v5 4/4] net: stmmac: Update the name of property
 'clk_csr'
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, Biao Huang
	<biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 27 Sep 2022 16:43:53 +0800
In-Reply-To: <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
	 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
	 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
	 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
	 <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_014440_964477_30B7ADCB 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, 2022-09-23 at 20:15 +0200, Krzysztof Kozlowski wrote:
> On 23/09/2022 20:14, Krzysztof Kozlowski wrote:
> > > This is going to break MT2712e on old devicetrees.
> > > 
> > > The right way of doing that is to check the return value of
> > > of_property_read_u32()
> > > for "snps,clk-csr": if the property is not found, fall back to
> > > the old "clk_csr".
> > 
> > I must admit - I don't care. That's the effect when submitter
> > bypasses
> > DT bindings review (81311c03ab4d ("net: ethernet: stmmac: add
> > management
> > of clk_csr property")).
> > 
> > If anyone wants ABI, please document the properties.
> > 
> > If out-of-tree users complain, please upstream your DTS or do not
> > use
> > undocumented features...
> > 
> 
> OTOH, as Angelo pointed out, handling old and new properties is quite
> easy to achieve, so... :)
> 
So, the conclusion is as following:

1. add new property 'snps,clk-csr' and document it in binding file.
2. parse new property 'snps,clk-csr' firstly, if failed, fall back to
old property 'clk_csr' in driver.

Is my understanding correct?

> Best regards,
> Krzysztof
> 
BRS
Jianguo


