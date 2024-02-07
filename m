Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07EFC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 01:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDouN0pdbhwQRjTzuJpHQCJy8aUyeV2qZj7bI+J4528=; b=PskSIQQrTILIJTy6DOdV/WLJn2
	dt6QIDFr/Zcswl4DrI0O+9UX6lIQsWeokiwBrhw/w03LqdGowbeUu9t3URVSfIKMH2fT2Vos4t7cz
	MJRwfoZwItNmVJH3KIqfxiN9tPax9LLVfV3Fg3IULLRv/Ek5HfktWq7mAaPW3L64hfVh1AxIryPlt
	W59COAH9hc41fkUgwFqfCBafwunCNrnGxWmB900Vlexy4NJtT+N5vKcIzHGeEi63v1q2UN12h87QR
	PSdICCGnsR69JnsavPTgcnmpcYR8/QDRqV14sgkRjLLMtFBduznf6rqL5kiGGVWrtA519dD24vU3A
	XYVa/Y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXWvW-00000009NY7-405W;
	Wed, 07 Feb 2024 01:40:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXWvU-00000009NWN-1qIe
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 01:40:37 +0000
X-UUID: e041a68cc55911ee9a263b4415211400-20240206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uDouN0pdbhwQRjTzuJpHQCJy8aUyeV2qZj7bI+J4528=;
	b=fgfwDmrpaqMez5Z9BkpGXFNZYLQDof9jjel6dunDkNgfvWyf1h10PN7uhIh5bGy55a8/A/0gPIy6qIkQXx88xdEUkqTX1xozjtd/YiEdgI1DBCesiylbyVe0Rq7UXGQ8fU3R9L0/ocEOBLR47SDFtJEgMMcLyNnpukVS5hMWwzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9816541b-5c23-44be-a15a-db572d3a187c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:024ab383-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e041a68cc55911ee9a263b4415211400-20240206
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 294686017; Tue, 06 Feb 2024 18:40:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Feb 2024 09:39:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Feb 2024 09:39:54 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Michael Lo <michael.lo@mediatek.com>,
	Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix suspend issue on MediaTek COB platform
Date: Wed, 7 Feb 2024 09:39:45 +0800
Message-ID: <20240207013945.23558-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.150300-8.000000
X-TMASE-MatchedRID: yZoAMijhO4c9S3IiQd+eNRNEPNwNrw/rieyBFTE1+ceIoW+1yT7Gw6UJ
	mwqvEWihdAyEKWUq4v4C3sKcss0odmK6SHtwuj6rQpxiLlDD9FWusS9CiBzL8X5h6y4KCSJcZ10
	wKXUWXnJirZ/FbBb+bqCF2qOQ8zIWVJTV35UngiMZXJLztZviXKxwr8rYOW+O0zabL4+/4csJSK
	yYs8AD/ax4GQqkd00FumMCMwce1mUfE8yM4pjsDwtuKBGekqUpOlxBO2IcOBajycPov0YYz9FAH
	qz04bFbXGumjTnZ3ElZZFJWUoXZhel/jnRe4WMsiMi52pBTvfk12WiR9TdDZ5UDrgLdu1TA4gKV
	wGe6cHjBkGBTIlURuXoXDz8+lMxFpW+aIDJ4DaRzkxJ+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.150300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B575A5AC19A7385059901DA6BF1BFA2F5ED3C6E1A2C7CF06A57263B916AC3F032000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_174036_510732_3F3FE492 
X-CRM114-Status: GOOD (  10.57  )
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

From: Michael Lo <michael.lo@mediatek.com>

MediaTek's controller driver on COB platform (e.g. MT8188) is
capable of controlling power supplies and reset pin of a component
(e.g. a WIFI chip) in power-on and power-off process.

Due to this optional feature, mt76 need to inform controller
that mt76 need to keep power during suspend. Otherwise WIFI will be
powered off when system enters suspend process.

The "wakeup-source" property was used for the device that need
this to go into suspend mode so that mt76 suspend handler doesn't
fail and the system is able to enter into a suspend state.

An example:
wifi: mt7921@0 {
	wifi0{
		reg = <0x0000 0 0 0 0>;
		wakeup-source;
	};
};

Signed-off-by: Michael Lo <michael.lo@mediatek.com>
Signed-off-by: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index fabd24726f3e..e673a153d3cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 
 #include "mt7921.h"
 #include "../mt76_connac2_mac.h"
@@ -369,6 +370,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_irq;
 
+	if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
+		device_init_wakeup(dev->mt76.dev, true);
+
 	return 0;
 
 err_free_irq:
@@ -386,6 +390,9 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 
+	if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
+		device_init_wakeup(dev->mt76.dev, false);
+
 	mt7921e_unregister_device(dev);
 	set_bit(MT76_REMOVED, &mdev->phy.state);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
-- 
2.18.0


