Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B7C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qnSucjK+gKarN9a1MgXHdB7vRW2F0h9h6MQ4SOUkkak=; b=lfuh9I5p5TOaHu
	VYRNptdF0BgGGmuS6yCykMOR/bCp661czMUBeG4giTFh0lPwxh6icm1bJ1JHGo84K270FAVJSj5m7
	AYv3bVNB6btC45AwoZDcRIQfIz+/o0RARWvzNRWoZszwOjVyRck8bzuqBYhXHirSzVv+Fy3TIn/hh
	q9ELGvkCquZtTv4zdxZxgNSDiyMIbyGm49ElOGMOmRUJ5/7DXsbk9UrjEyoH2bZgA8AS4mLQmQ/mZ
	yzCnlCBOJxz1mVjmqM7yN9rtE641QeWlQaM/KRblN48JD2Hm9UBgHlVYaGRKckRClbVj9llngdxy4
	H0gOkv0O1zJfXHOFKKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qd7-00AAmP-5c; Mon, 10 Jan 2022 09:06:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qOG-00A2sk-GK; Mon, 10 Jan 2022 08:50:57 +0000
X-UUID: d11f530e8726441ea05ce334d7e46d2b-20220110
X-UUID: d11f530e8726441ea05ce334d7e46d2b-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 327060513; Mon, 10 Jan 2022 01:50:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 00:48:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 16:48:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:48:43 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
 <guodong.liu@mediatek.com>
Subject: [PATCH v1 1/2] dt-bindings: iio: adc: Add compatible for Mediatek
 MT8186
Date: Mon, 10 Jan 2022 16:48:40 +0800
Message-ID: <20220110084841.575-1-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005056_599163_C0429EFA 
X-CRM114-Status: UNSURE (   8.46  )
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

This commit adds dt-binding documentation of auxadc for Mediatek MT8186 SoC
Platform.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index b939f9652e3a..65581ad4b816 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8183-auxadc
+              - mediatek,mt8186-auxadc
               - mediatek,mt8195-auxadc
               - mediatek,mt8516-auxadc
           - const: mediatek,mt8173-auxadc
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
