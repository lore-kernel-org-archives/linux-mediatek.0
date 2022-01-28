Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 06:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULu0kly/rZXzef+azMtHQ2GP6lwWWvMqmBc7izSKuvM=; b=4e9lHWt3vKE+2N
	7rSI19Sgz7m6tE7dImGdjXL0wNzWwwZiGiKs0nfrYZgBONMQrTc+0MxZeYXo4fUDW6xb1N76JTi8j
	KFIOej+CbmSRWZZa+lblyjFvH1lgN/vvBq4dXXM98ejIDPyeM1KXua5t2WhnwFzhKWMHgPB5D6jBV
	CU/pnBjaMbSWROZlFBjqPjjmyBJzRjlD5SHuFa7WqtBZl6bLrGCFicQI6fCzJVCFlsnyWzU6krdmF
	SA+uhy23sGMRUcyYWYaL/RUDXrvIqdCEVvYb/9zTdBMqyRkThk1c3+lbQuIYES6MrgK2r2jxax8mM
	kTGxeguMQlevxUnCA4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDKoG-000cGv-7I; Fri, 28 Jan 2022 06:32:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDKms-000bbA-2k; Fri, 28 Jan 2022 06:31:11 +0000
X-UUID: c0e9c99941184f01918c4b560f97951b-20220127
X-UUID: c0e9c99941184f01918c4b560f97951b-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1137859822; Thu, 27 Jan 2022 23:31:06 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 22:21:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 14:21:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 Jan 2022 14:21:02 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
CC: <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v3 3/7] dt-bindings: watchdog: Add compatible for Mediatek
 MT8186
Date: Fri, 28 Jan 2022 14:20:46 +0800
Message-ID: <20220128062050.23978-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_223110_177248_33A9B907 
X-CRM114-Status: GOOD (  10.01  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

This commit adds dt-binding documentation of watchdog for Mediatek
MT8186 SoC Platform.

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 0114871f887a..74db01e3658b 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -15,6 +15,7 @@ Required properties:
 	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
 	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
 	"mediatek,mt8183-wdt": for MT8183
+	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
 	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
