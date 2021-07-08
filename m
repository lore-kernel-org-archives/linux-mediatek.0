Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36795C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 13:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0165561493
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 13:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0165561493
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=67UeSDM1K1zDY9OEsMs7BfB5i8xU8gROMT14NLuhvkg=; b=PQ9C6L1zDo8/oR
	u8zEi8ZeNBJic/5USs9ccsGSNB2M2IR1JFsFFZLmmZK/SIk1I2BFZDTTR8gF6h6QdViYAasFuUFbP
	QWuTUmmwRszofSM7C3sRDs5IKJwsNRk+oaqmTWDxoAv2S0afIw80nZi3+WERazJkhhUPz70oiTnRP
	f6hnbkCqO6Fhrz2qwybSfqkw4dMBWUp9CQLKo7V6DVLNk8z7Uw1fbCnvL0SZx3cRmJYeuLcresXHM
	TyiHiAr+j58D1kaj9pklML1ZyeHqfnm0Zrhg+Ns/V4YUsFIDw13zHcKXZ4mPjlPCNonqa9vDcWta0
	+r+MJHutCu65s4kHxjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1U1N-00H4bz-0J; Thu, 08 Jul 2021 13:24:53 +0000
Received: from 185-125-188-181.canonical.com ([185.125.188.181]
 helo=smtp-relay-canonical-1.canonical.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1U18-00H4Z4-ID; Thu, 08 Jul 2021 13:24:39 +0000
Received: from localhost.localdomain (unknown [222.129.38.167])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id F2B09401BE; 
 Thu,  8 Jul 2021 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1625750250;
 bh=MZaGHZileR4ok+NZSlM+m9Pz61MDdpoPPs63678sG9k=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=wMlumXYlpN0n/yclDWu8glv34+OE5e0kLicAgCmYuQYhooP++yNldYLDdRuvlfmMQ
 BqdNhedF+Mfuhy2JwCRXw32TA6a60kOOjQZvu9oMvJfCmrJtfLzJin2ofDqxvARj2T
 cRI5yhvpa9IfaHbXJcRelXo99qJhAyPaepiAE5Ct149Qnwga5x635TBdgb/12ufHLk
 Qer4qH9flcYO5EAVOSfiNgEcy3VUjw3fCFJh+FHBFjlj3QRQtDIK41O/RRsY/9el0H
 N+XkWQGk7lO0M1Ho1AnJetVAyLs949u51jOeyn5mQ9qXWsLl2UZmFXFwjhzWtPuzhR
 OV/hhV6yQUJjA==
From: Aaron Ma <aaron.ma@canonical.com>
To: aaron.ma@canonical.com, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 Soul.Huang@mediatek.com, deren.wu@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mt76: mt7921: continue to probe driver when fw already
 downloaded
Date: Thu,  8 Jul 2021 21:17:10 +0800
Message-Id: <20210708131710.695595-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_062438_829139_1A7D228C 
X-CRM114-Status: GOOD (  10.03  )
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

When reboot system, no power cycles, firmware is already downloaded,
return -EIO will break driver as error:
mt7921e: probe of 0000:03:00.0 failed with error -5

Skip firmware download and continue to probe.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index c2c4dc196802..cd690c64f65b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -931,7 +931,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
 	ret = mt76_get_field(dev, MT_CONN_ON_MISC, MT_TOP_MISC2_FW_N9_RDY);
 	if (ret) {
 		dev_dbg(dev->mt76.dev, "Firmware is already download\n");
-		return -EIO;
+		goto fw_loaded;
 	}
 
 	ret = mt7921_load_patch(dev);
@@ -949,6 +949,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
 		return -EIO;
 	}
 
+fw_loaded:
 	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
 
 #ifdef CONFIG_PM
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
