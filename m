Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37E5FA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nflQPBAE0y+qB/9hp4ypHQfRrj5WUvsPWuO2cvPBe2Q=; b=Y3La9iB57OZpfWrlF6z8d/G8DB
	RyCeGQUeH9jLknmXE5qIYRfXPmGRm5SFdXh8u29l8oZXX7rQ+PFvNsmbV/r5qVvLuhS9zlRzzUdt3
	N+fIbo76qkhDYnS6Dt8lpDkiQaRkrYtP0WeE47dNR6pgGjcLVW6gc2m//CH5F+H/DnuqmAiZ03JJC
	rXeVa728kiMcL+kdzyGlade3BBIXNemHzf+vO+qmToJTYxqIykRopSfnDQmiMQ6RktaNU5i++bm+h
	lmGSZJ4LZv3CIfGy4kLqSiixcgOjo/M4hPPl43M4u6ydOBo+QBr62LHLS2SBNHynnqocOIKHa3gJw
	i1orzV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opYTX-00DKj2-Ee; Mon, 31 Oct 2022 17:21:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opYTU-00DKiL-NF
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 17:21:25 +0000
X-UUID: 728f93a9a593492ea775df323543cc64-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nflQPBAE0y+qB/9hp4ypHQfRrj5WUvsPWuO2cvPBe2Q=;
	b=U5KHPCXCGEfTZ/Ug3LrczQ5BPTMh1GOTvZ2+zo3TTWz4uxIWW+afcTVRVd1UtN3GO+MZdXHwx4P90FZ2QQ0KrwDNvDF0VXn0tu7t4GaG/3+jnEctzyEoVk7wnWQaoa2G7etiRycCumm+M/gsjYvl2FgAkDiUh0vfm2B3IdoG8lY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f51cba55-4122-4b12-be72-b8efb8ed91d3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:929a2d81-3116-4fbc-b86b-83475c3df513,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 728f93a9a593492ea775df323543cc64-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1379263358; Mon, 31 Oct 2022 10:21:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 1 Nov 2022 00:40:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 05/10] wifi: mt76: connac: add more unified command IDs
Date: Tue, 1 Nov 2022 00:39:55 +0800
Message-ID: <20221031164000.17063-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221031164000.17063-1-shayne.chen@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_102124_782700_D00B3FF8 
X-CRM114-Status: UNSURE (   7.60  )
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

Add more unified command IDs which will be used in new chipset.
This is the preliminary patch for mt7996 support.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 9cca73df6644..7f97d4b70e95 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1172,10 +1172,29 @@ enum {
 	MCU_UNI_CMD_DEV_INFO_UPDATE = 0x01,
 	MCU_UNI_CMD_BSS_INFO_UPDATE = 0x02,
 	MCU_UNI_CMD_STA_REC_UPDATE = 0x03,
+	MCU_UNI_CMD_EDCA_UPDATE = 0x04,
 	MCU_UNI_CMD_SUSPEND = 0x05,
 	MCU_UNI_CMD_OFFLOAD = 0x06,
 	MCU_UNI_CMD_HIF_CTRL = 0x07,
+	MCU_UNI_CMD_BAND_CONFIG = 0x08,
+	MCU_UNI_CMD_WSYS_CONFIG = 0x0b,
+	MCU_UNI_CMD_REG_ACCESS = 0x0d,
+	MCU_UNI_CMD_POWER_CREL = 0x0f,
+	MCU_UNI_CMD_RX_HDR_TRANS = 0x12,
+	MCU_UNI_CMD_TWT = 0x14,
+	MCU_UNI_CMD_RDD_CTRL = 0x19,
+	MCU_UNI_CMD_GET_MIB_INFO = 0x22,
 	MCU_UNI_CMD_SNIFFER = 0x24,
+	MCU_UNI_CMD_SR = 0x25,
+	MCU_UNI_CMD_TXPOWER = 0x2b,
+	MCU_UNI_CMD_EFUSE_CTRL = 0x2d,
+	MCU_UNI_CMD_RA = 0x2f,
+	MCU_UNI_CMD_MURU = 0x31,
+	MCU_UNI_CMD_BF = 0x33,
+	MCU_UNI_CMD_CHANNEL_SWITCH = 0x34,
+	MCU_UNI_CMD_THERMAL = 0x35,
+	MCU_UNI_CMD_VOW = 0x37,
+	MCU_UNI_CMD_RRO = 0x57,
 };
 
 enum {
-- 
2.25.1


