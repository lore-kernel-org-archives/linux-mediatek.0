Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16602ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfXQ2d35MrLc1v4GYZPeQpiq5HAopCVjNu6MieQbaYE=; b=yC/N+1a5FiRAglcIhzVmXCbo4z
	DVN9X8hH5GWZkpSdXhtD3LIUQOOtUG7bcqmyM7RbMu5ea72fSjfj6ZyAsjH8ILOO2F0cEdqVc+Uzl
	13lKx/S1D24rMh5yfqvan7hwTgpoV5HzABj/mVEOSjv4tHzvK2bK+imZltgSRnY9+1mC5NrNrQ8ib
	zOeEuG+F49miVNcz19z4vT0Cl1uaercJk3HH9iioA9vSBOvd1lHOIKUcXAfMzFEJzM7rZJZg4BExB
	jqLPyaLAGZyBEZwxvXH0WD1ibxwu8xltPXSUTSPJ0yjnjRGxMafQBBQciEHlt4/jeipk2V7Jl4cGJ
	1d0qWXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYl0B-0051w1-7A; Thu, 15 Sep 2022 09:17:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkxy-004yCO-Dh
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 09:15:27 +0000
X-UUID: 3be5086a8d3a4296ae946e618c7eff8d-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tfXQ2d35MrLc1v4GYZPeQpiq5HAopCVjNu6MieQbaYE=;
	b=EpPcpgjJqZmgfawJIXACcSrihnhaKvJukOPVyTL3Q+ta49NQ/VlYjUj1il7qX2LEmRGa3MGMpujNSzYVy0DmA+21dt+bTW4qG0r6CihH7qeSF0x6DVfO2iWwzJ5mSGiA+8OnuCLGxANMjitw5ikIAgXJXbZ7dSvDeuDClKr/Mi8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:62636ef2-d30c-4d29-a693-8c12b8e8ed35,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:319fc15d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3be5086a8d3a4296ae946e618c7eff8d-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1049661321; Thu, 15 Sep 2022 02:10:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 16:19:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 16:19:30 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] wifi: mac80211: fix decapsulation offload flag for WDS interface
Date: Thu, 15 Sep 2022 16:19:17 +0800
Message-ID: <20220915081917.3409-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_021526_509008_4D5FD490 
X-CRM114-Status: UNSURE (   8.69  )
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

The WDS interface whose iftype is NL80211_IFTYPE_AP_VLAN can not be
enabled rx decap offload because its offload_flags is not configured.
The offload_flags of wds interface shall be configured by checking
hardware information.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 net/mac80211/iface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 41531478437c..ea35a7cabd1a 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -865,6 +865,7 @@ static bool ieee80211_iftype_supports_hdr_offload(enum nl80211_iftype iftype)
 	/* P2P GO and client are mapped to AP/STATION types */
 	case NL80211_IFTYPE_AP:
 	case NL80211_IFTYPE_STATION:
+	case NL80211_IFTYPE_AP_VLAN:
 		return true;
 	default:
 		return false;
@@ -2120,6 +2121,7 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 
 	/* setup type-dependent data */
 	ieee80211_setup_sdata(sdata, type);
+	ieee80211_set_sdata_offload_flags(sdata);
 
 	if (ndev) {
 		ndev->ieee80211_ptr->use_4addr = params->use_4addr;
-- 
2.18.0


