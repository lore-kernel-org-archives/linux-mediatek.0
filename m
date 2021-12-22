Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB8EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 05:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEveREhIyE8MGojRoWk0u4ZMvVruuoMzFomG4DX/pYU=; b=lAcUrkcaAN3d44
	RIe7pNV2OMtJri2TDHhsaL+h5xVgk/GbqEkCh5b2JJFj0LVCsNAaZI+a7edwajvMAp7tp8L1F9Z5l
	j1SQDa17syTRxgtCEC9px1I3Gojk+p3Jb6kjegm2FqpFaFc5XuQWjUwj6GZnapZeZrpL7r1JclAXf
	DiYTQOmjAyrR3RBbHogX4G8z3iDJw5V0ahe/hPga/yqCyfS3J1t20zXP3j3lJsFxbXA+QZdQbbWXL
	OGSyArNZ3bg9sL9Uf3kmGkfOkNEnAhGVVtXbGXfkGnwbhOkicHKB4t6JXHHOQU34yeaUav/x9ZZAH
	aBmPeYncqNhj2yynzRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzudw-009Hqc-5a; Wed, 22 Dec 2021 05:58:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzudt-009Hq1-L0
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 05:58:26 +0000
X-UUID: eee58718d4214b7c8d3c4a549a83ee9f-20211221
X-UUID: eee58718d4214b7c8d3c4a549a83ee9f-20211221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 306317683; Tue, 21 Dec 2021 22:58:24 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Dec 2021 21:58:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Dec 2021 13:58:21 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Dec 2021 13:58:20 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] mt76: mt7921s: update mt7921s_wfsys_reset sequence
Date: Wed, 22 Dec 2021 13:58:18 +0800
Message-ID: <b18e61c14e845af5c4ade2a0eb16acd388058c17.1640151776.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f18bbe4b077e5e21c3fbb04c5ab84520142d567d.1640151776.git.objelf@gmail.com>
References: <f18bbe4b077e5e21c3fbb04c5ab84520142d567d.1640151776.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_215825_740903_DE6BC431 
X-CRM114-Status: UNSURE (   9.53  )
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

From: YN Chen <YN.Chen@mediatek.com>

MT7921S firmware expects driver to clear out the firmware download state
before FW is downloaded again in WiFi reset procedure.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/regs.h     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index cbd38122c510..411695f273cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -454,6 +454,9 @@
 
 #define MT_DMASHDL_SCHED_SET(_n)	MT_DMA_SHDL(0x070 + ((_n) << 2))
 
+#define MT_CONN_STATUS			0x7c053c10
+#define MT_WIFI_PATCH_DL_STATE		BIT(0)
+
 #define MT_CONN_ON_LPCTL		0x7c060010
 #define PCIE_LPCR_HOST_OWN_SYNC		BIT(2)
 #define PCIE_LPCR_HOST_CLR_OWN		BIT(1)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index e0f0d3a2b17e..4fd1d4765b04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -63,6 +63,8 @@ int mt7921s_wfsys_reset(struct mt7921_dev *dev)
 	clear_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 
 	/* activate mt7921s again */
+	mt7921s_mcu_drv_pmctrl(dev);
+	mt76_clear(dev, MT_CONN_STATUS, MT_WIFI_PATCH_DL_STATE);
 	mt7921s_mcu_fw_pmctrl(dev);
 	mt7921s_mcu_drv_pmctrl(dev);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
