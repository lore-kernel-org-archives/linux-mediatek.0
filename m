Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD56C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 05:41:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7281222597
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 05:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7281222597
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TKs19UI69IfP5dAzNq9gBpz+RypF2iYQZrbAzgPo/k8=; b=bLFXKtl4EpCRNDV5Uax629QS45
	Y3eXAqtKEdx0Ed0ZNSZVWFJIenwhTSTkCStcZ/N85lCUWlKlPf7g57aHcb8xwHoeXwhhnMGbTSzRg
	k4npFzhtoQNvoP32JVm10HBbNDwAq765BLV2dY9RJRboxayburg0B1dEh5J5n9zc5cNPPS+/a3jKJ
	QG3rDV8jI/Zha+Ew143LFp9Wy5BPQjEwsnQcgDjF9jPHmEgobSxPs8a3oHq/YkuDlVGT75r1NqmWn
	Gyq14BPXUyJe5SH9Du02L8GBR8sWaca+yNiocopWHxqIT/xNtlYb80dSuLnrMKyXhP7nPJteM6ZhP
	ZP3rBoMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwf5r-0004ue-18; Tue, 05 Jan 2021 05:41:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwf5p-0004uE-EJ
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 05:41:18 +0000
X-UUID: 88f5c846819b4261a8191f1f4e41be69-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cxwsXZ5wsllQMr60cT0y6Jsz/ArED+T2Ka6z3zHHACY=; 
 b=GnHFTwvksBeWdK0YQuCcS3SjjTyc+bnUEiEhvmKxSwGOaYP03WfsZVTOJTF3Dqi9qkp5SIf1WxfD/Fao/0+VTGN6r13BNWiDbaBiIrR+SyL+oDATOJAIC5/Zl+6mLtpsTGo93rk7Oo1tpPFbDpn2MmxaMTnoE+VgX9aAB0RqLcM=;
X-UUID: 88f5c846819b4261a8191f1f4e41be69-20210104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1515042618; Mon, 04 Jan 2021 21:41:11 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 21:41:09 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 13:41:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 13:41:07 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: mt7915: force ldpc for bw larger than 20MHz in testmode
Date: Tue, 5 Jan 2021 13:41:00 +0800
Message-ID: <20210105054100.5905-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 88B7FD876DFEA7D8934A83C7DA8550940EC305058A3E12EC643712A684710EB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_004117_622206_19CACF42 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

LDPC should be set when bw is larger than 20MHz to make
testmode tx work normally.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index dc1f56fb823d..e8787c336a55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -700,7 +700,7 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
 	if (mode >= MT_PHY_TYPE_HE_SU)
 		val |= FIELD_PREP(MT_TXD6_HELTF, td->tx_ltf);
 
-	if (td->tx_rate_ldpc)
+	if (td->tx_rate_ldpc || bw > 0)
 		val |= MT_TXD6_LDPC;
 
 	txwi[6] |= cpu_to_le32(val);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
