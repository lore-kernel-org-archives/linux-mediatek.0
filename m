Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BCCCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqlIcQ125tvk4GEsuF0dRqlzo9uSCVG9LCT4o/o97ao=; b=qm4NTzCBdSOT9B
	Fk+1KO06xSJDbM3wZ80E73ibHiF0cAEVyom4yYP3NAIPSUIF6bpaqRAdgDnHKjy75nmSoRRsyh433
	xTBFLJv3KTnYZdOutZxNB5hrGqcAtX1rkYKEH/malPwQ4Bpu1kRiRNqF3OEnqP9DZanCve0nfpK6M
	J7yoJHGunLSOmiaYBPhC5Q14F2Go+YcPQ44/9JWCHEUvrjQuf/m8XLS/XF5gw6gm/+GLliTuBVcO6
	AShDHs1PoaObrDQZXrC1PnpZxiA4QEd6pNB9Yd9OdqGpSyOzudy9QdzPdVanqoyteHIzKKbAmpRNt
	XORMYA5EmpQAPJjWMByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNH9-0000000E19R-3hAn;
	Mon, 27 Oct 2025 13:28:43 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNGx-0000000E11M-06ui;
	Mon, 27 Oct 2025 13:28:33 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 84C9F40387;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqlIcQ125tvk4GEsuF0dRqlzo9uSCVG9LCT4o/o97ao=;
	b=fLi9+wPMwhG7i0jNQFK+RZTNCe5HSZM/u7QhAOyR4HIwX3g4oeuZtksXy55V4Vs0LAuf68
	KgJiQ+XfhDSFQyuONuhgYS3DZhy2WaeRfcJ5gC6VbykHgfkL9QhgaiFoLMkqJLUJuQlisQ
	vMl//6Qtm9UDyXZ2cKobLjdnYkNJLuw=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 4F6761226C0;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 2/6] dt-bindings: arm: mediatek: add BPI-R4 Pro board
Date: Mon, 27 Oct 2025 14:28:12 +0100
Message-ID: <20251027132817.212534-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027132817.212534-1-linux@fw-web.de>
References: <20251027132817.212534-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_062831_260411_7E85EF34 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatibles for Bananapi R4 Pro boards.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..d09732ec8c89 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -113,6 +113,12 @@ properties:
           - const: bananapi,bpi-r4-2g5
           - const: bananapi,bpi-r4
           - const: mediatek,mt7988a
+      - items:
+          - enum:
+              - bananapi,bpi-r4-pro-4e
+              - bananapi,bpi-r4-pro-8x
+          - const: bananapi,bpi-r4-pro
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.43.0


