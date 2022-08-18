Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC84C32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ClZZ2FTavLDxpTSWVO2qjE/2Gaj22f/bitJ/LVcHoq0=; b=wA3ZyScMTFnFJBAWjevHp/VSoM
	Ys/l0agCdC62iyQBGLGPNlM7Hc4jXKXhm2D2a5SoNAYJEo3OxC9soVs4NFO7sRU9CHxvSH6AC1Nxe
	yk3c7+pjrao64GpwswwYeopfdaH0gZshbFh4f+rRIL8apMvsyA1Qg6aX/I6S/TcOrNmm1rj4V5dFG
	VOxec5PFp7GpX+HbKml/BJ5nuot1P8MncnOtn4STmcngfzl/3hjEYxH59XQfAyQ8GUXo9bZjwJ2oY
	Dwt6DO2rQfBHaSm3doXETctoDYn9Hea0w/J7s5B4DV+guRw6YMxR3k8OUvzsxI6hrrG0moEPSoovQ
	4swI3Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOWTo-00DQ49-NW; Thu, 18 Aug 2022 03:46:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOWTl-00DPqh-Oi
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 03:45:59 +0000
X-UUID: e6c0e6931d9f45c9a226e749068a560b-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ClZZ2FTavLDxpTSWVO2qjE/2Gaj22f/bitJ/LVcHoq0=;
	b=J0w+Ux2iBqqR68lcoiHHEwzVE9HeDc/f58XhbMkHommcHq8b7DiJdKP9AdKPB6SX+uVa2R81XPD1FF+x+mGeyawCNoew/Jy5Lls+rIeIXiRV1+WTu8moPvHpYCV1tE84mHn65IDVHWA2O0BJOGXC6yuFXyME8TG2iJ4q/sXQSy0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:670ac8cf-d6ef-4506-8507-9ed47df8dffe,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:b4a9a4fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e6c0e6931d9f45c9a226e749068a560b-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 94728457; Wed, 17 Aug 2022 20:44:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 10:44:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 18 Aug 2022 10:44:11 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: do not check state before configuring implicit beamform
Date: Thu, 18 Aug 2022 10:44:07 +0800
Message-ID: <20220818024407.4778-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_204557_871429_1DCCDB66 
X-CRM114-Status: GOOD (  10.60  )
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

Do not need to check running state before configuring implicit Tx
beamform. It is okay to configure implicit Tx beamform in run time.
Noted that the existing connected stations will be applied for new
configuration only if they reconnected to the interface.

Fixes: 6377b7f330be ("mt76: mt7915: add implicit Tx beamforming support")

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index fd76db8f5269..6ef3431cad64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -23,9 +23,9 @@ mt7915_implicit_txbf_set(void *data, u64 val)
 {
 	struct mt7915_dev *dev = data;
 
-	if (test_bit(MT76_STATE_RUNNING, &dev->mphy.state))
-		return -EBUSY;
-
+	/* The existing connected stations shall reconnect to apply
+	 * new implicit txbf configuration.
+	 */
 	dev->ibf = !!val;
 
 	return mt7915_mcu_set_txbf(dev, MT_BF_TYPE_UPDATE);
-- 
2.18.0


