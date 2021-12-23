Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF35C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=In+tkF1VJpIBK9R+WlHkWxDYiH94RKUequvIWQBSfKI=; b=vhWsozz5xnVi8K
	2VcpYh4lEvKvGf5JK2sPS9JztHcRx3dNlQE5FdbM/h3KM0XA29US8BWde5fsrHe5marWAjumArLCl
	JRw8ydYszxRc9j5qk6rX6UjDHk6Wce+fXyGRLwJ78CVzxK8mIZmBVpm7eu/b8CYDzrUD28sfcT2Ml
	jtBQsk3rejofqi0EGEexvAzxpQP3LpXTtX2Rjx/dISs1DUTeUIPoq14U5137sAobG+iYrPNDzt+bw
	a7hG3mHlJBqSZfHiUBWInTcwa5kFfmyAkYTgiwcZukUtjE/uyA0p7VQga7gFcWWMEVCRIxo8VLNU0
	9FXOqRCt0DeQnCkIzefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0IDo-00BxSh-CM; Thu, 23 Dec 2021 07:09:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0IDl-00BxRx-Lt
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 07:09:02 +0000
X-UUID: 61b5729752e04497bcc6dc37f38ff482-20211223
X-UUID: 61b5729752e04497bcc6dc37f38ff482-20211223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 270458204; Thu, 23 Dec 2021 00:08:49 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Dec 2021 22:58:47 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Dec 2021 14:58:46 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Dec 2021 14:58:45 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix warning: variable 'flags' set but not used
Date: Thu, 23 Dec 2021 14:58:43 +0800
Message-ID: <20211223065843.94919-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_230901_771552_9EE2EE9A 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

fix warning: variable 'flags' set but not used

Fixes: 0aa6b534b5e1 ("mt76: mt7915: update rx rate reporting for mt7916")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index ee4535a..f6d6321 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -469,7 +469,7 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
 			__le32 *rxv)
 {
 	u32 v0, v2;
-	u8 flags, stbc, gi, bw, dcm, mode, nss;
+	u8 stbc, gi, bw, dcm, mode, nss;
 	int i, idx;
 	bool cck = false;
 
@@ -505,20 +505,12 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
 		status->encoding = RX_ENC_HT;
 		if (i > 31)
 			return -EINVAL;
-
-		flags = RATE_INFO_FLAGS_MCS;
-		if (gi)
-			flags |= RATE_INFO_FLAGS_SHORT_GI;
 		break;
 	case MT_PHY_TYPE_VHT:
 		status->nss = nss;
 		status->encoding = RX_ENC_VHT;
 		if (i > 9)
 			return -EINVAL;
-
-		flags = RATE_INFO_FLAGS_VHT_MCS;
-		if (gi)
-			flags |= RATE_INFO_FLAGS_SHORT_GI;
 		break;
 	case MT_PHY_TYPE_HE_MU:
 	case MT_PHY_TYPE_HE_SU:
@@ -532,7 +524,6 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
 			status->he_gi = gi;
 
 		status->he_dcm = dcm;
-		flags |= RATE_INFO_FLAGS_HE_MCS;
 		break;
 	default:
 		return -EINVAL;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
