Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D84C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dkt3HR/PhYl/HcfNR96k5NZTqAIpZGIMAMABCP3i6Es=; b=ttjeCns8EJmkqUYoy/+pf1Hfk3
	qPKXmRLTx+qSrzN6rH9Gursq7GPmahwLOJ2DNi7RTrrcZ59TSl12pPFolInvtm7rlxX35piNDs8WG
	uFfTUQionTYIl328a91BGYncxfaZBoLhWljfWLUiJbaUgDJpO1qEUY/ecE0SypPykcrl8r6mYC5Pe
	E2FOTSVutdnLSgq9Kf6TGKMFkE8rNOb19aalFa34w/Qc0h/or7VF6+fwiRnRdUSj1ekYzq6kpH3Rl
	NF1ZcfvgiiGSWEVKOyyAiayUWh6aEN/a7k0W+WbGfqkN1gq/1tsKmXsykRb2Z9bsqTD4PntcN9cm6
	bTFE91pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYWL-00FUST-Nb; Thu, 05 Jan 2023 22:15:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVD1-00Dm3q-MH
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Dkt3HR/PhYl/HcfNR96k5NZTqAIpZGIMAMABCP3i6Es=; b=KtRd8/3UvBCGFu8+hz2IMnBeyz
	PUQ0z7cOM6bOPBSAcl3i8CH4Zi77suI+0MsBlaQc5oiwkJ1zs2EmUAoYhDIqLPmckfJBbcWduXwEn
	0noAzPGY1tRmQIoc96mHud2MjPfQAigfaHrYUl1f2L1SLD5HMQ9AVlC2wY4ymDep3WwGCsYScxKiw
	HfhP/AR3RJxR4XJQU8C2BH9oCuMCZEWWDpEjdgr6g2BDJJWcv6hYUGlDiOSs3USyuQ1Ltkuoj1d5X
	Xhe8LJ/oDXTvel6XFKSskiVoWfWzb684XWjrBLdvNRl4sTJIJnSDawADd8JVCmKxhUW1ZmRjBgrTT
	tQIolvow==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDOxu-001Idi-32
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 12:03:25 +0000
X-UUID: c2a8086f3f9640c0bfd42d33de08e719-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Dkt3HR/PhYl/HcfNR96k5NZTqAIpZGIMAMABCP3i6Es=;
	b=bSc2oxu9XDaysb7bN7jL+EY0Tr6N8sZdGJ8nztjhoemu/4n31sZ7hhk5zUcnHzHmQDzIzkwtftFc/OYpyb0YucNYrlqwkXkPzuCX71zqoF/SuzjzNpMepz2r+4y5cAdl2tHmy/A9tENImrpRxqIZAnOiUlwA2zswZE82Pq+jODk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:1b5b7e4d-6dec-4e3f-9e5b-0463a4fdc587,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:39f4e8f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c2a8086f3f9640c0bfd42d33de08e719-20230105
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1885029220; Thu, 05 Jan 2023 04:47:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 19:47:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 19:47:13 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7915: set sku initial value to zero
Date: Thu, 5 Jan 2023 19:47:10 +0800
Message-ID: <20230105114711.31430-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_120323_363346_EC0A3023 
X-CRM114-Status: UNSURE (   8.71  )
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

Set sku initial value before mcu starts to prevent mcu from getting an
invalid value.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 686c9bbd5929..2ac0a0f2859c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -883,6 +883,8 @@ static int mt7986_wmac_wm_enable(struct mt7915_dev *dev, bool enable)
 {
 	u32 cur;
 
+	mt76_wr(dev, MT_CONNINFRA_SKU_DEC_ADDR, 0);
+
 	mt76_rmw_field(dev, MT7986_TOP_WM_RESET,
 		       MT7986_TOP_WM_RESET_MASK, enable);
 	if (!enable)
-- 
2.18.0


