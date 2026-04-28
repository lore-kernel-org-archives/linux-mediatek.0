Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C594EFF885D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xe5brPMVO+9g1Dw+xvEM8fY4F+u3qXzfLKVLAqh40G0=; b=pL3LAU9O44nZD3c7B4WV70uS9v
	ZkqFK06KTXIqaSc43tPR8KkZ719IKkE4XvRZz3lPzNrk5rysiMVcnM4OlUst/mFz/SogbxBG73wTY
	Lg2e4xBxG6mfP6d7IEG4NQuTcm4UFxzOmPcThPMuYpyvx7kP0O6LpypZJQNTafHuReHQI7AjAz4pF
	EJoFfdYsg/5GrdnqfbbN9j0SyC7fTDQlCp8Ep4PJTaZhIF8ZP1BV6LP/DDVtAoCqm/0qc7m6rMgLp
	H2fTu04hU0c7T29crRzORj6IdARZQfV/2ffMx2ktbFCPWMg08BPDEwSU7myK8Q+f8lskUB8VIJrnQ
	PBnVHZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHe4H-00000000uTo-2RlR;
	Tue, 28 Apr 2026 08:45:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHe4F-00000000uT8-0SuC;
	Tue, 28 Apr 2026 08:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF8AA448AC;
	Tue, 28 Apr 2026 08:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE61DC2BCB5;
	Tue, 28 Apr 2026 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777365912;
	bh=7fk0VA5+cNoW7sx+mkYAgp0ak+eEVYN/A1DKtFhUDzQ=;
	h=From:Date:Subject:To:Cc:From;
	b=hhefmOqFMk/lzYcUZloW9IrHT1yZMBQfu/PqbsK7uGhhhWUhYzurKYnCzOsjzwNmP
	 YGmkzWeBflNEs83iQV5a0GgmCShd2HykxBSieNCQ1ihXsAciKJZbcWEVHsKQeYXO6T
	 /2ajj69aF1bVnq1IEO522qEb/exjULeLeot6AY3AT/DyubuUzBR7YxkYY1hWqAki5s
	 iFkRMsnXd/O8gY95usOUtxuUCCk3JLT7pjo48BgmhyTyxVwqpNuXGXQclq8MCIzVo1
	 dTnGwpeOCMnvUhwOXT6wvDMHXDhfGLqKIlCmaNUvevpITkiLFuuem2y0FLDKMJJ6le
	 HoXR8pIfVFD9Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 28 Apr 2026 10:44:21 +0200
Subject: [PATCH net] net: airoha: Move entries to queue head in case of DMA
 mapping failure in airoha_dev_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOw6DMAwA0Ksgz7UE5iPaq1QMpjXEA0nkBISEu
 Hujjm95FyQxlQSv6gKTQ5MGX9A8Kvg49qugfouBahrqjkZkteAYz00z7n7jiGIWDCNnh2NDff/
 sZJmphVJEk0XPf/8GLxmm+/4BL6nh0nMAAAA=
X-Change-ID: 20260428-airoha-xmit-unmap-error-path-8125594efb23
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_014519_202907_7E1AC011 
X-CRM114-Status: GOOD (  10.23  )
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

In order to respect the original descriptor order and avoid any
potential IOMMU fault or memory corruption, move pending queue entries
to the head of hw queue tx_list if the DMA mapping of current inflight
packet fails in airoha_dev_xmit routine.

Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5effb4a4ae84..82018a085e46 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2123,14 +2123,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 error_unmap:
-	while (!list_empty(&tx_list)) {
+	list_for_each_entry(e, &tx_list, list) {
 		e = list_first_entry(&tx_list, struct airoha_queue_entry,
 				     list);
 		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
 				 DMA_TO_DEVICE);
 		e->dma_addr = 0;
-		list_move_tail(&e->list, &q->tx_list);
 	}
+	list_splice(&tx_list, &q->tx_list);
 
 	spin_unlock_bh(&q->lock);
 error:

---
base-commit: 3bc179bc7146c26c9dff75d2943d10528274e301
change-id: 20260428-airoha-xmit-unmap-error-path-8125594efb23

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


