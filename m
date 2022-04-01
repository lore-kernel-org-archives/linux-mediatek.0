Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9568BC43217
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdEIbzH8keYt9Q6a3FDTXcFJwHLOQelAKgy922IXK5Y=; b=Dg3I/VbaLo1Axq
	ARSkTp0Uc2K4K0A2dX3JzpGGfcDx+DGsDCR3sEyBA/N7T0mBsQyluy4ekyXtoSkDfx6jr+AyVWCRA
	FIYq72CUGiQdijbxR09O6SC7Cq3oLd4Pl/AW8SE7RNIotcuTyLeCpGhIOE+nSaHik+HNyWOWKF4c2
	Q3MFKO8oxB0KvNPT6QAHvpZEY0eq5yVmmuNsWTfg4m3TMuMQKHnH1kPbw7Sd0dvqFiJFc1ktHZ1QP
	Z/z9pjYMZ2phYx1TO0KlBV9Uvnvt/Y/HuvQO02lBnht11yQZUFYzfs+u/8jGLudp2vzFv32nt7xXG
	LU106IcUz/vXbay1758w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIMY-0065Y3-3N; Fri, 01 Apr 2022 14:34:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIKC-0063ox-RB; Fri, 01 Apr 2022 14:32:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52DB061AFD;
 Fri,  1 Apr 2022 14:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A165BC340F2;
 Fri,  1 Apr 2022 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823547;
 bh=JUu1VZ2ZtuYvOXHjQxlxjlIy0uC2WzX5rrlXEFGLhO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H9Huu3i440CBVCRZDrYQJD6BDvrcRwdTOK6AAYWtiTHPiisgj2oiv7uvtDfqKgGDq
 bxXnHa4Yr/QkqTijbrgfpxWCE1eXutCl94JH8F119ED8dUoj1SW1gE9JBJz2hYeaNz
 OHejhSzYbQ5xbiq7BvVXSvhPJkEjqSgLICkdnyTFpxFbt1Aq8o9y/nvjTZZozfsWAu
 BzCeSHQShF7Z/uq9fVnI1BDv3C9kC9e1JyJZJCcSlztrGDYvEP7QWy9NFp/cRWGXnb
 B+r52/iW2bF++q9Ty2rs5AVghnjTqMTUhnbqQYoUm45O9pYl6U4MQEXOB4Y38zmR0f
 c+JE+0QjLpRPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Deren Wu <deren.wu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 138/149] mt76: fix monitor mode crash with sdio
 driver
Date: Fri,  1 Apr 2022 10:25:25 -0400
Message-Id: <20220401142536.1948161-138-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073228_953211_A011E56B 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

[ Upstream commit 123bc712b1de0805f9d683687e17b1ec2aba0b68 ]

mt7921s driver may receive frames with fragment buffers. If there is a
CTS packet received in monitor mode, the payload is 10 bytes only and
need 6 bytes header padding after RXD buffer. However, only RXD in the
first linear buffer, if we pull buffer size RXD-size+6 bytes with
skb_pull(), that would trigger "BUG_ON(skb->len < skb->data_len)" in
__skb_pull().

To avoid the nonlinear buffer issue, enlarge the RXD size from 128 to
256 to make sure all MCU operation in linear buffer.

[   52.007562] kernel BUG at include/linux/skbuff.h:2313!
[   52.007578] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   52.007987] pc : skb_pull+0x48/0x4c
[   52.008015] lr : mt7921_queue_rx_skb+0x494/0x890 [mt7921_common]
[   52.008361] Call trace:
[   52.008377]  skb_pull+0x48/0x4c
[   52.008400]  mt76s_net_worker+0x134/0x1b0 [mt76_sdio 35339a92c6eb7d4bbcc806a1d22f56365565135c]
[   52.008431]  __mt76_worker_fn+0xe8/0x170 [mt76 ef716597d11a77150bc07e3fdd68eeb0f9b56917]
[   52.008449]  kthread+0x148/0x3ac
[   52.008466]  ret_from_fork+0x10/0x30

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 404c3d1a70d6..368a5c6455b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -19,7 +19,7 @@
 
 #define MT_MCU_RING_SIZE	32
 #define MT_RX_BUF_SIZE		2048
-#define MT_SKB_HEAD_LEN		128
+#define MT_SKB_HEAD_LEN		256
 
 #define MT_MAX_NON_AQL_PKT	16
 #define MT_TXQ_FREE_THR		32
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
