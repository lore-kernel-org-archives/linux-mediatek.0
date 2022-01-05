Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C298C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 02:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkGUBdo0eO71ewzecGKmzb6hUc2I/Ya+g00KMziT1nY=; b=PXlMG+EW0lakVS
	whRA/60UZkJzT3/lMq2cV7WYrZsoFkCUEqcb44HYSkzATuniYyM6Twpzu6ZdYNyLAw00aLO4nbxAR
	7MuCIGTuhWiSmYy9IOFSryjsqD5olC7M0yONotKjvWOyO3joPOOTCNCPeVfEDlb62iZaLLMZTJlAD
	vLKS6iqbHjOK2oM4EE1h795VKRajSWxhkxGcOgqY8lfRYcm4myD66+BM0+RuMDUO8Q0sQwVmUOJ0z
	DRvDpYOyG7pShUr5psLdQAA4EY5pGqv6cmtm6vFmbew1lXg+OPIVKIsirxIRpgnLmhnz4x4RPiZzV
	BBgYXCmhpsGU66A+fHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4w29-00DJbK-F0; Wed, 05 Jan 2022 02:28:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4w1n-00DJTA-FE; Wed, 05 Jan 2022 02:27:52 +0000
X-UUID: 53f40029a0074df592979a49f44beaad-20220104
X-UUID: 53f40029a0074df592979a49f44beaad-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 169849945; Tue, 04 Jan 2022 19:27:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 18:27:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 5 Jan 2022 10:27:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 Jan 2022 10:27:44 +0800
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
Subject: [PATCH v2 5/7] dt-bindings: phy: Add compatible for Mediatek MT8186
Date: Wed, 5 Jan 2022 10:27:24 +0800
Message-ID: <20220105022726.2458-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220105022726.2458-1-allen-kh.cheng@mediatek.com>
References: <20220105022726.2458-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_182751_525236_9335EA65 
X-CRM114-Status: GOOD (  11.29  )
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

This commit adds dt-binding documentation of T-Phy for Mediatek MT8186 SoC
Platform.

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 9e6c0f43f1c6..cadbc696b3f5 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -80,6 +80,7 @@ properties:
               - mediatek,mt2712-tphy
               - mediatek,mt7629-tphy
               - mediatek,mt8183-tphy
+              - mediatek,mt8186-tphy
           - const: mediatek,generic-tphy-v2
       - items:
           - enum:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
