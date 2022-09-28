Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFFEC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwoK02CzcRXYuVBHLmRnxHj3TbaimYu3fl7cDpF224A=; b=MGAmgJaqlIgCENTFs1Bgv3DvRu
	rAqJw5rQZzWw8W1BTppfj5Hdtikrx4Bx/kOdYuzsBth8zmS6HfBRDKa/jKcav4IciVM6VPll1xBY7
	sQ/6us3B49lQ68jwrMcfjuK5QIv/kaHMlJie8TyhF1PSPufPyusgialCMGq3W3SviXkkFeXAGFhlE
	aDEpyQ2mdelzWC2yJoT8pkfAplOGtraKksZNljTzKacZenc7PBzq1j0tVnRaqBxxYi2DUylsKUD9L
	cKNEeCloJIzP9NpI+T1/+7icS+rHTq1G+GzDhREbK8/nTfebujSrqChJVN2Rm5TQcrBYK4sTrePky
	Kn0Qgs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTg8-00FMuk-V1; Wed, 28 Sep 2022 09:48:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTdS-00FLEq-IQ; Wed, 28 Sep 2022 09:45:48 +0000
X-UUID: 02be59d4f65843928f124617b3a44ff4-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KwoK02CzcRXYuVBHLmRnxHj3TbaimYu3fl7cDpF224A=;
	b=VupbKGWfQIiW+MIkboqnozd2aW6VGkWTLU68IpC/O0JF+Dj8ke4IZfFMiS/oxJCGeKonO+M2Q6Wt49Zo0egI4bIaYcRYUeAb0aqy1qi+CV3wT0V+Yx60Me2lBCz9sUDtk16kYTIMv1AonJw7ui86Exq58pklkp3HHIKBbBKTfEk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6dee59a7-82ac-4f72-89b7-4b233d9d8dd9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:a84d83e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 02be59d4f65843928f124617b3a44ff4-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1767060042; Wed, 28 Sep 2022 02:45:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 17:23:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 17:23:15 +0800
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
Subject: [resend PATCH v6 4/4] net: stmmac: add a parse for new property 'snps,clk-csr'
Date: Wed, 28 Sep 2022 17:23:08 +0800
Message-ID: <20220928092308.26019-5-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_024546_657751_3CEB4E4B 
X-CRM114-Status: GOOD (  12.06  )
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

Parse new property 'snps,clk-csr' firstly because the new property
is documented in binding file, if failed, fall back to old property
'clk_csr' for legacy case

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 9f5cac4000da..3db6cb0b6124 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -444,7 +444,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	 * or get clk_csr from device tree.
 	 */
 	plat->clk_csr = -1;
-	of_property_read_u32(np, "clk_csr", &plat->clk_csr);
+	if (of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr))
+		of_property_read_u32(np, "clk_csr", &plat->clk_csr);
 
 	/* "snps,phy-addr" is not a standard property. Mark it as deprecated
 	 * and warn of its use. Remove this when phy node support is added.
-- 
2.25.1


