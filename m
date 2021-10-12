Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE373C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 23:03:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838F260724
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 23:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 838F260724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4PVLj8Z2vcsVrpeAhqlQGqQKalgAooOR0FTPIbueb4=; b=yzzP7L45qSXBIu
	sDj+LAOQQ4H3UIvnLFVrIr8NDwVr7KcJIPldZ0S49yeS1q0ChvL4Y+huv5oCS86l4lU5KtTFkzA7G
	El/oEl5x+UEg36AV6GIUBgODi6CwZHQo0cZxvvsVk4Chbz8TIb3L7ZLnisCJFq1fWZKPymXa5yNwn
	nTQj8q915DjhjKWAlVj/H3USCAdn8B/UdU+uQx7iiGMqO8FS6PRapTgBpdw30lyZSHV9AGSljYvPM
	qIhgxRIsMaFpSlCsKJib5gEC0TIGSpla9ANnWmLu9p9I6dtrExFf7Tr7dLP2pNwZSJapNX0d/ynaU
	j9SrNcZLn7xHMomoB1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maQnI-00E8rI-Vk; Tue, 12 Oct 2021 23:02:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maQnF-00E8nV-LI
 for linux-mediatek@lists.infradead.org; Tue, 12 Oct 2021 23:02:47 +0000
X-UUID: fcff6da4594b463282895360bb247dfe-20211012
X-UUID: fcff6da4594b463282895360bb247dfe-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1600060301; Tue, 12 Oct 2021 16:02:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 15:52:50 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 13 Oct 2021 06:52:49 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 12/16] mt76: connac: extend mcu_get_nic_capability
Date: Wed, 13 Oct 2021 06:52:05 +0800
Message-ID: <e6831b1e422349b70abcfb027a09225b7e70f0ed.1634077769.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634077769.git.objelf@gmail.com>
References: <cover.1634077769.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_160245_740963_346F8043 
X-CRM114-Status: GOOD (  11.97  )
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

Extend mcu_get_nic_capability to obtain tx resource for SDIO device,
MAC address, and PHY capability.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 06f0d1348d52..31fc94cf21ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -512,6 +512,7 @@ struct mt76_sdio {
 		int pse_data_quota;
 		int ple_data_quota;
 		int pse_mcu_quota;
+		int pse_page_size;
 		int deficit;
 	} sched;
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 404c6bf8578e..b1a256476fed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1722,6 +1722,61 @@ void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_coredump_event);
 
+static void mt76_connac_mcu_parse_tx_resource(struct mt76_dev *dev,
+					      struct sk_buff *skb)
+{
+	struct mt76_sdio *sdio = &dev->sdio;
+	struct mt76_connac_tx_resource {
+		__le32 version;
+		__le32 pse_data_quota;
+		__le32 pse_mcu_quota;
+		__le32 ple_data_quota;
+		__le32 ple_mcu_quota;
+		__le16 pse_page_size;
+		__le16 ple_page_size;
+		u8 pp_padding;
+		u8 pad[3];
+	} __packed * tx_res;
+
+	tx_res = (struct mt76_connac_tx_resource *)skb->data;
+	sdio->sched.pse_data_quota = le32_to_cpu(tx_res->pse_data_quota);
+	sdio->sched.pse_mcu_quota = le32_to_cpu(tx_res->pse_mcu_quota);
+	sdio->sched.ple_data_quota = le32_to_cpu(tx_res->ple_data_quota);
+	sdio->sched.pse_page_size = le32_to_cpu(tx_res->pse_page_size);
+	sdio->sched.deficit = tx_res->pp_padding;
+}
+
+static void mt76_connac_mcu_parse_phy_cap(struct mt76_dev *dev,
+					  struct sk_buff *skb)
+{
+	struct mt76_connac_phy_cap {
+		u8 ht;
+		u8 vht;
+		u8 _5g;
+		u8 max_bw;
+		u8 nss;
+		u8 dbdc;
+		u8 tx_ldpc;
+		u8 rx_ldpc;
+		u8 tx_stbc;
+		u8 rx_stbc;
+		u8 hw_path;
+		u8 he;
+	} __packed * cap;
+
+	enum {
+		WF0_24G,
+		WF0_5G
+	};
+
+	cap = (struct mt76_connac_phy_cap *)skb->data;
+
+	dev->phy.antenna_mask = BIT(cap->nss) - 1;
+	dev->phy.chainmask = dev->phy.antenna_mask;
+	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
+	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+}
+
 int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
 {
 	struct mt76_connac_cap_hdr {
@@ -1764,6 +1819,17 @@ int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
 		case MT_NIC_CAP_6G:
 			phy->cap.has_6ghz = skb->data[0];
 			break;
+		case MT_NIC_CAP_MAC_ADDR:
+			memcpy(phy->macaddr, (void *)skb->data, ETH_ALEN);
+			break;
+		case MT_NIC_CAP_PHY:
+			mt76_connac_mcu_parse_phy_cap(phy->dev, skb);
+			break;
+		case MT_NIC_CAP_TX_RESOURCE:
+			if (mt76_is_sdio(phy->dev))
+				mt76_connac_mcu_parse_tx_resource(phy->dev,
+								  skb);
+			break;
 		default:
 			break;
 		}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
