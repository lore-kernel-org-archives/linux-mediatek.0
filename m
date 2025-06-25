Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689A6C7115C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OERsbOHSRXh3uYJSujNCCNFA7i+zxjD3fhY8uenqd7k=; b=W5Ikv0yauNSCrwyhOPor79KzG+
	r20Af+QCRUeA2lebtlKcyhBpuKyFSnaZQS0ZpXMaUBYr8P6dX4Ei9LRpfIB9Z038tdpiOQPOU0Lek
	R/drbQUI0e1jo5cKEye2KHyp+85A3DECLc4E9UqPTqMKZnX4h/WHnuS9b16lKjXi0q+GGgkVjRqmw
	6RyETmj/ZgK8xHJfrJU59GKCRUbzMHAnfbybDit2vyO45nsSi/0YxU3dMBr8lH1YS/FOu0liRWmsD
	zhR/X38paBe9yze9gUkQ9Q+dC50tMIBnuXJyzlII97/pNTvqXzIG2gmfVA4c8eDaoBzDtGIGG+lZ7
	qxar3MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULVX-00000007xQU-2Fhn;
	Wed, 25 Jun 2025 08:29:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKhT-00000007qDR-3LFX
	for linux-mediatek@bombadil.infradead.org;
	Wed, 25 Jun 2025 07:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OERsbOHSRXh3uYJSujNCCNFA7i+zxjD3fhY8uenqd7k=; b=CYhp+dQFUbcnNTtzU2Mx6TkBfi
	jJKPRTjCrLf6o5O0d3te8ay706LuILCGHniNtbEir5ZfNQWKw4vw/IPlkgZo4ege3ddu5RmT4wxZ8
	FSgkgJ0ggfJnYsEirMQUCSXIgwbY5gZtMiaeaeFSzcRfteRk6Uy7xW13SHPATtRls4q34mqWe/aRI
	3drP3IBQELS/p8dwMUCSVx/Q1+pAaKg+nWXPcbRQQQ2XHTLZOOof1bzjTjvSXuX/cyM1hqUoJ+iJ/
	/6lhgMgg38hmu4ubvevcw8wRjgadgsnrIE0hwbilmfz+z5VbnnJFRBBvvrkS8Ov+FoddX57h7tEIf
	dOKx5u4g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKhP-00000005eM5-47NQ
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jun 2025 07:37:42 +0000
X-UUID: 3d5e1fce519711f09f706fa2197c6ceb-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OERsbOHSRXh3uYJSujNCCNFA7i+zxjD3fhY8uenqd7k=;
	b=Egx2ojAWSIp2lbty0LC50vOzp2l3oKqj3X+bR/5+8HaukdOyJ0N1Sl2F4aoNU+RAkiPNJCQv9KD6JXxU59Ata7tsdSkfQRApl4D3Lib/4jwG3oTHqMOt+GljXwwws/2le79s9YrRHO1fuQB9G6b9qUkXJBZcybWPICtvPM9Jjqk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e93261d2-a561-4d2b-b62e-b580d6616119,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-55
X-CID-META: VersionHash:9eb4ff7,CLOUDID:7beb8b73-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3d5e1fce519711f09f706fa2197c6ceb-20250625
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1504195625; Wed, 25 Jun 2025 00:37:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 15:37:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 15:37:22 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>,
	kernel test robot <lkp@intel.com>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt792x: Limit the concurrent STA and SoftAP to operate on the same channel
Date: Wed, 25 Jun 2025 15:37:20 +0800
Message-ID: <20250625073720.1385210-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_083740_647199_4975203E 
X-CRM114-Status: GOOD (  13.81  )
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

From: Leon Yen <leon.yen@mediatek.com>

Due to the lack of NoA(Notice of Absence) mechanism in SoftAP mode, it is
inappropriate to allow concurrent SoftAP and STA to operate on the
different channels.

This patch restricts the concurrent SoftAP and STA to be setup on the same
channel only.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506250512.Q0I4znsF-lkp@intel.com/
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2:
  - add the "mt792x" tag to title
  - fix the build error for "initializer element is not a complie-time constant" issue
---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 2224925955d0..bdb4fefc6d36 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -28,7 +28,7 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	},
 };
 
-static const struct ieee80211_iface_limit if_limits_chanctx[] = {
+static const struct ieee80211_iface_limit if_limits_chanctx_mcc[] = {
 	{
 		.max = 2,
 		.types = BIT(NL80211_IFTYPE_STATION) |
@@ -36,8 +36,23 @@ static const struct ieee80211_iface_limit if_limits_chanctx[] = {
 	},
 	{
 		.max = 1,
-		.types = BIT(NL80211_IFTYPE_AP) |
-			 BIT(NL80211_IFTYPE_P2P_GO)
+		.types = BIT(NL80211_IFTYPE_P2P_GO)
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_P2P_DEVICE)
+	}
+};
+
+static const struct ieee80211_iface_limit if_limits_chanctx_scc[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION) |
+			 BIT(NL80211_IFTYPE_P2P_CLIENT)
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_AP)
 	},
 	{
 		.max = 1,
@@ -47,11 +62,18 @@ static const struct ieee80211_iface_limit if_limits_chanctx[] = {
 
 static const struct ieee80211_iface_combination if_comb_chanctx[] = {
 	{
-		.limits = if_limits_chanctx,
-		.n_limits = ARRAY_SIZE(if_limits_chanctx),
+		.limits = if_limits_chanctx_mcc,
+		.n_limits = ARRAY_SIZE(if_limits_chanctx_mcc),
 		.max_interfaces = 3,
 		.num_different_channels = 2,
 		.beacon_int_infra_match = false,
+	},
+	{
+		.limits = if_limits_chanctx_scc,
+		.n_limits = ARRAY_SIZE(if_limits_chanctx_scc),
+		.max_interfaces = 3,
+		.num_different_channels = 1,
+		.beacon_int_infra_match = false,
 	}
 };
 
-- 
2.34.1


