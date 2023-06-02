Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C627C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U156ija7meuifSpXzffXQuBUx6EClu4D+6wGKui69Q=; b=s1L14o+oJhsgWXMT1f7xHI2bYK
	ot7Y/YPZXvYtDjMK7QpK5WO0QMvjBgOmsjLyCitsxVW3rhvvZh4xNrOndRPRbasbbdLaKleuZGFVH
	fGO1HS3PuNnyHpAVyYcLkSb4Osqn40sN3J8QQTgdFaD5UR8fKZD8B3cRg3GfbfkomYLyKleu0DRi5
	Ck8THn9N5erDjUg+nQSFwiV/a6As0WzxxHpB7hBts5sxWD5QGeb+zW3HzLt1ZFO/JIjTopLB9bDYq
	VeovdKFhw0sUrq1xL9rZBxjogMzDfu5cSieDeolx81dyQQKiY7T6M+C/6UdgHx8l79Cmq3uKpxQcw
	R8NkN0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56bN-007F60-00;
	Fri, 02 Jun 2023 15:22:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56bK-007F3C-2T
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 15:22:03 +0000
X-UUID: 33f80390015911ee912e1518a6540028-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+U156ija7meuifSpXzffXQuBUx6EClu4D+6wGKui69Q=;
	b=uTqasGqouDDrZU2gty++00iJGijFXdLNwJkk18FWnK86HWKENgYZgY0CvGGVKMc6NRdJtBJc+iJsQKIj1zZ3/+OUOzwJpCssmOIQdyutws65MZ8lh4CaRd0hF6FNIYsbGx95fJzG64kGiaYiSbp0hgO7+VasFrYWbXSpWY19dV0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:a7b2dedb-1976-4293-8a8c-aad9da6ee26a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:25ef663d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 33f80390015911ee912e1518a6540028-20230602
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 46137114; Fri, 02 Jun 2023 08:21:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 23:21:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 23:21:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 02/12] wifi: mt76: connac: add a setting bit for dsp firmware
Date: Fri, 2 Jun 2023 23:20:58 +0800
Message-ID: <20230602152108.26860-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230602152108.26860-1-shayne.chen@mediatek.com>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_082202_802472_C89B7206 
X-CRM114-Status: UNSURE (   8.37  )
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

Add FW_START_WORKING_PDA_DSP for the indication of starting DSP
firmware download.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ca1ce97a6d2f..4a21c237ea6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -22,6 +22,7 @@
 
 #define FW_START_OVERRIDE		BIT(0)
 #define FW_START_WORKING_PDA_CR4	BIT(2)
+#define FW_START_WORKING_PDA_DSP	BIT(3)
 
 #define PATCH_SEC_NOT_SUPPORT		GENMASK(31, 0)
 #define PATCH_SEC_TYPE_MASK		GENMASK(15, 0)
-- 
2.39.2


