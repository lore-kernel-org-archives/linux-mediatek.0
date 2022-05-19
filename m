Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6z1SrTuYBAS6TWt3OsG0HFGhJMlavp3dY/e07z43po=; b=mH7O8Gb3S8FTu5
	lK1lRioHnTTq7AqSa8uB7zdS9D8DuJrnbl2IcD+wbOz7i1EjX3a/CW6znCjrFM3FUh1/3w9li+IWE
	u0oSPDKDNd2gYCLvcMXSpa91JE20yKM6nipLoJJG/Ww+NuargLgGhoEzmL8ijzqDJZUDVuNaT71iz
	23D45/n2Okb/iq/gPFPR0PYzAkez5vQYDz/iY06BQ/tNARmiRDqU2guqxN3aII24NK9qZecXNEYr/
	FJKpx0MqcUZr73VeBMbPXTfeDDpodTQkcL7FKrdJ/WSUz5Alu/diiHA6RRpUrxTep92I88ZnSr8NC
	tz1Rtbl7Od7v/3RtOhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZyN-005Mew-Kf; Thu, 19 May 2022 06:49:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZyI-005Mbc-Cl
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 06:49:21 +0000
X-UUID: 68b3954c0e664b46b9e9f3fe3bc170f9-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:33d97134-681a-4d96-9632-e5385f782c5e, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:603fc3e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 68b3954c0e664b46b9e9f3fe3bc170f9-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1276143773; Wed, 18 May 2022 23:49:10 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:39:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 14:39:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 14:39:07 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "Quan
 Zhou" <quan.zhou@mediatek.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH 2/3] mt76: mt7921: introduce BIOS SAR support
Date: Thu, 19 May 2022 14:38:23 +0800
Message-ID: <7a8f37ab32ca14d9703fe2217ff1184f46d8f61a.1652941276.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1652941276.git.deren.wu@mediatek.com>
References: <cover.1652941276.git.deren.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_234918_472627_74A47AA4 
X-CRM114-Status: GOOD (  25.13  )
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

From: Deren Wu <deren.wu@mediatek.com>

In BIOS SAR enabled device, mt7921 should read power limit in BIOS config.
The limit value would be applied to regular tx power settings in mt76.

Two major functionalities added:
1. Get BIOS SAR power table through ACPI.
2. Read power in Dynamic/Geo SAR table for tx power limit.

Table note
MTDS: Dynamic BIOS SAR table
MTGS: Geo BIOS SAR table
MTCL: Country List table (for 6G support)

Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/Makefile    |   1 +
 .../wireless/mediatek/mt76/mt7921/bios_sar.c  | 281 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/bios_sar.h  |  93 ++++++
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   2 +
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  20 ++
 5 files changed, 397 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
index 0a146818c623..b33e34d17e1d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -9,6 +9,7 @@ CFLAGS_trace.o := -I$(src)
 
 mt7921-common-y := mac.o mcu.o main.o init.o debugfs.o trace.o
 mt7921-common-$(CONFIG_NL80211_TESTMODE) += testmode.o
+mt7921-common-$(CONFIG_ACPI) += bios_sar.o
 mt7921e-y := pci.o pci_mac.o pci_mcu.o dma.o
 mt7921s-y := sdio.o sdio_mac.o sdio_mcu.o
 mt7921u-y := usb.o usb_mac.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.c b/drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.c
new file mode 100644
index 000000000000..166808e40c6b
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2022 MediaTek Inc. */
+
+#include <linux/acpi.h>
+#include "mt7921.h"
+
+static int
+mt7921_bsar_acpi_read(struct mt7921_dev *dev, u8 *method, u8 **tbl, u32 *len)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *sar_root, *sar_unit;
+	struct mt76_dev *mdev = &dev->mt76;
+	acpi_handle root, handle;
+	acpi_status status;
+	u32 i = 0;
+
+	root = ACPI_HANDLE(mdev->dev);
+	if (!root)
+		return -EOPNOTSUPP;
+
+	status = acpi_get_handle(root, method, &handle);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	status = acpi_evaluate_object(handle, NULL, NULL, &buf);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	sar_root = buf.pointer;
+	if (sar_root->type != ACPI_TYPE_PACKAGE ||
+	    sar_root->package.count < 4 ||
+	    sar_root->package.elements[0].type != ACPI_TYPE_INTEGER) {
+		dev_err(mdev->dev, "sar cnt = %d\n",
+			sar_root->package.count);
+		goto free;
+	}
+
+	if (!*tbl) {
+		*tbl = devm_kzalloc(mdev->dev, sar_root->package.count,
+				    GFP_KERNEL);
+		if (!*tbl)
+			goto free;
+	}
+	if (len)
+		*len = sar_root->package.count;
+
+	for (i = 0; i < sar_root->package.count; i++) {
+		sar_unit = &sar_root->package.elements[i];
+
+		if (sar_unit->type != ACPI_TYPE_INTEGER)
+			break;
+		*(*tbl + i) = (u8)sar_unit->integer.value;
+	}
+free:
+	kfree(sar_root);
+
+	return (i == sar_root->package.count) ? 0 : -EINVAL;
+}
+
+/* MTCL : Country List Table for 6G band */
+static int
+mt7921_bsar_acpi_read_mtcl(struct mt7921_dev *dev, u8 **table, u8 *version)
+{
+	*version = (mt7921_bsar_acpi_read(dev, MT7921_ACPI_MTCL, table, 0) < 0)
+		   ? 1 : 2;
+	return 0;
+}
+
+/* MTDS : Dynamic SAR Power Table */
+static int
+mt7921_bsar_acpi_read_mtds(struct mt7921_dev *dev, u8 **table, u8 version)
+{
+	int len, ret, sarlen, prelen, tblcnt;
+	bool enable;
+
+	ret = mt7921_bsar_acpi_read(dev, MT7921_ACPI_MTDS, table, &len);
+	if (ret)
+		return ret;
+
+	/* Table content validation */
+	switch (version) {
+	case 1:
+		enable = ((struct mt7921_bsar_dyn *)*table)->enable;
+		sarlen = sizeof(struct mt7921_bsar_dyn_limit);
+		prelen = offsetof(struct mt7921_bsar_dyn, tbl[0]);
+		break;
+	case 2:
+		enable = ((struct mt7921_bsar_dyn_v2 *)*table)->enable;
+		sarlen = sizeof(struct mt7921_bsar_dyn_limit_v2);
+		prelen = offsetof(struct mt7921_bsar_dyn_v2, tbl[0]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	tblcnt = (len - prelen) / sarlen;
+	if (!enable ||
+	    tblcnt > MT7921_BSAR_MAX_DYN || tblcnt < MT7921_BSAR_MIN_DYN)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+/* MTGS : Geo SAR Power Table */
+static int
+mt7921_bsar_acpi_read_mtgs(struct mt7921_dev *dev, u8 **table, u8 version)
+{
+	int len, ret = 0, sarlen, prelen, tblcnt;
+
+	ret = mt7921_bsar_acpi_read(dev, MT7921_ACPI_MTGS, table, &len);
+	if (ret)
+		return ret;
+
+	/* Table content validation */
+	switch (version) {
+	case 1:
+		sarlen = sizeof(struct mt7921_bsar_geo_limit);
+		prelen = offsetof(struct mt7921_bsar_geo, tbl[0]);
+		break;
+	case 2:
+		sarlen = sizeof(struct mt7921_bsar_geo_limit_v2);
+		prelen = offsetof(struct mt7921_bsar_geo_v2, tbl[0]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	tblcnt = (len - prelen) / sarlen;
+	if (tblcnt > MT7921_BSAR_MAX_GEO || tblcnt < MT7921_BSAR_MIN_GEO)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+int mt7921_init_bios_sar(struct mt7921_dev *dev)
+{
+	struct mt7921_bios_sar *bsar;
+	int ret;
+
+	bsar = devm_kzalloc(dev->mt76.dev, sizeof(*bsar), GFP_KERNEL);
+	if (!bsar)
+		return -ENOMEM;
+
+	mt7921_bsar_acpi_read_mtcl(dev, (u8 **)&bsar->countrylist, &bsar->ver);
+
+	/* MTDS is mandatory. Return error if table is invalid */
+	ret = mt7921_bsar_acpi_read_mtds(dev, (u8 **)&bsar->dyn, bsar->ver);
+	if (ret) {
+		devm_kfree(dev->mt76.dev, bsar->dyn);
+		devm_kfree(dev->mt76.dev, bsar->countrylist);
+		devm_kfree(dev->mt76.dev, bsar);
+		return ret;
+	}
+
+	/* MTGS is optional */
+	ret = mt7921_bsar_acpi_read_mtgs(dev, (u8 **)&bsar->geo, bsar->ver);
+	if (ret) {
+		devm_kfree(dev->mt76.dev, bsar->geo);
+		bsar->geo = NULL;
+	}
+
+	dev->phy.biossar = bsar;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7921_init_bios_sar);
+
+static s8
+mt7921_bsar_get_geo_pwr(struct mt7921_phy *phy,
+			enum nl80211_band band, s8 dyn_power)
+{
+	struct mt7921_bios_sar *bsar = phy->biossar;
+	struct mt7921_bsar_geo_band *band_pwr;
+	s8 geo_power;
+	u8 idx, max;
+
+	if (!bsar->geo)
+		return dyn_power;
+
+	switch (phy->mt76->dev->region) {
+	case NL80211_DFS_FCC:
+		idx = 0;
+		break;
+	case NL80211_DFS_ETSI:
+		idx = 1;
+		break;
+	default: /* WW */
+		idx = 2;
+		break;
+	}
+
+	if (bsar->ver == 1) {
+		band_pwr = &bsar->geo->tbl[idx].band[0];
+		max = ARRAY_SIZE(bsar->geo->tbl[idx].band);
+	} else {
+		band_pwr = &bsar->geo_v2->tbl[idx].band[0];
+		max = ARRAY_SIZE(bsar->geo_v2->tbl[idx].band);
+	}
+
+	switch (band) {
+	case NL80211_BAND_2GHZ:
+		idx = 0;
+		break;
+	case NL80211_BAND_5GHZ:
+		idx = 1;
+		break;
+	case NL80211_BAND_6GHZ:
+		idx = 2;
+		break;
+	default:
+		return dyn_power;
+	}
+
+	if (idx >= max)
+		return dyn_power;
+
+	geo_power = (band_pwr + idx)->pwr;
+	dyn_power += (band_pwr + idx)->offset;
+
+	return min(geo_power, dyn_power);
+}
+
+static s8
+mt7921_bsar_range_pwr(struct mt7921_phy *phy,
+		      const struct cfg80211_sar_freq_ranges *range,
+		      u8 idx)
+{
+	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
+	struct mt7921_bios_sar *bsar = phy->biossar;
+	u8 *limit, band, max;
+
+	if (!capa)
+		return 127;
+
+	if (bsar->ver == 1) {
+		limit = &bsar->dyn->tbl[0].frp[0];
+		max = ARRAY_SIZE(bsar->dyn->tbl[0].frp);
+	} else {
+		limit = &bsar->dyn_v2->tbl[0].frp[0];
+		max = ARRAY_SIZE(bsar->dyn_v2->tbl[0].frp);
+	}
+
+	if (idx >= max)
+		return 127;
+
+	if (range->start_freq >= 5945)
+		band = NL80211_BAND_6GHZ;
+	else if (range->start_freq >= 5150)
+		band = NL80211_BAND_5GHZ;
+	else
+		band = NL80211_BAND_2GHZ;
+
+	return mt7921_bsar_get_geo_pwr(phy, band, limit[idx]);
+}
+
+int mt7921_init_bios_sar_power(struct mt7921_phy *phy, bool set_default)
+{
+	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
+	int i;
+
+	if (!phy->biossar)
+		return 0;
+
+	/* When BIOS SAR enabled in HW, we should apply rules for .frp
+	 * 1. w/o .sar_specs : set BIOS SAR power as the defatul value
+	 * 2. w/  .sar_specs : set power with min(.sar_specs, BIOS_SAR)
+	 */
+	for (i = 0; i < capa->num_freq_ranges; i++) {
+		struct mt76_freq_range_power *frp = &phy->mt76->frp[i];
+
+		frp->range = set_default ? &capa->freq_ranges[i] : frp->range;
+		if (!frp->range)
+			continue;
+
+		frp->power = min_t(s8, set_default ? 127 : frp->power,
+				   mt7921_bsar_range_pwr(phy, frp->range, i));
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7921_init_bios_sar_power);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.h b/drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.h
new file mode 100644
index 000000000000..d1d1fbe6bc82
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: ISC */
+/* Copyright (C) 2022 MediaTek Inc. */
+
+#ifndef __MT7921_BIOS_SAR_H
+#define __MT7921_BIOS_SAR_H
+
+#define MT7921_BSAR_MIN_DYN		1
+#define MT7921_BSAR_MAX_DYN		8
+#define MT7921_BSAR_MIN_GEO		3
+#define MT7921_BSAR_MAX_GEO		8
+
+#define MT7921_ACPI_MTCL		"MTCL"
+#define MT7921_ACPI_MTDS		"MTDS"
+#define MT7921_ACPI_MTGS		"MTGS"
+
+struct mt7921_bsar_dyn_limit {
+	u8 idx;
+	u8 frp[5];
+} __packed;
+
+struct mt7921_bsar_dyn {
+	u8 names[4];
+	u8 enable;
+	u8 nr_tbl;
+	struct mt7921_bsar_dyn_limit tbl[0];
+} __packed;
+
+struct mt7921_bsar_dyn_limit_v2 {
+	u8 idx;
+	u8 frp[11];
+} __packed;
+
+struct mt7921_bsar_dyn_v2 {
+	u8 names[4];
+	u8 enable;
+	u8 rsvd;
+	u8 nr_tbl;
+	struct mt7921_bsar_dyn_limit_v2 tbl[0];
+} __packed;
+
+struct mt7921_bsar_geo_band {
+	u8 pwr;
+	u8 offset;
+} __packed;
+
+struct mt7921_bsar_geo_limit {
+	u8 idx;
+	/* 0:2G, 1:5G */
+	struct mt7921_bsar_geo_band band[2];
+} __packed;
+
+struct mt7921_bsar_geo {
+	u8 names[4];
+	u8 version;
+	u8 nr_tbl;
+	struct mt7921_bsar_geo_limit tbl[0];
+} __packed;
+
+struct mt7921_bsar_geo_limit_v2 {
+	u8 idx;
+	/* 0:2G, 1:5G, 2:6G */
+	struct mt7921_bsar_geo_band band[3];
+} __packed;
+
+struct mt7921_bsar_geo_v2 {
+	u8 names[4];
+	u8 version;
+	u8 rsvd;
+	u8 nr_tbl;
+	struct mt7921_bsar_geo_limit_v2 tbl[0];
+} __packed;
+
+struct mt7921_bsar_cl {
+	u8 names[4];
+	u8 version;
+	u8 mode_6g;
+	u8 cl6g[6];
+} __packed;
+
+struct mt7921_bios_sar {
+	u8 ver;
+	union {
+		struct mt7921_bsar_dyn *dyn;
+		struct mt7921_bsar_dyn_v2 *dyn_v2;
+	};
+	union {
+		struct mt7921_bsar_geo *geo;
+		struct mt7921_bsar_geo_v2 *geo_v2;
+	};
+	struct mt7921_bsar_cl *countrylist;
+};
+
+#endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 4a8675634f80..ae406f1b31a0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -289,6 +289,8 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	if (!mt76_is_mmio(&dev->mt76))
 		hw->extra_tx_headroom += MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
 
+	mt7921_init_bios_sar(dev);
+
 	ret = mt7921_init_wcid(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 5ca584bb2fc6..e5d541291919 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -8,6 +8,7 @@
 #include <linux/ktime.h>
 #include "../mt76_connac_mcu.h"
 #include "regs.h"
+#include "bios_sar.h"
 
 #define MT7921_MAX_INTERFACES		4
 #define MT7921_MAX_WMM_SETS		4
@@ -171,6 +172,9 @@ struct mt7921_phy {
 
 	struct sk_buff_head scan_event_list;
 	struct delayed_work scan_work;
+#ifdef CONFIG_ACPI
+	struct mt7921_bios_sar *biossar;
+#endif
 };
 
 #define mt7921_init_reset(dev)		((dev)->hif_ops->init_reset(dev))
@@ -481,4 +485,20 @@ int mt7921_mcu_uni_add_beacon_offload(struct mt7921_dev *dev,
 				      struct ieee80211_hw *hw,
 				      struct ieee80211_vif *vif,
 				      bool enable);
+#ifdef CONFIG_ACPI
+int mt7921_init_bios_sar(struct mt7921_dev *dev);
+int mt7921_init_bios_sar_power(struct mt7921_phy *phy, bool set_default);
+#else
+static inline int
+mt7921_init_bios_sar(struct mt7921_dev *dev)
+{
+	return 0;
+}
+
+static inline int
+mt7921_init_bios_sar_power(struct mt7921_phy *phy, bool set_default)
+{
+	return 0;
+}
+#endif
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
