Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12838C32772
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ylFjodn7Aeb+WoizSApOHlL1OxF/LUFr9fJYHURr7kw=; b=0N2lLp8S5dQ4NgDyNJgepQRVg0
	dZQrQ0cN6ce1c7D8HAv9o2zIMvCSVB+cb39Ke4z6n4o9FVkc8GUJIoT7nM3lbPAlhxChRTD/Sw/5Y
	Hy8d/qn16QFUbLoCTZSVQIbwiX5wLOwhgJcCrv4Gtcs3tHPwzQqO1XrHyncfwdy4+GPDQCyIxbS4h
	sptYKflm95xT77CjxbBzEPZgvc5Nddmmi8OuYYg9rX5cCXx/MykM7Zqib6FGPdLTM0gcL+wOw9KTG
	DLicvBb/IBoK4pGNF5YXPHfmXEcIjNlwOcJOpzpgjTj5nXzu7FXugGSU7DBoP5LWYJ/QffWfaR+D7
	uOkdrVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfpV-005do3-SE; Thu, 18 Aug 2022 13:45:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfhi-005Vvp-Mw; Thu, 18 Aug 2022 13:37:00 +0000
X-UUID: 212563b62d674f9696189bd1d7ec551e-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ylFjodn7Aeb+WoizSApOHlL1OxF/LUFr9fJYHURr7kw=;
	b=o+V1cAmQV0wN2pMr7BdAYqyVq3JV0CjLrPTJ/rbosfByki97/POHfKgcaq/UYUQ5Gj6owzKqm4GAn2E2FjwGjmj4Q6XvF3NK9tSa+JLvcjm3O2+iVIm490kc85y31h0WrlRiNIQSusb01DhEKef/D3/ZQEgLwtYG5If4GcookNo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:83528fd8-4bfa-48a9-b020-354b705b26df,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:f717b3fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 212563b62d674f9696189bd1d7ec551e-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2012470352; Thu, 18 Aug 2022 06:36:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 20:46:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 18 Aug 2022 20:46:07 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <daniel.lezcano@linaro.org>, <matthias.bgg@gmail.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH RESEND] dt-bindings: timer: Add compatible for MediaTek MT8188
Date: Thu, 18 Aug 2022 20:46:02 +0800
Message-ID: <20220818124602.20394-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_063658_810648_EB8AE8D6 
X-CRM114-Status: UNSURE (   9.41  )
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

Add dt-binding documentation of timer for MediaTek MT8188 SoC
platform.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index f1c848af91d3..8bbb6e94508b 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -25,6 +25,7 @@ Required properties:
 	For those SoCs that use SYST
 	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
 	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
+	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)
 	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
 	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
 	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
-- 
2.18.0


