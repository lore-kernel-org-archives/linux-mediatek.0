Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A299DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 05:36:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48472613AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 05:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48472613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=knxHNECPdJAqKd6k8OgEDWj5bK5L6vjnbZMn7mMRAxs=; b=meY9auSHpus2Cdbpg6ysmpSwr
	u7HaCv7uB7Dq9tzqxkzFL6TeHi121kXuQW0SdvJXRxhxi7Qz3M9lUiJHMa7rR1VM4BYs3RwTqkkAk
	1VQxYTgC0xhHObC5mF/i94MhF5NFZ1BlpJT/B73ckeQxQ6B8QXS8QPEyyKAt+fs2mzdeBpucx7WCf
	hhpoeZwzG9weJ3yPbi0RN14y/c6Kr+7XTrNwD0vBbjaOSzPbkG+Sor/Jo/S8nC3MYFlpcHzmYNiGR
	itufN3v/id8AerXIW+a8oVgpQXOo28/ErYNjkQow5SnZ6rK3k2PJIcPPoeaeAgQvKS55iuqw4c/FG
	UVQGbKuhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWBiG-008JHa-60; Tue, 13 Apr 2021 05:35:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWBhf-008JEx-OB
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 05:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Duhom3brMv4t49JPUBeN+Va8GkjWJzQOsnbO33IMV4c=; b=OKr7cQFBiZzcu9sOSFiwy979Ys
 GWQRTT9U6Xibx2B0Q59jptjCsJtmZB4ZTKcRZvoJvWcsWpkv/h+J8Alek2aV9lU4XkYfEHCFWZiWj
 a6zuyt+mzQT3CbDOTjzHlF/sxsWCp4KtHY7sl7weUPvoS6NkPcJ7sulJa0j043UUFu8yyqpI6E5GI
 CB2jtRLPULn7/UHcWzEGEFwPGAxmCwthL5ATmuPts/9d4aqzJBQR2blT+CLnveE2ieptenhY0MKqf
 +B8sdk49ks+hgRNR4S3aNxvDzetBbWqwZI/RbwzxuN9TrnDQ9GVV0AfqGp2IYR6CPtzejsRn5YP7e
 1xd01m4w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWBhc-006kJU-A4
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 05:35:09 +0000
X-UUID: 62a8b38a7ff042838b99ae19a4bbce0e-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Duhom3brMv4t49JPUBeN+Va8GkjWJzQOsnbO33IMV4c=; 
 b=ti63yeWwTzLSvXnki130CNvHAQSdb/zzIcRdPmVeFjLRYTheHY6c9Nrq9BpSlOvEQrJ4PgQ0HBeHVe8MRuGhZr5ip3d+poj4pzoIARtAgeHeyKvyqvMb+71hyJW5sjNJamceId9w3KD+7z6hdcipXhYYvF7pDI9BWxtZHw9vUJs=;
X-UUID: 62a8b38a7ff042838b99ae19a4bbce0e-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 527192626; Mon, 12 Apr 2021 22:35:02 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:35:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 13:34:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Apr 2021 13:34:58 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: fix memleak when mt7915_unregister_device()
Date: Tue, 13 Apr 2021 13:34:57 +0800
Message-ID: <3bf5d5df8fcd20a8a093c2de849f527c28c6fc54.1618290080.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <519a81d0c36ab64750a39b1eac3cb86a09cb2f1d.1618290080.git.ryder.lee@mediatek.com>
References: <519a81d0c36ab64750a39b1eac3cb86a09cb2f1d.1618290080.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C05952F9C6A380AA889A5D17CC999E72F6B5A0625C5EB7C02979FA5D022D8B62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_223508_380970_51DD980A 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

mt7915_tx_token_put() should get call before mt76_free_pending_txwi().

Fixes: f285dfb98562 ("mt76: mt7915: reset token when mac_reset happens")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 3f9f74aa8399..6322a92fd2d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -744,9 +744,8 @@ void mt7915_unregister_device(struct mt7915_dev *dev)
 	mt7915_unregister_ext_phy(dev);
 	mt76_unregister_device(&dev->mt76);
 	mt7915_mcu_exit(dev);
-	mt7915_dma_cleanup(dev);
-
 	mt7915_tx_token_put(dev);
+	mt7915_dma_cleanup(dev);
 
 	mt76_free_device(&dev->mt76);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
