Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D68CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HYXW5yEKSQd1AJsaezSyhUNS9MYUZJqEftau3O4NMfA=; b=yxvQUAvin/X9XLsS1lUsljAoAX
	USwE+K7QEQaaZ7Aie1OiwM35tTks2mHH+quEwnGER98KRgfSaDwoTBvAxkxasRgeMz7mMvYxORwRg
	HgFtPhkj8LhIgLfxByc1eBh4unjrYBzvRuKPInlJ9T/8P0Xejm+KwpONhKB49SkMfra/4vD6C37zn
	4FRviDXh51s+Cp5+DMFYN4QxoJL8zSCGylcffV62dDmLSkutw9AhRWmbK1SshqjkoPnvp1edc1TMd
	oQr1jbUINHbMaV/V+xHbLGYgxjXBDGcWbZBQ0SYyXkVveuEIXfUalV7MJqFn+gPssMWsrZXPPMoQm
	qdUBp9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwvd-00Di2B-Nv; Thu, 14 Jul 2022 11:22:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwvb-00DhyZ-Ca; Thu, 14 Jul 2022 11:22:44 +0000
X-UUID: 7f508bdf1bef4a628a4b3c6ea5f7ed91-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8d566380-8deb-4285-8a40-0fba971ab19a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:ecba7ed7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7f508bdf1bef4a628a4b3c6ea5f7ed91-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1100718062; Thu, 14 Jul 2022 04:22:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 18:42:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 18:41:59 +0800
From: <kewei.xu@mediatek.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <kewei.xu@mediatek.com>,
	<david-yh.chiu@mediatek.com>
Subject: [PATCH 1/1] dt-bindings: uart: update bindings for MT8188 SoC
Date: Thu, 14 Jul 2022 18:41:49 +0800
Message-ID: <20220714104149.23343-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_042243_451028_38172A85 
X-CRM114-Status: UNSURE (   7.87  )
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

From: Kewei Xu <kewei.xu@mediatek.com>

Add a DT binding documentation for the MT8188 soc.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 113b5d6a2245..e5094e1db7b4 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -21,6 +21,7 @@ Required properties:
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
   * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
   * "mediatek,mt8186-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
+  * "mediatek,mt8188-uart", "mediatek,mt6577-uart" for MT8188 compatible UARTS
   * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
   * "mediatek,mt8195-uart", "mediatek,mt6577-uart" for MT8195 compatible UARTS
   * "mediatek,mt8516-uart" for MT8516 compatible UARTS
-- 
2.18.0


