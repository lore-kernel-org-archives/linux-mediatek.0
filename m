Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A28C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 07:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A36160231
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 07:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A36160231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHZ6DtuiXiFIMF77Y4o+O+oZjF/ipy6dB5FjZQ1j1LI=; b=uHrlohZS8oJlm2
	E5DuiiMaJaHAM4zEVfUPTBdJn4C8lsiFsd+Pz12qlxmOroGelu0p7GXB0MASAPbZ5bIuAxMswkQKO
	M3nSMlGsJYBvXbtDmpESP/FvqRKZe0casK+LLfqZMKwtdiJ7PTo3CfTxj+NmHlKVyy8biIvwHJw9h
	DIW+bbCrMk4kvsQoLrTfaqqd4SDSSqZNZ2MoNImt8m+HyiN2nok4b66igqrfLQcxS/pE+9ACazA4E
	ErMoCoDDTMkbnly9TUrRpVrapRoUgkeRqcYkY1zHX3rj4gBqfXSMje4vCvxWlfQzTruPHr5RaQYGS
	WbH7F/XtUhLIFw71wFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJWPC-00BrVq-8V; Fri, 27 Aug 2021 07:36:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWP7-00BrUH-MV
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 07:36:01 +0000
X-UUID: e1ba9fc0e04e4feba79984bc67fa9fe4-20210827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JbjrYoeutVtykPJYef5izPu3JgqgqbXrihWvvw+IVhM=; 
 b=r7bMx2cq3bPXERh9kmF4vp9HVLoc79Y//Vdy9P7+D0HRlGwPSZ11INOlmpAXeNtU7lklsxA+rn7LSksk+OhNe1u5WPmvNGh9aq/WVeyjVkNyz0D+4ulOM65jXV5Th0n/u61PWAKHyJ3dMa2RVVKaNUx9QqpqhLlOds0eO53dSK0=;
X-UUID: e1ba9fc0e04e4feba79984bc67fa9fe4-20210827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1081620382; Fri, 27 Aug 2021 00:35:53 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 00:25:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 15:25:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 27 Aug 2021 15:25:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix 'nrates' is uninitialized when used here
Date: Fri, 27 Aug 2021 15:25:38 +0800
Message-ID: <6bacb2514f00d8483d24f60e232718923f16890c.1630048924.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_003557_783650_B664F0DB 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2105:3: warning:
variable 'nrates' is uninitialized when used here [-Wuninitialized]

Fixes: 48469214f50c ("mt76: mt7915: rework .set_bitrate_mask() to support more options")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8141a42b2d0b..4e6d9e20cc00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2092,7 +2092,7 @@ mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 	struct cfg80211_bitrate_mask *mask = &mvif->bitrate_mask;
 	enum nl80211_band band = chandef->chan->band;
 	struct sta_phy phy = {};
-	int ret, nrates;
+	int ret, nrates = 0;
 
 #define __sta_phy_bitrate_mask_check(_mcs, _gi, _he)				\
 	do {									\
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
