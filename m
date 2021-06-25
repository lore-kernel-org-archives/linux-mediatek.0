Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CD2C49EA6
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 02:33:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19994613CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 02:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19994613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VSqd3HADJaWxQ3CkdIlKSnRJsVad8aOgAo+3FFqPVms=; b=kAVv9tEV5KOPkC
	Up7gaa13LMSdpD/CGHRSyruzwpI2MGrJxmOO3F8OEQepeX2xwh9C+8JhP9avXyCmZELqMVvzW27y1
	s91CMhzbX2xUg5UN8z4SeP8OrZKsuny6NN1oNfRopeu47568+3BQWumj5YxUwYFbVonulqN8NUWYQ
	s1xvLzqBcrp4xB82i8Q/n1SdIZ4aqxtSAGXc0xIEG2U2QshdterRuHd9IsZ17h+o1mZKphuucWuk4
	Mjawm/DX4qjk2rWNk4HDHDhaLrrt1pwW4uo3oYrNr2wYBvCor3spmEnB4gDEzrBoxg+z6VgV1Uxbk
	ZPSaUdSBABN8y7LWmYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwbeu-00H5rS-LT; Fri, 25 Jun 2021 02:33:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwber-00H5r1-7M
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 02:33:31 +0000
X-UUID: 4a25bf3dc016484e9ad7821e23d5a371-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iywjOxYtLIOxpzLE1XblBJBFEQM4nEOpmsk41a1PE8s=; 
 b=hCXztEWJZAKUwF/TiROtMy03MM7t49NCCoNnbU8Baiy2d/BriFUY9U+HqE1KazKF/wQf24bZ9ZHNoHYQWbHNLJCg2Ql1F0tmnPokl9BIPWn5TRIADSFtI6gPWNPj3RCFRszJzSiApO57D6T4yVN1k8Vv58KlYfig6/nqO/w6aoo=;
X-UUID: 4a25bf3dc016484e9ad7821e23d5a371-20210624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1913777059; Thu, 24 Jun 2021 19:24:04 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 19:14:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Jun 2021 10:14:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Jun 2021 10:14:01 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>, 
 Bo Jiao <bo.jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix potential overflow of eeprom page index
Date: Fri, 25 Jun 2021 10:12:21 +0800
Message-ID: <20210625021221.10171-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_193330_725832_D1462BE7 
X-CRM114-Status: GOOD (  11.54  )
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

If total eeprom size is divisible by per-page size, the i in for loop
will exceed max page index, which happens in our newer chipset.

Fixes: 26f18380e6ca ("mt76: mt7915: add support for flash mode")
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c4e3ac2..0509953 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3392,20 +3392,20 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 
 static int mt7915_mcu_set_eeprom_flash(struct mt7915_dev *dev)
 {
-#define TOTAL_PAGE_MASK		GENMASK(7, 5)
+#define MAX_PAGE_IDX_MASK	GENMASK(7, 5)
 #define PAGE_IDX_MASK		GENMASK(4, 2)
 #define PER_PAGE_SIZE		0x400
 	struct mt7915_mcu_eeprom req = { .buffer_mode = EE_MODE_BUFFER };
-	u8 total = MT7915_EEPROM_SIZE / PER_PAGE_SIZE;
+	u8 total = DIV_ROUND_UP(MT7915_EEPROM_SIZE, PER_PAGE_SIZE);
 	u8 *eep = (u8 *)dev->mt76.eeprom.data;
 	int eep_len;
 	int i;
 
-	for (i = 0; i <= total; i++, eep += eep_len) {
+	for (i = 0; i < total; i++, eep += eep_len) {
 		struct sk_buff *skb;
 		int ret;
 
-		if (i == total)
+		if (i == total - 1 && MT7915_EEPROM_SIZE % PER_PAGE_SIZE)
 			eep_len = MT7915_EEPROM_SIZE % PER_PAGE_SIZE;
 		else
 			eep_len = PER_PAGE_SIZE;
@@ -3415,7 +3415,7 @@ static int mt7915_mcu_set_eeprom_flash(struct mt7915_dev *dev)
 		if (!skb)
 			return -ENOMEM;
 
-		req.format = FIELD_PREP(TOTAL_PAGE_MASK, total) |
+		req.format = FIELD_PREP(MAX_PAGE_IDX_MASK, total - 1) |
 			     FIELD_PREP(PAGE_IDX_MASK, i) | EE_FORMAT_WHOLE;
 		req.len = cpu_to_le16(eep_len);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
