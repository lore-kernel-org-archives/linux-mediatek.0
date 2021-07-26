Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D02CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8C360F45
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E8C360F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9teiMLBgGEvmy/4mNjvyFHNivhJM1lWnnThqc8hZ7a0=; b=P+XOS/TEWUzXwP
	JUtrjZ9h6w3Q2S4vm3T/Ax+mLwi4IPPGookKxQnIoTR+uwQXOVJL9LW2DWgfqQKYTlHtA0i3eFdrD
	a/D3YCnsH6LzOsbsIuteoXaruMs1ZhQHlI9WhkCMmNMAOx5Ibp3XlTHjRu+eQpITf1LBfHHcpIchI
	JDQ34tTZZvDMnQAafrS7Mr0YhHroIt8h3h33dG04HFiXCqJS/jLnqaebaEUiDtLQbgGPqI1WPXfaP
	OyDMH0rzWA/iObg0V3KmYNuOOo8NLe6N2sbZRUwaD7GJb6bk+auwgVauiuI3iMrVta3WUSD0vxAyX
	wOHeNEFPP5qkDm/XOq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7usu-009sVH-28; Mon, 26 Jul 2021 07:18:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ury-009s3c-Bi; Mon, 26 Jul 2021 07:17:47 +0000
X-UUID: b84d4a22a1664e04a54a7c4466b0f48a-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sEz0WQKPpjHp6jhOTIhrEF5ZjVOnwvdEB7Vvse/W9Dc=; 
 b=shfipi3HtmhEKG8H2Lr4UcPPdsz3Q0zm4KmaSoaXSBH2iYskbIwNTkNii+OJf57ssBZ5ZlwcVSI9b6uY7PiYmsKee/IEjKBjxrZkm47IGoEwaxDUPlJOFfyQ2QiZJX4PVmDVJFr86PR44kQFdeNai/l1Rrsm90kQaj2HE2fMswg=;
X-UUID: b84d4a22a1664e04a54a7c4466b0f48a-20210726
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 126307503; Mon, 26 Jul 2021 00:17:44 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 00:17:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:17:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Jul 2021 15:17:40 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH 08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng
 binding
Date: Mon, 26 Jul 2021 15:14:35 +0800
Message-ID: <20210726071439.14248-9-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726071439.14248-1-sam.shih@mediatek.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_001746_456588_CDAF2E0C 
X-CRM114-Status: UNSURE (   9.80  )
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

Add RNG binding for MT7986 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 61888e07bda0..bb32491ee8ae 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt7622-rng
               - mediatek,mt7629-rng
+              - mediatek,mt7986-rng
               - mediatek,mt8365-rng
               - mediatek,mt8516-rng
           - const: mediatek,mt7623-rng
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
