Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB0DC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD9D61279
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FD9D61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sa6EcKJe9+Vido2Mup0ie+VLvipBCNhAt7+Q6rPwTsY=; b=TUAoto5KI68/yWwx7BjY40H2R
	3AO/2u6yHfi0S5GPyA7t/Fn5jIJm+n6Tb/a0vByS1sV0vRPy4H64tZRHpoh/rek5M2k3fcLjG2AEx
	1O9L2qLkRKiWGSoOg0QkpOuJgW6lzXJda6TbIWYxERLVTRACdCOaeqDGuPmxBGHyzhGTs2jdTc/6c
	7DT6YkHFTZRgsxaPtSxt58q5PTuw6ctdTLQjHWnRnjzF175qTEm/O3WEmxTs5WGTDftfSwD6ufuWU
	5aGsn36J4I+UbCtbCYqqRUD3E1zcE1qGWPQj/Wh2r36i7z6LKeV9Wr5R86kjS2vnXx7EbCxybkbp/
	7kQw7qm+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUmL-00A4tf-FG; Mon, 19 Apr 2021 14:21:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmJ-00A4sv-6T
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=h45EFwTAs2hUGVtyVHo/Ltpd7gTM5qMRjPnAAEUioEY=; b=jN/TQ5Y/Q1XwkSLTz5H8BnrQEv
 tjfOfWMDYTNC/bqsQop1KNuiIs3JAq5xjg15Dp1gSpPk/MGZh1lOuxIXVi0NffQB0OR0A9f6gT4ve
 yhZY0Zz2H7gJq5lIFXOAKQVpy33FMsDf4RdE2hdBHpB+h0m+pHL/Y3bx9/E1vKCXFCodRCZmBQLOU
 IVlwJppnTteVE49Tgh7pMejoViDZAfFHaWmW2Kl4Qn5HDj0Z04PZNBw1xarDFfTEP+Au/GItDS6SE
 JPvnqMwr3rAEHoowgG4xqG6I2UCXgPkKJDiXgxClm2CfcFmaLb4+lFg3CU8Qp7hmDy6k/R4lae+jR
 5zLxiozQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmG-00BRkV-DU
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:30 +0000
X-UUID: ac2d6479e7f44a22b55ed49c6d881937-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h45EFwTAs2hUGVtyVHo/Ltpd7gTM5qMRjPnAAEUioEY=; 
 b=LfLR3DiJbgt0J2ku2yCNwDb3rdISeA+LXR7DUVG2NfgIA6iyMsEzQo40t5WBNn5wnKW2iuunz0rKhkZRH4vkfjR/3HHY2etVNx9P76YhdQZnZdqDlufnm/o42G2kmAyRmbi2ikvq4hUKg8SngA/1SKlgcvJ1To05ptItqklRpvs=;
X-UUID: ac2d6479e7f44a22b55ed49c6d881937-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 498168355; Mon, 19 Apr 2021 07:21:26 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 22:21:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 22:21:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH v2 5/6] mt76: connac: introduce mt76_connac_mcu_set_deep_sleep
 utility
Date: Mon, 19 Apr 2021 22:20:58 +0800
Message-ID: <1618842059-8192-6-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
References: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 787FEFBEDAE633D96533E843CEEB0C3CA9AD4A22DE488F0CBAA1BA686BADE5292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072128_480570_24D47B07 
X-CRM114-Status: GOOD (  11.20  )
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

Introduce mt76_connac_mcu_set_deep_sleep to enable deep sleep mode
and will be activated immediately when the host returns the ownership
to the device.

Co-developed-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 22 ++++++++++++-------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 10 +++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 860406a53cb6..7578855099e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1528,14 +1528,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_sched_scan_enable);
 
 int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
 {
-	struct {
-		__le16 id;
-		u8 type;
-		u8 resp_type;
-		__le16 data_size;
-		__le16 resv;
-		u8 data[320];
-	} req = {
+	struct mt76_connac_config req = {
 		.resp_type = 0,
 	};
 
@@ -1546,6 +1539,19 @@ int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_chip_config);
 
+int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable)
+{
+	struct mt76_connac_config req = {
+		.resp_type = 0,
+	};
+
+	snprintf(req.data, sizeof(req.data), "KeepFullPwr %d", !enable);
+
+	return mt76_mcu_send_msg(dev, MCU_CMD_CHIP_CONFIG, &req, sizeof(req),
+				 false);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_deep_sleep);
+
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ff9fca52f344..e943b89fda75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -918,6 +918,15 @@ struct mt76_connac_tx_power_limit_tlv {
 	u8 pad2[32];
 } __packed;
 
+struct mt76_connac_config {
+	__le16 id;
+	u8 type;
+	u8 resp_type;
+	__le16 data_size;
+	__le16 resv;
+	u8 data[320];
+} __packed;
+
 #define to_wcid_lo(id)		FIELD_GET(GENMASK(7, 0), (u16)id)
 #define to_wcid_hi(id)		FIELD_GET(GENMASK(9, 8), (u16)id)
 
@@ -1017,6 +1026,7 @@ int mt76_connac_mcu_set_hif_suspend(struct mt76_dev *dev, bool suspend);
 void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
 int mt76_connac_mcu_chip_config(struct mt76_dev *dev);
+int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable);
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump);
 int mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
