Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADB5CD13D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbGjIxP5cg74e10qOUBqYimGtz6mxPuNvWSQ6d8ggJE=; b=ZZY1iG42xeQ+vNVH8Rol+ph4+j
	Tk2UxOpjWc3mYL4IrdnD+JojMoh7G5xDlQG0O04fWn+JDoVwN83LGH8qE0yIoatGYNzaw5hICBMsC
	Ph7Hcd/UkyGfvTi++b3j4gzXfXrsOf/k4MYwQxrxjtTYaut9CTD8eWu345HQR4B7TpCxhbIlRfIu0
	TRkuIlEt1nklW3qvv8sEM64ARwijnvGTWQDVfG8UoX4Z2hV1feWoUNErg156pKltbM+XRuT43lD1A
	yf6OPZLH+RaYvVwfBruzUYS6k3UVD45XPSMmvF/qWNxPhrjV+OMd3jrR73NVTReyWUaob0/nQUKkO
	Rn+V+31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAbL-00Ex6I-0N;
	Mon, 18 Sep 2023 09:31:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAbI-00Ex4s-0k
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:31:29 +0000
X-UUID: 2308192e560611ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jbGjIxP5cg74e10qOUBqYimGtz6mxPuNvWSQ6d8ggJE=;
	b=HXWQ5TZcq4DvwFHOmUXl63pNi36jD64viOdX8BZ3TtMATsK6t7U++EJhG2lUGQMKxYnCvPd+vs/t/+TSwcwtOgf1HWmwQFq0TxBWTWWNztSsxPP0CyJ7qgjP8eZ606VYIMQIUGvVkuFxUVl9VZvzkr3KfQJrz4a+vRK+AjE3Yug=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f80e0f31-9715-47b1-8329-eb97da94b12d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:3f86d3ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 2308192e560611ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 217574163; Mon, 18 Sep 2023 02:31:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 17:31:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 17:31:21 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "Hao
 Zhang" <hao.zhang@mediatek.com>, Leon Yen <leon.yen@mediatek.com>, "Mingyen
 Hsieh" <mingyen.hsieh@mediatek.com>, Nelson Yu <nelson.yu@mediatek.com>,
	"Quan Zhou" <quan.zhou@mediatek.com>, Rong Yan <rong.yan@mediatek.com>
Subject: [PATCH v3 00/17] Add support for Mediatek Wi-Fi7 driver mt7925
Date: Mon, 18 Sep 2023 17:30:53 +0800
Message-ID: <cover.1695024367.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.376700-8.000000
X-TMASE-MatchedRID: dTXa9VSD0MTGHadaRuAOvxv+r1s9z1a0Ct59Uh3p/NXo5/9VDsD0gA5x
	vr++qx3rYE8U75Rh/1qJ1uwZVAc3Y4uLXAHXNQlQXy2tkK+taSRAq6/y5AEOOhP6Y8Vsp9y7njM
	loJas2eeokhRcXx5751rcv8nBrrT3utbsRFhsjTJ7k1ZHmKLF7c6YYW8CaluSVI7KaIl9NheMvW
	2SwdoNIIU7ak+0A5gokmXrMwdSLSLEFB+Bmr71qkOZWaJBszmqo5KBmcJozDZo5YsPsbyLXeJ85
	MO4rWjIrE1r27NixU3x1S0rgG1nwDI0UzRdrW2oH5YQyOg71ZZU3K6aV1ad7Zsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNRqXnrxrKCOXIwfdOp7tkaoCngd93xYG2suqhlDPIauxEX6L28aXSDOy5gT
	aC6eODHi66TnsTBVE/u5iwcyGJUG76NaD3BHC6XYFwjVyCKW9F0aD5ljt43pMcHZD6gqu7wxMjf
	ifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.376700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5DE980944CCA5461CF14DAAB2E6B1298C11D4C1A329225C4247B616A466104C12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023128_271644_37581151 
X-CRM114-Status: GOOD (  11.42  )
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

This series adds mt7925, a new mac80211 driver for MediaTek Wi-Fi 7
(802.11be) device Filogic 360, which can support Station, AP, P2P, and
monitor modes. Filogic 360 supports max 4096-QAM/160MHz radio operation at 6 GHz,
5 GHz, or 2.4 GHz with 2x2 antennas. This chip supports PCIe and USB bus type.

mt7925 supports Wi-Fi 6E and EHT rate with single link only at this moment,
whereas Wi-Fi 7 and its specific features are working in progress. They will be
introduced in further patches.

The driver is build tested by Intel's kernel test robot with both GCC and Clang
with several architecture. Sparse reports no warnings.

There are multiple authors, they are listed in alphabetical order below.

Co-developed-by: Hao Zhang <hao.zhang@mediatek.com>
Signed-off-by: Hao Zhang <hao.zhang@mediatek.com>
Co-developed-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Nelson Yu <nelson.yu@mediatek.com>
Signed-off-by: Nelson Yu <nelson.yu@mediatek.com>
Co-developed-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Co-developed-by: Rong Yan <rong.yan@mediatek.com>
Signed-off-by: Rong Yan <rong.yan@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>

----------------[commit message cut here]----------------

v2:
- add patchwork link for preceding series
- rebase on top of staging tree and apply fixes for following new patches
  * 586baa51d755 ("wifi: mt76: remove unused error path in mt76_connac_tx_complete_skb")
  * 29b8fc6742a1 ("wifi: mt76: fix race condition related to checking tx queue fill status")
  * e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer with sparse")

v3:
- rebase on the top of maintainer tree
- align struct ieee80211_chanctx_conf migration to struct mt76_vif
- fix chip_reset fail
- this series is based on "wifi: mt76: move struct ieee80211_chanctx_conf up to struct mt76_vif"
https://patchwork.kernel.org/project/linux-wireless/patch/f1e86c1f90ebe75ce2ae0cb1ba34f8db2996792c.1695021398.git.deren.wu@mediatek.com/

Deren Wu (17):
  wifi: mt76: mt7925: add Kconfig
  wifi: mt76: mt7925: add Makefile
  wifi: mt76: mt7925: add mt7925.h
  wifi: mt76: mt7925: add regs.h
  wifi: mt76: mt7925: add mcu.c
  wifi: mt76: mt7925: add mcu.h
  wifi: mt76: mt7925: add mac.c
  wifi: mt76: mt7925: add mac.h
  wifi: mt76: mt7925: add main.c
  wifi: mt76: mt7925: add init.c
  wifi: mt76: mt7925: add pci_mcu.c
  wifi: mt76: mt7925: add pci_mac.c
  wifi: mt76: mt7925: add pci.c
  wifi: mt76: mt7925: add usb.c
  wifi: mt76: mt7925: add debugfs.c
  wifi: mt76: add mt7925 to Makefile
  wifi: mt76: add mt7925 to Kconfig

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 .../net/wireless/mediatek/mt76/mt7925/Kconfig |   30 +
 .../wireless/mediatek/mt76/mt7925/Makefile    |    9 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  319 ++
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  235 ++
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 1452 ++++++++
 .../net/wireless/mediatek/mt76/mt7925/mac.h   |   23 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 1471 ++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 3174 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  537 +++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  325 ++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  586 +++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  148 +
 .../wireless/mediatek/mt76/mt7925/pci_mcu.c   |   53 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |   92 +
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  340 ++
 17 files changed, 8796 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mac.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/main.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/regs.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/usb.c

-- 
2.18.0


