Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22457CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kE+6XFeMKDa0LS+xV+tYro9ZbSI0C+U04y9XFOZqI+I=; b=j/EwC+e1IJU3R2lEMNAh/5cRPE
	m0jfxyPverZhX6blE0fWRDwq+cgAvlPziC7/yUK74JEHsLtfLhxE+U15p2rb/ynlujI3mJAJIb/7D
	l7CEHNykh+lMBe+zFeeSDgQoZhUZgBVLO+yQhNVo7pcPJ4yL1whSB99n9VwASRcnyN/GZgM6uO1lL
	/K2UK4Ep8L/kF60ZT7LAZIRaDE4Ix6k9H4Wh23UZ5fsuKsFKp88O3w8c/OZuI5k3RaHSIGRlxO9nG
	/XdP7VUee8GNJbRzJz5NyD2Z22DDbxeM7hoTV/lhJcXv2rS6OYaGTXVhHa+VonuUF7BSQUhiulxrw
	BM2hevCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeE1-0000000FuCz-0j10;
	Mon, 05 Oct 2026 08:39:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeDy-0000000FuCT-0LvE
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 08:39:08 +0000
X-UUID: 359327aac09811f1afed4741b24580c9-20261005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kE+6XFeMKDa0LS+xV+tYro9ZbSI0C+U04y9XFOZqI+I=;
	b=S0fxLePZg6fPGd4msmF/jpRzdg7tHfIJ8QX5Qti+Os8zh3ts79Ja+BPbRXsOHWymSco6Em9GjyQVW2UpN6jHUlUrOth4uZ8gx85D1uMbU/QbeDJYdQXgs99IAEtrbVxBUN7y2QsYkQobpxQiyHz2vWDBjDlCRQ6oKOkgmjp9U08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:607db12d-2fc9-4b35-a6d3-08f4472a8780,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:2e9fa094-f92e-44c1-a195-feed1a426245,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 359327aac09811f1afed4741b24580c9-20261005
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1855856247; Mon, 05 Oct 2026 01:38:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Oct 2026 16:38:56 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 5 Oct 2026 16:38:56 +0800
From: Anthony Liu <anthony.liu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.lee@mediatek.com>,
	<litien.chang@mediatek.com>, <kun.wu@mediatek.com>, <jb.tsai@mediatek.com>,
	<emery.hsin@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH] wifi: mt76: logging FW return value when FW download fails
Date: Mon, 5 Oct 2026 16:38:55 +0800
Message-ID: <20261005083855.107460-1-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_013906_130454_ADEBD1A7 
X-CRM114-Status: UNSURE (   7.80  )
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

Add log messages for pinpointing FW download failures.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index eb4d02ec3ebe..9189ccdaa5e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3225,7 +3225,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
 
 	ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, false);
 	if (ret) {
-		dev_err(dev->dev, "Failed to start WM firmware\n");
+		dev_err(dev->dev, "Failed to start WM firmware %d\n", ret);
 		goto out;
 	}
 
@@ -3396,7 +3396,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 
 	ret = mt76_connac_mcu_start_patch(dev);
 	if (ret)
-		dev_err(dev->dev, "Failed to start patch\n");
+		dev_err(dev->dev, "Failed to start patch %d\n", ret);
 
 out:
 	sem = mt76_connac_mcu_patch_sem_ctrl(dev, false);
@@ -3518,7 +3518,7 @@ int mt76_connac3_load_cb_patch(struct mt76_dev *dev, const char *fw_name)
 
 	ret = mt76_connac_cb_mcu_start_patch(dev);
 	if (ret)
-		dev_err(dev->dev, "Failed to start cb patch\n");
+		dev_err(dev->dev, "Failed to start cb patch %d\n", ret);
 
 out:
 	sem = mt76_connac_cb_mcu_patch_sem_ctrl(dev, false);
-- 
2.45.2


