Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDEEC3ABC3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 May 2025 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wf+qkKu65FaMVZa2MxGfjykd40KuUnPboMPaERsy98U=; b=RPwJka3vWwfoC/
	zIS37kTy4dcr51ziIx5y6BWSUFkx+4TJyquZfmUd1/5P16cZOB1VqRj9iD0wERt3s3Xha6hdWrir3
	M/u+PhI0vSdNijk/0+OvlTGxsB3/VPHvhWDgZA8kWpSVHvAkX/AYdpwTwnTtys8glXO/xlSnGANWq
	SWuTi7esoLF2QZ8AhYSzz0Vqo/xEguGyf2xrjhQ0ITsPKuuxGH1WlHCaS7EyKhR4RqtTFY6py0K0G
	LulCzH4bS9oLFHs7j9NCWfPnCHf19moIfPbqsCF9VV0RNIJuvWIOIJ5FFEeU+tOdaU7q/9HEKFiD/
	5F8TqmQbxZkUaqVbOisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7f6-00000007MX1-3oNm;
	Sun, 11 May 2025 14:28:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XA-00000007LXC-1OmB;
	Sun, 11 May 2025 14:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Wf+qkKu65FaMVZa2MxGfjykd40KuUnPboMPaERsy98U=; b=h74hatGfXgO6xTfNvMuK9UHU2a
	/tWfvE5VDE0ULtgaslYmHEbagfRNsBe05q23srpXGIN5g/Y6O1RIR1bCys3RPvafMdb0EI98OhqES
	jUbfi3lscM1Xjc9lyGjonVh7tHFs9USfskKTLnlahSz2qUi7NWXiwftlW74v+HVNumnRDQLlURKrm
	6ohy7KaeOjRTiLvAQo+rElo0bLizUUB9xdLNJCx01cyzjbqhPwB4essB8/xHP16BUAMckOUTNk3W4
	XCuAwKQ5thCS/qpPFUcYwLZKp6GQgUhWs43j7LWVYTjwipWbMxsOi2UOOTEoL90SkNxLxSS+M15zN
	xjcv4sxg==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7X5-0000000Gcgq-2WA3;
	Sun, 11 May 2025 14:20:02 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id BC0AF3FE8B;
	Sun, 11 May 2025 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wf+qkKu65FaMVZa2MxGfjykd40KuUnPboMPaERsy98U=;
	b=be9TC2cOOJBCUaYLXbpxmRItc3gt84Zpk1T/7i0JY1EAB0fu1UmwC7IfCjAPI9CAGoeFSH
	GIyIZYDft3RXSbg4/sl5DgETb+Pe9dukvrx1+61VNk82HT8q9vM/8Q/2MusjtVtPgA2zcV
	/vX0NGvXJgu/McJ5+zxZAVlEl6sqrXs=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id A0BB8100787;
	Sun, 11 May 2025 14:19:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 03/14] dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
Date: Sun, 11 May 2025 16:19:19 +0200
Message-ID: <20250511141942.10284-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b5c8833d-e78d-44c5-8ad4-9baf6c366a00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_151959_942127_095AC503 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Mt7988 buildin switch has own mdio bus where ge-phys are connected.
Add related property for this.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index bb22c36749fc..5f1363278f43 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -156,6 +156,9 @@ properties:
     maxItems: 1
 
 patternProperties:
+  "^mdio(-bus)?$":
+    $ref: /schemas/net/mdio.yaml#
+
   "^(ethernet-)?ports$":
     type: object
     additionalProperties: true
-- 
2.43.0


