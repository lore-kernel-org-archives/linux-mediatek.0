Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F511E67A6C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 05:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U0pjx6MBRdmbHia5VISr9zyiGLKGVqVY7cF6epmrGjQ=; b=iWnsFCykVuFMqsaH/Masz4O2Kg
	BVZG8tN8UqIOWQgugAHHLZ7isLVfeUUFtCQRDTtW5aIZhdcLOW6+LEdsr6iB9BaVoUH5POA1vyhUA
	me4nHn0e31wCSRL7Aij9jPVnBN3vtCzWNPUUSvYDQZqa798m5/q+ksDfyav1XpUFWmDajXdZcvV9+
	MwuvkZVlwoWWn2HHcKcbD8os8t+y+NAQl3tBbOyT3Abgo0Biy8F48m8UCdQ2qHrnYC2+gAkx64hkc
	zK1xejDICw9EordabR1EnefCJCUwsEJWWDoagSdWDOjXl+oCT9I1HLP2ynzjv2xdT+B9GjIUiJ3p9
	vtM+otxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIbY-0000000EZH6-4Ax5;
	Tue, 03 Mar 2026 05:47:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIbX-0000000EZGT-0Dmw
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 05:47:36 +0000
X-UUID: 7786fbb016c411f1a16f0188aa809bee-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=U0pjx6MBRdmbHia5VISr9zyiGLKGVqVY7cF6epmrGjQ=;
	b=gr9xYPxMyE8xnKVBBXdOgxItswWjL/ISheIHW9LYLIuNR4hy6Z3utLA9baBrmQZEpUdK3dmq4ed9TY1X1b8CqwRG8lPnnTxUuaaRsRrRZ0S/OwiPl4TYOrRmiostB26CYe3BcU3GKQVYpzx52GtM+VY4jGuuGcPooUbVThzlr4U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:98b95a59-e604-4cd7-93bc-112c642cbc88,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:0b7a2dea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7786fbb016c411f1a16f0188aa809bee-20260302
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 429768927; Mon, 02 Mar 2026 22:47:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 13:47:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 13:47:27 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <Money.Wang@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Subject: [PATCH] wifi: mac80211: fix missing ieee80211_eml_params member initialization
Date: Tue, 3 Mar 2026 13:47:25 +0800
Message-ID: <20260303054725.471548-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_214735_095111_D539564A 
X-CRM114-Status: UNSURE (   8.22  )
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

The missing initialization causes driver to misinterpret the EML control bitmap,
resulting in incorrect link bitmap handling.

Fixes: 0d95280a2d54e ("wifi: mac80211: Add eMLSR/eMLMR action frame parsing support")
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 net/mac80211/eht.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/eht.c b/net/mac80211/eht.c
index 75096b2195d2..078e1e23d8d1 100644
--- a/net/mac80211/eht.c
+++ b/net/mac80211/eht.c
@@ -154,6 +154,7 @@ void ieee80211_rx_eml_op_mode_notif(struct ieee80211_sub_if_data *sdata,
 	u8 *ptr = mgmt->u.action.u.eml_omn.variable;
 	struct ieee80211_eml_params eml_params = {
 		.link_id = status->link_id,
+		.control = control,
 	};
 	struct sta_info *sta;
 	int opt_len = 0;
-- 
2.45.2


