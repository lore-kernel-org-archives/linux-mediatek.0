Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37B1C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 01:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lXFEKYRP6cX54am0HUFt00DDuPh2zJC7xV1hZiNIZY=; b=3Y2oATh3ZhbnzX09+DXjPsIpq4
	caubbAZAVdCM1s7tUQiaBztwPYzuCgWkZ8eRfVCfpcWC389UY1+LQV24rsb8dFVl3tQqaTWv9pCyX
	lxMaxB2/AmUq4fMNt/brd3aHFrJvV0Mf3fCvzZ7WwwtNTSKewDNM61f0WnTnYkMAXn6PTydEIPDSf
	tvaqIfKf88ruEOsIxR5aujwWDoybP24Ge394R1L/E9IBHjTqR7uHOZTMYzF8xv841wrkiifzIqNAe
	sUmWNKruXgbmtfyNv0v2YFLDhPf1djXlLp1kV1aT4QnjbtkgpZ/nXj2aEBntYXIjS8dn2hV42IEIZ
	TY5UoqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfrah-000000005X2-1Ljr;
	Mon, 19 Aug 2024 01:53:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfrae-000000005WS-1i6h
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 01:53:49 +0000
X-UUID: db234fc25dcd11efb3adad29d29602c1-20240818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9lXFEKYRP6cX54am0HUFt00DDuPh2zJC7xV1hZiNIZY=;
	b=FaauE4Z2+TjAjjGuMOPHeTrdt1D1RbWa+6EGSRnKczLvLJQhXOftLajoMi8Y/Or1HujJ7tii8Qq2hjVCiz9qOBb+p3gG/wD9JNUb1WMV3f5pZyzlRgaVUdm9YYzIaXrkG/qsBB7eiep7QIuLwQzZ9qbSgyYeWE5Zof71TduPrtw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b4d0f6b7-9dca-4e5d-b26f-191b0c0d07cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e585a55b-248b-45cb-bde8-d789f49f4e1e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: db234fc25dcd11efb3adad29d29602c1-20240818
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 4869879; Sun, 18 Aug 2024 18:53:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 19 Aug 2024 09:53:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 19 Aug 2024 09:53:36 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7925: replace chan config with extend txpower config for clc
Date: Mon, 19 Aug 2024 09:53:34 +0800
Message-ID: <20240819015334.14580-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240819015334.14580-1-mingyen.hsieh@mediatek.com>
References: <20240819015334.14580-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.076600-8.000000
X-TMASE-MatchedRID: EJLkrvRJ8yw0Z9sXcK7F6SmjEOrcO6AyTJDl9FKHbrnBz2A0dX3336PF
	jJEFr+olKE0Je8DR/D4NXwNUB3oA790H8LFZNFG7MGpgBNI6BaMAmqpN/LW/FDsL6l6VX2Q6YfM
	MqExvS6ooATlh54i3zaT85cjPvuTpPy8ILgLs3TgHwrRMBVxcR6V3yIRdB6FsUv+hgGJf01iAhO
	caQrQ0U1GyRcoeF18qmKP0zzpTAeGwod8xOMKmvMCBO+zxAW5pftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.076600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9ED05BC689255F93E55A654E4361CF77CD3BFF8DE060F7051FE9EA8C806E78452000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_185348_480426_4240FA80 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Since MT792x_CLC_CHAN is currently not in use, we have added an
extension for setting txpower to replace it.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 7fa74d59cc48..ab12616ec2b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -68,7 +68,7 @@ struct mt792x_fw_features {
 
 enum {
 	MT792x_CLC_POWER,
-	MT792x_CLC_CHAN,
+	MT792x_CLC_POWER_EXT,
 	MT792x_CLC_MAX_NUM,
 };
 
-- 
2.18.0


