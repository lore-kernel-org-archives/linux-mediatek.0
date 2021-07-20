Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C508C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 13:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6636108B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 13:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6636108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLhZiYa+ktNJ3lzktLAPPd/riY/srTrHUUpaqXYYO4o=; b=K/wuSrukjCJbOT
	izTwDv3iuSxMyn3JCjENLFvyxs4+99k+81bX6wxhhuz8r46rZWrkzholL3C/KQFUKEg7L5yWUv6UR
	QlunF2va8z0hZObbd5qC+0RO732WU0MmidqAJM5IkXpBKZQsRPp/rhAwQR23Q3e7i7D+om5LI51oM
	fOTYJ6eZou21YqxB1faf4vD7Qgl7Ho39ZCSEI2XGOOdcFUVLCo8dcCl8L7ZcsXuu8jU/t7VmlUfZt
	nE+205BeBLHGE2XtkbKQbRrgCwhuOA+eQykEblbnIQOd+3zBRXDqJM83d6xFioZJbBZg5eD70SA8H
	EWartYi568kCT2pk7LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5pbv-00CvjR-UN; Tue, 20 Jul 2021 13:16:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5pbq-00CvhE-9r
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 13:16:34 +0000
X-UUID: 8e114fea23744c2190042144c9d25c1c-20210720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hsEH8um0YwfhT66F7mNgovgqiGdpmcAVyToI2RonXAg=; 
 b=fHpul2S9tJixX7c262f+GISDUmXlD3QFNcCOebjhxYGSapTYj2lPHQGcfPokjOK25T2d/jfxsNIgmT8Pky8re+C0HWJorPhPzoKmaNrLoqwO7roTYdHgxEfRpfMYEeT48KLRPxtcGs5kxLge9u4PghV459gvhPEl9nh0kbfvy9w=;
X-UUID: 8e114fea23744c2190042144c9d25c1c-20210720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1762042612; Tue, 20 Jul 2021 06:16:28 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 06:16:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 21:01:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Jul 2021 21:01:20 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: fix bit fields for HT rate idx
Date: Tue, 20 Jul 2021 21:00:14 +0800
Message-ID: <20210720130014.23572-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210720130014.23572-1-shayne.chen@mediatek.com>
References: <20210720130014.23572-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_061630_410972_C923D243 
X-CRM114-Status: GOOD (  10.18  )
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

The bit fields of tx rate idx should be 6 bits, otherwise it might be
incorrect in HT mode.
For VHT/HE rates, only 4 bits are actually used by rate idx, the other
2 bits are used for other functions.

Fixes: c31d94af1843 ("mt76: mt7915: fix tx rate related fields in tx descriptor")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 5e6f3ef..15f4341 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -283,7 +283,8 @@ enum tx_mcu_port_q_idx {
 #define MT_TX_RATE_MODE			GENMASK(9, 6)
 #define MT_TX_RATE_SU_EXT_TONE		BIT(5)
 #define MT_TX_RATE_DCM			BIT(4)
-#define MT_TX_RATE_IDX			GENMASK(3, 0)
+/* VHT/HE only use bits 0-3 */
+#define MT_TX_RATE_IDX			GENMASK(5, 0)
 
 #define MT_TXP_MAX_BUF_NUM		6
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
