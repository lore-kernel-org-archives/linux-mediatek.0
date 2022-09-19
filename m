Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ABAECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6BsuexwRwhOZe8OGcnm44TLSArfjuO8d8MCgdCmbcQ=; b=kMptDNHtd2LtOFN4h/Oflx8AcW
	OOi6C1Jrtgwk/7CtuucoBLxfMH6oRUi64v4SHdFQxd0QIhjU+xkBsb/QpANwglHCi68clhdYi9fJb
	PB7EB/l1nyPWZKk7xGQPYv6yVdL4+63rQJNmNiCX1Yjsm1Z+BdvHX2NEs/WAMw/M1tfsxzHeyIfdD
	1pVInXObXiaTd5rN3GxH7dBwfDwkfH/o6x09TqnDE09WwTQmJwv47yK6L1lSRFKmUc1yWimMqrvtF
	sgxNZ7oQZ3Yt5uyAConjHuyLGe+xrW4b2YszwSNrDYbtfk+4pcIGjvHphAsnve2IrMijs5/e+BRII
	2I8/5ncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBmD-009jrV-Hv; Mon, 19 Sep 2022 08:05:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBm9-009jf2-05; Mon, 19 Sep 2022 08:05:11 +0000
X-UUID: 796e02123fbd42569f9a9e33ec024457-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D6BsuexwRwhOZe8OGcnm44TLSArfjuO8d8MCgdCmbcQ=;
	b=o3dKkxs8y4TI9proGzJ7H59yvowhMv06a9pPoVMB7Z1aPJRph+ZpqYgfJw3NMegzsSiI63GX8nUe8RJ227lMSy4gcimnNIpeQ/Tg4euw233iRl2RaXAlMwqx2RdavPD/Cp/2dpXMNYTaFAyAa1aQZR+FaNKOUTTMhccvfhAiPZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3c3e6808-df4e-4e33-b19d-27765a0ad874,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:c51fd818-0314-4ae7-b2d1-7295be49255e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 796e02123fbd42569f9a9e33ec024457-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 117424424; Mon, 19 Sep 2022 01:04:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 16:04:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Sep 2022 16:04:19 +0800
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
Subject: [PATCH 1/2] stmmac: dwmac-mediatek: add support for mt8188
Date: Mon, 19 Sep 2022 16:04:09 +0800
Message-ID: <20220919080410.11270-2-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_010509_574059_F8E537A3 
X-CRM114-Status: GOOD (  11.54  )
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

Add ethernet support for MediaTek SoCs from mt8188 family.
As mt8188 and mt8195 have same ethernet design, so private data
"mt8195_gmac_variant" can be reused for mt8188.

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index d42e1afb6521..f45be440b6d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -720,6 +720,8 @@ static const struct of_device_id mediatek_dwmac_match[] = {
 	  .data = &mt2712_gmac_variant },
 	{ .compatible = "mediatek,mt8195-gmac",
 	  .data = &mt8195_gmac_variant },
+	{ .compatible = "mediatek,mt8188-gmac",
+	  .data = &mt8195_gmac_variant },
 	{ }
 };
 
-- 
2.25.1


