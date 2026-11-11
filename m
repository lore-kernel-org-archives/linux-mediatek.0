Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2C606A320
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OFKl8JwH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=h4mcjZP1;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=e9ScvAs9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L5I1B5dReJ4xQ/aiPXnXg5Jumcrt0D9+GNfIpCmigU4=; b=OFKl8JwHEs3wcXUymrNFd95QfB
	fPUf8RBB+mgdrnToyAqjn3y6NTLmsYwIfHvg9my9Q+an5yt1r22+knRlqX3pFTGu9nEjSloYTzJnj
	hOW2eS+2Sh6x23r9RAY8gj/LLktjepc9zXO/8dKrxmutH0/VISkphHmVRQHHI+pFs7KkiqYft/tky
	2O2LPLXkSA1TYzWp3M+07osjc1TlOd/sqdVN97FkMBVsWDi/ZC0BtwDOjAOfZErTElwieceFJszXN
	XvyKVKb//l+Pg+xabiFp3gaGKnZpGqcR0YaZKxeSudwNHqk/DqOHqTTiXyMiAEfe3Y/PN3Ihu95oj
	ISrK5+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy4H-00000005RsC-0Z3q;
	Wed, 11 Nov 2026 02:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy4F-00000005Rs4-3T5I
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Nov 2026 02:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=L5I1B5dReJ4xQ/aiPXnXg5Jumcrt0D9+GNfIpCmigU4=; b=h4mcjZP1Pnxnqhlk6ZxkVWmmPB
	C2F6k8A1q9a1wjJ85Dg/jPqif31FsmUgqbBM8IBISDonpjs0UTn+M0YgDfuSLXQyYXdRl4bAHJ4aF
	GxOB0JykKPnsmFxJpze6l4+rrKvr806FaEmIXjQYpwZRUcX7TynZ2EgHaMChxNUzlUGGLKtW4dj/y
	xmHBQLEnJgmOB1ebQ28gCwiVUyJFwW37wpfEyqzwobykKqaVCd9+wLFSh1XpW4TNG2TFQrpyLIJLK
	ptb2zKPzdjAG9ZlCstK1OMuoQGrSVnDWDUilZpzEKn+L5AvBXjekVnQfjKD5btJ8kLG2jK8x+2Dwm
	HuyGZ6tg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy4C-00000008hHW-00yS
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:28:06 +0000
X-UUID: 7f207322dd7711f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=L5I1B5dReJ4xQ/aiPXnXg5Jumcrt0D9+GNfIpCmigU4=;
	b=e9ScvAs9P+JQLsbEcs3azGmuXw6kn4O/OEq28pCTk2lspXcSu/pO3ULw8jj1yv0n/POP6NR6MvZJm2YbzvVuf67a0QIJwXKX3zNz+nXaYYdG8hDeIcx8UWLDWKqLefBHREuf/3TCLNN0vC3lG2uuo0z+CqUGDiL2kXnIhToHNoc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:97808dda-7289-4065-863e-29866c8ee378,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3ffebb5f-1b4c-4860-998c-597777959174,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7f207322dd7711f1acbe4559397dec65-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1944573690; Tue, 10 Nov 2026 19:27:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:27:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:27:50 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Yung-lun.Chien@mediatek.com>,
	<jb.tsai@mediatek.com>, allen.chien <yung-lun.chien@mediatek.com>
Subject: [PATCH] wifi: mt76: clamp channel power to the s8 range
Date: Wed, 11 Nov 2026 10:27:49 +0800
Message-ID: <20261111022749.784001-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_022804_572314_84C7655E 
X-CRM114-Status: GOOD (  10.60  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "allen.chien" <yung-lun.chien@mediatek.com>

mt76_connac_get_ch_power() computes power as an int from
2 * ch->max_reg_power and then compares it with target_power through
min_t(s8, ...), which truncates the value to 8 bits. An out-of-range
max_reg_power would wrap (e.g. 300 becomes 44) and could lower
target_power wrongly.

Clamp the value into the s8 range when it is calculated. Regulatory
limits are far below that range, so valid input is not affected.

Signed-off-by: allen.chien <yung-lun.chien@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ad53bb60d5cd..f5215fa27faf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2168,7 +2168,8 @@ s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
 
 		if (ch->hw_value == chan->hw_value) {
 			if (!(ch->flags & IEEE80211_CHAN_DISABLED)) {
-				int power = 2 * ch->max_reg_power;
+				int power = clamp_t(int, 2 * ch->max_reg_power,
+						    S8_MIN, S8_MAX);
 
 				if (is_mt7663(dev) && (power > 63 || power < -64))
 					power = 63;
-- 
2.45.2


