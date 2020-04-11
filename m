Return-Path: <SRS0=Ks85=53=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFB0C352B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 23:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF1320CC7
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 23:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UC+MVf67";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtClqM2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DF1320CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etLeVwt0l6lLwoySM0oKOCdt9zVaX7WEwr+zGbOhnCU=; b=UC+MVf67HmtV3M
	JNzA9ENvgIO5RuBPrI5Y02dV7bBbeKe/JL3hypgNghiLLD7TgZD2Gf/UU0UlFPYIhTEbLkFL91S6V
	jHfvIh217WlIAhG/2ZCrbbbQS1s57LxxfOUitlsdaymeX6Z8yqk+aW/wiIdCsAu+15I1OvtKKhuhR
	C2hAmSXNVyeItc+NGfCavgroo1MSb2Juh3jxvtK4yAnrrK7s6kpfcQwwBZdJzWBnMgEI6/vUdqiSn
	XawqVGKcag+z84cxAR3Ci0qfQgeifyXtBJ3qDHhJHCDc0FOpfVMKW9mihimTEfZuIXIpWHa/B4Gru
	V3dcY2ssKBWScDSU3Z5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNPIr-00007n-5E; Sat, 11 Apr 2020 23:12:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNPEM-0002Cb-Im; Sat, 11 Apr 2020 23:08:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DF9F216FD;
 Sat, 11 Apr 2020 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646486;
 bh=w68oapllwXBcXuPwr+A/R2ShE4TVv5AB6GPxa7PIA1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CtClqM2lj/bMA0tOFFSTip8x90DiaLTlq2dr2CHkJAxKSJRSgjW9DuM/hayZHXCl2
 yg/gSwtEpkSTLyeKzgIKI1su/tmG1tAK/FL/Y2hjCUe6IuvUnYviEeW0QfLkKiRLrO
 DBhDbHMT7npm25nVTU45Erdka3d/spf/HlAfsMD0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 050/121] mt76: fix handling full tx queues in
 mt76_dma_tx_queue_skb_raw
Date: Sat, 11 Apr 2020 19:05:55 -0400
Message-Id: <20200411230706.23855-50-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_160807_382760_6476E301 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 93eaec7625f13cffb593b471405b017c7e64d4ee ]

Fixes a theoretical issue where it could potentially overwrite an existing
descriptor entry (and leaking its skb)

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 1847f55e199b0..c001d94958d83 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -261,10 +261,13 @@ mt76_dma_tx_queue_skb_raw(struct mt76_dev *dev, enum mt76_txq_id qid,
 	struct mt76_queue_buf buf;
 	dma_addr_t addr;
 
+	if (q->queued + 1 >= q->ndesc - 1)
+		goto error;
+
 	addr = dma_map_single(dev->dev, skb->data, skb->len,
 			      DMA_TO_DEVICE);
 	if (unlikely(dma_mapping_error(dev->dev, addr)))
-		return -ENOMEM;
+		goto error;
 
 	buf.addr = addr;
 	buf.len = skb->len;
@@ -275,6 +278,10 @@ mt76_dma_tx_queue_skb_raw(struct mt76_dev *dev, enum mt76_txq_id qid,
 	spin_unlock_bh(&q->lock);
 
 	return 0;
+
+error:
+	dev_kfree_skb(skb);
+	return -ENOMEM;
 }
 
 static int
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
