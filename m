Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 23:58:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10FED61155
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 23:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10FED61155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ycXuQW4unDS/sZB0cllUFN+lF2BTFSjh66PU96DwHw=; b=FAbj9c8Dl6YlWU
	Q0akSG8f+tH3EIhvPtibsT50g9fYFUEcXGJEcCZRpX7P1k8Ff22EDcItQg3H4n8L7APqeu8Rmp77P
	Wx9JEgvL9KgJFHvYCv9MIP7yyKzOPxH2pNWs/P9CBTo3HGACCBqnmKEk3oUe73fuOl//q560Y7a+a
	ZaqiBOZcUf7a/874HkMSjc0ZSSfgDitejfIHGGxiMae2jrgdap1Ahvuuub5SQ4TXQh4FOa5hZGPBC
	Gq0Tx0isTQBcfjnqT+HLT8lSAhJ2H4V64fu7Tbt9PhbFGNNaJixT3n1gRM4QC/fhT2O5NuyM6OrGd
	GAbUXDeFk7nN+89wYjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRNjp-00FAfY-Pd; Fri, 17 Sep 2021 23:57:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRNjl-00FAf4-Go
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 23:57:47 +0000
X-UUID: 899c207846ce474f8e35cc199f0fce38-20210917
X-UUID: 899c207846ce474f8e35cc199f0fce38-20210917
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1340818706; Fri, 17 Sep 2021 16:57:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 16:54:24 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 18 Sep 2021 07:54:22 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: not accounting the MCU header size in
 __mt76_mcu_send_firmware for mt7915/21
Date: Sat, 18 Sep 2021 07:54:21 +0800
Message-ID: <d1bb53709aa4cebc33acb1f4690683299d68b06f.1631917451.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_165745_608417_69F4FA88 
X-CRM114-Status: GOOD (  13.90  )
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

From: Sean Wang <sean.wang@mediatek.com>

Each firmware piece with mt7915 and mt7921 do not have the MCU header to
reroute the packet to the internal RAM. So we do not need to consider the
MCU header size in __mt76_mcu_send_firmware.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
The patch is developed based on ("mt76: introduce __mt76_mcu_send_firmware
routine")
---
 drivers/net/wireless/mediatek/mt76/mcu.c        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h       | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 946694af5dcc..3f94c37251df 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -112,7 +112,7 @@ int __mt76_mcu_send_firmware(struct mt76_dev *dev, int cmd, const void *data,
 	int err, cur_len;
 
 	while (len > 0) {
-		cur_len = min_t(int, max_len - dev->mcu_ops->headroom, len);
+		cur_len = min_t(int, max_len, len);
 
 		err = mt76_mcu_send_msg(dev, cmd, data, cur_len, false);
 		if (err)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 644d1417ecdc..274f1d2466e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1263,7 +1263,9 @@ static inline int
 mt76_mcu_send_firmware(struct mt76_dev *dev, int cmd, const void *data,
 		       int len)
 {
-	return __mt76_mcu_send_firmware(dev, cmd, data, len, 4096);
+	int max_len = 4096 - dev->mcu_ops->headroom;
+
+	return __mt76_mcu_send_firmware(dev, cmd, data, len, max_len);
 }
 
 static inline int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 39cba8210242..17dd6881eef0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2692,8 +2692,8 @@ static int mt7915_load_patch(struct mt7915_dev *dev)
 			goto out;
 		}
 
-		ret = mt76_mcu_send_firmware(&dev->mt76, MCU_CMD(FW_SCATTER),
-					     dl, len);
+		ret = __mt76_mcu_send_firmware(&dev->mt76, MCU_CMD(FW_SCATTER),
+					       dl, len, 4096);
 		if (ret) {
 			dev_err(dev->mt76.dev, "Failed to send patch\n");
 			goto out;
@@ -2761,8 +2761,8 @@ mt7915_mcu_send_ram_firmware(struct mt7915_dev *dev,
 			return err;
 		}
 
-		err = mt76_mcu_send_firmware(&dev->mt76, MCU_CMD(FW_SCATTER),
-					     data + offset, len);
+		err = __mt76_mcu_send_firmware(&dev->mt76, MCU_CMD(FW_SCATTER),
+					       data + offset, len, 4096);
 		if (err) {
 			dev_err(dev->mt76.dev, "Failed to send firmware.\n");
 			return err;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
