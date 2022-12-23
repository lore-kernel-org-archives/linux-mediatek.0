Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E10EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 02:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BseEKJDeDeZ7+Gz+rMrpO4HRXtkR+aAiH33ITZwHI4k=; b=NH3bVuqSFkDipCxNuejW5Ff7sh
	AAm+7HMyxl/43T/TkqdzL3Rn8dJuB0fLJbXVH5HgddTl1rNuocZrhq1GXTiO8m04QWgaVLOqp8fbP
	OOIia3KxneU59qWMpVM1a5B2l+cpAYQ11mZEQw/HvlPjmdmRyF4HACMf+1ZsXPPhB6trCNNbBVSih
	1QIkk4+skIMIHUdHfZ8og+uV0uk1I2GTUaX3uZhT4EVzuTdFV5ygRJ8V0+hlXtyyHOkx2NoaH+Dbj
	L5Sxwaxej25z3UBeNO6L2k9VFo9mJJJnccEXkBnfiOtVyDkwWhNecdyT2GlJBEf6hSMjjQedKtn3R
	UW65NoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XqO-0024ss-Nm; Fri, 23 Dec 2022 02:31:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XqF-0024mn-Ss; Fri, 23 Dec 2022 02:31:25 +0000
X-UUID: 9f84268e670c49b38a6edfcb03929381-20221222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BseEKJDeDeZ7+Gz+rMrpO4HRXtkR+aAiH33ITZwHI4k=;
	b=dY5fXjC/KHfMz9V+Z2TNxVKKDOWtSaLbz07FHlHKeQ53qEyow+7HR8Ee2Yj3En7NtVzx1tohuF5LDD6cYtYVdyHh1Qcl7gZqVoiajn7/sORJGX6qeOn2Y96SZLOFopXe2PzeO10PnozdEk7/iiFbO7LBSZbi/K2UxJYCVxBaa2s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:667a7e1d-c173-4938-b12e-5c2373c0bf2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:91752a8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9f84268e670c49b38a6edfcb03929381-20221222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 257220090; Thu, 22 Dec 2022 19:31:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 23 Dec 2022 09:50:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Dec 2022 09:50:40 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Biao
 Huang" <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [PATCH v5 1/2] stmmac: dwmac-mediatek: enable 2ns delay only for special cases
Date: Fri, 23 Dec 2022 09:50:28 +0800
Message-ID: <20221223015029.24978-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223015029.24978-1-biao.huang@mediatek.com>
References: <20221223015029.24978-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_183123_988466_0181CF73 
X-CRM114-Status: GOOD (  12.65  )
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

In current driver, MAC will always enable 2ns delay in RGMII mode,
but that will lead to transmission failures for "rgmii-id"/"rgmii-txid"
cases.

Modify the implementation of fix_mac_speed() to ensure the 2ns delay
will only take effect for "rgmii-rxid"/"rgmii" cases, then user can
choose phy-mode freely.

Fixes: f2d356a6ab71 ("stmmac: dwmac-mediatek: add support for mt8195")
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index d42e1afb6521..cde4fb81d596 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -447,7 +447,9 @@ static void mt8195_fix_mac_speed(void *priv, unsigned int speed)
 {
 	struct mediatek_dwmac_plat_data *priv_plat = priv;
 
-	if ((phy_interface_mode_is_rgmii(priv_plat->phy_mode))) {
+	switch (priv_plat->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
 		/* prefer 2ns fixed delay which is controlled by TXC_PHASE_CTRL,
 		 * when link speed is 1Gbps with RGMII interface,
 		 * Fall back to delay macro circuit for 10/100Mbps link speed.
@@ -462,6 +464,9 @@ static void mt8195_fix_mac_speed(void *priv, unsigned int speed)
 					   MT8195_RGMII_TXC_PHASE_CTRL);
 		else
 			mt8195_set_delay(priv_plat);
+		break;
+	default:
+		break;
 	}
 }
 
-- 
2.25.1


