Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C6CA1010
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcP4m8Fa4tEnKK0jwOE7jEMLI/2pU3xNxf7xy+UlxFY=; b=RsxhqaDjkQZgfCk9PSShCyqNeb
	R5fMyJz24Ab2SVRJXDM6kjnT8ISnsP2+92tCT+LOeSftZUyK3XPU5rlLIqWPkCKXE/N0VxmauQTco
	w1hrIUj11QBubLPPMKWEAqm2c0qt8YNZ/CevdcPD7N/TjHZmDUu/Y5gY4ISE5rQRTJMTvZYBt2ktd
	G+Ufrw1LddSOVD7nL+8r4Odeff5st+TfIG2WC3rF/siXkVqn794K8VRcvXb9UJC//78eMUsCI5rhM
	nfI5DatGZ5vkJTqgwtGRl0M7z5CvyHQA1n82Wpy43UEsd70jV8MBpl1Av1S27w23TQOPXf6p3lIDA
	OOCdORRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jo-00000008Zt8-2guI;
	Thu, 04 Sep 2025 03:07:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jn-00000008ZsB-2EEU
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 Sep 2025 03:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kcP4m8Fa4tEnKK0jwOE7jEMLI/2pU3xNxf7xy+UlxFY=; b=oHuG6W+hRHjunrZYQLQRqfFW9H
	8djWyst19UuvMo1KvzA6bzfbpLkvRt+SZwEJlj3TG51RlESroMmYekmxxUBMglup75v4xW+fzp0cm
	fsBRXpUrCiyQVXi+fgKNPRnfXx8nfM/VTZYYzannYIy4n37lY7oy9GVqRb16m+trlO2dsnf20q9Jp
	W+jDIsTsvviwQwGO047SjbhSItJcAiPlOrxLkExzBdrqmAlNXhvudeb9kfvWMQN22WR5gafsw6UMy
	KFlcFO0f9vjzBjRgqhjI7HyFKKN7HlZzn6RtZEgLSZdQeKksMA4WqXUgmyc3D6CkpV0YyS2x3Uhlf
	v/fdZ3ng==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Ji-00000004Gxh-3Zqb
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 03:07:22 +0000
X-UUID: 3e438258893c11f09eb0dd999d3936bf-20250903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kcP4m8Fa4tEnKK0jwOE7jEMLI/2pU3xNxf7xy+UlxFY=;
	b=ieLtGw+5vg7tke8ZttG312jH1WQkOWsy/9NmtD6WtYtaMFkhlORsPY5T81+bL1vBCa2M7HWsaw1zHrKRkzymDRofy9qFpN+g9s+fSeK84PdjkkOZrEp3IGaMtOB/vwxW+5FoJdYOvjtEx5nxXrJrNN5SCJQG4VFiwFGtDGdls64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ecd0afdf-7af2-445e-a49b-8c6a811b0fc9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:0a286a84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3e438258893c11f09eb0dd999d3936bf-20250903
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1890265535; Wed, 03 Sep 2025 20:07:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 4 Sep 2025 11:07:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 4 Sep 2025 11:07:04 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 4/4] wifi: mt76: connac: synchronize token_count access in mt76_connac_skip_fw_pmctrl
Date: Thu, 4 Sep 2025 11:06:49 +0800
Message-ID: <20250904030649.655436-5-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
References: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040720_188398_D1C43FD3 
X-CRM114-Status: GOOD (  10.26  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Read dev->token_count under token_lock to prevent race conditions with
concurrent token updates, ensuring accurate power management decisions.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 93e5d36206e8..756719ce0e48 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -383,9 +383,14 @@ static inline bool
 mt76_connac_skip_fw_pmctrl(struct mt76_phy *phy, struct mt76_connac_pm *pm)
 {
 	struct mt76_dev *dev = phy->dev;
+	u16 token_count = 0;
 	bool ret;
 
-	if (dev->token_count)
+	spin_lock_bh(&dev->token_lock);
+	token_count = dev->token_count;
+	spin_unlock_bh(&dev->token_lock);
+
+	if (token_count)
 		return true;
 
 	spin_lock_bh(&pm->wake.lock);
-- 
2.34.1


