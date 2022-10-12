Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EDBC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 00:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpuaaJKKh9YbLdcKl0fEmI69RN38zDuCkhoX9nQ/iHA=; b=muWEBeeJTVczu79M/7RaC/Fe+Z
	zqQWuqlT9k5dgS5Cm7g7uHq6ECeAONyj994s78qTO5190VkI7bj9wtg2tMLc9u3LunJSyYKXfBeEv
	sjUv+TAHkTvVPnYdYyv2zk5mKa8sqoTDxWoiyMCXbpJeGm3Ygv9anBewDxfZsT9HOkv2vBSQYYR/f
	EghIdXPYuUMWaa8Ug+PNP6w5Fz40MhpIPnr+x9FuNJRAykPnpgbFetrQMniwScDp/hJqYdxEkfGs3
	gl7SwqyDJ39jRVMHeUgsqihy66cgxKZx87pCihpII4n8jQAznJDt03p1i5tn1CilN8BfLHCtHxwl0
	XYgiIZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiQ4b-006O4e-Ep; Wed, 12 Oct 2022 00:58:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiQ4Y-006O3c-T2
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 00:58:12 +0000
X-UUID: aa5a396c05ec41c99a1259bb076d8e8c-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RpuaaJKKh9YbLdcKl0fEmI69RN38zDuCkhoX9nQ/iHA=;
	b=h60Il/K5m5miJR1hM2SUcgbdCLuE6b0TZd6r5x3ju313VWUiEnmPhfmYOXv1r0PrIH7giGyH2ZL42qRprPn7zxNgZR7+FCa6+tyTLKRBkAoiMUQ3TY88NgdaSpHwqm8imrKHMQ4qErc4c83EWtj5onXeGi1qFfAZHlzQLCBOigI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:85941816-5834-428a-9bed-5569b915697f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:7d1d2c01-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aa5a396c05ec41c99a1259bb076d8e8c-20221011
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 158238559; Tue, 11 Oct 2022 17:58:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 12 Oct 2022 08:16:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 12 Oct 2022 08:16:29 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 5/7] wifi: mt76: connac: accept hw scan request at a time
Date: Wed, 12 Oct 2022 08:16:19 +0800
Message-ID: <6431e657539945698715c39f0973c69982cc81da.1665533390.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8d784dba38cfb2183af2e4d9fc822a27ef34dcd2.1665533390.git.objelf@gmail.com>
References: <8d784dba38cfb2183af2e4d9fc822a27ef34dcd2.1665533390.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_175810_965656_47C469F8 
X-CRM114-Status: GOOD (  10.72  )
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

From: Sean Wang <sean.wang@mediatek.com>

The current hw scan cannot accept multiple hw scan requests at a time, we
return the proper error code when the hw scan is still undergoing.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fffdb6976e52..e5c925ec8691 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1537,6 +1537,9 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	struct mt76_connac_hw_scan_req *req;
 	struct sk_buff *skb;
 
+	if (test_bit(MT76_HW_SCANNING, &phy->state))
+		return -EBUSY;
+
 	skb = mt76_mcu_msg_alloc(mdev, NULL, sizeof(*req));
 	if (!skb)
 		return -ENOMEM;
-- 
2.25.1


