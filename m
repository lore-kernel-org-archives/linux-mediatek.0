Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D381C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWBKd6s+alHmuqMW7zBzYd2csWJfir6MkKHpoQDs4cg=; b=RdfquDidXE95xPadJB8G+9rKvb
	rK0B63n/ifJ0eDwxF7MU+IGUi0ENJENMYBS3BsbpmdCtDfGkxiJppxeLIpOG+7fmnn79dhvBNdrf4
	vhm9iwmqwkOax4RHCReFX4AYG8lIpp6Cy0UciXAzwnv7zoEn8byC4kVny3acbbmdGO+yeEpNzC5bn
	pXv7PfxHGSSDcSq3HtyhvGXyyJdJJdW50ohpg7V3bxCKclDM30sEmD5iwdhm5IA0sYeK+wILNJah6
	/KIj+oityb7nZhQp9tXU8fow/YTc0FBP2LDHQLqhdHURKFK/cBAKjGpRg7l87Ypjx9zkoNVa5ep2B
	gVp7ftfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6I9-009IhO-6g; Tue, 27 Sep 2022 08:50:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6I4-009IeZ-6G; Tue, 27 Sep 2022 08:50:09 +0000
X-UUID: 13e9ac5de29745adaed32e0088d90435-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PWBKd6s+alHmuqMW7zBzYd2csWJfir6MkKHpoQDs4cg=;
	b=Ry/6IipgkSU2hqtXGAVjuy+5b5xKfu8wglUEzfr25o/dRZNXDRdrpfArD37Q0c7f24lLrXcY8AdAyJF7tvOW6Gkp1z5HrlGZD8Y7nk99nIf+dxBrOBkWeJ5dOmohV/tOzja0ZcyL9//6S7HvkQQNNFwyRI7EzHI+Bd4AowS9IHk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:64f9ea3c-45d1-4087-91c4-3f207fa5f2e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:cc1a2a07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 13e9ac5de29745adaed32e0088d90435-20220927
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 46199577; Tue, 27 Sep 2022 01:50:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 16:49:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 16:49:27 +0800
Message-ID: <eb6a70844b067f76e8405b937de9408045d569a0.camel@mediatek.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: net: snps,dwmac: add clk_csr
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
Date: Tue, 27 Sep 2022 16:49:27 +0800
In-Reply-To: <a215ae81-10de-7880-1a15-b7b08d0d80d7@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
	 <20220923052828.16581-3-jianguo.zhang@mediatek.com>
	 <a215ae81-10de-7880-1a15-b7b08d0d80d7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_015008_293200_6D074A3A 
X-CRM114-Status: GOOD (  13.08  )
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

On Fri, 2022-09-23 at 20:11 +0200, Krzysztof Kozlowski wrote:
> On 23/09/2022 07:28, Jianguo Zhang wrote:
> > The clk_csr property is parsed in driver for generating MDC clock
> > with correct frequency. A warning('clk_csr' was unexpeted) is
> > reported
> > when runing 'make_dtbs_check' because the clk_csr property
> > has been not documented in the binding file.
> 
> Your subject is not accurate anymore. Maybe mention that instead of
> existing clk_csr, you add a different property.
> 
> With commit msg fixes:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
We will fix commit message in next version patches.

> Best regards,
> Krzysztof
> 
BRS
Jianguo


