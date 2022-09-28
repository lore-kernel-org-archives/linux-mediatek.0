Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B08C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8AkCuVifU5zwCzq1TAZdFFy/YIu3ZJg8AhDMw4VC6U=; b=NEuybQGuFAUhzqPwKTmbbBfK2G
	cDz3C2s4uqwzs9PsNlRKOgxOq5hSqchKke2YoSXq5DCe4vP3msM9tn0WQf2nduFZuoTFngNsq69+s
	BP3Tr6C+gO7WtGF2Oq9/lt5TLEhU9xQ+zbxPriChYnBGNxy5jeJmA5lLD0tRTyB0osDruZvPz/9rw
	YvQwLhvXgEOyfJbZrRop94WZF7Q6Fuaru4xQdYBMjeiqn/PGC16uZp5XJ8OwxgirRLwGSzBGSruKz
	Y+A7s9cro3k2Ucb+ufn+ukAKF+jwdQiWxRetlLRYqzo2YZSE7rTkAsnsaQSVDEND3sbVGhOG8/nR6
	4j1CPr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUtb-00Fqa6-53; Wed, 28 Sep 2022 11:06:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUtY-00FqXw-Bf; Wed, 28 Sep 2022 11:06:29 +0000
X-UUID: cc5d9026f2124ff6946b051c772ab0e4-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z8AkCuVifU5zwCzq1TAZdFFy/YIu3ZJg8AhDMw4VC6U=;
	b=ChKYJHQV4oDEJybKctphjvJcCaAyVTWJSEN1iZOTODh/HEPfFYEXyyZ/Ea3e+hvYDO3YfPjk/Igvk6dDNuKXqAkug9QZzTHpUVYUxaFmp+vFtIpEm6NjA6LCdvVoeQN1kT/lSjDqUX2kTUA69o1YVJxBajGqLy9WWoNvj6Ywq+Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3c2c6230-49ca-4822-a0a5-e204354281a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:996285e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cc5d9026f2124ff6946b051c772ab0e4-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1175939930; Wed, 28 Sep 2022 04:06:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 19:05:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Sep 2022 19:05:46 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2, 1/2] dt-bindings: media: mediatek-jpeg-decoder: Add MT8188 compatible string
Date: Wed, 28 Sep 2022 19:05:33 +0800
Message-ID: <20220928110534.4756-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928110534.4756-1-jianhua.lin@mediatek.com>
References: <20220928110534.4756-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_040628_411676_44C7411F 
X-CRM114-Status: UNSURE (   9.90  )
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

Add compatible for MT8188 jpeg decoder.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index 052e752157b4..3c77adfa320c 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
+              - mediatek,mt8188-jpgdec
           - const: mediatek,mt2701-jpgdec
 
   reg:
-- 
2.18.0


