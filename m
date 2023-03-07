Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76957C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKuooxxGwS4yy88Yvfn9FqVnpJrJynN8TCv2/zCxMmo=; b=gbNjdWDIxnLvQs+9BQ/eJjSeh6
	1BkTpue70IDorK7B10adJHf7A1aFNDW6froEA1sWw3P9B/C2CLnGZpqo5RcYeYrYWxBhrGYiovm3p
	EvW3SPgOat7lGp/nteWKBAIkSAGDmjFP0SfN5pRBSKHVIMr5MXVWjdXzFwToEY/FewF2E51YAReGl
	kOJsX1RZhYzw7JXSkmjEU927h/A+yWSqZAIYicXsQxr5jRYPmTqw83hq2FJlqgs0/z9YC40IBDv5d
	mtxhm5VMhu93OaejznONpz1V4U14uzLDiE7C7cCxae0cGGJZA9GnF8Rj1WDRWTH38V4cRQAIBFDWB
	6gNOI65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZeU-001Ju4-2j; Tue, 07 Mar 2023 15:54:58 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZeO-001JpX-7F; Tue, 07 Mar 2023 15:54:53 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZZeJ-0001oD-2V;
	Tue, 07 Mar 2023 16:54:47 +0100
Date: Tue, 7 Mar 2023 15:53:10 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH net-next v12 04/18] dt-bindings: arm: mediatek: sgmiisys: add
 MT7981 SoC
Message-ID: <999685551580442b16f2ecbadd2ab92f0ecdfd75.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678201958.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_075452_294141_7F2A293A 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Alexander Couzens <lynxis@fe80.eu>, Jianhui Zhao <zhaojh329@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mediatek,pnswap boolean property needed on many boards using the
MediaTek MT7981 SoC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
index 7ce597011a32..66a95191bd77 100644
--- a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
@@ -19,6 +19,8 @@ properties:
       - enum:
           - mediatek,mt7622-sgmiisys
           - mediatek,mt7629-sgmiisys
+          - mediatek,mt7981-sgmiisys_0
+          - mediatek,mt7981-sgmiisys_1
           - mediatek,mt7986-sgmiisys_0
           - mediatek,mt7986-sgmiisys_1
       - const: syscon
@@ -29,6 +31,10 @@ properties:
   '#clock-cells':
     const: 1
 
+  mediatek,pnswap:
+    description: Invert polarity of the SGMII data lanes
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.39.2


