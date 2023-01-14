Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF90C46467
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jan 2023 04:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3q8eUrFQGCvox/fCQJWQXBx4k/sv4dLG8kGb0Zo/4+Q=; b=BPfms2aJl5n3AssNF0qZxlikyt
	kG/MZzol4JO2zNAMSLaS4uFfHWLXSUevoO6Z05OCSIuYLxwrc43ZN5u/8+qRf/5MhkFwpMr6n00hR
	BL0sYsAHZirITQH+p6kZRYeqPuvPYkQfU3E41Lq2xkXWG/WUaOkA+w0Rl0wyaO2OOFQxQD20BGH9L
	GI4182OYrs0R1LjQ2LRKXfRmb+dAipDmK1iAeUra2xelvG/59KsqbM670dGnuE/+2UZX4yLQjteNW
	/xqar+7Pe1QwCwn0glaZVa1OoNSK/nbWkqkLCFLmviZebzxi8QxNOixPZs5H/TEiGsr/khNQLmkVA
	l7BeITEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGYcG-005FC2-TW; Sat, 14 Jan 2023 04:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGYcF-005FBh-39
	for linux-mediatek@bombadil.infradead.org; Sat, 14 Jan 2023 04:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3q8eUrFQGCvox/fCQJWQXBx4k/sv4dLG8kGb0Zo/4+Q=; b=K06Uleru+0cpYsSp5hRCC2/fnR
	+TjFBjgCS2UBrdjZbW2rVZQvNPR+Bmmrx1vKvfkNZuLA5Cr/251ZgE5cafwP+3KESF207Y1gbE0RE
	PznNhoP1Aupe19oJ6H90Q3IswYHWhzRkfStGSGIF9gRdNioZd0G+bDaxk9HtWMoGTt/NWrrKofcjY
	s4oAkphunsqhYhvakJbscXmBMMG/zC6r0dz45hhTgcAu3Md3HlAgf29dFTFvOUKCfOae+pwJp5glB
	5YdG/OhR0mhJYD+VG99TYP7VpYzg9RCvnetgWrmiFc95c+Tkh7NfvhjbsIuB0xSoEVZV5PRRFlk1D
	mNwTnWmw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGYby-004b3X-30
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Jan 2023 04:57:51 +0000
X-UUID: e463c50293c711eda08d4d6090ec5a5c-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3q8eUrFQGCvox/fCQJWQXBx4k/sv4dLG8kGb0Zo/4+Q=;
	b=Up0mH1Zwf+c+0EcNO6N2xtbU4tdlYqaaiMRv2V9n6WavO2IV7Q+6C1uOLJpGDPzkqSOumW1DGLc97uC8d64qWSeuZVlh6/ZAWxi17KYAzu9oZzy7Rwj3T5othniMLGzbPssFTphxTzJtl7QeZImraeq/RSWpIantBhfSQ4jM34Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:d85f3297-820b-4e85-90bf-03d199912583,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:d8e0c8f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: e463c50293c711eda08d4d6090ec5a5c-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 79549735; Fri, 13 Jan 2023 21:57:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 14 Jan 2023 12:57:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 14 Jan 2023 12:57:03 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, Eric-SY
 Chang <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7921: reduce polling time in pmctrl
Date: Sat, 14 Jan 2023 12:56:47 +0800
Message-ID: <09ec100ccffd791acba8ad0521e486e309ff4644.1673670759.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <4113f5787a4e15271698219c61367d5105109c92.1673670759.git.deren.wu@mediatek.com>
References: <4113f5787a4e15271698219c61367d5105109c92.1673670759.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_045748_131915_295C3B49 
X-CRM114-Status: GOOD (  11.03  )
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

Due to the polling tick is 10ms, the wake up flow in the status waiting
would cause more 10~20ms than the real HW response time. Reduce
tick-interval from 10ms to 1ms to get better network performance, such
as ping latency, in low power mode.

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
index 86340d3205c5..288caa728afc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
@@ -69,8 +69,8 @@ int __mt7921e_mcu_drv_pmctrl(struct mt7921_dev *dev)
 
 	for (i = 0; i < MT7921_DRV_OWN_RETRY_COUNT; i++) {
 		mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);
-		if (mt76_poll_msec(dev, MT_CONN_ON_LPCTL,
-				   PCIE_LPCR_HOST_OWN_SYNC, 0, 50))
+		if (mt76_poll_msec_tick(dev, MT_CONN_ON_LPCTL,
+					PCIE_LPCR_HOST_OWN_SYNC, 0, 50, 1))
 			break;
 	}
 
@@ -110,8 +110,8 @@ int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev)
 
 	for (i = 0; i < MT7921_DRV_OWN_RETRY_COUNT; i++) {
 		mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_SET_OWN);
-		if (mt76_poll_msec(dev, MT_CONN_ON_LPCTL,
-				   PCIE_LPCR_HOST_OWN_SYNC, 4, 50))
+		if (mt76_poll_msec_tick(dev, MT_CONN_ON_LPCTL,
+					PCIE_LPCR_HOST_OWN_SYNC, 4, 50, 1))
 			break;
 	}
 
-- 
2.18.0


