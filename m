Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F75C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzmxqryW8yHEoTUTCYpFa+mgBgQ/H7EBQFSpqP5Rbiw=; b=JlkVEAymz17bfULRx9ZSYeFtcK
	YFgVCYGE7+yFbPLl5+7aT4gDTTkWW5X72qTY1vQCS/hyTKmbalUVFaPXUMe6lZkQHzFDyC5HS+j50
	SlXGpWv0a6LoqtQVpvgO0aa5O0NwzaOPz1K7f7WjT2FwfSDr/norhQBYOXQVNs1cg4qvUjBAHopCq
	YZiDmwlR+Y2hEmiSOJHmrR7a8HtPnAo9OyQ6/C+fB+LciLI1lHgg8Ze28RCdvp5d5blimFDRa2G6U
	vCfXQtd33KPWhW6df039gjgieArlRdXi1xS2m5XwwFEM74V3an8jQ1nJzZK2hs+ncDBCMmVvEaXVj
	f27vBtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqM6-00Br6a-24;
	Mon, 27 Mar 2023 17:10:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqM4-00Br4p-0A
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 17:10:01 +0000
X-UUID: 328b0708ccc211ed8687db9d93187ff1-20230327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bzmxqryW8yHEoTUTCYpFa+mgBgQ/H7EBQFSpqP5Rbiw=;
	b=ldV8SH4fpPzNLu7WeuvXoPPfeIy1SqRF8HJ+n6+USQyl6cVuuxf3Eb+rObuK9hBZW35sP/Gzhvp8FEk7HZWGAeFpCpk23a8pC1fqN7pO6fh/Or6qBqOM6jd9HoNEo9rhkSm625ny8i0YLgxX4NKmbz0EVeV/+0atYzsz3jh07m0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6a5e799f-5110-451d-ba4f-ff0ac1351a70,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:6a5e799f-5110-451d-ba4f-ff0ac1351a70,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:878412f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230328010957NSHGRL53,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 328b0708ccc211ed8687db9d93187ff1-20230327
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1949906900; Mon, 27 Mar 2023 10:09:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 01:09:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 01:09:11 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/2] wifi: mac80211: fix the size calculation of ieee80211_ie_len_eht_cap()
Date: Tue, 28 Mar 2023 01:07:41 +0800
Message-ID: <06c13635fc03bcff58a647b8e03e9f01a74294bd.1679935259.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_101000_098633_49F59F5B 
X-CRM114-Status: GOOD (  10.74  )
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

Here should return the size of ieee80211_eht_cap_elem_fixed, so fix it.

Fixes: 820acc810fb6 ("mac80211: Add EHT capabilities to association/probe request")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 1a28fe5cb614..210fdca7ff48 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -4903,7 +4903,7 @@ u8 ieee80211_ie_len_eht_cap(struct ieee80211_sub_if_data *sdata, u8 iftype)
 				       &eht_cap->eht_cap_elem,
 				       is_ap);
 	return 2 + 1 +
-	       sizeof(he_cap->he_cap_elem) + n +
+	       sizeof(eht_cap->eht_cap_elem) + n +
 	       ieee80211_eht_ppe_size(eht_cap->eht_ppe_thres[0],
 				      eht_cap->eht_cap_elem.phy_cap_info);
 	return 0;
-- 
2.18.0


