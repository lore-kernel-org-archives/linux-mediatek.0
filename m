Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5L+S3MRY3da9Sa84V1SbG2LIL1U8ZyT/6mAcfzHZsZw=; b=TlFHRzk2rJd9Qk
	9JO9ejVwvXxoOtdrGNNvhIYqbUEABXcSfCpz2wYadDAdfur6ahRzbCavBdbu1cb2J7E8kT4kLygQJ
	76yucuw//WIns8FkNhLviFUENkyBjchFJEge4WrXnltunir27Kf6TSiXjrkoLfS9XoFqsHBRVxJgz
	sK3PDEGQR2eIT+dePdfklpZZPenGrUPJS+w7u+gFCMW+Ugw445zFCREpIiaDmSZOgZB21pBmFbbSW
	w/Eqm7KiCSfZ54QcdgGY3BUSc4ZchM4eHicvx/BqFjxiDs5KuRZdSOM9hWcMeaTHpQAnCAZbWTRpj
	lE2ByFXXDKcOWkt5i6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhS0-00Assm-70; Thu, 17 Feb 2022 14:08:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhGm-00An8g-N0; Thu, 17 Feb 2022 13:56:29 +0000
X-UUID: 989027d2ecae4f5390109230564ecd77-20220217
X-UUID: 989027d2ecae4f5390109230564ecd77-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1842970944; Thu, 17 Feb 2022 06:56:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:56:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 21:56:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Feb 2022 21:56:22 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Kishon Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Min Guo <Min.Guo@mediatek.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8192
Date: Thu, 17 Feb 2022 21:56:20 +0800
Message-ID: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055628_798135_46758B20 
X-CRM114-Status: UNSURE (   8.47  )
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

This commit adds dt-binding documentation of T-Phy for Mediatek MT8192 SoC
Platform.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index d279ba222316..7b2e1bc119be 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -81,6 +81,7 @@ properties:
               - mediatek,mt7629-tphy
               - mediatek,mt8183-tphy
               - mediatek,mt8186-tphy
+              - mediatek,mt8192-tphy
           - const: mediatek,generic-tphy-v2
       - items:
           - enum:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
