Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD7ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSfNvRkXsaTSJIsFm9G+GczbyEq3LGT/ioLJVJiL7vc=; b=1IYK5iP/tCdmAUSlervfl+9N0f
	w0MdCm6Itwd4HjrQ99vuV/DJRss/+VyYy839NKgkdWgl7rFUdnz6X6hBwJGm2MiKCSZLUUctQs9jD
	n8rhCDJaK/B0Kf42h5l88EubcYB01ztELZe+MF/4totemIZV/wLKXB1aTr5v05mz3y47EPJkfR+5L
	lGge4/N+iz3WFXkiwzdHqvOiQW13OGV2mmLQEj2mN9AHCR98UZylkimocn2WGkEVyeyqrTj9kn/Zz
	M53k/t5m1GTqMX8BhagG/0HaoImSlYFgUqUwQH/HGLPLQ1dZSWTEpaInYPOiS+sDc2I+KGYJxKTi7
	Z1wozIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objPO-004aIy-TG; Fri, 23 Sep 2022 14:12:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objPM-004aGl-5S; Fri, 23 Sep 2022 14:12:01 +0000
X-UUID: 5df525dcb0be4105829b34a3aea180ce-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cSfNvRkXsaTSJIsFm9G+GczbyEq3LGT/ioLJVJiL7vc=;
	b=LmXn0AeKubIHA2B6PveiYdtW2cPvBYzPxEDaIKWSn7f04/nNMjAqNvSbINdRd8JE/Jf9ySG/Brg/KNL9RXiRx9MQc9bPJ0PSX5ViCb4+lxNoHPzw1oa377hx6oefqbpkXF+RGUhUrSLWJVZRr81IVzzLbU5cy6Sr/l7eeKnXSak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9854bd4d-87e4-4077-b25f-0e29989f5a60,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:889c05e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5df525dcb0be4105829b34a3aea180ce-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 398711087; Fri, 23 Sep 2022 07:11:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 21:11:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 21:11:50 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 1/5] dt-bindings: mfd: mediatek: Add scpsys compatible for mt8186
Date: Fri, 23 Sep 2022 21:11:44 +0800
Message-ID: <20220923131148.6678-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_071200_245333_84B44AED 
X-CRM114-Status: UNSURE (   8.82  )
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

Add a new scpsys compatible for mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 3737207d8504..c8c4812fffe2 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -21,6 +21,7 @@ properties:
           - mediatek,mt8167-scpsys
           - mediatek,mt8173-scpsys
           - mediatek,mt8183-scpsys
+          - mediatek,mt8186-scpsys
           - mediatek,mt8192-scpsys
           - mediatek,mt8195-scpsys
       - const: syscon
-- 
2.18.0


