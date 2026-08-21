Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B213C5DF87
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVcIWXhY2wz8NvM95p3hoeFhZkF3cOjz6bVDt67l2Xo=; b=unIgg7cYpA76j5IjsZX4HY+vwd
	cWd8137kASgVQ5De4nEZMIoFDxhMQrhKeOuz79zsAsCI+T/xW+Zt4rbnGJMN+dbKakP5pV0mV+Mz3
	gg+KsIMaAb5ZzbKyjHVnE5ufYfVP8YIH1n7Tsq8HU8NdcXYGzKnMhLYIrD5IglOTu5nkkCduxiDoC
	5UrxApqxRXnrdQl6ZGUE3MyB+ndXSQeqyGHyQDM03be1aDG22OvdoZplERW3fborsN+HlumimEeyM
	ZTJCuU/7y5WpOzKr2sF0CFGckQrXDY81BNo5EIUJeVWU+jAh1SrEOWcn1A31YXtwr6JpQXo8LKv8I
	OPnt3i/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxE0z-0000000CPss-0SGJ;
	Fri, 21 Aug 2026 01:25:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxE0w-0000000CPsA-3Z6j
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 01:25:47 +0000
X-UUID: 3a37e7a89cff11f1afed4741b24580c9-20260820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gVcIWXhY2wz8NvM95p3hoeFhZkF3cOjz6bVDt67l2Xo=;
	b=oGT80TkWQSHP+lLbTLeHa88NuS4XtH/NJN3jbjLEr/BF1tNfhU3u6Z/Lcdb8OT899wylFFH1JADtY3LZ+0xwzpUgykT9ISQmSdHnlfgzRgeoqMhYbs2z+rTzqWpkkG1qBLyr1937WiVlHdM+N4dIUrptvA/SdmeJ5381aEqyE38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8256a6a5-533d-4ce7-b103-5bef44704feb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:d465495e-4843-4d87-9105-fd688b4769cd,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a37e7a89cff11f1afed4741b24580c9-20260820
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 102408426; Thu, 20 Aug 2026 18:25:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 21 Aug 2026 09:25:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 21 Aug 2026 09:25:40 +0800
From: Anthony Liu <anthony.liu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.lee@mediatek.com>,
	<litien.chang@mediatek.com>, <kun.wu@mediatek.com>, <jb.tsai@mediatek.com>,
	<emery.hsin@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH v2] [PATCH 03/05] wifi: mt76: add ACPI MTFG option for bus configuration
Date: Fri, 21 Aug 2026 09:25:26 +0800
Message-ID: <20260821012528.2259093-3-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821012528.2259093-1-anthony.liu@mediatek.com>
References: <20260821012528.2259093-1-anthony.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_182546_969383_292168AB 
X-CRM114-Status: UNSURE (   8.60  )
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

Extend ACPI MTFG table parsing to support an additional MTFG bus
configuration option.

Change-Id: I200f080d5b297e765b6a57c394f1006ae1bc585e
Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd7956e4a..227a6960f135 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -355,6 +355,7 @@ u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 	} map[] = {
 		{ 1, 1 },
 		{ 4, 2 },
+		{ 13, 3 },
 	};
 	u8 flags = BIT(0);
 	int i, j;
-- 
2.45.2


