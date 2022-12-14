Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9771DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 02:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGUc/lRqRgjWi2rVlEjt4jIndjYYgAmh7BkUd/moSKY=; b=PlZ0sO2VkGc8Imkv5HzM1IF8tj
	8J4tI8bt+1weePO3nAT1tybRstkXcbbYyjMkq3PYtUXUA20l8PkNfuWx3ZROISh/fEvoCcDD4vlh2
	8X1TObU2tSeikzLfccLVY8KAzHovsuaF7A2vilzIaO6GqS4T8AOVLJcJoS6/wYet3aF+mEIINmXCh
	y2XHKmiNVw+JJJOS3pboaEiuldo7gAaDdfIj4DuIzwU6RdQh8MkH3ybQAd7mtkwfmoD7xqHuIpSLp
	HdYL5dW0CY1dxgeQ9Jz+99ZKgeRX0VS+L/Klz7LSVIRp+WHp0I6/wp/8R+QOqaa2r4g2N63TXa9R0
	hRo/J7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5HVw-00AQXQ-1M; Wed, 14 Dec 2022 02:28:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5HVt-00AQVC-Ef
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 02:28:55 +0000
X-UUID: 6f738aa1a9d145cb94a8e5fb88596667-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QGUc/lRqRgjWi2rVlEjt4jIndjYYgAmh7BkUd/moSKY=;
	b=hjUGWs6/dJbq7V5JKtINoehyuBtitPJrTLkt1LfIDfg9zMHhsEbKe1NQv67LYpxrnHPeaDlbi1+9DCJWnmY98zdkf6Jr0svC+JLNJikiLdtrkWsDv7oVLOeVswtq72rUpJcrMLChZfnPd9sYMEt5Z3i9QlLkWWthFzBye82OsPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:bc528c45-1612-4301-b0d5-92f7b07cd96c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:33e58ad2-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6f738aa1a9d145cb94a8e5fb88596667-20221213
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1805451859; Tue, 13 Dec 2022 19:28:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Dec 2022 10:28:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Dec 2022 10:28:11 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v3 0/4] rework thermal protection
Date: Wed, 14 Dec 2022 10:28:05 +0800
Message-ID: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_182853_648888_AD1F482F 
X-CRM114-Status: UNSURE (   5.85  )
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

Rework thermal protection with the following changes:
1. Send thermal fw commands only after mcu init done.
2. Firmware expects to disable thermal protect before reconfiguring thermal protect.
3. Send fw commands through mt7915_thermal_temp_store() to update firmware
temperature directly.
4. Add error messages for invalid setting.

Howard Hsu (4):
  wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only
    after init_work
  wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling
  wifi: mt76: mt7915: rework mt7915_thermal_temp_store()
  wifi: mt76: mt7915: add error message in
    mt7915_thermal_set_cur_throttle_state()

 .../net/wireless/mediatek/mt76/mt7915/init.c  | 32 +++++++----
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 11 ++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 54 +++++++++++--------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  6 +++
 4 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.18.0


