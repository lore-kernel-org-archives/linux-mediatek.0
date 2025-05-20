Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B69C3ABDD
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 May 2025 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VXNWF5d42ExcW7fSb5Pp8BqxYkRqWCdR/2Uwti83pgs=; b=k8nulRxsKKh+lXjHWENP4jp7+o
	pEDuLgLZktJER010YV74bL9lrM1oUQSBKFAOGNQ1edz5khBdJ8OD6uOCOAoJVF9XWhyRbPLF59OdP
	QiQTI3TwJ2DJBa1CQLlDtysfw4lMf7m++D80TysKq3OwNBXmYpBDhLSZURtVdbSCdq/lXGT9uVNXR
	VSe7NjRRHmJIH7c/5R/iGKJkt9fy9yizJ+oZjME0dcfLwcUlPTzmBgsClwThRv3b2kEOgjfypGLop
	slHae9d4voA1OeYbqCwCH2PvAQlvfXK6KlMBcJbH0EuOrOrQKNT9fMn3hsaT1EHWL5A84RzlHVPL6
	lX4m5KLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHO6q-0000000DBuA-0NHE;
	Tue, 20 May 2025 14:38:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHO2K-0000000DAwK-2vfT;
	Tue, 20 May 2025 14:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 773FBA4EB3B;
	Tue, 20 May 2025 14:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA936C4CEE9;
	Tue, 20 May 2025 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747751623;
	bh=UQfJvh5021ymW/G9gh8EoO5JxCDWd0uvGKSwEiCv7E0=;
	h=From:Date:Subject:To:Cc:From;
	b=aQ+9q0fJXMJ5lhQGGKqFh6loEs0vjEb6JRqQQ5HsCoHvFfDZLI16YBJz0tutRCM3F
	 jCgySkrVHzmVJEPK13z5akCdb/IH66xjUKCxxxCp3nl76laRzsvYEEMJtBiNgIYHW/
	 ck2j5KHcbe0Mb4He57DsNDw80uLol8KERhGPire9X24KCs5oSSCZ2aYpiqCK7XefYJ
	 gXi+IwmPZNZf3mEjtCclQRmaL6XmtQqD03EN2C0MZPspPBcolP2QdcJABVkvjg73ZF
	 OI6hdwF0MYYvT6ptoLHaINQgLLLbFBD/ts4WtYXqWUue2P3O+Lv2Oo65na/u600bnx
	 Uvb6XyGha8GqA==
From: Simon Horman <horms@kernel.org>
Date: Tue, 20 May 2025 15:33:33 +0100
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: Correct spelling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-mtk-spell-v1-1-2b0d5b4a4528@kernel.org>
X-B4-Tracking: v=1; b=H4sIALySLGgC/x3MQQqEMBAF0atIr22IjYp6FXERxz/aqFGSIIJ49
 wmzfFDUQwFeEajLHvK4NOjhEoo8o89i3QzWKZnESGUqMbzHlcOJbeNxktKiltY2llJ/enz1/r9
 6cojscEca3vcHWMSozGUAAAA=
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_073344_880717_93BC76D8 
X-CRM114-Status: GOOD (  11.40  )
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

Correct spelling of platforms, various, and initial.
As flagged by codespell.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
 drivers/net/ethernet/mediatek/mtk_wed.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 2d4b9964d3db..6f72a8c8ae1e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1178,7 +1178,7 @@ struct mtk_reg_map {
 };
 
 /* struct mtk_eth_data -	This is the structure holding all differences
- *				among various plaforms
+ *				among various platforms
  * @reg_map			Soc register map.
  * @ana_rgc3:                   The offset for register ANA_RGC3 related to
  *				sgmiisys syscon
@@ -1278,7 +1278,7 @@ struct mtk_soc_data {
  * @mii_bus:		If there is a bus we need to create an instance for it
  * @pending_work:	The workqueue used to reset the dma ring
  * @state:		Initialization and runtime state of the device
- * @soc:		Holding specific data among vaious SoCs
+ * @soc:		Holding specific data among various SoCs
  */
 
 struct mtk_eth {
diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index e212a4ba9275..351dd152f4f3 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2000,7 +2000,7 @@ mtk_wed_configure_irq(struct mtk_wed_device *dev, u32 irq_mask)
 		if (mtk_wed_is_v3_or_greater(dev->hw))
 			wed_set(dev, MTK_WED_CTRL, MTK_WED_CTRL_TX_TKID_ALI_EN);
 
-		/* initail tx interrupt trigger */
+		/* initial tx interrupt trigger */
 		wed_w32(dev, MTK_WED_WPDMA_INT_CTRL_TX,
 			MTK_WED_WPDMA_INT_CTRL_TX0_DONE_EN |
 			MTK_WED_WPDMA_INT_CTRL_TX0_DONE_CLR |
@@ -2011,7 +2011,7 @@ mtk_wed_configure_irq(struct mtk_wed_device *dev, u32 irq_mask)
 			FIELD_PREP(MTK_WED_WPDMA_INT_CTRL_TX1_DONE_TRIG,
 				   dev->wlan.tx_tbit[1]));
 
-		/* initail txfree interrupt trigger */
+		/* initial txfree interrupt trigger */
 		wed_w32(dev, MTK_WED_WPDMA_INT_CTRL_TX_FREE,
 			MTK_WED_WPDMA_INT_CTRL_TX_FREE_DONE_EN |
 			MTK_WED_WPDMA_INT_CTRL_TX_FREE_DONE_CLR |


