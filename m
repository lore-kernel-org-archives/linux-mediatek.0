Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24283C25B6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKS4mAxzCwofgV5lrkCv+67Ih4jlWyJk35U0DrEJjmE=; b=PdHUkDMQdwxuJr6Vhe1u5WoCXX
	Oe1SGVhnY6lhdcZgo0HV1NV5ADn7bk0WNH7HmeLkdOthEyNQsdth0PgpTUfE00Ctkm0nmmkSbR4Ar
	2KjTBL+VteiLDuLUTAkOSgYXXTpcW4gDlEs0ent3XolTAewYxJVFx0rFIm+l1zP+pTfA35PXHYwVl
	9tZ1emX83PXCTcVPVo1miIpvE7Chbk7fCwGVWMUJjzCsJi+/KZ9Y4dD3Hvvn2NfOT13UmKquGWz3/
	GENfCuadB8sl5bggM8w5799B7vE/wbrSempgcm8gzhIrjEv34xeWQ2CFm9vvzVPlNcL4/DyF4CyCE
	5aE2Eh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvnYE-00DKlP-2y;
	Wed, 25 Oct 2023 23:44:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvnYC-00DKl4-0I
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 23:44:37 +0000
X-UUID: 6ebeb54c739011ee86758d4a7c00f3a0-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qKS4mAxzCwofgV5lrkCv+67Ih4jlWyJk35U0DrEJjmE=;
	b=ATb1dGHLp8bZGIilV8/wOF5hhgypsrQ3FRkXE5HjEPE+BhKkWHs1k/rqMe6FN8ccwbDLUOESvyY4a+QLb3WXoMu4wEniAeTtUNPsdpWkiDeyu0zj+Ui/0Q/kA/XmN+LHFA1g5Qrw90xnqXQDwqsoPGMkQQMtxwtI9N/VHtIj1qU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:dcc280a2-0dbf-4091-80e3-cb67ee9ce9f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:9582c6fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6ebeb54c739011ee86758d4a7c00f3a0-20231025
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 358656154; Wed, 25 Oct 2023 16:44:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Oct 2023 07:34:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Oct 2023 07:34:23 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7915: fix missing CH144 support for mt7915 pre-calibration
Date: Thu, 26 Oct 2023 07:34:21 +0800
Message-ID: <30c279a4c3d937a592f95951ec22c8591b24e275.1698274193.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <f21b261373fc221b8370264c44ee751fa85cf41c.1698274193.git.ryder.lee@mediatek.com>
References: <f21b261373fc221b8370264c44ee751fa85cf41c.1698274193.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.565200-8.000000
X-TMASE-MatchedRID: 8d+rTuw6A/ZYXTxImR5ZvAPZZctd3P4B7f6JAS2hKPg3nZaS9VtZrqPF
	jJEFr+olwXCBO/GKkVr3FLeZXNZS4EZLVcXaUbdiuR7xzqovR/1Di9mwshcj9kaBOIZIqgk0Shp
	LTU8kT8ieqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.565200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 35BD9C14BD588542D622D01B6322A5A8C56C379A6B195B0D85543D01262456772000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_164436_160084_7016188F 
X-CRM114-Status: UNSURE (   9.13  )
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

Sync from MTK SDK. The current mt7915 pre-calibration data lacks CH144@BW20
so we fallback to apply adjacent channel's data as an alternative.

Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index da3ee9f91704..01f208fec73e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2990,6 +2990,8 @@ static int mt7915_dpd_freq_idx(struct mt7915_dev *dev, u16 freq, u8 bw)
 	if (is_mt7915(&dev->mt76)) {
 		freq_list = freq_list_v1;
 		n_freqs = ARRAY_SIZE(freq_list_v1);
+		/* NOTE: apply adjacent channel data for the missing ch144 */
+		freq = (freq == 5720) ? 5700: freq;
 	} else {
 		freq_list = freq_list_v2;
 		n_freqs = ARRAY_SIZE(freq_list_v2);
-- 
2.39.0


