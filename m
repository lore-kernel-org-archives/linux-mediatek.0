Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50748C47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++yrsJrzau0SCaizLWufalB6DIb/7OAtjBFolyLrQwU=; b=eimJWMy8nGC3UeouqC9agQg6xF
	S8HJm2UZzviskS8DYHQSEFGdcivffW6+PDYEkqj0+somHPIhbNlVIeChEOI0em6xC5ikyd+KZNJ16
	eCBHVXAdPIH4N+iIXTKwBUGVp51wRi4NDhGToWPXfwqEHnMYrDSXTY3jJ2LkAy3poyjdXJXKE7gtT
	F48AlYLMg4KaG6JHD3+PkOZSG8SEOlTeqMbC+qVY88tuDZfdA2QZs/F8GDE5KL0jMaCtag7oC8Cy3
	17IXWTcf2wFGJkZ1TxdwNbzPBLX3ZzcrPBa3MYCI0bw+yzfwVR261ZoilJRm+T3i4tuoR8nyMmSAW
	fJsRadVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLxS-00Dnis-1a;
	Thu, 04 Jan 2024 11:32:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLxP-00DneP-1b
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 11:32:17 +0000
X-UUID: e6140930aaf411eeafd70d0b34820190-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=++yrsJrzau0SCaizLWufalB6DIb/7OAtjBFolyLrQwU=;
	b=geOFI75cvRzyU75LbcqVUy+emrrcbImzZs/ENMHm4QmHGfDbEDTyqUAljMiBfLOszoilrPJ/wAJRQVIqC3pOHxDJQyyZ0i/CClxHzSJPcpVbPnGVlmJ+PijMkAXkAjh5J5wedPs0lV4qf7Y7q5fZekDqRT1kXAIa7rwPOPD9Txk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:92f96d1b-9f35-4c16-85c6-5a80d448b7fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:a6eafc7e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e6140930aaf411eeafd70d0b34820190-20240104
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 887895437; Thu, 04 Jan 2024 04:32:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 19:32:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 19:32:07 +0800
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
Subject: [PATCH v2] wifi: mt76: mt7925: fix the wrong data type for scan command
Date: Thu, 4 Jan 2024 19:32:06 +0800
Message-ID: <20240104113206.13252-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.507500-8.000000
X-TMASE-MatchedRID: EJLkrvRJ8yxIQkQ+2Oh2tcAmcZEx8XHJQl/FdRYkUZL01TdrRxjjBl4s
	hHbNA5484vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpOlxBO2IcOBaUr4UTaNYjAOxyJvKRzDVEd7r
	8EQd0X8Jk1fx+G1RLBPiNk75IK0l68wkY9DwRNABPi0PYVK4cl7wh+S5j613tVAlaNPJUwKHBkG
	BTIlURuXoXDz8+lMxFpW+aIDJ4DaRzkxJ+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.507500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E6C718F3336F38C754DA4F673ABCA838045B8B2ED76587825CF1D80AC3135DB32000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_033215_548216_0193E3C7 
X-CRM114-Status: GOOD (  10.28  )
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
func_mask_ext from 'u8' to '__le32'.

Change-Id: Ib9fc1aadd1f1960b63d35f31f0a4655416884bf0
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2:
 change the data type from 'u32' to '__le32'.
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 3c41e21303b1..98cb705e7423 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -208,7 +208,7 @@ struct scan_req_tlv {
 	__le16 channel_dwell_time; /* channel Dwell interval */
 	__le16 timeout_value;
 	__le16 probe_delay_time;
-	u8 func_mask_ext;
+	__le32 func_mask_ext;
 };
 
 struct scan_ssid_tlv {
-- 
2.18.0


