Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207AC352A1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2cVskIWbbN+ZIa3m7Nn1RfPLAaj9PpfSOtlDTL6vj6Q=; b=Dt5KN/X9+/AJSlHnX07zbfMdYL
	4/tHxm3QvJFUBvAle0yg4mh3TIHm3OASocgFZL2JPaDITpvkY/s3cvQ1VbmjkgFA7bdN9b4L1t+RU
	Y/xXq/P0/U9QUmcvG/phAkS4EO/5alT+EkE9dP+DQzuTXHktM0RKamYUPBn0Jw86uXdGwHEVzJ2QQ
	mBNrZrxrZcgI7gOTnXeLXLxp5UpbCsTnSS3+uK5mC6Y3J/SnIJSIaLQm/+e5WXdyzyUEW4ixSeAkY
	brlqU3+akxfMYQqwSTL4WYR1jW7lW57Dd61/fv+qFRbajiKkkbQ6mW1LDFrPYtad4KVvkKNi4I2yu
	jC9fUScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1SRx-003ZJE-Bt; Sat, 03 Dec 2022 13:21:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1SRu-003ZIu-MH
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 13:20:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B80F60C4D;
	Sat,  3 Dec 2022 13:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D87BC433C1;
	Sat,  3 Dec 2022 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670073656;
	bh=WRRsNHyJqBjdeC2QSytaa2enRTqxjhcJaDFKE8KqG9M=;
	h=From:To:Cc:Subject:Date:From;
	b=jp6PtICadOveJeyqCNB581pT1YISUGuuUS6EAvkN/2mKRDjThreCsSfbZC9JBz8mS
	 0O3xDnjCkoIJ6kjUqmw2NXivzw5TZDeIq+EebFy8OfgeOCCUmX1hxUf6S+9XYX7I2O
	 RpRaxk9mroT6t5RIP9oAbK2XxN9s5ilJv0Rhkyyl7wEQHxyVEwfPZdRBmG+bmT9zTt
	 grMrm1PEpjWKieYpeIqivWsJcKIzfrFiPkl62rV0zYRNm1tn48TrjJeWrOiJtJPA9j
	 m6piVHwhVl+v2Dp+G93xs0sN2AV6L2SL5F4qHtbZlc+iOIOafuQmH+Wi5heDsZslv7
	 FpUHjEvqiTtBg==
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
	sujuan.chen@mediatek.com,
	lorenzo.bianconi@redhat.com
Subject: [PATCH net-next] net: mtk_eth_soc: enable flow offload support fot MT7986 SoC
Date: Sat,  3 Dec 2022 14:20:37 +0100
Message-Id: <fdcaacd827938e6a8c4aa1ac2c13e46d2c08c821.1670072898.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_052058_806856_C36C2898 
X-CRM114-Status: UNSURE (   8.93  )
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

Since Wireless Ethernet Dispatcher is now available for mt7986 in mt76,
enable hw flow support for MT7986 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8b93dab79141..e3de9a53b2d9 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4593,6 +4593,7 @@ static const struct mtk_soc_data mt7986_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7986_CLKS_BITMAP,
 	.required_pctl = false,
+	.offload_version = 2,
 	.hash_offset = 4,
 	.foe_entry_size = sizeof(struct mtk_foe_entry),
 	.txrx = {
-- 
2.38.1


