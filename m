Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7422CC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 06:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zodG3TIj/bxvoQArJAAN1YPKHEtL0GfJ0B9pLll9oSI=; b=rZYiR/AggBxs5KIgc8zTwM2STc
	w1/6Hxcat4eoPbkzQ6SSlvbFK0LCil37s4Snw6uISJGwPBY+O1uaR3LD8b+WXRPy7u93gspTNWnCg
	M+4ZYJA9/G+MB4NnZvkrpwhJhhyYZiicqpknQjjrk36QdlHSdU8VlI5rC0+cWAc06wUfwyWJn2Mkf
	CphrqgY7O/th/H0147ZeNDtoTi/LvBkbfBP/ozAQsDfxbStRzRMlzaRSZ+KyqOHdeacSxUs6xxLHs
	HAY98wi+U5JG5Dcxn0DUXK1wJLGodDxhhWtB9QkswBDAtdEwdYbHjyIOSqEfX1bgAhU7R7dhKoOZj
	C6GDcNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obbmS-002NPp-9B; Fri, 23 Sep 2022 06:03:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obbmQ-002NOO-1b; Fri, 23 Sep 2022 06:03:19 +0000
X-UUID: 23d165147fee420594919670888ae51e-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zodG3TIj/bxvoQArJAAN1YPKHEtL0GfJ0B9pLll9oSI=;
	b=fILl0P663EdWcu2dytwg9tnH510Ui+nelhjvtbaNgT091OfoYjKWbswQACBk1ZApxcxUHQRcPylpcSuyrmWlBjycYHhpxyrdBfDzqW6den4vwnuOWD8Dn0/wFwWQOqKGKIuMKPdXgA1UmbnHUF9vGgWd+wLm8ivkb4Z43FSLTmg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8417e9d0-9307-480c-90ec-529fef66036e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:4580d2a2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 23d165147fee420594919670888ae51e-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 798555463; Thu, 22 Sep 2022 23:00:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 13:28:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Sep 2022 13:28:44 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
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
	Jianguo Zhang <jianguo.zhang@mediatek.com>
Subject: [PATCH v5 3/4] arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
Date: Fri, 23 Sep 2022 13:28:27 +0800
Message-ID: <20220923052828.16581-4-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_230318_114811_E8045AFD 
X-CRM114-Status: GOOD (  11.05  )
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

Update the name of property 'clk_csr' as 'snps,clk-csr' to align with
the property name in the binding file.

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 4797537cb368..e6d7453e56e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -756,7 +756,7 @@ eth: ethernet@1101c000 {
 		snps,mtl-tx-config = <&mtl_tx_setup>;
 		snps,txpbl = <1>;
 		snps,rxpbl = <1>;
-		clk_csr = <0>;
+		snps,clk-csr = <0>;
 		status = "disabled";
 	};
 
-- 
2.25.1


