Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE576C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 02:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B1F61165
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 02:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B1F61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=clK54EgqFvX5kOqA+r5IW9Bb/oz1xAdi4DGmhGDCeqE=; b=tPtEvneTRmeIV1
	SAjpcb6WUw7zprkQB6fKOIaSczUwzUNmkU4mUK4PJpU2HNZQJpDR016Cq/TruV38JFytXxzjNz7Qn
	UvbUbKghn7nVLoJL0KqJMol4b4dx+r2xUWQMFd2g++36dg5Z3OT1iq+gf8KCTc7qLMxT6WtyvQx+b
	bL4XUKtEYvS2VrlxSYczmS5rMXietY9nfIvKydLj7F3db12OnpMpBjyzd2rOPlwnZ4SwQYb9lyCSs
	58gWqV721EvD8mxMnAuditv6jg95D0HCy27KAjycveHP6f7KmcGz2YKdvXx5C4jFmQ1aSqxBR+AF0
	HK51XWuzwVkhzkEktv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5fse-00BkfV-1h; Tue, 20 Jul 2021 02:53:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5fsa-00BkeX-Gu
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 02:53:10 +0000
X-UUID: 6d62b93f9013491fb2b05cc74be68bb2-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ohI0LvFYsoV0QS5gCrgX0x9obWhXTxhPpyOhtMYFa7g=; 
 b=SkfaAp3H1/rH4tkZ1Id5ciUmaL5iRJzssvtohvyqN5PlUUKX0kvljg3uJz3cgFfiskBlSn5Mr1oyOpakDMSdxZSNn0vIAlq0DwnqcvyrtrU9bOGuRSSm+UupcJpd1pY/P7vpjJjWjP9NIoRJu98R/3loAXb4fu/yl9Ubv8IFlkk=;
X-UUID: 6d62b93f9013491fb2b05cc74be68bb2-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 76487591; Mon, 19 Jul 2021 19:53:05 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 19:49:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 10:49:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Jul 2021 10:49:27 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: fix potential overflow of eeprom page index
Date: Tue, 20 Jul 2021 10:48:32 +0800
Message-ID: <20210720024832.20265-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_195309_429488_4FC145AE 
X-CRM114-Status: GOOD (  12.13  )
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
Reported-by: kernel test robot <lkp@intel.com>
---
v2: fix warning reported by kernel test robot

	drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:3407:22: warning: use
	of logical '&&' with constant operand [-Wconstant-logical-operand]
	if (i == total - 1 && MT7915_EEPROM_SIZE % PER_PAGE_SIZE)
			^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 91efa9b..69b6796 100644
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
+		if (i == total - 1 && !!(MT7915_EEPROM_SIZE % PER_PAGE_SIZE))
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
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
