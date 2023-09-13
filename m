Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A77EDEC6C
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhQsN1QHxfD0mrFyOb1zYqkCf1B8R/ejG1MPBioqGHs=; b=RVInhw/J3LF68b7bOCrk+qk5Fn
	m4tWzG9WmLfvIG/QeUqVejPFzoI9mCv/c8CR7I1dyArSYSjbwJW7VMjwGGInFKjsuYn+PKzLLybKX
	hJ+ZcBJuBoYg93qPFZVdMZk+TWzcqjaZWc+S+f1CJpHHmXjBBB0B7TZ1n6m/cNM9nHI8Tsf5ZPAKS
	7dUO2l9aQF28/wQTS3O0gqk4UM5zPHrFaEIPDR5VRxYvfw9yc+3aQUTIMV9YuCG/2QnKYaeGUkGRa
	dHAPVGxbCYhL8tGuc6TnF8HijA8y3FvE4HV6VqNhnC4TBt1SgB2vMu6qu2XabjA9Ob5F2wi/J9F0l
	aPacFecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR74-0068xn-1R;
	Wed, 13 Sep 2023 14:45:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR70-0068vz-2f
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 14:45:04 +0000
X-UUID: 1bdc8894524411ee86758d4a7c00f3a0-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OhQsN1QHxfD0mrFyOb1zYqkCf1B8R/ejG1MPBioqGHs=;
	b=GlWZbo7g4WR8GtQ7SJeUIX5sjcvxV/JrbVIpgEvitpSfBKK3yZ0bau+CmM5prCyoUGF7YsYl0lxHwwInxUU044jAok5wbUr8rGtIhL/5ECzS5z9haB6IqCuEJ+oBIr492r3XO8BvRO0eQUpaNU/nVbemquv4VmAId2q/UXI7x9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:cd0c8aee-1e65-433e-bd11-656cfc4cd538,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:0723e613-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1bdc8894524411ee86758d4a7c00f3a0-20230913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 72194729; Wed, 13 Sep 2023 07:44:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 22:44:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 22:44:21 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 01/17] wifi: mt76: mt7925: add Kconfig
Date: Wed, 13 Sep 2023 22:43:29 +0800
Message-ID: <45a4252195df19e63955f936e1fabb5a8a27fc01.1694595134.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1694595134.git.deren.wu@mediatek.com>
References: <cover.1694595134.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.556500-8.000000
X-TMASE-MatchedRID: 4UDH+/Xdc17KRSR886eK0gPZZctd3P4BX5TqQagR07e7qpOHKudqcwaT
	alM8C773sTAiXMQKIRaB5/HP/eqARpTZ9V50RBQ7oMfp2vHck9VqYquCrLrVwpsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXBPMO0jEPAoCdGBR8MluBRlJuCPWAVyYUqAYie6Ph9RwCfh
	PTqXWL1xXz+bRPDo3As6b27tFuzaHcFgbKzFhH3sOG0H/5+9OaF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.556500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FD302CD0D0DFB0379A5BB4F4F949257437C17894ECBCD1510F905CD09F35E2322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_074502_905759_DD51311F 
X-CRM114-Status: GOOD (  11.34  )
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


