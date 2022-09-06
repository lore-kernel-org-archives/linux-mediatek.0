Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538B4ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rc3GAQ3bwHZ4N6A/wab5rPZONYkkHJDzLwcLV5v43f4=; b=o4o0BmBLQWvA+ACeaJx0se2s74
	E3BIVxAH08b6Qz8/AZ6RXFvSpt6YMbP5eYmhObuE4j5AVFPjbiS4MQ405DitEul1ZzHmOoDel23ho
	oUSK7sFLxy89Aevuw7PI0C7kL5/PPqGvJyDzMcszMoOogSmSManboQRGNw/SDQFRNfl431BERA+MA
	qfPimvX1KGgbFBxqkIRl2gFgmbJ3ptcLW17+hO2ZbJxGmJcc5YRuJq1ePqSVbSXMC4qivIsinUU+t
	FsMlo1sIelci7qfffp5oEmL5FKS/sBHHG9DOCFxkVLmPlkCfN/1XPVFBl7jnqZFfAWZD4k3Zts8I6
	vjlXEzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaSm-00Em9u-3l; Tue, 06 Sep 2022 15:26:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZhC-00EMtQ-VJ
	for linux-mediatek@lists.infradead.org; Tue, 06 Sep 2022 14:37:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C22CA6134E;
	Tue,  6 Sep 2022 14:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8300C433D7;
	Tue,  6 Sep 2022 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662475017;
	bh=XRL315MAyOCfgp7sMWqBqs6KwVLvXbXCAZ47y0frCXA=;
	h=From:To:Cc:Subject:Date:From;
	b=kB32FJVm4R9Okt3CwKgk8fekAYOeRDxFGmyaiergN1oM215KgguvHmR1bJUDQVZGA
	 7sd8FntlwN4RIxMWQl2xh/dldqUgIjZcgI8bK5bXNMegHWezOh0IkcOCIZkOcts0k0
	 aO35aAo1LGF7fNbr1t0fW+rZUugFeC94A36B/pSPIgtvWYA+irhNUfZZRVTeFQtpnm
	 qP9GUQ5sM9fo63gMOO/OdnWRInu8opaYX9BxciT9B80feQZ0xsFkmXK4s5KxRGG+lP
	 iXDzVgoAJzHewQCfFzArXSvlrS0wuGEW9YrNItBnmCUnr3jJiZ/PZConqGrCaVmz1C
	 oxeIdlW8t/uFA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear
Date: Tue,  6 Sep 2022 16:36:32 +0200
Message-Id: <6fb6f748b78faba37702f4757e5b3fb279eaf5ed.1662474824.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_073659_108158_59FF0AE6 
X-CRM114-Status: GOOD (  10.24  )
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

Set ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear routine.

Fixes: 33fc42de33278 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index dab8f3f771f8..cfe804bc8d20 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -412,7 +412,7 @@ __mtk_foe_entry_clear(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 	if (entry->hash != 0xffff) {
 		ppe->foe_table[entry->hash].ib1 &= ~MTK_FOE_IB1_STATE;
 		ppe->foe_table[entry->hash].ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE,
-							      MTK_FOE_STATE_BIND);
+							      MTK_FOE_STATE_UNBIND);
 		dma_wmb();
 	}
 	entry->hash = 0xffff;
-- 
2.37.3


