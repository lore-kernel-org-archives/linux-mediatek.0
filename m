Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE89D39418
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2026 12:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHEWfbvKFtRJFXm9RNPwNDnN8PoPuneE3H4WgitsNAY=; b=RV8cfe7fxdGVMZ8Nfnx0BT+yUF
	PWywi49PoqQE/FTvzMJIxXa2s65PMPmlq2zH+MuDbjpaKd2PHzt4b/01LQ4QWFqEmVxQXarHvfVsg
	Mm7BFWvQGKkP5wXlG45FtMEpwk/muiMwvhVIStrpJv0XgZfJpkkAm0DU4nVj/ceKYZCoc7gpi13du
	AMRinbOWmXmu5/o5KhCuNazA85sYE61tRbgEQfeNW9iwsV2+x2GG6/G4NXhERhzg+2WEAO7fWzTf7
	d42CAhYOO+ls4BqzM/iZxTm9Ss3GeSopxuoj+TiTCZv0gB+LsP2vGDhpMmsWMJjtAiL9OJc24v+tW
	H4D7+Few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hc4-0000000080m-2Z5w;
	Thu, 02 Apr 2026 12:57:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hc2-0000000080S-1RtH;
	Thu, 02 Apr 2026 12:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6759761881;
	Thu,  2 Apr 2026 12:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8F2C116C6;
	Thu,  2 Apr 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775134649;
	bh=V6OVjIC2l3rgrFgADrj8zqhzjtfaMmdho2sc81R4Sgc=;
	h=From:Date:Subject:To:Cc:From;
	b=TxZWGkvO/QQgBy2cgsWsDxzPX0kUqBgPnH/JmFNQvw19BYgARLXjprcNaonFrFo8T
	 DiFwo0Yuu3ol2QjuuQ3jkLdb1ImmDXGqgGsH0YretZYbX/j7nMGc+38Ypy9doslmfK
	 PUqb20+5495Ttq0rPgCWOejDPHuqSNYcmyzodS+fRciH1i35rIbV9DGpMcrWqSEwz8
	 TAjXk6ZWe+FcTC5DTb4G8qPIPwumt3tXiNQoQHpo9Wj0fKgeteCnwCRwW5HWlniDeV
	 1+OgdAGHQisSi5uy0A47/zwlgsTdXZ2LrrQMtVEwkEALSR2YByB5Vpbt+/OeVs1Gf8
	 2XtoJDc9+48ZA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 02 Apr 2026 14:57:10 +0200
Subject: [PATCH net] net: airoha: Fix memory leak in
 airoha_qdma_rx_process()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QrCMAwAf2Xk2UCtU8FfESnZmrmgbbdExmDs3
 1d8vHu428BYhQ0ezQbKi5iUXOF8aqAfKb8ZJVYG7/zNtc4jiZaRwhwTBV3DpKVnM0yc8Mv0wUF
 W9PfueokdEbUD1NKkXPX/8oTMP3jt+wGy096kegAAAA==
X-Change-ID: 20260402-airoha_qdma_rx_process-mem-leak-fix-27b53dbaaa4f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

If an error occurs on the subsequents buffers belonging to the
non-linear part of the skb (e.g. due to an error in the payload length
reported by the NIC or if we consumed all the available fragments for
the skb), the page_pool fragment will not be linked to the skb so it will
not return to the pool in the airoha_qdma_rx_process() error path. Fix the
memory leak partially reverting commit 'd6d2b0e1538d ("net: airoha: Fix
page recycling in airoha_qdma_rx_process()")' and always running
page_pool_put_full_page routine in the airoha_qdma_rx_process() error
path.

Fixes: d6d2b0e1538d ("net: airoha: Fix page recycling in airoha_qdma_rx_process()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 95ba99b89428e4cafb91ff7813e43ffeb38e6d9b..91cb63a32d9904e0700bcce45b53624677d75c6c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -697,9 +697,8 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		if (q->skb) {
 			dev_kfree_skb(q->skb);
 			q->skb = NULL;
-		} else {
-			page_pool_put_full_page(q->page_pool, page, true);
 		}
+		page_pool_put_full_page(q->page_pool, page, true);
 	}
 	airoha_qdma_fill_rx_queue(q);
 

---
base-commit: a1822cb524e89b4cd2cf0b82e484a2335496a6d9
change-id: 20260402-airoha_qdma_rx_process-mem-leak-fix-27b53dbaaa4f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


