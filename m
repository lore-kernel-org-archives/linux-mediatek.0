Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8443AC7EE33
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+L2Tpb+dUNC8ni2FPWrhFjsr9duAkRXBdpvppSWils=; b=291i/ITIi6moqBekXzqPAmERTu
	CArMnN1kvj6l0q7UrU0Pnv3wSo6gmrJmoSujMxOjoDJSOMMR2ra3U1b7yTnyN64DVlZX+PNKQFs72
	DXWGMEAS/wt9F+ISDfOKEWwPwomkPkoUHyWWGaVUZpnXATlCX1eGesHTc/QZXDKxiXt8KG19Fijb3
	syKHfPOsAShgOL3ssLSf2AEn4GkwYmtmcsykhe9i9KY675uG7pNGao5vV0CP2weCsCV6H4TVa4KYv
	0fkHeIpT6Y54x9mKggUz7F6n+ibWRBM5Tl/6ac5pQZ6F7NF1yCMal671MN32myJuWjX5YRTTeLDBC
	M3KwGXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SS-00Eh29-32;
	Mon, 05 Jun 2023 08:20:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SO-00Egy4-0e
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 08:20:53 +0000
X-UUID: dd4e1674037911ee83ed1395ce914268-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w+L2Tpb+dUNC8ni2FPWrhFjsr9duAkRXBdpvppSWils=;
	b=iiJ1L9rYYVK+MegzMEn6ALOUm2UWYInHgt0LVHF6YhDTZKcNVzyL40U9VmX4y8GIYxUc/cDZMSu5NwdlD6O5qWWqUCkWFiPY0YwoYRS4ALRdCprcinT2EXK6KLJkONXOlxK1UvNKyb+ige13ehTCrZqtw12cl7EMHgiEVJ2HLCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:e9c6d3a2-ab23-49a4-a43e-f7865ec9f531,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:1d0c983d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: dd4e1674037911ee83ed1395ce914268-20230605
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1925950055; Mon, 05 Jun 2023 01:20:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 16:20:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 16:20:41 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 04/10] wifi: mt76: mt7996: init he and eht cap for AP_VLAN
Date: Mon, 5 Jun 2023 16:19:41 +0800
Message-ID: <20230605081947.12804-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230605081947.12804-1-shayne.chen@mediatek.com>
References: <20230605081947.12804-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012052_252602_DBBAE226 
X-CRM114-Status: UNSURE (   8.13  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Init he and eht capabilities for AP_VLAN type. Without this patch, the
BA response from AP_VLAN will not include the ADDBA extension tag.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f1b48cdda58f..004575a0479b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -808,6 +808,7 @@ __mt7996_set_stream_he_eht_caps(struct mt7996_phy *phy,
 		switch (i) {
 		case NL80211_IFTYPE_STATION:
 		case NL80211_IFTYPE_AP:
+		case NL80211_IFTYPE_AP_VLAN:
 #ifdef CONFIG_MAC80211_MESH
 		case NL80211_IFTYPE_MESH_POINT:
 #endif
-- 
2.39.2


