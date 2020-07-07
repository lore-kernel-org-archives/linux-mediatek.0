Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76417C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 19:17:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3C520771
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 19:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SrjFSl1h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Al1fLAqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3C520771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NLmiardWjQQAzTWET26p9+7n7rHKEoWI/nFwXEkQ8AI=; b=SrjFSl1hJatUSdjzpmdL4FFXU
	7R+h0jaSodlUiRu80z3iBl2QtXTBsSpSh+jCZ4Hw6lUB9KKNbsGUTmRwBo/9t7OkhPwY/5kqDu4Ed
	uuou3qGrrRjDqK7cUUYlyG1q91cfywiAnOs9tFN1SkZolxxuj1vNWpdItSW7klR9hVwbhw7nqO8Y5
	fdjtClN5GeDX2wkokOEXT18S2L5Xp4+vcQ0V5rMjFl6a36eqb/ViWiP4NrzLOTn57NEKKr6ADT0I1
	nCNrF73csYlqox8/KOIGdKKDCcn9UukRNiIH4WMCh7xAR2Y195FVjiWCgqlRdXvNbOr/fLSR1lU/X
	VIyMPnQHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jst5e-0003Qo-DA; Tue, 07 Jul 2020 19:17:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jst5b-0003Nb-Bn
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 19:17:12 +0000
X-UUID: 61bd233ff83a43739893ef3db368bc73-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6WwLQZSskyqVpi7nnoZklS0XEE0b/m647iz/70QPzhA=; 
 b=Al1fLAqMtxgm9Z4FlGhArPx2AeOHiMhU7dNhq3NmZLuIlN0ZiRz25Xt8yjgvXeEtyw+a6u2I08x8vvGURmYb7SHO9J8qTEIUqxSieUpZF0ixwRrAg7fCSy0AR4A537N2UDJpZkJ/HfZujirydB0p+S3+XkDoEWKoEHu7UUy2y3o=;
X-UUID: 61bd233ff83a43739893ef3db368bc73-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 497427962; Tue, 07 Jul 2020 11:17:19 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 12:17:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:16:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 03:16:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 2/3] mt76: mt7663u: fix potential memory leak in mcu
 message handler
Date: Wed, 8 Jul 2020 03:16:47 +0800
Message-ID: <f2a7b771de7a82b430f9960a6294090d62991a8f.1594148548.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
References: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFAE3EC087A09961308A87017844A1E472331BF8FCC4033435F92BDFEFB911A42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_151711_536788_EA9B8CCE 
X-CRM114-Status: GOOD (  10.80  )
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

v1 -> v2:
	- add Acked-by tag

Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
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
