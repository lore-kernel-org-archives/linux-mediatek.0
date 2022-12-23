Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0263C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 11:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4uPlhoxLdAQhmHGbNEm5ojAY0RU+YdbQcWOPs8ae04=; b=qD7/ITFmafMjcGeDIe1whD8NIT
	t5g2VnAqBcdFSwsaM+Vh6ZTmhpSXomYruI9SPkcT2PzzD2Fa2dWNKqWh7YlDR+S+D0sDcOM1CmbLW
	ak22V63RqU4Wqscpx2W3fHoYcGtyABuLGb8t8CNXmbvVc9N9eJnWaGipd8oTTlYarIOdhj/97L+xP
	GQIw6MZA3gdq83qefpZLDiLyX1wdR21FhmqBqQklTISrNclMuEi7AzRT/6CyAnPNaoW+OZVtvKtrc
	6aZnAuBVoZNy1kQFAPMS5PO3nSV8a9M68TTepnnCLyLXgK8jbICf32Y6BT9xPFNz4Ces9egeWzAoq
	ud8yi5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fsV-006rUI-Dx; Fri, 23 Dec 2022 11:06:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fsQ-006rQ2-8f
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 11:06:12 +0000
X-UUID: 85b5218ff7cf41dc9f055dfd4f8d9e12-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g4uPlhoxLdAQhmHGbNEm5ojAY0RU+YdbQcWOPs8ae04=;
	b=IdLAx5ElG3d7h0GV7ElHknOkQ+nDvLUF8/rEvcPryezTvEX1LoozQEd9kEM+gkGwQRD4dkS2rnPBOmW1LgG/ztGLheFSILrxyvwVw11tkuwbYK4tZdIMoq2hJRYnXd+w4zpUyw0yHYDkid9vOOLd+U48qwszI6uHep1NNNh6CW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:6eae99f4-0cf1-45b4-888c-b3c8c0482400,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:e470c8f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 85b5218ff7cf41dc9f055dfd4f8d9e12-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 510695928; Fri, 23 Dec 2022 03:57:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Dec 2022 18:16:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 18:16:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 4/4] wifi: mt76: connac: fix POWER_CTRL command name typo
Date: Fri, 23 Dec 2022 18:13:48 +0800
Message-ID: <20221223101348.11504-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223101348.11504-1-shayne.chen@mediatek.com>
References: <20221223101348.11504-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_030610_357463_4EA0E7C3 
X-CRM114-Status: UNSURE (   9.13  )
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

Fix typo MCU_UNI_CMD_POWER_CREL to MCU_UNI_CMD_POWER_CTRL.

Fixes: 779d34de055e ("wifi: mt76: connac: add more unified command IDs")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f1e942b9a887..82fdf6d794bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1198,7 +1198,7 @@ enum {
 	MCU_UNI_CMD_REPT_MUAR = 0x09,
 	MCU_UNI_CMD_WSYS_CONFIG = 0x0b,
 	MCU_UNI_CMD_REG_ACCESS = 0x0d,
-	MCU_UNI_CMD_POWER_CREL = 0x0f,
+	MCU_UNI_CMD_POWER_CTRL = 0x0f,
 	MCU_UNI_CMD_RX_HDR_TRANS = 0x12,
 	MCU_UNI_CMD_SER = 0x13,
 	MCU_UNI_CMD_TWT = 0x14,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index a88fc7680b1a..d781c6e0f33a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2399,7 +2399,7 @@ mt7996_mcu_restart(struct mt76_dev *dev)
 		.power_mode = 1,
 	};
 
-	return mt76_mcu_send_msg(dev, MCU_WM_UNI_CMD(POWER_CREL), &req,
+	return mt76_mcu_send_msg(dev, MCU_WM_UNI_CMD(POWER_CTRL), &req,
 				 sizeof(req), false);
 }
 
-- 
2.25.1


