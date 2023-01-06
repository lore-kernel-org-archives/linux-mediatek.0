Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3943FC53210
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 02:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCgAEXW6eSFcKj+Z6Ey5MKhr/05jx4NkjqDNfQM7PgQ=; b=2um1Bl2zlxcWK93E0/+nGRJ7fp
	xxcsc12sxB4pVCsea1wRCunGU7BAhRB1CAmd1JvXBiQQWW1EflEA0dWsTUJLRAJEon20GGGMH6hak
	+coo2leqNM2m3LZuBul0zm8nhVS8/il49s4V6VFZDK465DH0ZFlFIj0NfgwcooOm8ruYsrS9T2Qw+
	zcgIoYKEO9tz0rj4U0u8XYi4CS4oGtM6aUe7PACFDj04kE8bh7iIea6zTyBt6CYN6as3B35BTFiZT
	EkHSInBqvM+wxgM/ePPpeZSniiDCuxcmuxcxkjhU2Hw4dfgaT/ZmBKU43uaJl/XT29uDVrZXKEPTf
	hu6UdoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDckP-00HHbM-VM; Fri, 06 Jan 2023 02:46:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDckL-00HHZJ-Bl
	for linux-mediatek@bombadil.infradead.org; Fri, 06 Jan 2023 02:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yCgAEXW6eSFcKj+Z6Ey5MKhr/05jx4NkjqDNfQM7PgQ=; b=Q02NvDiuOvj9upuezpfoSCgSIl
	S5Di7jw4pacJvsUaADKVgb3iK0VakZJqEgAkyvv3bKNinXvqZhU/0ty9kfzfa7bYTdrr/FvKbxzxK
	d8ulR4pfDmT/XZQ9Zth92h9yhWuqys8zLnvW4habLL/DjCWWOyAxecOyNa3Ty38vyLIaxD7DjC4LS
	MiOiqhS9NeK0PUULNkJtnYbr9em48UuSap6EcnCrIk1BlvVeziA4+oQkUm49iPZJgR/849fW+vdCa
	Nflb/3onZjOaegwfVFcT08l/T2qwCCBeb/xt1/hGvkrz30cKKCdi4desuQUE4ICULmJ70b5TkSWKk
	Iqck8w9w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDck4-001g2M-1R
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Jan 2023 02:46:06 +0000
X-UUID: a981045e90934423bfd03732e84ecf8c-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yCgAEXW6eSFcKj+Z6Ey5MKhr/05jx4NkjqDNfQM7PgQ=;
	b=gVjpN6qKcPSL8sFzLgie2dNSyqbrV9x4/m2/AcWsQluZ8Yn4C+a74oTExrGyaGJVWwMkTBKsZ8VYJHuH9jbEpX/AzNzolTiv5B5ZiKCoakr29VnA6pj89Pvayx0h3n2ZDUVDPqozvRvgBnk1a9L1AwLewkRwycvZsI691JGacA0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:7929182b-bfa9-4a12-a5ce-0cf54a27b6be,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.17,REQID:7929182b-bfa9-4a12-a5ce-0cf54a27b6be,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:543e81c,CLOUDID:c7b2688b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230106104415RDNRVZBT,BulkQuantity:3,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-BVR: 0
X-UUID: a981045e90934423bfd03732e84ecf8c-20230105
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 294281745; Thu, 05 Jan 2023 19:44:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 6 Jan 2023 10:44:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 10:44:13 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v2 2/2] wifi: mt76: mt7915: wed: enable red per-band token drop
Date: Fri, 6 Jan 2023 10:44:12 +0800
Message-ID: <20230106024412.10064-2-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230106024412.10064-1-chui-hao.chiu@mediatek.com>
References: <20230106024412.10064-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_024602_528133_8A249EC6 
X-CRM114-Status: GOOD (  15.90  )
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

Enable RED to limit the number of token used by each band. If single band
uses too many tokens, it would hurt the throughput of the other bands.The
software path can solve this problem by AQL so enable RED for HW path only.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
v2:
  - Fix endianness and remove blank lines.
  - Add macro to prevent compile error without CONFIG_NET_MEDIATEK_SOC_SED.
  - Add static for mt7915_mcu_set_red.
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 50 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  2 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 5 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f1e942b9a887..855a434ecf54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1171,6 +1171,7 @@ enum {
 	MCU_EXT_CMD_GET_MIB_INFO = 0x5a,
 	MCU_EXT_CMD_TXDPD_CAL = 0x60,
 	MCU_EXT_CMD_CAL_CACHE = 0x67,
+	MCU_EXT_CMD_RED_ENABLE = 0x68,
 	MCU_EXT_CMD_SET_RADAR_TH = 0x7c,
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 	MCU_EXT_CMD_MWDS_SUPPORT = 0x80,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 37a3c1f082d9..b4fbd19e285a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2291,6 +2291,53 @@ mt7915_mcu_init_rx_airtime(struct mt7915_dev *dev)
 				 sizeof(req), true);
 }
 
+static int mt7915_red_set_watermark(struct mt7915_dev *dev)
+{
+#define RED_GLOBAL_TOKEN_WATERMARK 2
+	struct {
+		__le32 args[3];
+		u8 cmd;
+		u8 version;
+		u8 __rsv1[4];
+		__le16 len;
+		__le16 high_mark;
+		__le16 low_mark;
+		u8 __rsv2[12];
+	} __packed req = {
+		.args[0] = cpu_to_le32(MCU_WA_PARAM_RED_SETTING),
+		.cmd = RED_GLOBAL_TOKEN_WATERMARK,
+		.len = cpu_to_le16(sizeof(req) - sizeof(req.args)),
+		.high_mark = cpu_to_le16(MT7915_HW_TOKEN_SIZE - 256),
+		.low_mark = cpu_to_le16(MT7915_HW_TOKEN_SIZE - 256 - 1536),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_PARAM_CMD(SET), &req,
+				 sizeof(req), false);
+}
+
+static int mt7915_mcu_set_red(struct mt7915_dev *dev, bool enabled)
+{
+#define RED_DISABLE		0
+#define RED_BY_WA_ENABLE	2
+	int ret;
+	u32 red_type = enabled ? RED_BY_WA_ENABLE : RED_DISABLE;
+	__le32 req = cpu_to_le32(red_type);
+
+	if (enabled) {
+		ret = mt7915_red_set_watermark(dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RED_ENABLE), &req,
+				sizeof(req), false);
+	if (ret < 0)
+		return ret;
+
+	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+				 MCU_WA_PARAM_RED, enabled, 0);
+}
+
 int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 {
 	int ret;
@@ -2339,8 +2386,7 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
-	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
-				 MCU_WA_PARAM_RED, 0, 0);
+	return mt7915_mcu_set_red(dev, mtk_wed_device_active(&dev->mt76.mmio.wed));
 }
 
 int mt7915_mcu_init(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 29b5434bfdb8..b9ea297f382c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -278,6 +278,7 @@ enum {
 	MCU_WA_PARAM_PDMA_RX = 0x04,
 	MCU_WA_PARAM_CPU_UTIL = 0x0b,
 	MCU_WA_PARAM_RED = 0x0e,
+	MCU_WA_PARAM_RED_SETTING = 0x40,
 };
 
 enum mcu_mmps_mode {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 1a2e4df8d1b5..b9e8cfd926c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -748,7 +748,7 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 		wed->wlan.wpdma_rx_glo = res->start + MT_WPDMA_GLO_CFG;
 		wed->wlan.wpdma_rx = res->start + MT_RXQ_WED_DATA_RING_BASE;
 	}
-	wed->wlan.nbuf = 4096;
+	wed->wlan.nbuf = MT7915_HW_TOKEN_SIZE;
 	wed->wlan.tx_tbit[0] = is_mt7915(&dev->mt76) ? 4 : 30;
 	wed->wlan.tx_tbit[1] = is_mt7915(&dev->mt76) ? 5 : 31;
 	wed->wlan.txfree_tbit = is_mt7986(&dev->mt76) ? 2 : 1;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 6351feba6bdf..45881e88efe0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -53,6 +53,7 @@
 #define MT7916_EEPROM_SIZE		4096
 
 #define MT7915_EEPROM_BLOCK_SIZE	16
+#define MT7915_HW_TOKEN_SIZE		4096
 #define MT7915_TOKEN_SIZE		8192
 
 #define MT7915_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
-- 
2.18.0


