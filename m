Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B40C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46SauTyit4sWt2JRMPfuc5e5tF4z9rL9nm6H+Pyr3gA=; b=oDPMjhvPAjBfAM
	/X8cSO/SVHyi9xxZUB+7FUxKzvnB5ZuvuM5JfO6TkNhVMNa3Ws/J1HSzO57NWZ8ugAh+LTRL7ISPV
	bJ4A+INrm6j/eu8iNlJ36isIgFv1tVqhdswkTY5Ubqxups08Tdr6ghS5Qxw9IXGk61Dsp0w51lbGG
	y8zLswa1cnMLo+9pHBrJZ++FywmHe9lmOu7TI7e/Y1JXAeet4XYyxLcUOfwct16rAyZUaEEKSW9bK
	9ezwo5o7nBrwX0eJCeHqTAKA07cwPvzhkgIuSV/8xpVSAkKcaQWTwn+c8oFnGd2OcSvCGUI+T74nO
	O6WELxsseF841XC6ikZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ByD-00FCTy-Ba; Tue, 11 Jan 2022 07:53:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ByA-00FCRc-Kd
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 07:53:27 +0000
X-UUID: ae3d1956515641e9a9fe141662f87183-20220111
X-UUID: ae3d1956515641e9a9fe141662f87183-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 759761650; Tue, 11 Jan 2022 00:53:22 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 23:51:17 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 15:51:15 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 11 Jan 2022 15:51:14 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 4/5] mt76: mt7915: add Kconfig entry for MT7986
Date: Tue, 11 Jan 2022 15:51:07 +0800
Message-ID: <d63ae1dfe22f90e0a9fa4ccc01152e82287ea0da.1641886298.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <351271a274dc236f027c58487df6b21c7dbf9fd0.1641886298.git.Bo.Jiao@mediatek.com>
References: <351271a274dc236f027c58487df6b21c7dbf9fd0.1641886298.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_235326_715054_39C2652D 
X-CRM114-Status: GOOD (  10.25  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

This enables building support for the MT7986 SoC built-in WLAN chip.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
index b8b98cb..8db1ddc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
@@ -11,3 +11,14 @@ config MT7915E
 	  OFDMA, spatial reuse and dual carrier modulation.
 
 	  To compile this driver as a module, choose M here.
+
+config MT7986_WMAC
+	bool "MT7986 (SoC) WMAC support"
+	depends on MT7915E
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	select REGMAP
+	default y
+	help
+	  This adds support for the built-in WMAC on MT7986 SoC devices
+	  which has the same feature set as a MT7915, but enables 6E
+	  support.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
