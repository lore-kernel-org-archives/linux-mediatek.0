Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A0DEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B15sksH76SkHgQdEWVy6xLiMIraCMaM5vx8Ai35ldxY=; b=L3wo0q4JfCjVMqRCegIT4h93B4
	eo/JAs96QSSGR62vt/GelW5sNOkbWELDNFynZSljWK+f52H/uftz3wS+X/DqZQf/V7sCb+b9yooQh
	c4b8J4TCQLaUBCZlz/GsDPqBCYFEUrJ+fKyY+S6I0ZVF5vIRIfACysdMzZgCNQLcK1pZ2ShnKCJRu
	xPpIJvKOQitt2VVUJ7yoocBEN4CoAp/73hwQCCMMGD9UcPz4Qz5KR19D0DUvSADFAyXd8obgY+X1k
	cPZONY+cac3ZclE+fQhjI2KUbeqtCL3VVZVDzJ9VV3nAAJW0dL4id73xJ+p9drYoutyx9pi+88UJD
	/SQadxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlvB-001iFT-1A;
	Thu, 13 Jul 2023 02:19:09 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlv8-001iEM-0L;
	Thu, 13 Jul 2023 02:19:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJlv6-0005XJ-1Y;
	Thu, 13 Jul 2023 02:19:05 +0000
Date: Thu, 13 Jul 2023 03:18:52 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH v2 net-next 4/9] net: ethernet: mtk_eth_soc: increase
 MAX_DEVS to 3
Message-ID: <2cc8012ec538106c6bcf22a40b647ec342e687a8.1689012506.git.daniel@makrotopia.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_191906_147630_D4844B87 
X-CRM114-Status: GOOD (  16.15  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

This is a preliminary patch to add MT7988 SoC support since it runs 3
macs instead of 2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 +++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7014e0d108b27..7f191e4337dd8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4030,8 +4030,12 @@ static void mtk_sgmii_destroy(struct mtk_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < MTK_MAX_DEVS; i++)
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		if (!eth->sgmii_pcs[i])
+			continue;
+
 		mtk_pcs_lynxi_destroy(eth->sgmii_pcs[i]);
+	}
 }
 
 static int mtk_cleanup(struct mtk_eth *eth)
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index c74c3918113a5..b18ce4430d437 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1049,8 +1049,8 @@ struct mtk_soc_data {
 
 #define MTK_DMA_MONITOR_TIMEOUT		msecs_to_jiffies(1000)
 
-/* currently no SoC has more than 2 macs */
-#define MTK_MAX_DEVS			2
+/* currently no SoC has more than 3 macs */
+#define MTK_MAX_DEVS	3
 
 /* struct mtk_eth -	This is the main datasructure for holding the state
  *			of the driver
-- 
2.41.0

