Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B65C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXioOF1K+VKgN8TOD7yddiipWqxKsdy8Iw7EAB+DK+k=; b=X8v76zVBqzgl0k2UxWIQBSTiHj
	3jSvsu+S97W7/l6L0AiPPdboSH1glb/YA6JS80/bnSQ9hWREAbgVMS+XwpEFvL79XUaH3pdgkwswk
	sI2cMG+huIe4Ro0bsNZip7CsNSNIXU886VceCr4fEIeOScd79TYciDbUiTHBd1Q0S0ijuJB6gsXgD
	phD+XnTgnNz8mTdmC05KQaYLlJ69aY7/3p+DjZ7P4ibrgI61Ez6o+FBrjuTzfBMqdO/RgZx0rSjzb
	Skx9s6BpSaGNvobIpWzg9wzifb6X9Qkhqn2PEQS62cgeSxmXe/GlmzZ3rMNHknPrhAhWK+MUBi+NV
	G4nkPCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU5-002jqs-4Q; Mon, 09 Jan 2023 16:58:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU3-002jpQ-6c
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cXioOF1K+VKgN8TOD7yddiipWqxKsdy8Iw7EAB+DK+k=; b=OPeQ0PbuuNvNJ1eJmWXUqaJP04
	HfT0qtBYALg8XxqmoX54FsS9mndtwb31LmOfljqrRgd643gWBHkhxyhk+nkBi4u8t8HGKMZFH3KhD
	+lljMMSdfzLbkHWnzxMH3A6pckzRuilHGqsbQnbZ0gFPJ5AOkdTIOwvxUc81jyk15PUPEX7vxNz45
	ljpKB5nPFQVoQ+OHIEbxXhALyrlO3cqbLcCbCz7VlEh8C3bjfiDKTArDbyTAK9YSco8dRW/2uIFl4
	WH865Tcz365/B/0dvoZUO1qaKO+B+aeR/Owwijwrmh0KlIOw3U0Cog/C2Y5RNB7RlHG4Wrc9k4Aqm
	UgFWOkNQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTs-002mms-21
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:42 +0000
X-UUID: 3d459abc602749d6b169718a6f168749-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cXioOF1K+VKgN8TOD7yddiipWqxKsdy8Iw7EAB+DK+k=;
	b=FvAszcFyI17LuP6EY+EdCDyaVxTwf5yZgylcvLngl1mHRYuyRcQ9/VqB72/t7DUKrfEhZs3j9stVLFU8KaPNqb4nIQjjcrszAo2Zvk1fUQvwVb5ws72xE+jBit4dKuMEDNJxuaSqCkB8TclV1CfxroGnEmCzVHqadbCKGArR6ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:e63c38e2-695d-42e2-bd53-73a98d24483c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:e4eebb8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 3d459abc602749d6b169718a6f168749-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 452200715; Mon, 09 Jan 2023 09:58:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 04/13] wifi: mt76: connac: add cmd id related to EHT support
Date: Tue, 10 Jan 2023 00:57:22 +0800
Message-ID: <20230109165731.682-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165841_091187_E7B7AAEF 
X-CRM114-Status: UNSURE (   9.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index efba24bd3c6b..e26c4e4a2a16 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -793,6 +793,7 @@ enum {
 	STA_REC_PHY = 0x15,
 	STA_REC_HE_6G = 0x17,
 	STA_REC_HE_V2 = 0x19,
+	STA_REC_EHT = 0x22,
 	STA_REC_HDRT = 0x28,
 	STA_REC_HDR_TRANS = 0x2B,
 	STA_REC_MAX_NUM
@@ -1202,6 +1203,7 @@ enum {
 	MCU_UNI_CMD_REPT_MUAR = 0x09,
 	MCU_UNI_CMD_WSYS_CONFIG = 0x0b,
 	MCU_UNI_CMD_REG_ACCESS = 0x0d,
+	MCU_UNI_CMD_CHIP_CONFIG = 0x0e,
 	MCU_UNI_CMD_POWER_CTRL = 0x0f,
 	MCU_UNI_CMD_RX_HDR_TRANS = 0x12,
 	MCU_UNI_CMD_SER = 0x13,
-- 
2.25.1


