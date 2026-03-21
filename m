Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE02A1094478
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Mar 2026 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJDHmNEPgxTWHgpZgrvXmhNERd6v5/eB1as32nDeqeQ=; b=ES56LwtqdSvFzhnM2Fu625xVbz
	uVsgJitHkM/q/abzD2cKzgEFHa5XWSISf4XLJZ1xgBAyTyNJErCjh77rmG92Gy5IUHAMH6IMVsnc2
	Rb/wTlWNui38EWQ4/YWcjA0i5L++eiWlfg36KlIuwu95Xzbjt/Cqzfy//OEUUHxUTctCshFvwTIO/
	VHk8UWgz7GZTN0wyUyOGeRGyG+Zqi3oV5/Y9qR+3MlrOhIC7X0WEBkDHbjRRhsF4Rs6qxNo+Bb1x+
	DI+7ueXdhOM+btRVC3VdP2E70b32fko0DlSHVqbjqRCAGJszfUIsGfGaLQX+Grrr+Rg8qNkU1arV/
	3G8aNWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3xWb-0000000EY6E-3ubw;
	Sat, 21 Mar 2026 14:42:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3xWa-0000000EY5t-1fSo;
	Sat, 21 Mar 2026 14:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E11F60103;
	Sat, 21 Mar 2026 14:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19BBC19421;
	Sat, 21 Mar 2026 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774104119;
	bh=ObYld9zxOf6gTfGXzgKx7yFASQiWGAHw3Ikee/ABTwE=;
	h=From:Date:Subject:To:Cc:From;
	b=ILV3TUUIr7ndjs9F0yQRz4drfu7tdZJuJwE6Z0Si0AUcUO9TEizrQcWeREYKsD5h1
	 tJwlaSSSoUAfoF3mQJByQwESStrnna+vHCRaT13NAWx9zJYWLguuHcvz1Mj3Z7sDz5
	 2BYqHs4r8N0TcWzCju46/0z/vuNENF4zevW+2uGdlXPXl0VX5lgoMvaKUEhjbadJ0B
	 k9fZK4KGKt2oQB7X8Jf3/IxdP2B1Mjbz7R1pdauk3VQEC3VDqhdUeEkweFfKEYi5lG
	 F8Vvxu+jJJNpqQSiCaICtou6otCNZLPGd6C5X2pcEiyCbqru3lHRSJomn2x2s6y298
	 NR3ZIg5+GkR9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 21 Mar 2026 15:41:44 +0100
Subject: [PATCH net-next v2] net: airoha: Rework the code flow in
 airoha_remove() and in airoha_probe() error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-airoha-remove-rework-v2-1-16c7bade5fe5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ6CMBCFr2Jm7Zj+gBBX3sOwaOgAE7Q1U1Ixh
 LvbcABXL19e3vc2SCRMCW6nDYQyJ46hgDmfoJ9cGAnZFwajzFVZo9CxxMmh0CtmKvGJMmNrW1t
 XlW/q1kOZvoUGXg/tAwItGGhdoCvNxGmJ8j3+sj76/+qsUaPzRENDtld6uM8kgZ6XKCN0+77/A
 LfZdOLDAAAA
X-Change-ID: 20260320-airoha-remove-rework-8383544d758d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
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

As suggested by Simon in [0], rework the code flow in airoha_remove()
and in the airoha_probe() error path in order to rely on a more common
approach un-registering configured net-devices first and destroying the
hw resources at the end of the code.
Introduce airoha_qdma_cleanup routine to release QDMA resources.

[0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org/

Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Fix eth->napi_dev leak if airoha_hw_init() fails in airoha_probe()
- Link to v1: https://lore.kernel.org/r/20260320-airoha-remove-rework-v1-1-adeef7e3c01f@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 76 ++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 961325da833b27eee31dfa03be26dfc82071097e..82e53c60f561f6314fbf201ba8bc8711e40edc68 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1368,6 +1368,33 @@ static int airoha_qdma_init(struct platform_device *pdev,
 	return airoha_qdma_hw_init(qdma);
 }
 
+static void airoha_qdma_cleanup(struct airoha_qdma *qdma)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+		if (!qdma->q_rx[i].ndesc)
+			continue;
+
+		netif_napi_del(&qdma->q_rx[i].napi);
+		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
+		if (qdma->q_rx[i].page_pool) {
+			page_pool_destroy(qdma->q_rx[i].page_pool);
+			qdma->q_rx[i].page_pool = NULL;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
+		netif_napi_del(&qdma->q_tx_irq[i].napi);
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
+		if (!qdma->q_tx[i].ndesc)
+			continue;
+
+		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
+	}
+}
+
 static int airoha_hw_init(struct platform_device *pdev,
 			  struct airoha_eth *eth)
 {
@@ -1395,41 +1422,30 @@ static int airoha_hw_init(struct platform_device *pdev,
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
 		err = airoha_qdma_init(pdev, eth, &eth->qdma[i]);
 		if (err)
-			return err;
+			goto error;
 	}
 
 	err = airoha_ppe_init(eth);
 	if (err)
-		return err;
+		goto error;
 
 	set_bit(DEV_STATE_INITIALIZED, &eth->state);
 
 	return 0;
+error:
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+		airoha_qdma_cleanup(&eth->qdma[i]);
+
+	return err;
 }
 
-static void airoha_hw_cleanup(struct airoha_qdma *qdma)
+static void airoha_hw_cleanup(struct airoha_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
-		if (!qdma->q_rx[i].ndesc)
-			continue;
-
-		netif_napi_del(&qdma->q_rx[i].napi);
-		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
-		if (qdma->q_rx[i].page_pool)
-			page_pool_destroy(qdma->q_rx[i].page_pool);
-	}
-
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
-		netif_napi_del(&qdma->q_tx_irq[i].napi);
-
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
-		if (!qdma->q_tx[i].ndesc)
-			continue;
-
-		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
-	}
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+		airoha_qdma_cleanup(&eth->qdma[i]);
+	airoha_ppe_deinit(eth);
 }
 
 static void airoha_qdma_start_napi(struct airoha_qdma *qdma)
@@ -3012,7 +3028,7 @@ static int airoha_probe(struct platform_device *pdev)
 
 	err = airoha_hw_init(pdev, eth);
 	if (err)
-		goto error_hw_cleanup;
+		goto error_netdev_free;
 
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_start_napi(&eth->qdma[i]);
@@ -3040,10 +3056,6 @@ static int airoha_probe(struct platform_device *pdev)
 error_napi_stop:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
-	airoha_ppe_deinit(eth);
-error_hw_cleanup:
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_hw_cleanup(&eth->qdma[i]);
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
@@ -3055,6 +3067,8 @@ static int airoha_probe(struct platform_device *pdev)
 			unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
+	airoha_hw_cleanup(eth);
+error_netdev_free:
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
 
@@ -3066,10 +3080,8 @@ static void airoha_remove(struct platform_device *pdev)
 	struct airoha_eth *eth = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
-		airoha_hw_cleanup(&eth->qdma[i]);
-	}
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
@@ -3080,9 +3092,9 @@ static void airoha_remove(struct platform_device *pdev)
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
-	free_netdev(eth->napi_dev);
+	airoha_hw_cleanup(eth);
 
-	airoha_ppe_deinit(eth);
+	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
 }
 

---
base-commit: fb78a629b4f0eb399b413f6c093a3da177b3a4eb
change-id: 20260320-airoha-remove-rework-8383544d758d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


