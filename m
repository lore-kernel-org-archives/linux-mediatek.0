Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE1C00528
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fiM+GO9ZKp6zVyrcN8a2wa4TFDVhSpddgo78BbaPow=; b=t+WagKBKhdIWUSiTPIHnEQVXJi
	1eNpYcc3/IUM2GsiHewi0rDeMCFxYOGTDG8n8J/Qs75BQt+FG3CJMPSjWXQJGGWbwihfxa4sbkY6O
	Cqg0nxedoBfg4ukc7PkpLh520gR8mrhv789Un8xUmjZagk4bD42lY3e0jqEI0iKV0JRuGcC+SnjVR
	bReL03FIFaP+lf7N87ohImp+ZhJE4LpGok4ppg16gL0SB75Sq1masvhoNYPm1LAZVBNXcfJAkhhLe
	ahUyV6pWK/cTKbxWY1wLur/j1P45yN9kC5OVK8yNCZZRC0U/lbJyXC1sU7QF9pvGNW1DXDeLuFkr1
	4vVCav6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRp-002bce-1m;
	Tue, 01 Aug 2023 14:34:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bXu-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:04 +0000
X-UUID: 714771a6307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3fiM+GO9ZKp6zVyrcN8a2wa4TFDVhSpddgo78BbaPow=;
	b=B8YxHVR1rTpNeIc0XYzXGr8wkaatMhgO2a7xfV5tXML4jsM1dWe6gTPUYAfpczKekmpu/34utDIJv1fLTKlLKa8Tp/vY+GWhPdnEO/BhOPT14C+dfAp1lkLV50+lkb0yuqm08Tr1CIwK9C0SC+v2I3YcB6zUkv0GYYT4nzgUzmI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:fde9e311-1581-4b09-827c-c5c52185c096,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.30,REQID:fde9e311-1581-4b09-827c-c5c52185c096,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b36fb242-d291-4e62-b539-43d7d78362ba,B
	ulkID:2308012233555XLS9Q0V,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_SNR
X-UUID: 714771a6307811ee83ed1395ce914268-20230801
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246046922; Tue, 01 Aug 2023 07:33:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:52 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 6/8] wifi: mt76: connac: add data field in struct tlv
Date: Tue, 1 Aug 2023 22:30:30 +0800
Message-ID: <30512020136c37ea7e381195fad537e40e7476b6.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_862236_D3B67214 
X-CRM114-Status: GOOD (  10.13  )
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

Add tlv->data element for tlv parsing easier.

This is a preliminary patch to support mt7925 driver.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 4b64426d371d..ed70bde1428b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -191,6 +191,7 @@ struct mt76_connac2_fw_region {
 struct tlv {
 	__le16 tag;
 	__le16 len;
+	u8 data[];
 } __packed;
 
 struct bss_info_omac {
-- 
2.18.0


