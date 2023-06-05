Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B090C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK442o+TSmC2/oovm6NFFCuJYxxN9tyqtaZCBSo0kT8=; b=zGLGy4Sxe2LO6w9QKtoEtqfr3B
	UzVR60AZutJDXiQEgwRA0Uz2IvqBrnVxemKRtcNRZV3VKMnP0GGPGy6eEVxHLdd17rWCMAOQrgTVs
	yXQDY+tkuRsGZiPW/CpEP8Khlb7teeqDQ27XbonL0SRxj7sIZYDdr//NbAQdwy26qPD9oaBVZFjAs
	k1BmzqwbLNt0R4mtMDIK2+qT5kvY1qaI+wk6nQxyM1QsbX1LYb4H6RAZkzYivRAJ6LIneXuqA0Xwo
	xBw8ELswPginOdBz4QSrvlNWDf3isgU94FvjVZIhLGGcNwhM0c4vWkgxCvmip4gCILjeXHXxq36Hk
	ns7L2j1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SO-00Egze-0R;
	Mon, 05 Jun 2023 08:20:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SK-00EgxB-2G
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 08:20:49 +0000
X-UUID: de5fb676037911ee912e1518a6540028-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YK442o+TSmC2/oovm6NFFCuJYxxN9tyqtaZCBSo0kT8=;
	b=Z4TJjW33SmfyyqqOXMih5fEIRlASCZXeHbACgdtaBz9Bf7T3nMU+mYTuu7Bpp9iz/HnKcG3wIdxpgGO/8BOnDoRcawUswa6kSBXBzaS+YP6XVSsFYPM1XRYzH4zPwGcH5lL72gOgxs8BNFwkOndwPxFXNTWQzLNszbB05oHjXVU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:891fb828-ac3e-4208-9f22-058f84e4691a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:891fb828-ac3e-4208-9f22-058f84e4691a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:dc0f0c6e-2f20-4998-991c-3b78627e4938,B
	ulkID:230605162046OJR79O9O,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: de5fb676037911ee912e1518a6540028-20230605
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 699985693; Mon, 05 Jun 2023 01:20:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 16:20:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 16:20:41 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 10/10] wifi: mt76: mt7996: increase tx token size
Date: Mon, 5 Jun 2023 16:19:47 +0800
Message-ID: <20230605081947.12804-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230605081947.12804-1-shayne.chen@mediatek.com>
References: <20230605081947.12804-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012048_742928_5B4C50DB 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

Align tx token size to proprietary driver, which can improve peak
throughput under MU performance tests.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index a3bd85d3df25..651f53aa0cca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -36,7 +36,7 @@
 #define MT7996_EEPROM_DEFAULT		"mediatek/mt7996/mt7996_eeprom.bin"
 #define MT7996_EEPROM_SIZE		7680
 #define MT7996_EEPROM_BLOCK_SIZE	16
-#define MT7996_TOKEN_SIZE		8192
+#define MT7996_TOKEN_SIZE		16384
 
 #define MT7996_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
 #define MT7996_CFEND_RATE_11B		0x03	/* 11B LP, 11M */
-- 
2.39.2


