Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B255CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xr5ACJ0cOUKZQ2YuQcm5JeI3Xx4W0lDc93CFxb5CV3Y=; b=ugiViNAvVeVLmP
	mDo1upiN3O15REvBaqv0HRKqv69r9o/8T6gvDQdRhuZnNMnMpRlpE6Ko/S8/EVSAyLz3XCCxZKRzA
	p/xXcq/SC0w/Fy1nO+SupINwExD0t4491+ussmrWizDaRik8XxCiFAFLO2PAAanugJJQliMWlq7TH
	YBKR6TJO9Fm8aY85w8b4oFJi/1XUtwogqeI6ZeDuK0DhZGOc1bOajg2aIt741x9Qy8KsC1aajvOUJ
	8I2glIWrro+KQSSijUADIzVmuXqAR/bCIN/uth+66nvSrnPlALSVCmnX6jtIIX/lgHwL9oSnJ5SrH
	0Z1/C+TasLrjfPl88A2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIWw-006BGz-6a; Fri, 01 Apr 2022 14:45:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIOt-006778-OM; Fri, 01 Apr 2022 14:37:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4183D60915;
 Fri,  1 Apr 2022 14:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45F2C36AE3;
 Fri,  1 Apr 2022 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823838;
 bh=TNhuIYcQcfG4QlNOpWtFeXYobcT5C6Y/M7tHewwSy5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BkCMqCklg1npmmNOYdACDMrRxCxT+Du4OssYB70E69JbBqvsacJEjf5quYmix4rOd
 qM35wvFAMJVdWQtnA0YjyS8druLPFpTwqCcr2tL/Fs+hIXyClGz0Ll2QI2/PN1GAVT
 eHAC1t1SwHnKhqLtv8/mOCjwBsjJvDnqDgK8P4zKC3ga35vLTQVcu3i8PfJ7yYxFm8
 oTfPZ4M3ZxteJXEYQH5JtQY9FwvPzozQkI01KFomOaSbHKu3OQBCgcMOIhEr3TgT2l
 FOw8pRQ3FMpICFRkoTm7DnoGmQLt2lRX9XAkwhOadDKI2hA75Wuntz9R82WibtEri8
 0pNArgX7bx0wg==
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
Subject: [PATCH AUTOSEL 5.16 099/109] mt76: fix monitor mode crash with sdio
 driver
Date: Fri,  1 Apr 2022 10:32:46 -0400
Message-Id: <20220401143256.1950537-99-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073719_885941_760C37EA 
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
index e2da720a91b6..f740a8ba164d 100644
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
