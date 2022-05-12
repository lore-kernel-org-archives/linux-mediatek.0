Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOZ2MnkUb//naHTsytBbmytC6tEuBG7fZChX8yJfSFs=; b=wCybxIQQZYuUzx
	A/2wHF6ONoHrAwhgQz2eza31k29fi9pMh16acZ4/v9xfOGCL2QjNt43ygcRhV8belcWzOzxVOnPjI
	D2aKJcFPlGIWZOY0p4sr2/qHWU7GNcxrgXkTTZOTpjNVuczVQOBIKSzZD1xpnnVIcsmw9823I8nG3
	kRmY+HuXPA+vqIJVVNR+3ZYJ//Dj4zj/k2HpwqLi6OxiFQTeMW5oactJa6kKioblRRfxu5t653vZL
	7KnbwvysKnJ5DPi0mf09bxoqad4rB4w9tLtvxtovFhNDDugk0fNZ9PaE85sExKgubYZ0b/Yz06+jF
	U+HQPAZ4eVtYYXp1xImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np2HT-00AP6m-V2; Thu, 12 May 2022 06:26:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np2HR-00AP5p-9U; Thu, 12 May 2022 06:26:34 +0000
X-UUID: 365266622b5b4ad98014667d2fb8636f-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2f6587c5-b8c8-4b63-a164-f3313abf08c2, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:b0c504a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 365266622b5b4ad98014667d2fb8636f-20220511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 459401883; Wed, 11 May 2022 23:26:27 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 23:26:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 14:26:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 14:26:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH next v5 2/4] dt-bindings: nvmem: mediatek: efuse: add support
 mt8183
Date: Thu, 12 May 2022 14:26:20 +0800
Message-ID: <20220512062622.31484-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512062622.31484-1-chunfeng.yun@mediatek.com>
References: <20220512062622.31484-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_232633_369003_A37919EA 
X-CRM114-Status: UNSURE (   7.12  )
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

Add "mediatek,mt8183-efuse" to fix dtbs check warning.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: new patch
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f6e01ddb7499..7c7233e29ecf 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -28,6 +28,7 @@ properties:
               - mediatek,mt7622-efuse
               - mediatek,mt7623-efuse
               - mediatek,mt8173-efuse
+              - mediatek,mt8183-efuse
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
