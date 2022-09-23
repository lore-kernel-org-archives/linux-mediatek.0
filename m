Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0AAECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 03:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1k5TOoyEcepapXTo6DfuMdGwBHBkldYi/XOn9F6EwJA=; b=JiI9NRiDDHVfgDmzEa+c9ab8J9
	BGU+3i2cvvE222VpDk1AXXVQ6OJ0ok9Jx3HeLpVeKbNdhYVIWGprjH8Q5VIfbJLx4SagzWxIffiab
	ZEsxBrsaPz4tMgjGQroIbmOH/D3ZeQqioH2eYDoDMskuGB1SJVdMZPq2FnQg1kxkMwrTGIMPjwmuU
	ayQKkEa8iiWK7DufVsMfTu+OrHLbRZAqDP3qcDqiHpSbkt40FRsOBNMzTVGSzt2bASfvdDIp8KjXq
	nzT0jJaqSW/FCIBQMl9EFEVlpCVPh7LOzhBHetttym+ZiRWFKRoNP3aWt/bmv1TJf00NxNmh6viul
	iXJGAw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obZfP-001oVj-OL; Fri, 23 Sep 2022 03:47:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYLC-001KRs-Kx; Fri, 23 Sep 2022 02:23:03 +0000
X-UUID: 77d66b2c94c74fe2a41c3261bebfc2c5-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1k5TOoyEcepapXTo6DfuMdGwBHBkldYi/XOn9F6EwJA=;
	b=cJ+ZvhgPTPLkgEOCChkcJUHphHkjgYfz96qfeW7o/jPDakKFTB4u+XkKL7Ki+WC+OsuSY9WZUdSuVsoAspOsCCebkCS6gcXce88rNvRGNfkmKmk9uKtVpLmK5m1xjA/Z6RdrMIPI86VQszdEMMH6EuJ8FRCMeUus1lU+lDrAprA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:af439cc2-1494-47cc-8689-1d948bbcb655,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e6c5bd06-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 77d66b2c94c74fe2a41c3261bebfc2c5-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1298137541; Thu, 22 Sep 2022 19:19:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 23 Sep 2022 09:48:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 09:48:28 +0800
Message-ID: <8007b455dd18837c06ab099a6009505e7dddc124.camel@mediatek.com>
Subject: Re: [resend PATCH v4 2/2] dt-bindings: net: snps,dwmac: add clk_csr
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
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Christophe Roullier <christophe.roullier@st.com>
Date: Fri, 23 Sep 2022 09:48:28 +0800
In-Reply-To: <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
References: <20220922092743.22824-1-jianguo.zhang@mediatek.com>
	 <20220922092743.22824-3-jianguo.zhang@mediatek.com>
	 <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_192258_839116_601EE489 
X-CRM114-Status: GOOD (  17.53  )
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

On Thu, 2022-09-22 at 17:07 +0200, Krzysztof Kozlowski wrote:
> On 22/09/2022 11:27, Jianguo Zhang wrote:
> > The clk_csr property is parsed in driver for generating MDC clock
> > with correct frequency. A warning('clk_csr' was unexpeted) is
> > reported
> > when runing 'make_dtbs_check' because the clk_csr property
> > has been not documented in the binding file.
> > 
> 
> You did not describe the case, but apparently this came with
> 81311c03ab4d ("net: ethernet: stmmac: add management of clk_csr
> property") which never brought the bindings change.
> 
> Therefore the property was never part of bindings documentation and
> bringing them via driver is not the correct process. It bypasses the
> review and such bypass cannot be an argument to bring the property to
> bindings. It's not how new properties can be added.
> 
> Therefore I don't agree. Please make it a property matching bindings,
> so
> vendor prefix, no underscores in node names.
> 
> Driver and DTS need updates.
> 
We will rename the property 'clk_csr' as 'snps,clk-csr' and update DTS
& driver to align with the new name in next versions patches.
> Best regards,
> Krzysztof
> 
BRS
Jianguo


