Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1025C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhQsN1QHxfD0mrFyOb1zYqkCf1B8R/ejG1MPBioqGHs=; b=vQUxUqY08bnEJnYCH0t1CTlaxk
	6aGeo10HTPaBT47Z/FjXI1gW2ZcW3y4AApJew4Zwh7AbFcoxmFz7fZk7K9n0wojb6hEUNs+pDXpwn
	suKtFrr2UrjGO+mJlbr+SIrhA3wu/rfgn+gyiRtJGXeBxo94Si+Kb8UVf8YuHHmw0bprrDauFtqbp
	WQ759IssoZfFO4sMsRQr0m7EfR4Aa81K4OG9k1kjkq+i/EA0LaluktCNKGHIv2wOOoF7ctKBuw1St
	BLqc3zYiic9UGretGe9lh26E85hyldIfdKhnpSvlqoMFRMKRIx2hez5lbcd4Z8wtM31D5sTdrqSrV
	7Cx+ZuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAbt-00ExGA-1t;
	Mon, 18 Sep 2023 09:32:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAbr-00ExFR-0O
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:32:04 +0000
X-UUID: 373f08b2560611ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OhQsN1QHxfD0mrFyOb1zYqkCf1B8R/ejG1MPBioqGHs=;
	b=XhxeYLwTJqM8E+ExfP6GvhkGGfwq0rk8K8q2vMofIACbGXlNkikvUaBn0fVoqGY9U0z3z34gVxtjVBs82AnQqxu7Fa7tIQI9mLnIr7NlTVlfKamUUGK/8Fs5KhorwIqIibvlBpJUZmrfKhPyXo/5OZddE0At8lGe23kiHAKtTHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a982f3a2-aa13-4025-9e4c-6258f3da0752,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:0beb27c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 373f08b2560611ee9b7791016c24628a-20230918
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1951731626; Mon, 18 Sep 2023 02:31:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 17:31:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 17:31:22 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v3 01/17] wifi: mt76: mt7925: add Kconfig
Date: Mon, 18 Sep 2023 17:30:54 +0800
Message-ID: <75f15cacec8ac0bb2a6e16c77075f20c7dcffc18.1695024367.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695024367.git.deren.wu@mediatek.com>
References: <cover.1695024367.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023203_168770_5D25AD11 
X-CRM114-Status: GOOD (  11.52  )
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
 .../net/wireless/mediatek/mt76/mt7925/Kconfig | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/Kconfig

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7925/Kconfig
new file mode 100644
index 000000000000..5854e95e68a5
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: ISC
+config MT7925_COMMON
+	tristate
+	select MT792x_LIB
+	select WANT_DEV_COREDUMP
+
+config MT7925E
+	tristate "MediaTek MT7925E (PCIe) support"
+	select MT7925_COMMON
+	depends on MAC80211
+	depends on PCI
+	help
+	  This adds support for MT7925-based wireless PCIe devices,
+	  which support operation at 6GHz, 5GHz, and 2.4GHz IEEE 802.11be
+	  2x2:2SS 4096-QAM, 160MHz channels.
+
+	  To compile this driver as a module, choose M here.
+
+config MT7925U
+	tristate "MediaTek MT7925U (USB) support"
+	select MT792x_USB
+	select MT7925_COMMON
+	depends on MAC80211
+	depends on USB
+	help
+	  This adds support for MT7925-based wireless USB devices,
+	  which support operation at 6GHz, 5GHz, and 2.4GHz IEEE 802.11be
+	  2x2:2SS 4096-QAM, 160MHz channels.
+
+	  To compile this driver as a module, choose M here.
-- 
2.18.0


