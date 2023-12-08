Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47875C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 06:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z+7//TjXr90B58SC9BAM6tUD4VYYh+8yYZBEuenz64Y=; b=x4WNtsxnD30Yak9zPTXBuwwmK7
	4pFGUXqE+RJXBY6QtHyfFUrFLZq29jUTClyPLA7gaDfNJFvH8R4YV0lQSoiDHtMZrnynC0QasP3aj
	Es/mawE7Crhi4ROTZyQhxWTE25hsFa4zbPWWIhCNNUREFcCVqGzmjOToJC6wMrldvGgQY4PD1nKOb
	WyuwRO1t/H8bn9Y0wUMiPqY0P4pu5xakHdBqwEpiMJHeQuJM4SU77MU9unNGV4OnXOm0l4oy8AiGk
	/5eqmWjsFNkVdAtbaB0ybOhuMe7MJyirV7744GBrj9yIIzsIgJIG2fzB0PqsnlB+I9UO+1uU6sK1f
	cSHC81mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUWF-00EtIT-0F;
	Fri, 08 Dec 2023 06:39:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUWB-00EtHX-1I
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 06:39:24 +0000
X-UUID: 839a725a959411ee958cff29c719f35b-20231207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=z+7//TjXr90B58SC9BAM6tUD4VYYh+8yYZBEuenz64Y=;
	b=Ow1uqMj3O+AS9w6aNrL53HBLYrfMrrYRrw7xWE3TDJUtIy/axkvHoOlQYJjOOU78ewedcjNajH9uwZIsd7MvMEQ9rbcr6OhI7e1oz/pNNGkc7mCMcrqHvMszBYPeGw8RKNliVHkpiA10GJFMdeuOsy0hEUk1VQuALK2YfBTA7Q0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:6e10c1fe-3c14-402e-87d3-bf2a57f04847,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:ec858d73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 839a725a959411ee958cff29c719f35b-20231207
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <allen.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2102251009; Thu, 07 Dec 2023 23:39:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Dec 2023 14:38:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Dec 2023 14:38:43 +0800
From: Allen Ye <allen.ye@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Allen Ye <allen.ye@mediatek.com>
Subject: [PATCH v2] wifi: mac80211: Update bssid indicator with real BSS numbers
Date: Fri, 8 Dec 2023 14:38:20 +0800
Message-ID: <20231208063820.25983-1-allen.ye@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.827400-8.000000
X-TMASE-MatchedRID: aIMFWkTGGx22jsN8aguKvC97pb4g5HCtvtVce6w5+K9bLUcJ8BGOxWD/
	jkY+Hb4OeejfEBgiuSAkTiFDx5Ln6W94Ipa1otxoP6pyf9NtizR6zDxGcFEbCkPL6pqegFS6jGT
	DyIuhciDc0NDBaoYShQ9CP6VIrQmOWt71IsCTbXGeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hfNj
	F5BHUO+wax7kVctRdPxm1GKEdCief7eCqlRXtydMSWMYvbQRfP1AnhESIjQag=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.827400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F4D371DF9CB6022027055843B20B7EDEC59B7FF7ECCFEFF863B2047F81BB808A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_223923_466945_6C2D080A 
X-CRM114-Status: UNSURE (   9.45  )
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

The cnt member in mbssid is the count of total number of MBSSID elements
instead of BSSID. Therefore, we fix this by reading the MaxBSSID Indicator
field directly.

Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Co-developed-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Allen Ye <allen.ye@mediatek.com>
---
v2:
  - Fix From and s-o-b format error
---
 net/mac80211/cfg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 606b1b2e4123..f90bcd59f85a 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1164,9 +1164,11 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 	/* copy in optional mbssid_ies */
 	if (mbssid) {
 		u8 *pos = new->tail + new->tail_len;
+		const struct element *mbssid_elem;
 
 		new->mbssid_ies = (void *)pos;
 		pos += struct_size(new->mbssid_ies, elem, mbssid->cnt);
+		mbssid_elem = (const struct element *)pos;
 		pos += ieee80211_copy_mbssid_beacon(pos, new->mbssid_ies,
 						    mbssid);
 		if (rnr) {
@@ -1175,8 +1177,7 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 			ieee80211_copy_rnr_beacon(pos, new->rnr_ies, rnr);
 		}
 		/* update bssid_indicator */
-		link_conf->bssid_indicator =
-			ilog2(__roundup_pow_of_two(mbssid->cnt + 1));
+		link_conf->bssid_indicator = mbssid_elem->data[0];
 	}
 
 	if (csa) {
-- 
2.18.0


