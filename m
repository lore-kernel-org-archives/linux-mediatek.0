Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 05:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xasBFXOv9cmfh6Nf77lLs69pXtL+ufDq2brz5/V+QwI=; b=UCz9uosx5l+ZKX
	2hs1XPMNaXhSDE0JsqQjd5G7L5hkJUJ6q/fiqN8LYtXWgv1lfQtmGin3b7S3c0N3TC75j6zVbBxvi
	pmtud3KMeyFr5LqtQEfJf3Q6HFQ0jXKKteyTb02GVhdBad194ubD+1BH1OmHn/m6c9busbZ+arvFj
	vwOMdXbI1P3XvoFi4ys/L+NDJZWiCM5yNO5542NXfUJwR3sOcrHml6dzgU0C0asB3AW1y7cPUoxRX
	WnGaOSklUwqa+rWTAdf7a+4E9MDHShhWkPgq0ATo2f4AqlcjkLkZS1YuvNF7wUfMXwPiGdKFFZd9X
	dyM3ZyQfG4E/oW4zpSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMNjK-0081BK-Sf; Tue, 22 Feb 2022 05:28:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMNip-0080ze-CK; Tue, 22 Feb 2022 05:28:24 +0000
X-UUID: bf8de283daec497599b5881f9905c86a-20220221
X-UUID: bf8de283daec497599b5881f9905c86a-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 86379650; Mon, 21 Feb 2022 22:28:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 21:28:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Feb 2022 13:28:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Feb 2022 13:28:13 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v4,
 1/5] dt-bindings: arm: mediatek: mmsys: add support for MT8186
Date: Tue, 22 Feb 2022 13:27:59 +0800
Message-ID: <20220222052803.3570-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_212823_443526_A1FB47DE 
X-CRM114-Status: UNSURE (   8.49  )
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

Add "mediatek,mt8186-mmsys" to binding document.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 763c62323a74..b31d90dc9eb4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8167-mmsys
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
+              - mediatek,mt8186-mmsys
               - mediatek,mt8192-mmsys
               - mediatek,mt8365-mmsys
           - const: syscon
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
