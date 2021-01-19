Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFCFC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 03:01:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8169F206F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 03:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8169F206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWGWV2wcdsSXaSb4ttdaVTMT9VICRAIKMA6xEJ2jakQ=; b=Z97+saqUy7gEYl4akfsjNWSmbd
	GaQzMbs1RmaUFWkGC/uQ9TEzcxRCG7RJ4lQPas39649wCeM/CttpBSIqDCyUWACfcwlIjDxuPZDGQ
	seqOUgrwqAGgMX9pHQXF3MNybJ5ih8NRIIo07Eh16tO+JOz7HUGqlUMWmZL7nErjtTvVyU2xIv2E2
	x8dxWBYHHaOhnCi2zxyJE2AdpnNuogVB8J3rXLZk1XGHSFFi6sneWmwfYqdtyv963331Yy0HBin6A
	JYfOQnCJUt3HlIFkpLztK32nlYjWySPcSMbXaKLIeGe94ld0F47MmXGOBHsqmsEHsF2IbEgWUGa5g
	qZNlnDFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1hH0-0007Jv-0a; Tue, 19 Jan 2021 03:01:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1hGx-0007Ip-Qf
 for linux-mediatek@lists.infradead.org; Tue, 19 Jan 2021 03:01:36 +0000
X-UUID: f621859c78384c3eaf87c21045e44767-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+pMJXSfggRp6QMPMTv6oSVpOlZCFHVbD5L2c0hXPRog=; 
 b=PHb+mkKI3sK4ldm8UhBgSKLmmU2vzNpo7mqWGcCpWNNYoYHC10XobCxLGvDf9myZaJFGTEnNmNcIEG8brRaLit/7AV+V2LuS1wc9tH+sQw7XSUKHwUAXyV9I5f4kytlDQlWT9TvqWtNzvhm/el7FA0AU4oVZgbpGCBovdNetp8w=;
X-UUID: f621859c78384c3eaf87c21045e44767-20210118
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 167512599; Mon, 18 Jan 2021 19:01:30 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 19:01:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Jan 2021 11:01:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Jan 2021 11:01:26 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2] mt76: mt7915: support TxBF for DBDC
Date: Tue, 19 Jan 2021 11:01:25 +0800
Message-ID: <55d4370379796672abd12baacb82ace52d594b9d.1610938153.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84CABABC773B09E7EBDFBA5094A23FF14B3DA54BCB7ADC49741A0C36F91E371B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_220136_046841_5E593B13 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With this patch, TxBF can be run on both bands simultaneously.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  7 +++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 19 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 5e21646865a6..ad4e5b95158b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -169,6 +169,13 @@ static int mt7915_txbf_init(struct mt7915_dev *dev)
 {
 	int ret;
 
+
+	if (dev->dbdc_support) {
+		ret = mt7915_mcu_set_txbf_module(dev);
+		if (ret)
+			return ret;
+	}
+
 	/* trigger sounding packets */
 	ret = mt7915_mcu_set_txbf_sounding(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6d4c5b7dfd56..b8fe34da9c77 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3422,6 +3422,25 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band)
 				 &req, sizeof(req), false);
 }
 
+int mt7915_mcu_set_txbf_module(struct mt7915_dev *dev)
+{
+#define MT_BF_MODULE_UPDATE               25
+	struct {
+		u8 action;
+		u8 bf_num;
+		u8 bf_bitmap;
+		u8 bf_sel[8];
+		u8 rsv[8];
+	} __packed req = {
+		.action = MT_BF_MODULE_UPDATE,
+		.bf_num = 2,
+		.bf_bitmap = GENMASK(1, 0),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_TXBF_ACTION, &req,
+				 sizeof(req), true);
+}
+
 int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev)
 {
 #define MT_BF_TYPE_UPDATE		20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b5954bae139b..f45e88bf2626 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -341,6 +341,7 @@ int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
 int mt7915_mcu_set_sku(struct mt7915_phy *phy);
 int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev);
+int mt7915_mcu_set_txbf_module(struct mt7915_dev *dev);
 int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev);
 int mt7915_mcu_set_fcc5_lpn(struct mt7915_dev *dev, int val);
 int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
