Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC912C6379F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VPkZSELNWhl1DucR6ZYjynm+OOU6VxGRQyu4+mAsdxg=; b=FsZimT3LTmz+SECryluuV8vewd
	nz9UX1ViobVXXXP9+BVniubXXoSlVg1oSPZiyJXwM2gezibvAU+dfC3RdlIVfvAwia5wt1JF2JR/D
	Qd0ZP8ilWP6XgCEiX35fI8JVjGtuSvN8zjqzcxCjK5TPNGaifYH1P7MXMkJnqdLcX9tz2tcEFaO35
	REkE3mndG/qThfdDJx0mAgfV6IyFe3odZ4URAXT9pULMSS6p7W/u+bf94fZofGA0NWu1+SazPF/mh
	RWGJOzozABIj22JcMQel3LogJgO66LdZ0oAlo6xBi5a8731AkhIIoDz+y49IwSOl5ZFt7vthqmpds
	HRcIH+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4w5-001Etm-9E; Thu, 09 Feb 2023 11:17:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4va-001EZL-7O
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 11:17:27 +0000
X-UUID: 4dd8cdb8a86b11eda08d4d6090ec5a5c-20230209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VPkZSELNWhl1DucR6ZYjynm+OOU6VxGRQyu4+mAsdxg=;
	b=MupSM6y9LUQNM7LiCaMpWQVfgoEMpw9DQF28qj0LUydk+sNTjy0TbMS/mNXPFKMLm1QQPCBC1Bp0z0Glm9mBCzIY3pZeNoHNNzPgxua47CbUrk1S4S1ixFWVahkHi8wWqLBalYRyNDOp8wlJtkjsY21vxoLkpLItjtFgliZ5kUQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:631f972b-04da-434e-9428-bd527fba7740,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:a200f6f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 4dd8cdb8a86b11eda08d4d6090ec5a5c-20230209
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1368057971; Thu, 09 Feb 2023 04:17:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Feb 2023 19:07:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 9 Feb 2023 19:07:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mac80211: make rate u32 in sta_set_rate_info_rx()
Date: Thu, 9 Feb 2023 19:06:59 +0800
Message-ID: <20230209110659.25447-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_031722_342778_B675AD6B 
X-CRM114-Status: GOOD (  11.00  )
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

The value of last_rate in ieee80211_sta_rx_stats is degraded from u32 to
u16 after being assigned to rate variable, which causes information loss
in STA_STATS_FIELD_TYPE and later bitfields.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 net/mac80211/sta_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 27c737fe7fb8..bd532d3f925d 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -2418,7 +2418,7 @@ static void sta_stats_decode_rate(struct ieee80211_local *local, u32 rate,
 
 static int sta_set_rate_info_rx(struct sta_info *sta, struct rate_info *rinfo)
 {
-	u16 rate = READ_ONCE(sta_get_last_rx_stats(sta)->last_rate);
+	u32 rate = READ_ONCE(sta_get_last_rx_stats(sta)->last_rate);
 
 	if (rate == STA_STATS_RATE_INVALID)
 		return -EINVAL;
-- 
2.25.1


