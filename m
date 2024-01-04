Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E37C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=frFw3phKhsWMGzBQfo28kukVqr2J7NF9caCnWn+RMlE=; b=tc+3MSQfwR0VJWeUgeTq6DCbMK
	osZ4DqJKfrWxiDuoD9AZ+0BD+/PhsYlD022sktRNqDeCpagIxbU7MGALEctR+s1qiGAQ5ZSyzKXqX
	J5CbV7bSUT4SWBq5ojU/vtPElr3TXZOVf7xjAtqJvGLBCDEAuqPGChz3BZaAGlQor9r0k4k1efQqk
	8Nv7AHs9M9ojp1eVepcsppcg93dWnCI3KQHLyBtw3xou+UBx8tMi0m8gN2LWoyJJeCJqHL8fWTGGh
	dVZLNYZLkKLXVsSQNB+rEFMiB+Vrqz7btlrpbO3CvgNTw4rkAw6yxU/Wb8g/gEYjncHXKEYbFjqNy
	ihSGThXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKMI-00DQn8-33;
	Thu, 04 Jan 2024 09:49:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKMG-00DQlr-0c
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 09:49:49 +0000
X-UUID: 95a15614aae611eeafd70d0b34820190-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=frFw3phKhsWMGzBQfo28kukVqr2J7NF9caCnWn+RMlE=;
	b=qAsZtAZgtcip8kCyIK/vpPFNWn+nXXeUSnGcLrYchzbE/s6p64ICwbLtp9e12UqEyb6z9fKwTqTVQbwhEoAh4FoIb9V3ebRZeiufcYSkH4NrYyabPqUz+uVzbKTlV37x4gDZnGqiqTlbTDxSyJiIq+1zNWxUnPdDCk3Kec8iInQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ef32d902-54ba-4911-911f-8ef8c06ddebb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:f622fc7e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 95a15614aae611eeafd70d0b34820190-20240104
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1508161727; Thu, 04 Jan 2024 02:49:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 17:49:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 17:49:08 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix the wrong data type for scan command
Date: Thu, 4 Jan 2024 17:48:45 +0800
Message-ID: <20240104094845.11276-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_014948_234541_CB7C6A59 
X-CRM114-Status: GOOD (  10.25  )
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

For the member of 'struct scan_req_tlv', replace data type of
func_mask_ext from 'u8' to 'u32'.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 3c41e21303b1..82b7e277397f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -208,7 +208,7 @@ struct scan_req_tlv {
 	__le16 channel_dwell_time; /* channel Dwell interval */
 	__le16 timeout_value;
 	__le16 probe_delay_time;
-	u8 func_mask_ext;
+	u32 func_mask_ext;
 };
 
 struct scan_ssid_tlv {
-- 
2.18.0


