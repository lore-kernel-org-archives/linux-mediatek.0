Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3154EDEC6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba6S9adPAWLGYboYX2BbN2qsBvx/vGtpZBCMQpt/U9Y=; b=NX0xeXSOnrupJT4Io3/kTY9Lzi
	IxxQz+8gMKcUiKOmGYsiFEO6Jxyojvp/6He05znFBr9vgZG+qYmrekDYWXPPIhseBYs+sUmhZzYzd
	450adYftp+v207h0sGdcfzE0XJb21XcAuH/D4fIXqjtiv5DX7QVfLAPIuAS3j2XlbHD7r/WKLHvjb
	KIKnVP0IjEO8XJ5cPFd5pr/BUz1yvu//hWoljvGaaYn13lnW0Ued/Ub0NMzA/IwJa2lKxLsw/jjJP
	7QYmJtiI9CwM72rgUeOKJX/iTaMXFfV6uQ2G0m0dZC3iXFoZUEdthiNhK6fPlcdn7mwbLO9XY2s9z
	qvTcSt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR78-00690i-2R;
	Wed, 13 Sep 2023 14:45:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR73-0068xO-2i
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 14:45:08 +0000
X-UUID: 1c7b0028524411ee86758d4a7c00f3a0-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ba6S9adPAWLGYboYX2BbN2qsBvx/vGtpZBCMQpt/U9Y=;
	b=rAYNEpfV8ZVdfgbenewA8SLnZ63GHaK2V31Iq2k/cRRxBt9cD/6uF9iGTb9Eoh0pvQhk3FtlTMPkowcU58voTApo+WtOgSb3QprMAO0QndvYKoJOqLQXXujgr8DmUGdm9TdiJBkvWecmAUZVmLlBlwvQDXTwb7hy69D1TdyUPQo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:38bb4a67-0fb7-4b95-b321-8cbd3309c855,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:13f5cbbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c7b0028524411ee86758d4a7c00f3a0-20230913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1732002372; Wed, 13 Sep 2023 07:44:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 22:44:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 22:44:23 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 11/17] wifi: mt76: mt7925: add pci_mcu.c
Date: Wed, 13 Sep 2023 22:43:39 +0800
Message-ID: <e70d792e7c37219ee48baf199a3275d98bf20900.1694595134.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1694595134.git.deren.wu@mediatek.com>
References: <cover.1694595134.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.646400-8.000000
X-TMASE-MatchedRID: 59Hu41dzmXTKRSR886eK0gPZZctd3P4BWjWsWQUWzVpnnK6mXN72m1Ue
	MbrYurbIadgG7kzTAhS5ujAticPZ9fm9WstcRwZxuZH4LSX2+NUfOdo4H355iGe6/ylXAzNJo8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgoGRyAacnhaYq25BLAOYym3oGIxpTutRJqX5VCcpSMWDStc
	hC7WBwun7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.646400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4713915B6A59FB1A5B8A42FC35B5370034F84BA176D1928A0672B21B5E87B7782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_074505_894421_8D748404 
X-CRM114-Status: GOOD (  13.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/pci_mcu.c   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
new file mode 100644
index 000000000000..f95bc5dcd830
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2023 MediaTek Inc. */
+
+#include "mt7925.h"
+#include "mcu.h"
+
+static int
+mt7925_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
+			int cmd, int *seq)
+{
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	enum mt76_mcuq_id txq = MT_MCUQ_WM;
+	int ret;
+
+	ret = mt7925_mcu_fill_message(mdev, skb, cmd, seq);
+	if (ret)
+		return ret;
+
+	mdev->mcu.timeout = 3 * HZ;
+
+	if (cmd == MCU_CMD(FW_SCATTER))
+		txq = MT_MCUQ_FWDL;
+
+	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[txq], skb, 0);
+}
+
+int mt7925e_mcu_init(struct mt792x_dev *dev)
+{
+	static const struct mt76_mcu_ops mt7925_mcu_ops = {
+		.headroom = sizeof(struct mt76_connac2_mcu_txd),
+		.mcu_skb_send_msg = mt7925_mcu_send_message,
+		.mcu_parse_response = mt7925_mcu_parse_response,
+	};
+	int err;
+
+	dev->mt76.mcu_ops = &mt7925_mcu_ops;
+
+	err = mt792xe_mcu_fw_pmctrl(dev);
+	if (err)
+		return err;
+
+	err = __mt792xe_mcu_drv_pmctrl(dev);
+	if (err)
+		return err;
+
+	mt76_rmw_field(dev, MT_PCIE_MAC_PM, MT_PCIE_MAC_PM_L0S_DIS, 1);
+
+	err = mt7925_run_firmware(dev);
+
+	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
+
+	return err;
+}
-- 
2.18.0


