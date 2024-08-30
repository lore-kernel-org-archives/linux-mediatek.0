Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E813CA0EE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jM1WDMlAP0+iq09j52bjz7q5yr0unHnXFA0Fd69rmqA=; b=bDCniDOAjRsRcDJvw+V7LVcg68
	Bc8XJ5WijH5LN1Goi00d0Clr2Hy1CHBibi9g961Jlc4YrH404ofipUOe+VAs1Fk9lyFup50nMWwy1
	a4bDxPcv0gqEel8STJp7qo0698I4Ra1OPT1R/AL/y3FF+J/PFoiFJpFVTMZYlD2/la80XvsinrVdq
	cqDj0cQUJ/sey9U9M+nx8UBHf5Ref0BTrc3v4Z0BXaDch6ydaBvnBzjKoF69Qys5PAPKzRc5edAIh
	DvVuaESqyBOu/gtVHdj8ktOZP2papDXzFF+KsuUe6/6pTLVcSrSgdvkqp0ldCKU+0eH7+S9X2UD8h
	atc4WEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw8y-00000005973-02Qu;
	Fri, 30 Aug 2024 07:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw7e-000000058gv-0Ukx
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:32:43 +0000
X-UUID: 070e82f066a211efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jM1WDMlAP0+iq09j52bjz7q5yr0unHnXFA0Fd69rmqA=;
	b=E2/JZr/fxqjC9IA+8FArBYHkmYpctboejGKv43C4/5aQ0A+S0SZglhZ2J1D7gWCtLwtZxg8AGgD6x3R0VZ1g5BLYevYFBeo4hOBhWtG+waCgMT1vuyx9LHOAYh4BgU6OONZyU95tl7z83KEm5PZkYo3KcCYLr6qiNANzMgwfiSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:232a1a2d-394b-4d1f-811d-0fcb702c8faf,IP:0,U
	RL:0,TC:0,Content:39,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:39
X-CID-META: VersionHash:6dc6a47,CLOUDID:480d6ccf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 070e82f066a211efb3adad29d29602c1-20240830
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2138058120; Fri, 30 Aug 2024 00:32:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 15:32:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 15:32:31 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Quan Zhou
	<quan.zhou@mediatek.com>, Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
Subject: [PATCH] wifi: mac80211: introduce EHT rate support in AQL airtime
Date: Fri, 30 Aug 2024 15:32:29 +0800
Message-ID: <20240830073229.21593-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.891900-8.000000
X-TMASE-MatchedRID: fgVbCT167QSGeTbGWdRz1u7KTDtx8CggLC92/N1OWlnfUZT83lbkEA3o
	tOVSQ3PR/0znhYaTxRu/JYZGzpCXD7EMJCLOBFF24pdq9sdj8LVLxPtqS8Bm59EsTITobgNE2ug
	QZCK503JtMbP5CeY5H1z/5q7y7hvVG3+s7Q8JfKbRfDQgu+j+5bkHqOCID0rPmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ19+9ZqEp9FTgKpU9kWk81zd7Uyl30/xRS95Qbz6z72TxCe/RFxmWAwYKih
	/TKd/b8pRccn8lzTmHv18tFFIi4RCWchtbyTeU/vThLoe1eIoIXRoPmWO3jekxwdkPqCq7vDEyN
	+J8hd+jCS9WgDXVPCvqy+VVvqH2X
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.891900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3D3DBFE8EAD3EF1D38D0B77CC28F79E72FE0ED4A52571B78D1E8BBE505B84BAB2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_003242_195698_1F087AC2 
X-CRM114-Status: UNSURE (   9.90  )
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

Add definitions related to EHT mode and airtime calculation
according to the 802.11BE_D4.0.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
---
 net/mac80211/airtime.c | 352 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 349 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index fdf8b658fede..1fd9bea61379 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -55,10 +55,21 @@
 #define HE_DURATION_S(shift, streams, gi, bps)		\
 	(HE_DURATION(streams, gi, bps) >> shift)
 
+/* gi in HE/EHT is identical. It matches enum nl80211_eht_gi as well */
+#define EHT_GI_08 HE_GI_08
+#define EHT_GI_16 HE_GI_16
+#define EHT_GI_32 HE_GI_32
+
+#define EHT_DURATION(streams, gi, bps)			\
+	HE_DURATION(streams, gi, bps)
+#define EHT_DURATION_S(shift, streams, gi, bps)		\
+	HE_DURATION_S(shift, streams, gi, bps)
+
 #define BW_20			0
 #define BW_40			1
 #define BW_80			2
 #define BW_160			3
+#define BW_320			4
 
 /*
  * Define group sort order: HT40 -> SGI -> #streams
@@ -68,17 +79,26 @@
 #define IEEE80211_VHT_STREAM_GROUPS	8 /* BW(=4) * SGI(=2) */
 
 #define IEEE80211_HE_MAX_STREAMS	8
+#define IEEE80211_HE_STREAM_GROUPS	12 /* BW(=4) * GI(=3) */
+
+#define IEEE80211_EHT_MAX_STREAMS	16
+#define IEEE80211_EHT_STREAM_GROUPS	15 /* BW(=5) * GI(=3) */
 
 #define IEEE80211_HT_GROUPS_NB	(IEEE80211_MAX_STREAMS *	\
 				 IEEE80211_HT_STREAM_GROUPS)
 #define IEEE80211_VHT_GROUPS_NB	(IEEE80211_MAX_STREAMS *	\
 					 IEEE80211_VHT_STREAM_GROUPS)
+#define IEEE80211_HE_GROUPS_NB	(IEEE80211_HE_MAX_STREAMS *	\
+				 IEEE80211_HE_STREAM_GROUPS)
+#define IEEE80211_EHT_GROUPS_NB	(IEEE80211_EHT_MAX_STREAMS *	\
+				 IEEE80211_EHT_STREAM_GROUPS)
 
 #define IEEE80211_HT_GROUP_0	0
 #define IEEE80211_VHT_GROUP_0	(IEEE80211_HT_GROUP_0 + IEEE80211_HT_GROUPS_NB)
 #define IEEE80211_HE_GROUP_0	(IEEE80211_VHT_GROUP_0 + IEEE80211_VHT_GROUPS_NB)
+#define IEEE80211_EHT_GROUP_0	(IEEE80211_HE_GROUP_0 + IEEE80211_HE_GROUPS_NB)
 
-#define MCS_GROUP_RATES		12
+#define MCS_GROUP_RATES		14
 
 #define HT_GROUP_IDX(_streams, _sgi, _ht40)	\
 	IEEE80211_HT_GROUP_0 +			\
@@ -203,6 +223,59 @@
 #define HE_GROUP(_streams, _gi, _bw)					\
 	__HE_GROUP(_streams, _gi, _bw,				\
 		   HE_GROUP_SHIFT(_streams, _gi, _bw))
+
+#define EHT_BW2VBPS(_bw, r5, r4, r3, r2, r1)					\
+	((_bw) == BW_320 ? r5 : BW2VBPS(_bw, r4, r3, r2, r1))
+
+#define EHT_GROUP_IDX(_streams, _gi, _bw)				\
+	(IEEE80211_EHT_GROUP_0 +					\
+	 IEEE80211_EHT_MAX_STREAMS * 3 * (_bw) +			\
+	 IEEE80211_EHT_MAX_STREAMS * (_gi) +				\
+	 (_streams) - 1)
+
+#define __EHT_GROUP(_streams, _gi, _bw, _s)						\
+	[EHT_GROUP_IDX(_streams, _gi, _bw)] = {						\
+	.shift = _s,									\
+	.duration = {									\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw,  1960,   980,  490,  234,  117)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw,  3920,  1960,  980,  468,  234)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw,  5880,  2937, 1470,  702,  351)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw,  7840,  3920, 1960,  936,  468)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 11760,  5880, 2940, 1404,  702)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 15680,  7840, 3920, 1872,  936)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 17640,  8820, 4410, 2106, 1053)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 19600,  9800, 4900, 2340, 1170)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 23520, 11760, 5880, 2808, 1404)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 26133, 13066, 6533, 3120, 1560)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 29400, 14700, 7350, 3510, 1755)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 32666, 16333, 8166, 3900, 1950)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 35280, 17640, 8820, 4212, 2106)),	\
+		EHT_DURATION_S(_s, _streams, _gi,					\
+			       EHT_BW2VBPS(_bw, 39200, 19600, 9800, 4680, 2340))	\
+		}									\
+}
+
+#define EHT_GROUP_SHIFT(_streams, _gi, _bw)						\
+	GROUP_SHIFT(EHT_DURATION(_streams, _gi,						\
+				 EHT_BW2VBPS(_bw, 1960, 980, 490, 234, 117)))
+
+#define EHT_GROUP(_streams, _gi, _bw)					\
+	__EHT_GROUP(_streams, _gi, _bw,				\
+		   EHT_GROUP_SHIFT(_streams, _gi, _bw))
+
 struct mcs_group {
 	u8 shift;
 	u16 duration[MCS_GROUP_RATES];
@@ -376,6 +449,261 @@ static const struct mcs_group airtime_mcs_groups[] = {
 	HE_GROUP(6, HE_GI_32, BW_160),
 	HE_GROUP(7, HE_GI_32, BW_160),
 	HE_GROUP(8, HE_GI_32, BW_160),
+
+	EHT_GROUP(1, EHT_GI_08, BW_20),
+	EHT_GROUP(2, EHT_GI_08, BW_20),
+	EHT_GROUP(3, EHT_GI_08, BW_20),
+	EHT_GROUP(4, EHT_GI_08, BW_20),
+	EHT_GROUP(5, EHT_GI_08, BW_20),
+	EHT_GROUP(6, EHT_GI_08, BW_20),
+	EHT_GROUP(7, EHT_GI_08, BW_20),
+	EHT_GROUP(8, EHT_GI_08, BW_20),
+	EHT_GROUP(9, EHT_GI_08, BW_20),
+	EHT_GROUP(10, EHT_GI_08, BW_20),
+	EHT_GROUP(11, EHT_GI_08, BW_20),
+	EHT_GROUP(12, EHT_GI_08, BW_20),
+	EHT_GROUP(13, EHT_GI_08, BW_20),
+	EHT_GROUP(14, EHT_GI_08, BW_20),
+	EHT_GROUP(15, EHT_GI_08, BW_20),
+	EHT_GROUP(16, EHT_GI_08, BW_20),
+
+	EHT_GROUP(1, EHT_GI_16, BW_20),
+	EHT_GROUP(2, EHT_GI_16, BW_20),
+	EHT_GROUP(3, EHT_GI_16, BW_20),
+	EHT_GROUP(4, EHT_GI_16, BW_20),
+	EHT_GROUP(5, EHT_GI_16, BW_20),
+	EHT_GROUP(6, EHT_GI_16, BW_20),
+	EHT_GROUP(7, EHT_GI_16, BW_20),
+	EHT_GROUP(8, EHT_GI_16, BW_20),
+	EHT_GROUP(9, EHT_GI_16, BW_20),
+	EHT_GROUP(10, EHT_GI_16, BW_20),
+	EHT_GROUP(11, EHT_GI_16, BW_20),
+	EHT_GROUP(12, EHT_GI_16, BW_20),
+	EHT_GROUP(13, EHT_GI_16, BW_20),
+	EHT_GROUP(14, EHT_GI_16, BW_20),
+	EHT_GROUP(15, EHT_GI_16, BW_20),
+	EHT_GROUP(16, EHT_GI_16, BW_20),
+
+	EHT_GROUP(1, EHT_GI_32, BW_20),
+	EHT_GROUP(2, EHT_GI_32, BW_20),
+	EHT_GROUP(3, EHT_GI_32, BW_20),
+	EHT_GROUP(4, EHT_GI_32, BW_20),
+	EHT_GROUP(5, EHT_GI_32, BW_20),
+	EHT_GROUP(6, EHT_GI_32, BW_20),
+	EHT_GROUP(7, EHT_GI_32, BW_20),
+	EHT_GROUP(8, EHT_GI_32, BW_20),
+	EHT_GROUP(9, EHT_GI_32, BW_20),
+	EHT_GROUP(10, EHT_GI_32, BW_20),
+	EHT_GROUP(11, EHT_GI_32, BW_20),
+	EHT_GROUP(12, EHT_GI_32, BW_20),
+	EHT_GROUP(13, EHT_GI_32, BW_20),
+	EHT_GROUP(14, EHT_GI_32, BW_20),
+	EHT_GROUP(15, EHT_GI_32, BW_20),
+	EHT_GROUP(16, EHT_GI_32, BW_20),
+
+	EHT_GROUP(1, EHT_GI_08, BW_40),
+	EHT_GROUP(2, EHT_GI_08, BW_40),
+	EHT_GROUP(3, EHT_GI_08, BW_40),
+	EHT_GROUP(4, EHT_GI_08, BW_40),
+	EHT_GROUP(5, EHT_GI_08, BW_40),
+	EHT_GROUP(6, EHT_GI_08, BW_40),
+	EHT_GROUP(7, EHT_GI_08, BW_40),
+	EHT_GROUP(8, EHT_GI_08, BW_40),
+	EHT_GROUP(9, EHT_GI_08, BW_40),
+	EHT_GROUP(10, EHT_GI_08, BW_40),
+	EHT_GROUP(11, EHT_GI_08, BW_40),
+	EHT_GROUP(12, EHT_GI_08, BW_40),
+	EHT_GROUP(13, EHT_GI_08, BW_40),
+	EHT_GROUP(14, EHT_GI_08, BW_40),
+	EHT_GROUP(15, EHT_GI_08, BW_40),
+	EHT_GROUP(16, EHT_GI_08, BW_40),
+
+	EHT_GROUP(1, EHT_GI_16, BW_40),
+	EHT_GROUP(2, EHT_GI_16, BW_40),
+	EHT_GROUP(3, EHT_GI_16, BW_40),
+	EHT_GROUP(4, EHT_GI_16, BW_40),
+	EHT_GROUP(5, EHT_GI_16, BW_40),
+	EHT_GROUP(6, EHT_GI_16, BW_40),
+	EHT_GROUP(7, EHT_GI_16, BW_40),
+	EHT_GROUP(8, EHT_GI_16, BW_40),
+	EHT_GROUP(9, EHT_GI_16, BW_40),
+	EHT_GROUP(10, EHT_GI_16, BW_40),
+	EHT_GROUP(11, EHT_GI_16, BW_40),
+	EHT_GROUP(12, EHT_GI_16, BW_40),
+	EHT_GROUP(13, EHT_GI_16, BW_40),
+	EHT_GROUP(14, EHT_GI_16, BW_40),
+	EHT_GROUP(15, EHT_GI_16, BW_40),
+	EHT_GROUP(16, EHT_GI_16, BW_40),
+
+	EHT_GROUP(1, EHT_GI_32, BW_40),
+	EHT_GROUP(2, EHT_GI_32, BW_40),
+	EHT_GROUP(3, EHT_GI_32, BW_40),
+	EHT_GROUP(4, EHT_GI_32, BW_40),
+	EHT_GROUP(5, EHT_GI_32, BW_40),
+	EHT_GROUP(6, EHT_GI_32, BW_40),
+	EHT_GROUP(7, EHT_GI_32, BW_40),
+	EHT_GROUP(8, EHT_GI_32, BW_40),
+	EHT_GROUP(9, EHT_GI_32, BW_40),
+	EHT_GROUP(10, EHT_GI_32, BW_40),
+	EHT_GROUP(11, EHT_GI_32, BW_40),
+	EHT_GROUP(12, EHT_GI_32, BW_40),
+	EHT_GROUP(13, EHT_GI_32, BW_40),
+	EHT_GROUP(14, EHT_GI_32, BW_40),
+	EHT_GROUP(15, EHT_GI_32, BW_40),
+	EHT_GROUP(16, EHT_GI_32, BW_40),
+
+	EHT_GROUP(1, EHT_GI_08, BW_80),
+	EHT_GROUP(2, EHT_GI_08, BW_80),
+	EHT_GROUP(3, EHT_GI_08, BW_80),
+	EHT_GROUP(4, EHT_GI_08, BW_80),
+	EHT_GROUP(5, EHT_GI_08, BW_80),
+	EHT_GROUP(6, EHT_GI_08, BW_80),
+	EHT_GROUP(7, EHT_GI_08, BW_80),
+	EHT_GROUP(8, EHT_GI_08, BW_80),
+	EHT_GROUP(9, EHT_GI_08, BW_80),
+	EHT_GROUP(10, EHT_GI_08, BW_80),
+	EHT_GROUP(11, EHT_GI_08, BW_80),
+	EHT_GROUP(12, EHT_GI_08, BW_80),
+	EHT_GROUP(13, EHT_GI_08, BW_80),
+	EHT_GROUP(14, EHT_GI_08, BW_80),
+	EHT_GROUP(15, EHT_GI_08, BW_80),
+	EHT_GROUP(16, EHT_GI_08, BW_80),
+
+	EHT_GROUP(1, EHT_GI_16, BW_80),
+	EHT_GROUP(2, EHT_GI_16, BW_80),
+	EHT_GROUP(3, EHT_GI_16, BW_80),
+	EHT_GROUP(4, EHT_GI_16, BW_80),
+	EHT_GROUP(5, EHT_GI_16, BW_80),
+	EHT_GROUP(6, EHT_GI_16, BW_80),
+	EHT_GROUP(7, EHT_GI_16, BW_80),
+	EHT_GROUP(8, EHT_GI_16, BW_80),
+	EHT_GROUP(9, EHT_GI_16, BW_80),
+	EHT_GROUP(10, EHT_GI_16, BW_80),
+	EHT_GROUP(11, EHT_GI_16, BW_80),
+	EHT_GROUP(12, EHT_GI_16, BW_80),
+	EHT_GROUP(13, EHT_GI_16, BW_80),
+	EHT_GROUP(14, EHT_GI_16, BW_80),
+	EHT_GROUP(15, EHT_GI_16, BW_80),
+	EHT_GROUP(16, EHT_GI_16, BW_80),
+
+	EHT_GROUP(1, EHT_GI_32, BW_80),
+	EHT_GROUP(2, EHT_GI_32, BW_80),
+	EHT_GROUP(3, EHT_GI_32, BW_80),
+	EHT_GROUP(4, EHT_GI_32, BW_80),
+	EHT_GROUP(5, EHT_GI_32, BW_80),
+	EHT_GROUP(6, EHT_GI_32, BW_80),
+	EHT_GROUP(7, EHT_GI_32, BW_80),
+	EHT_GROUP(8, EHT_GI_32, BW_80),
+	EHT_GROUP(9, EHT_GI_32, BW_80),
+	EHT_GROUP(10, EHT_GI_32, BW_80),
+	EHT_GROUP(11, EHT_GI_32, BW_80),
+	EHT_GROUP(12, EHT_GI_32, BW_80),
+	EHT_GROUP(13, EHT_GI_32, BW_80),
+	EHT_GROUP(14, EHT_GI_32, BW_80),
+	EHT_GROUP(15, EHT_GI_32, BW_80),
+	EHT_GROUP(16, EHT_GI_32, BW_80),
+
+	EHT_GROUP(1, EHT_GI_08, BW_160),
+	EHT_GROUP(2, EHT_GI_08, BW_160),
+	EHT_GROUP(3, EHT_GI_08, BW_160),
+	EHT_GROUP(4, EHT_GI_08, BW_160),
+	EHT_GROUP(5, EHT_GI_08, BW_160),
+	EHT_GROUP(6, EHT_GI_08, BW_160),
+	EHT_GROUP(7, EHT_GI_08, BW_160),
+	EHT_GROUP(8, EHT_GI_08, BW_160),
+	EHT_GROUP(9, EHT_GI_08, BW_160),
+	EHT_GROUP(10, EHT_GI_08, BW_160),
+	EHT_GROUP(11, EHT_GI_08, BW_160),
+	EHT_GROUP(12, EHT_GI_08, BW_160),
+	EHT_GROUP(13, EHT_GI_08, BW_160),
+	EHT_GROUP(14, EHT_GI_08, BW_160),
+	EHT_GROUP(15, EHT_GI_08, BW_160),
+	EHT_GROUP(16, EHT_GI_08, BW_160),
+
+	EHT_GROUP(1, EHT_GI_16, BW_160),
+	EHT_GROUP(2, EHT_GI_16, BW_160),
+	EHT_GROUP(3, EHT_GI_16, BW_160),
+	EHT_GROUP(4, EHT_GI_16, BW_160),
+	EHT_GROUP(5, EHT_GI_16, BW_160),
+	EHT_GROUP(6, EHT_GI_16, BW_160),
+	EHT_GROUP(7, EHT_GI_16, BW_160),
+	EHT_GROUP(8, EHT_GI_16, BW_160),
+	EHT_GROUP(9, EHT_GI_16, BW_160),
+	EHT_GROUP(10, EHT_GI_16, BW_160),
+	EHT_GROUP(11, EHT_GI_16, BW_160),
+	EHT_GROUP(12, EHT_GI_16, BW_160),
+	EHT_GROUP(13, EHT_GI_16, BW_160),
+	EHT_GROUP(14, EHT_GI_16, BW_160),
+	EHT_GROUP(15, EHT_GI_16, BW_160),
+	EHT_GROUP(16, EHT_GI_16, BW_160),
+
+	EHT_GROUP(1, EHT_GI_32, BW_160),
+	EHT_GROUP(2, EHT_GI_32, BW_160),
+	EHT_GROUP(3, EHT_GI_32, BW_160),
+	EHT_GROUP(4, EHT_GI_32, BW_160),
+	EHT_GROUP(5, EHT_GI_32, BW_160),
+	EHT_GROUP(6, EHT_GI_32, BW_160),
+	EHT_GROUP(7, EHT_GI_32, BW_160),
+	EHT_GROUP(8, EHT_GI_32, BW_160),
+	EHT_GROUP(9, EHT_GI_32, BW_160),
+	EHT_GROUP(10, EHT_GI_32, BW_160),
+	EHT_GROUP(11, EHT_GI_32, BW_160),
+	EHT_GROUP(12, EHT_GI_32, BW_160),
+	EHT_GROUP(13, EHT_GI_32, BW_160),
+	EHT_GROUP(14, EHT_GI_32, BW_160),
+	EHT_GROUP(15, EHT_GI_32, BW_160),
+	EHT_GROUP(16, EHT_GI_32, BW_160),
+
+	EHT_GROUP(1, EHT_GI_08, BW_320),
+	EHT_GROUP(2, EHT_GI_08, BW_320),
+	EHT_GROUP(3, EHT_GI_08, BW_320),
+	EHT_GROUP(4, EHT_GI_08, BW_320),
+	EHT_GROUP(5, EHT_GI_08, BW_320),
+	EHT_GROUP(6, EHT_GI_08, BW_320),
+	EHT_GROUP(7, EHT_GI_08, BW_320),
+	EHT_GROUP(8, EHT_GI_08, BW_320),
+	EHT_GROUP(9, EHT_GI_08, BW_320),
+	EHT_GROUP(10, EHT_GI_08, BW_320),
+	EHT_GROUP(11, EHT_GI_08, BW_320),
+	EHT_GROUP(12, EHT_GI_08, BW_320),
+	EHT_GROUP(13, EHT_GI_08, BW_320),
+	EHT_GROUP(14, EHT_GI_08, BW_320),
+	EHT_GROUP(15, EHT_GI_08, BW_320),
+	EHT_GROUP(16, EHT_GI_08, BW_320),
+
+	EHT_GROUP(1, EHT_GI_16, BW_320),
+	EHT_GROUP(2, EHT_GI_16, BW_320),
+	EHT_GROUP(3, EHT_GI_16, BW_320),
+	EHT_GROUP(4, EHT_GI_16, BW_320),
+	EHT_GROUP(5, EHT_GI_16, BW_320),
+	EHT_GROUP(6, EHT_GI_16, BW_320),
+	EHT_GROUP(7, EHT_GI_16, BW_320),
+	EHT_GROUP(8, EHT_GI_16, BW_320),
+	EHT_GROUP(9, EHT_GI_16, BW_320),
+	EHT_GROUP(10, EHT_GI_16, BW_320),
+	EHT_GROUP(11, EHT_GI_16, BW_320),
+	EHT_GROUP(12, EHT_GI_16, BW_320),
+	EHT_GROUP(13, EHT_GI_16, BW_320),
+	EHT_GROUP(14, EHT_GI_16, BW_320),
+	EHT_GROUP(15, EHT_GI_16, BW_320),
+	EHT_GROUP(16, EHT_GI_16, BW_320),
+
+	EHT_GROUP(1, EHT_GI_32, BW_320),
+	EHT_GROUP(2, EHT_GI_32, BW_320),
+	EHT_GROUP(3, EHT_GI_32, BW_320),
+	EHT_GROUP(4, EHT_GI_32, BW_320),
+	EHT_GROUP(5, EHT_GI_32, BW_320),
+	EHT_GROUP(6, EHT_GI_32, BW_320),
+	EHT_GROUP(7, EHT_GI_32, BW_320),
+	EHT_GROUP(8, EHT_GI_32, BW_320),
+	EHT_GROUP(9, EHT_GI_32, BW_320),
+	EHT_GROUP(10, EHT_GI_32, BW_320),
+	EHT_GROUP(11, EHT_GI_32, BW_320),
+	EHT_GROUP(12, EHT_GI_32, BW_320),
+	EHT_GROUP(13, EHT_GI_32, BW_320),
+	EHT_GROUP(14, EHT_GI_32, BW_320),
+	EHT_GROUP(15, EHT_GI_32, BW_320),
+	EHT_GROUP(16, EHT_GI_32, BW_320),
 };
 
 static u32
@@ -443,11 +771,20 @@ static u32 ieee80211_get_rate_duration(struct ieee80211_hw *hw,
 		idx = status->rate_idx;
 		group = HE_GROUP_IDX(streams, status->he_gi, bw);
 		break;
+	case RX_ENC_EHT:
+		streams = status->nss;
+		idx = status->rate_idx;
+		group = EHT_GROUP_IDX(streams, status->eht.gi, bw);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 		return 0;
 	}
 
+	if (WARN_ON_ONCE((status->encoding != RX_ENC_EHT && streams > 8) ||
+			 (status->encoding == RX_ENC_EHT && streams > 16)))
+		return 0;
+
 	if (WARN_ON_ONCE((status->encoding != RX_ENC_HE && streams > 4) ||
 			 (status->encoding == RX_ENC_HE && streams > 8)))
 		return 0;
@@ -517,7 +854,9 @@ static bool ieee80211_fill_rate_info(struct ieee80211_hw *hw,
 	stat->nss = ri->nss;
 	stat->rate_idx = ri->mcs;
 
-	if (ri->flags & RATE_INFO_FLAGS_HE_MCS)
+	if (ri->flags & RATE_INFO_FLAGS_EHT_MCS)
+		stat->encoding = RX_ENC_EHT;
+	else if (ri->flags & RATE_INFO_FLAGS_HE_MCS)
 		stat->encoding = RX_ENC_HE;
 	else if (ri->flags & RATE_INFO_FLAGS_VHT_MCS)
 		stat->encoding = RX_ENC_VHT;
@@ -529,7 +868,14 @@ static bool ieee80211_fill_rate_info(struct ieee80211_hw *hw,
 	if (ri->flags & RATE_INFO_FLAGS_SHORT_GI)
 		stat->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 
-	stat->he_gi = ri->he_gi;
+	switch (stat->encoding) {
+	case RX_ENC_EHT:
+		stat->eht.gi = ri->eht_gi;
+		break;
+	default:
+		stat->he_gi = ri->he_gi;
+		break;
+	}
 
 	if (stat->encoding != RX_ENC_LEGACY)
 		return true;
-- 
2.45.2


