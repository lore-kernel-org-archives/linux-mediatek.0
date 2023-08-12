Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A601BC0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQRZZUbt7IVfuRoJQ54M/pv8ahCw0UL7VT5FDHbc2Ms=; b=mWkhDgO7zTFF2tk0xtkMy23Hcm
	Y2wUd/LpOLZ0UPbe0Rva0ZvUjrg/0rZwfsVBAr1s1Ui8LpqRCdsobnk2paAbLQvXgRMeY6r8xXW03
	H0a0ChyiGjRnRfK5lYF3QfFepV5u2lLvqVhZ0vCxc8qM1Y27uCqxWSRt3FZ+rjFThw8lm6MPIyDpT
	QfsnY1nU9tVtYK4xDF8fBHGuTRR+DW4766WLfWFroPK46380B0rl+6HSufBYbEki+8uZ4eRnoEtbP
	f2JZmoi8DEq+R6Zob27IgopbfpD/jprLvi1qMzsuW6DMSOflyYpNvQ7Dsl6qhnWB090LfLqkEkH5p
	JlAC+E0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkk-00D0Tv-1j;
	Sat, 12 Aug 2023 09:17:46 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkh-00D0Rb-15;
	Sat, 12 Aug 2023 09:17:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08CC1BF205;
	Sat, 12 Aug 2023 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691831861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQRZZUbt7IVfuRoJQ54M/pv8ahCw0UL7VT5FDHbc2Ms=;
	b=ElaC7G4IQ0Ergf+Mx/uoTMSknbXFqIxyynUVIbR42rVmhe5Hkmy9puE8OdxwImNNS8SlYl
	trYB2LnlpsoHsFaOaFN29RavSKI098c9UnLrP+bLh6FYvQfkPjgLHFaJ4TWTvh6GfGp5t8
	VE+1C2BeetlMFODAlhC76FaxfmlLtqS6FvxyZAU5ptIuKR5GWALiU1JkuD38QjvnpJy8p6
	bixusuIC9Lzyoww+rS2RebHTpkpd46J5z5qLLmcs14JHMaoJFupFm8blcF2twpJRphsllj
	WZ0iZd2yiSziADXz2bEQjyMz0Lq1vRxw4OyOswunTfKgTfhsNrG86pmkmQBWcA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: net: dsa: realtek: require compatible property under mdio node
Date: Sat, 12 Aug 2023 12:17:07 +0300
Message-Id: <20230812091708.34665-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812091708.34665-1-arinc.unal@arinc9.com>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_021743_512959_0221AADA 
X-CRM114-Status: UNSURE (   9.16  )
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

The compatible property must be defined under the mdio node. Enforce it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 Documentation/devicetree/bindings/net/dsa/realtek.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
index ea7db0890abc..f600e65fc990 100644
--- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
@@ -103,6 +103,9 @@ allOf:
             compatible:
               const: realtek,smi-mdio
 
+          required:
+            - compatible
+
   - if:
       required:
         - reg
-- 
2.39.2


