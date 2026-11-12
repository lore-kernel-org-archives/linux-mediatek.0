Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7103606C709
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DkaMtty4;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=HeJJztsL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gh3jxO2iwSuBlABl9q4UwPhnIEJuTZmYdNuAfXiYLcQ=; b=DkaMtty41Gdjy7djIWJhHdZTT3
	PxDWybA3J6LupVFSLouDU/h4bPmgUWG5uPbqeaRkxlKeY38asGSZKj/kd4tnTdM5TIDFs5YGZtUx5
	TP+XbYzkp1/VIuxwmPEmHZTvrHX2wVnU0RWS8G2rBzZ3okGo4bXPG4mjtToCA3kY5GSbw07ka0ISf
	4Q1isyFeZWLERqSn1Lo23nSH7whSfOXHt1JHsA5JWfnzDKe6+6EUMvGM3vw1TomR98Xj1PiQTbUJk
	r8KErNOI/BrxVjVRQckW2rMCTlyalcXEBejThqN6daHQrvTjulw5hqLViWhCSlUcvemFIxOki5rLz
	bisHV3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVKl-0000000AA4x-2SA5;
	Thu, 12 Nov 2026 13:59:23 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVKg-0000000AA3A-34jt;
	Thu, 12 Nov 2026 13:59:21 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54773892a;
	Thu, 12 Nov 2026 21:59:08 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: Fix potential PPE hash table leak
Date: Thu, 12 Nov 2026 21:59:07 +0800
Message-ID: <20261112-88a3a7ff32-net-mtk@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d00e1e2f03a1kunm1c09b32f29fb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx8fVkNCSk0aHUpLTx9LSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=HeJJztsLnkngVdpJcwMvtiN91TgW368eWU+GIA2e2J/q6MHBklFcjL13c5rs1h2iiAO9NQOOIWX73WvGm24bKOVlndqsNNBnH9ojijKqZInjvXxVvFkpGj/2/cUjGFH4nJqDP9YAVYjmgK9VoBj7fDoTbVa7uNuZEIO0TI6IAFw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=gh3jxO2iwSuBlABl9q4UwPhnIEJuTZmYdNuAfXiYLcQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_055919_671393_D595D641 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The remove path does not destroy the PPE L2 flow hash tables. Their
bucket tables are not device-managed and remain allocated when the PPE
objects are released.

Call mtk_ppe_deinit() after unregistering the netdevs and cancelling the
driver work, as the probe error path already does.

This issue was found by our static analysis tool under development.

Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index ad0fdc4133fb..08973b6f0711 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5426,6 +5426,7 @@ static void mtk_remove(struct platform_device *pdev)
 	netif_napi_del(&eth->rx_napi);
 	mtk_cleanup(eth);
 	free_netdev(eth->dummy_dev);
+	mtk_ppe_deinit(eth);
 	mtk_mdio_cleanup(eth);
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


