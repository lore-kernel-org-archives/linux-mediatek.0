Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFD3C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS7mW19qDpYrx8JMNTYFrZJRBd3/SbVIsq4J7C+bHQE=; b=u3+Ab/Ovt6GUu6
	Mj5CAJI4HUtd7t9NXtBfS8zS/s7zVnt6MVCAgqdBOA6DXsopwXIiPhw7OGe+lXWW2IUgpVQWwOyrj
	jKoCmF6JwOFuIpK3O9NsP39vfIgRb7T/GVA/3piaKrcjI7iytt3USQ/FyqWuINpkr94CSQ5du+O5K
	VH1BKAuS2RC+P7mFHDzX0fW5hCrqA+Mx2Nzyuc4BfUEDARiMZoryZuQ7oJBMbLxyvsjhDAS691ftm
	/fzxcN5ZX3+vpH30OTgY91O3aOfNGrz1XepwEVXXl7c4ThFmW3PYH65lmMBKHRyDNhH6ZPxXTOYEb
	iraV36gESEu5nstzc5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0RB-005hpd-4s; Thu, 28 Apr 2022 09:27:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0R4-005hnt-DF; Thu, 28 Apr 2022 09:27:43 +0000
X-UUID: 3808915d031a48448dea9183eff7dd22-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:da010c1f-72bc-4dfb-ad8d-4e50592efb6f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:0321d0c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3808915d031a48448dea9183eff7dd22-20220428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 8245450; Thu, 28 Apr 2022 02:27:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 02:27:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 17:27:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 17:27:30 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
 Yuchen Huang <yuchen.huang@mediatek.com>
Subject: [PATCH v2 1/1] dt-bindings: rtc: mediatek: add mt6358 and mt6366
 compatible
Date: Thu, 28 Apr 2022 17:27:26 +0800
Message-ID: <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
References: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_022742_504247_B2A26541 
X-CRM114-Status: UNSURE (   9.79  )
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

Add mt6358 and mt6366 compatible in devicetree-binding document for
MediaTek PMIC based RTC. mt6358 and mt6366 use same compatible data
to store RTC_WRTGR address offset.

mt6358-rts should be used as fallback for mt6366-rtc.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
---
 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
index 55a0c8874c03..7212076a8f1b 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
@@ -14,6 +14,8 @@ For MediaTek PMIC wrapper bus bindings, see:
 Required properties:
 - compatible: Should be one of follows
        "mediatek,mt6323-rtc": for MT6323 PMIC
+       "mediatek,mt6358-rtc": for MT6358 PMIC
+       "mediatek,mt6366-rtc", "mediatek,mt6358-rtc": for MT6366 PMIC
        "mediatek,mt6397-rtc": for MT6397 PMIC
 
 Example:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
