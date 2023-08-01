Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE11C001E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6xWEjJfYEPkjrJiAUGHjFpogRsfrDeCeUZabD+zTkM=; b=ZR/ebJMvRQPetu6mG+HQ+04k78
	RoAQdeQaWy2hO9fv7gdFwnJVzy9i2h1INchADBO2xuSQdUKwcDA3yT0gNyIqOpQukrSEhNIQyjJpX
	xFToJoJc/NBgdbgSI90TH7jxpVsC9f9/C+itkdf6kn7O0Fs0brCALZHsHm4qwtd8JL9YtvMtBLQPa
	dl4O3tJEdFOriu2W6SH+9S0YT0xlMgMlBaaV85H3a8057K7DxPfBnJMUnSHbloWou+ASxX+YmOzCY
	pprY5DgysQ79Ds+ma7PK6sHtGaTvYP+ya0ucJhGUSZiP2kX5XSAiCCGNfkcLdPCgaviLI1ZjHPT74
	MWd1S5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqdE-002dUo-16;
	Tue, 01 Aug 2023 14:45:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqdC-002dUB-1e
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:45:51 +0000
X-UUID: 188bb62e307a11ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U6xWEjJfYEPkjrJiAUGHjFpogRsfrDeCeUZabD+zTkM=;
	b=Th0mxJ8asz0ZaeFmN5FFeoifkg41Lg/ig6EasFIJg3kKvDJ4AlhCzhWEiV0Jv/vM1FC7kKrHPAiLQTSHlsOsP73YAHYa4lMZkICK6WVqrW2AhWoZSCKADLuFx/kavWSHq3pvFn3IFlu8Ay3oSrvNteu5I4RBYi6FJuWSmgpDdvM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:6df9a16c-995d-4622-891e-a78d64fa0f00,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:1fcc6f8,CLOUDID:e72e08b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 188bb62e307a11ee83ed1395ce914268-20230801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1673740827; Tue, 01 Aug 2023 07:45:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:35:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:35:42 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 02/17] wifi: mt76: mt7925: add Makefile
Date: Tue, 1 Aug 2023 22:34:18 +0800
Message-ID: <ab4a185ab4775664c7441e1a6356e9c05cf76239.1690864199.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690864199.git.deren.wu@mediatek.com>
References: <cover.1690864199.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_074550_554030_1496CC18 
X-CRM114-Status: GOOD (  10.55  )
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
 drivers/net/wireless/mediatek/mt76/mt7925/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/Makefile

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/Makefile b/drivers/net/wireless/mediatek/mt76/mt7925/Makefile
new file mode 100644
index 000000000000..d321e4ed732f
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: ISC
+
+obj-$(CONFIG_MT7925_COMMON) += mt7925-common.o
+obj-$(CONFIG_MT7925E) += mt7925e.o
+obj-$(CONFIG_MT7925U) += mt7925u.o
+
+mt7925-common-y := mac.o mcu.o main.o init.o debugfs.o
+mt7925e-y := pci.o pci_mac.o pci_mcu.o
+mt7925u-y := usb.o
-- 
2.18.0


