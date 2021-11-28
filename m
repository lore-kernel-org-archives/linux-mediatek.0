Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCD8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXLxqT2Xb731GP9BVhLRDyBEQPUrPtYuUDZHQaugt74=; b=GMO4EWLaVIWnSn
	ayMtzzjgdN7WrT6qMd5Ls46V9piSRho+ytEnjLmpOG7OM8u+o7c0/+9ynp9tBFSUkDaiIXGvetIxv
	3XldjpTU0G0WePgvmZl3OPNhVxq//Ga3WfBrqRljVGkMnqO9+bduzpV/+7H+lVg10PqqjfEPieoAw
	Anatp5V5nyxnuvBvVV+sTMbPdQ78Cibkapi7E9iLv1SYVHfiAh1Y43taHD7c9eFkHnXatLndVJvkw
	9+mZ9TJ9E7ad1mpFqEpzwV32CENRpe5EtoPd3anO8MCIpTs7n60hB6f8fCUz75kTaTWiZ1dR8SddQ
	P3y2g7g6iqoPlgIIICCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrEr7-00FGfs-Od; Sun, 28 Nov 2021 07:44:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrEr4-00FGfF-KY
 for linux-mediatek@lists.infradead.org; Sun, 28 Nov 2021 07:44:12 +0000
X-UUID: 92452658af4a447c9b86bb3e06eaa43c-20211128
X-UUID: 92452658af4a447c9b86bb3e06eaa43c-20211128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 485007268; Sun, 28 Nov 2021 00:44:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Nov 2021 23:44:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 15:44:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 28 Nov 2021 15:44:00 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921s: fix bus hang with wrong privilege
Date: Sun, 28 Nov 2021 15:43:59 +0800
Message-ID: <430016f5be77f69b047271081ed891f164bfe65d.1638081217.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_234410_708523_C75D5B16 
X-CRM114-Status: UNSURE (   8.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

Accroding to chip hw flow, mt7921s need to re-acquire privilege
again before normal running. Otherwise, the bus may be stuck in
an abnormal status.

Tested-by: Leon Yen <Leon.Yen@mediatek.com>
Co-developed-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Signed-off-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 6ada1ebe7d68..1227d626e9d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -720,6 +720,17 @@ static int mt7921_load_patch(struct mt7921_dev *dev)
 	if (ret)
 		dev_err(dev->mt76.dev, "Failed to start patch\n");
 
+	if (mt76_is_sdio(&dev->mt76)) {
+		/* activate again */
+		ret = __mt7921_mcu_fw_pmctrl(dev);
+		if (ret)
+			return ret;
+
+		ret = __mt7921_mcu_drv_pmctrl(dev);
+		if (ret)
+			return ret;
+	}
+
 out:
 	sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
 	switch (sem) {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
