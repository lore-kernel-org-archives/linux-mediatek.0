Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DEBECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+SQybGqqP70WeluDFjb9PRoBalSlPkIRRoVy+auTYjM=; b=gtpTNAzXgBIBfr0CIo/kodFMoI
	kxovOePb6wO7SDdYXYutS8cuQxQdyICTDNqc1rF6Ljrr5xe4NXWObR1Qid/Fy8cyWi9UQ7TKsFeFq
	qdv+IgzWtKKwQnp8/e/h3CgpQ8qXM6+DUUkKft2iNEZBb++mlljHP52jQSDO6R9uFtZSpKJ/gONrY
	wpO4/D2nSSEITx19IJEcvjeMCyMb1v2Ggw+L/JKjzdt5u5Qy9R1JCViFCW1Y/itbRho4O6i/IVhcD
	yfzi78gOT7qOZRfw4gtMZs70T/8HJgcEKg+QnZxD8VP8n63u67/AXefYNC/2smCfURZXhrB5ruI9S
	Zj08ixWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDLD-00AvIZ-Qk; Mon, 19 Sep 2022 09:45:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCF2-00A9lZ-UH; Mon, 19 Sep 2022 08:35:17 +0000
X-UUID: ef9b5a51bdc644bb920269b06a69e4cd-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+SQybGqqP70WeluDFjb9PRoBalSlPkIRRoVy+auTYjM=;
	b=oRPJODa66QW8ROkckDmzZpiiWasFG5zlugbkuEBA7kZg7c/KSPnrZL2LWfcort7rtH0f2vWy9idGNWMfuNLrgi8UVxv2O+OE0zzaY6fUY8HcOnNskjle6s4857/Kkzb60uHFvic+VaZl+xeHCaDRmKfFJddwVlhdkaPGl9ImFrE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:74229935-fdd0-4e53-9e21-ae4d6837c1e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:fe47d918-0314-4ae7-b2d1-7295be49255e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ef9b5a51bdc644bb920269b06a69e4cd-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 5784537; Mon, 19 Sep 2022 01:34:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 16:04:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Sep 2022 16:04:18 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Biao
 Huang" <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jianguo Zhang <jianguo.zhang@mediatek.com>
Subject: [PATCH 0/2] Mediatek ethernet patchs for mt8188
Date: Mon, 19 Sep 2022 16:04:08 +0800
Message-ID: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_013501_278771_863EABD2 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

This series includes 2 patchs:
1. add ethenet driver entry for mt8188
2. add binding document for the ethernet on mt8188


Jianguo Zhang (2):
  stmmac: dwmac-mediatek: add support for mt8188
  net: dt-bindings: dwmac: add support for mt8188

 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c      | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

--
2.25.1



