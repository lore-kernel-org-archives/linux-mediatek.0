Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AEBC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 04:38:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD47206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 04:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+XFO+Zq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YayVW+MX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD47206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e5eRPd6+6J8xyzyVC/pv30D8ZKE/zJsrw8/TPwIIsG4=; b=u+XFO+Zq5dwwz032Nm37bAHxM
	UJ+DmTrl5tYQnIJoe4DVfraJF/7ZG4FN+PmDfrEM8I60i+bxMgM8vnQvOvviSYpf7NGwW0broSrZ8
	VsZiiw7ZSo0wps3R2fLklFPpK0SxKLin3sNx7UUmhgmELzan4CZQ8LvjHhvP1w/xf3hEidZZP1xcz
	10BO3T/NOxJNo2mJ0kOhMTnn3XoD7tEMvOb8pd57vfABn/h79cq1bGo0UnjgFakAi+/0abhvwwiow
	k7hXrX1ePNqbCYMHVDSpCSRNtmc+Cs0EQyx+OD2qr0AKTFv5YJYNf1y8X/a4cyaPm+MaIetUrA5lY
	MhZ+cRdzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq825-0003K1-3s; Tue, 30 Jun 2020 04:38:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq820-0003JD-FA
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 04:38:06 +0000
X-UUID: a2e8cad6a4dc4c4ca34fbfc163faa29e-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FoTYp24eF+YXVi71xoB1IHArULDVoU2R5ArOZql2HM8=; 
 b=YayVW+MXANoksVFe8GGJ/+PUGPV98H8aM66cPuE04O9kAcw9EnfQIfSOkH7zwtbiiyzL8xMrQtED8djEKfMFIRwUlyJiDh2xhq3D3XpEkQzLwoqYt4Lhuv5j6gR0psDdecNxFa6ZRqbokgQriBLl3vhUlMD3IxgnWS6K6aTVALo=;
X-UUID: a2e8cad6a4dc4c4ca34fbfc163faa29e-20200629
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 275356422; Mon, 29 Jun 2020 20:37:57 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 21:37:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 12:37:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Jun 2020 12:37:56 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/3] mt76: mt7663u: fix potential memory leak in mcu message
 handler
Date: Tue, 30 Jun 2020 12:37:50 +0800
Message-ID: <74f27a79f53c6df3c49484a27c5b954d827cd9a5.1593491298.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
References: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F3B80C1C9581102FA6D476316E8008941CD87F125D212641B645BD95A92D3E62000:8
X-MTK: N
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
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fix potential memory leak in mcu message handler on error condition.

Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
index cd709fd617db..3e66ff98cab8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
@@ -34,7 +34,6 @@ mt7663u_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 
 	ret = mt76u_bulk_msg(&dev->mt76, skb->data, skb->len, NULL,
 			     1000, ep);
-	dev_kfree_skb(skb);
 	if (ret < 0)
 		goto out;
 
@@ -43,6 +42,7 @@ mt7663u_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 
 out:
 	mutex_unlock(&mdev->mcu.mutex);
+	dev_kfree_skb(skb);
 
 	return ret;
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
