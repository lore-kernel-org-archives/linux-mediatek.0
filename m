Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50070D37488
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ADFFoqFLgR7O0G82SEPunbkRMk+EcPOSHMzQhw2rP8E=; b=0o8Nz7fOV0pAg4+dDvv2FAWPs0
	7qJPtNyQw2SCWICKvr1UrYBCqdO8NgsnMaS5/7TuIyEChJ6DxbHflPBr2Jhtt8WYsVvg8UkCWVXSM
	EBDY4eGy0xTaNiegsWfhiFtRoEV7mxxqisXZKkjzFRxKojnSgwiIZt91jV2YIgML5O4jv72D5lrq/
	hcAqKykVQsTp6axPMcRiv5xio6kM1e20cO4QDnQeamKlMDiyyhFTdEmbHvElbZ7XLfyxIVxk/iSP0
	qjn6bekR9A+bC8kuIz4WmPzM0ubtojbwigb+DI0LypR/YKzwh2AQhEZ9UoiIuwLSnuZhu+IaGLC+N
	PIgt/H7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RD7-0000000F3dn-1b3l;
	Thu, 17 Oct 2024 14:10:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1R4n-0000000F28O-3mTs;
	Thu, 17 Oct 2024 14:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E62C3A44006;
	Thu, 17 Oct 2024 14:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A260C4CEC3;
	Thu, 17 Oct 2024 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729173723;
	bh=pLt4qtrvN+Wt60ikm10Xa1vqgY/lQUmiZwndPnYxBeo=;
	h=From:Date:Subject:To:Cc:From;
	b=Fo+eB0Hv88wp/+U3UCLqtvYrXW+UX4BcvoIgFm+If1ksawMPOXxeKkkMw3bjQmdrD
	 RsbybO+udVFCkvTo3PJDMSmPyzsTFGOcbQQbynI9fVjqgobIeregdV4HGYJYpS9ZHr
	 06VRQfetPT/Aw/pK/n3XQlgiTZ6MSMgIVyi7LKmNWwEXSsGC7qHpqE6Kj59tZn313c
	 mEb4ZwzbeSBa37fdfa01kNeTHnjzdHI4T8frf8DvIQTaXEUBDSsUtgW+AApgqcct6c
	 NnR/IlAnFC9dX6TxrDzoa45IyJ0aMCsaTFcReHagYxotKHPA1PT13+qgV9EcdV/P/1
	 nl67WMN4/w/rg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 17 Oct 2024 16:01:41 +0200
Subject: [PATCH net-next] net: airoha: Reset BQL stopping the netdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-airoha-en7581-reset-bql-v1-1-08c0c9888de5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMQYEWcC/x3MQQrCMBBG4auUWXcgExIqXkVcJM2vHZBUJ6UIp
 Xc3uPwW7x3UYIpG1+Egw65N19oh40DzkuoTrKWbvPNBnEyc1NYlMeoUL8KGho3z58UhIuQSZ++
 KUK/fhod+/+fb/Tx/kguGa2kAAAA=
X-Change-ID: 20241017-airoha-en7581-reset-bql-45e4bd5c20d1
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_070206_043184_189AF2E7 
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

Run airoha_qdma_cleanup_tx_queue() in ndo_stop callback in order to
unmap pending skbs. Moreover, reset BQL txq state stopping the netdevice,

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 836a957aad77bec972c536567a4ee7d304ac7b52..23905f54f991fc8062542b890fbf002154676612 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2341,7 +2341,7 @@ static int airoha_dev_stop(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
-	int err;
+	int i, err;
 
 	netif_tx_disable(dev);
 	err = airoha_set_gdm_ports(qdma->eth, false);
@@ -2352,6 +2352,14 @@ static int airoha_dev_stop(struct net_device *dev)
 			  GLOBAL_CFG_TX_DMA_EN_MASK |
 			  GLOBAL_CFG_RX_DMA_EN_MASK);
 
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
+		if (!qdma->q_tx[i].ndesc)
+			continue;
+
+		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
+		netdev_tx_reset_subqueue(dev, i);
+	}
+
 	return 0;
 }
 

---
base-commit: e60fa8ebc2af54c2f62cc4ed63b85894dabf9101
change-id: 20241017-airoha-en7581-reset-bql-45e4bd5c20d1

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


