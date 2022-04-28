Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0809DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LBDqCxN+lXPb+MQjSiqDr5D0qlGQacl2qGzmuSOZMjY=; b=YKu4R/69NQceAJ
	nHcnHi7J+jU+DoOvFgHyXM+UuknSoCYoBAe73S9Oz3TW/biaf3apuvq4SN+NILTf91yPn05sOdcv8
	WiVR3NnavOBnor6ecz+pWhog8uaWu3FWgJZeLwiua7cRFMM8HBYwLrrL5sQFy5cJm7qjsKsZUl1Ck
	LiW8x1ALmzUlrj3rFNmA2E83QjAof/Gb51Mb31aIiMRN+FQElGpeiCEsxmR/cKguheyAN05X0msVE
	61sdH3E9iOjXapIyHPHU7ErdhCJP6BnxLdSZ3tIDrVvo5bVXC89Sx/mE7/YwGyY3JdU4bd8g9XdMA
	Ow+ZSyqkd97O5lE7kzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njy5c-004zYE-06; Thu, 28 Apr 2022 06:57:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njy5N-004zTy-MX; Thu, 28 Apr 2022 06:57:11 +0000
X-UUID: 23d7ab5b049e4a4bbd2f3a3c35323fd7-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0417b596-101c-4368-b2d4-353ac1d01c81, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8289012f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 23d7ab5b049e4a4bbd2f3a3c35323fd7-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 613822173; Wed, 27 Apr 2022 23:57:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 23:47:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 14:46:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 14:46:39 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] dt-bindings: rtc: mediatek: add mt6358 and mt6366 compatible
Date: Thu, 28 Apr 2022 14:46:37 +0800
Message-ID: <20220428064637.28288-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_235709_743058_FD4D0603 
X-CRM114-Status: UNSURE (   8.32  )
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

mt6366-rtc will use mt6358-rts as fallback.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
index 55a0c8874c03..5b012d222f5b 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
@@ -14,6 +14,8 @@ For MediaTek PMIC wrapper bus bindings, see:
 Required properties:
 - compatible: Should be one of follows
        "mediatek,mt6323-rtc": for MT6323 PMIC
+       "mediatek,mt6358-rtc": for MT6358 PMIC
+       "mediatek,mt6358-rtc","mediatek,mt6366-rtc": for MT6366 PMIC
        "mediatek,mt6397-rtc": for MT6397 PMIC
 
 Example:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
