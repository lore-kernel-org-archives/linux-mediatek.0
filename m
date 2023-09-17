Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D32ACD37B3
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aq+pwsYFiwStYxtjQVnBxBzcUNTCMXjBxquvlKd5ZhI=; b=meUqaP3xUvgU97+oRYkkJeH/be
	RL9sJkdzApraD+23vNMgs2e3qjD1O1RaaZzU/XTbhNn+MrdTZI1LcY+jYyKv8QEEc83492Ezde07X
	U8N3Fifqc3K8IE1usG1cZ15di6qJ8ReLThtFf5Z0K9bNxRd87EcHJz0pNaxgoNPAqVHrph+rwkrzZ
	ZykolRym8r0x2wUROaNun8t0rDkTa4ocpoarfpEax1AXEFwAi4PFbr/RlHv/9Ynix4V8OKc4PsqWx
	uZj1v5AYl8AzKZlaVY9HFtAZaIOl+2WuMgSyUV1LQq8GAIFe/WpjIvbfwhtsqm8Py9lVa/Pbcn0M2
	GQI50CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhrC5-00DezQ-0l;
	Sun, 17 Sep 2023 12:48:09 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhrC2-00Deye-19;
	Sun, 17 Sep 2023 12:48:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E7C3C0004;
	Sun, 17 Sep 2023 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694954879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Aq+pwsYFiwStYxtjQVnBxBzcUNTCMXjBxquvlKd5ZhI=;
	b=dU+jbPVzpXt3H6VtNT2P6FcrQlOnsf4Df+ssXytXV5pjq0RstMNPtNcn+RQlbMT2Lxp7Gj
	fmDzLM73gjnxTvIlafkC2FAIen6ClA4zYbIXRFXCNQIuVNOqbv7WpQKYt6vLZY6cqd5u9B
	rv8vWvHVRhfzWhQ11K9XFOWmH4Hk0COyGvL7V/PYohpp0q/HbzoyD4JlI1r9eRpGje8O+k
	TMxcTeTe1i+2knSZEEZw+JipkIkP2Cle/TB3lBp4nzJ7kNIV0u2NuABQ7pVgic/GYOF5qX
	l5DEMpOqjXCFaQWXWTfuRTn0/uqnsjLT5za0jh8ZMoQ3kgMLkaIkSmy0nEWIEQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 1/2] dt-bindings: net: mediatek,net: remove reference on top level schema
Date: Sun, 17 Sep 2023 15:47:22 +0300
Message-Id: <20230917124723.143202-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_054806_556868_37FDE4D1 
X-CRM114-Status: UNSURE (   9.04  )
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

The top level schema does not represent an ethernet controller, the
subschema defining the MAC nodes does. Remove the reference to
ethernet-controller.yaml on the top level schema.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index e74502a0afe8..0b2cb1897310 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -105,7 +105,6 @@ properties:
     const: 0
 
 allOf:
-  - $ref: ethernet-controller.yaml#
   - if:
       properties:
         compatible:
-- 
2.39.2


