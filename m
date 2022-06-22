Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1271C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NKFJdhMRCL8JdwSNDs5aCtNeROGI5oqeNDvse4Eapr0=; b=cbCxMhk82UyGucp3Ir3uxKszZp
	TmBqoxIlbIGhRrTR+vuAfDSjrfNzGS9mUcxanJhOq7E0GhwFHccvXj6wmPIhU72MyPZ91RTnAsBgL
	7BFWLJW8VHQNOMTCcK1Gl0PZ27WZTF/y1fBBb4twkXMkZidSF6iJiInFj3Pk51sYJtsezXxM1WhJO
	APqm1hHgCfizs2kEOBcRtx5viS97dp+o50ogyx2cTk7xVTkAL3MDIwxBZbRpE1tLueIQqYiUjcDGU
	yjtX/c7hT0GxAiCDyYgFt98QzS1dd7zx3lXYahoGqoxNC1TKpFBqeW4GDJxjkSJwCFePPwJjDvSgH
	XU5wuYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3orC-007wVr-83; Wed, 22 Jun 2022 01:08:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3or9-007wUY-2H
	for linux-mediatek@lists.infradead.org; Wed, 22 Jun 2022 01:08:33 +0000
X-UUID: 866dcc9b16f84ffe98810d8a1312a7eb-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:aa7167c4-d70b-46b4-a153-127d845a2a2e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:c70427ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 866dcc9b16f84ffe98810d8a1312a7eb-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 251990802; Tue, 21 Jun 2022 18:08:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:08:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 09:08:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 22 Jun 2022 09:08:22 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Johannes Berg <johannes.berg@intel.com>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.Lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Peter
 Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] mac80211: add s1g action frame in _ieee80211_is_robust_mgmt_frame
Date: Wed, 22 Jun 2022 09:08:20 +0800
Message-ID: <20220622010820.17522-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_180831_147944_06B801C1 
X-CRM114-Status: UNSURE (   8.93  )
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

S1g action frame with code 22 is not protected so update the robust
action frame list.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 include/linux/ieee80211.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 5c65ae6b8..4c25207b3 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -4094,6 +4094,7 @@ static inline bool _ieee80211_is_robust_mgmt_frame(struct ieee80211_hdr *hdr)
 			*category != WLAN_CATEGORY_SELF_PROTECTED &&
 			*category != WLAN_CATEGORY_UNPROT_DMG &&
 			*category != WLAN_CATEGORY_VHT &&
+			*category != WLAN_CATEGORY_S1G &&
 			*category != WLAN_CATEGORY_VENDOR_SPECIFIC;
 	}
 
-- 
2.18.0


