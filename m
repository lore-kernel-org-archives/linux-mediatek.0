Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75DFC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T39FyNEwI6F/HZ7nRpTpZVn4jqVCtPlIlNVn7jkEgME=; b=GKjF2BVrYFAAL6TTBKoA2oWDZ8
	U+7/QI5bFmfeaKHUftQvVmkk56xU/G5o+1pPiLjeH65Wf2Ndsyhmxfrt1ELEQO+bhtPjbexUsgn8I
	EU+TlQtlEaLMn2oAB2o8KaSjZzJEbg5Nw5bUsczTSrjt/gTyfQO3yeEImy6G4TfVVWI6t3JGwqQMr
	CMyQBjIx+NHBM7stmrLsdNDI9S4yJt1keXlWqTiRBfEPBsOVln8CVFoIBiJ056jvhx2tjvNKkYOz/
	dEkXtKhVFOtpjodu96ZwJdlq/VUldlmQJOKBI08C/3z/b8K3VhYuAYGt6FBTQaPqhiW/rosgkbET6
	J6aDVI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVJK-00AwGS-2S;
	Wed, 10 Jan 2024 09:55:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVJH-00AwFZ-29
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 09:55:44 +0000
X-UUID: 66bed3f0af9e11ee9a662f17bb45267e-20240110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=T39FyNEwI6F/HZ7nRpTpZVn4jqVCtPlIlNVn7jkEgME=;
	b=L3rJUk2F6vqgZu3dmzKcUFAf9JmfBPF0X/c0kDsXh+125CYKj71TBsroVjD9mBe9L11t9ZAZzqDw57fksRm+excK6MIrHSaljpamkluD22SfHF4RAR1jV+NfwHUvVJFyiNDBpRoMcsdcH6gYLgWvzdxj8O/OTS8AHD0FBrBeNDM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ce039376-b74e-4570-b763-a0818362bb62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:8b11327f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 66bed3f0af9e11ee9a662f17bb45267e-20240110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2068038638; Wed, 10 Jan 2024 02:55:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jan 2024 17:55:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jan 2024 17:55:02 +0800
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
Subject: [PATCH v3] wifi: mt76: mt7925: fix the wrong data type for scan command
Date: Wed, 10 Jan 2024 17:54:57 +0800
Message-ID: <20240110095457.11951-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.277500-8.000000
X-TMASE-MatchedRID: dHqkmzbglWZIQkQ+2Oh2tcAmcZEx8XHJMVx/3ZYby79b6PBUqmq+UlO4
	BD7nLMxns8CcQmOfNJ/cFPFR1xoqQh8TzIzimOwP0C1sQRfQzEHEQdG7H66TyN+E/XGDLHcMTcV
	YJ/W0+IfQwa+VkK70gBRfQH7W22PyeFJEhPOce+XHT0feGj9sxPyVjEKMi9OXNlo6G1fYocNl75
	UwE60dAf2Zr4ZzVe8ZjofsMjQaxVwyYjbiqIQ3CsykhtyXcigD6rVdgBjDT2oh1j2M6LiVMg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.277500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A135D5F670C88D2A372A26A7F1C56D4384ACC8B9DB37747C26561D84A13ACF642000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_015543_723160_73EF54B1 
X-CRM114-Status: GOOD (  10.53  )
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

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2:
 change the data type from 'u32' to '__le32'.
v3:
 remove redundant "Change-Id tag" in commit message.
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


