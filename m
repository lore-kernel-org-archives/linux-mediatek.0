Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB6DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yauqpBX2S8mCdfVRXBU/hH7WgdxSH3iokDslKSp1jvE=; b=NYm3bzjBf1sZ3Q0GHCagk1XSy+
	FglhgYK0AOPaSUWakOObbnPtMuvCZi/6kair9K7m3RyKQg00iVOlYY0oTlODHSM3pruOyc4bLfrqF
	DNyeLSSrj4S16Fh1RiNmCWZhG+TW6OznWZHtetwed0cBhSNPdmgsmGDaAMxGKZxjCbo22kVgRjMDx
	GU97vTZUT/7Er1CoQKOpcCYkQ9/k8n05gY3SX8nrBtrbKecCgQZlQT4j6O3CDDRA9ptLsNOy675qD
	0QIZ/r5RRKzsJpH+7u8i3xZWJZqa32hbvgR1ckD36KPsx/p3lZjs5fkOk9mW+VojmSvI/rS7YRtUL
	m+k03sJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPKa-006q12-Au; Tue, 22 Nov 2022 09:12:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPKV-006pvt-W7
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 09:12:37 +0000
X-UUID: b528cdeefbe74f848834b9ef935877e9-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yauqpBX2S8mCdfVRXBU/hH7WgdxSH3iokDslKSp1jvE=;
	b=L5yhdohvV9HzujW+MuPucjfTgkau8z27IbrKv7LdAHqMZkypCCzzmearedOr0K09P0c5xJrEP59tKR0m8J1HgXbUIDGrdRdU8bhlzKQz3ChkA1/f63dRMebfccuVVvfZaFJlZaSlwbM8b71eI4XD/yX4zBEOnaGZnWUU3MhXg08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:7bf5bb16-83d8-47f1-98a2-1be6b31cc81d,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:5b25f8f8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b528cdeefbe74f848834b9ef935877e9-20221122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 907293701; Tue, 22 Nov 2022 02:12:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 16:51:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 16:51:57 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, MeiChia Chiu <meichia.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>, Money Wang
	<Money.Wang@mediatek.com>
Subject: [PATCH 0/9] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices
Date: Tue, 22 Nov 2022 16:45:45 +0800
Message-ID: <20221122084554.9494-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_011236_069354_3165C77E 
X-CRM114-Status: GOOD (  11.40  )
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

Add MediaTek new mac80211 driver mt7996 for Wi-Fi 7 (802.11be) devices.
The driver first supports Filogic 680 PCI device, which is a Wi-Fi 7
chipset supporting concurrent tri-band operation at 6 GHz, 5 GHz, and
2.4 GHz with 4x4 antennas on each band.

Currently, mt7996 only supports tri-band HE or older mode.
EHT mode and more variants of Filogic 680 support will be introduced
in further patches.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Co-developed-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Co-developed-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

----------------[commit message cut here]----------------

This series is based on the following series with fixes folded:
- https://patchwork.kernel.org/project/linux-wireless/cover/20221110093525.29649-1-shayne.chen@mediatek.com/

For easier review, the big patch has been splitted into multiple patches
per functionality. These patches will be folded into a single patch in
the final version.

Shayne Chen (9):
  wifi: mt76: mt7996: add PCI support
  wifi: mt76: mt7996: add DMA support
  wifi: mt76: mt7996: add MCU support
  wifi: mt76: mt7996: add EEPROM support
  wifi: mt76: mt7996: add MAC support
  wifi: mt76: mt7996: add ieee80211_ops
  wifi: mt76: mt7996: add debugfs support
  wifi: mt76: mt7996: add module support
  wifi: mt76: add mt7996 module support

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 .../net/wireless/mediatek/mt76/mt7996/Kconfig |   12 +
 .../wireless/mediatek/mt76/mt7996/Makefile    |    6 +
 .../wireless/mediatek/mt76/mt7996/debugfs.c   |  851 ++++
 .../net/wireless/mediatek/mt76/mt7996/dma.c   |  360 ++
 .../wireless/mediatek/mt76/mt7996/eeprom.c    |  229 ++
 .../wireless/mediatek/mt76/mt7996/eeprom.h    |   75 +
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  816 ++++
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 2468 ++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mac.h   |  398 ++
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 1325 +++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 3429 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  662 ++++
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  385 ++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  516 +++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  222 ++
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  533 +++
 18 files changed, 12289 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/dma.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mac.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/main.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/pci.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/regs.h

-- 
2.25.1


