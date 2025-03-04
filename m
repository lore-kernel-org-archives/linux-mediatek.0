Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E53C282D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nunz/youOH01vZt31DqXWl3/Hsxkv3nIUEnrIGMLlsU=; b=3f322E+98UprOKqyPnHw11M+yn
	wrWU41gJzX/5Nadl0vwr8FYH/A6oziK8MJ7sPiAGHk0lbV2YvDhvDyKDGCSFhhvXwDWo0v+4OgzjF
	FCQglS2BnVhKMIpLIgwhoXRzZX9ycg4I4h/0VuLSdmF3JaWdv2d2G3DIAeMhJw+8TEXpDSOLfs5PA
	thmLzV2T2VsZC+M+mIQDP1kgLURqsvTdMvvAVfwRtyxZYAEsRXQLNmE8rsA9Z96tT1Ib7rx/ioBpN
	az/0LNDsvDvieCXzo0i4Fz/MuHEsYuIGadLE1fvqu5pczYEM5piW3VTzY6yGij2GUi8WmVZzEqLGv
	MlfhNRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM2r-00000003Kpf-1IUo;
	Tue, 04 Mar 2025 06:46:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLmQ-00000003HLn-2IDR
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Mar 2025 06:29:27 +0000
X-UUID: 008ddf5ef8c211ef83f2a1c9db70dae0-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Nunz/youOH01vZt31DqXWl3/Hsxkv3nIUEnrIGMLlsU=;
	b=WlbzRyfDHgHhaAb2KRXrrCNMZ1oaR0+PDaHB4ZjuOszmcHx/rucdpiFnjTL7PmChuqpVNQe3EchzTsfIlxIAWIJWeCMrdExPO0CZBJHgsX28bW7xxHWi4U7+REZ9L8SK//jqV49bzq/RvLrEpGDsOEEK7zC3IYSQ5CrjiSrl9Go=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d03010bb-ba82-4cff-8331-55c8fe646d5d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:4f3f7f29-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 008ddf5ef8c211ef83f2a1c9db70dae0-20250303
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1661198616; Mon, 03 Mar 2025 23:29:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Mar 2025 14:29:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 4 Mar 2025 14:29:16 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 4/6] wifi: mt76: mt7925: remove unused acpi function for clc
Date: Tue, 4 Mar 2025 14:28:52 +0800
Message-ID: <20250304062854.829194-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250304062854.829194-1-mingyen.hsieh@mediatek.com>
References: <20250304062854.829194-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222926_587009_FD71A4B8 
X-CRM114-Status: GOOD (  10.17  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The code for handling ACPI configuration in CLC was copied from the mt7921
driver but is not utilized in the mt7925 implementation. So removes the
unused functionality to clean up the codebase.

Cc: stable@vger.kernel.org
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: no change
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 602ac3c31976..3fd75216889f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3421,7 +3421,6 @@ __mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 
 		.idx = idx,
 		.env = env_cap,
-		.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
 	};
 	int ret, valid_cnt = 0;
 	u8 *pos, *last_pos;
-- 
2.34.1


