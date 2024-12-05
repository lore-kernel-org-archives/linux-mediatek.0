Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098DAE7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1Jv+HheEJucUyubj/46X4K/2/75/GEjr8K5KaaDCU8=; b=WyHeja3n3JyyGPVF/ac5MsicNE
	hZCKFjgQwAt+wIdN8bfIY8qk6RxTpgabCaBsEGxQQzAaBxdaG4jSTtisflOJgYGunlZi++TrNqKmn
	SeUyiVEL3qx6ZYuJiCetcTqX5JRxBDiDIo5HTavfEq0CXxoszXt41Uhqxr16ziS0drQHc6WzpEvIA
	lje/R2h5UqTkM0Z1PJWXYzAJkDg6NwlksOjSsLIB6rfmThEUKJfO3hkp3O7+ol9at8xS1f+awDNjd
	UPMmIEw666Z8VMq4upFcvDgANDZ+Rkf0a80r5XIYH6rGmLSf/hoPc0QulffbS6iFcHAunp1q+pWUv
	PBxh6cCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAoI-0000000Fuzw-0TvA;
	Thu, 05 Dec 2024 12:18:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAlI-0000000FuF4-41FH;
	Thu, 05 Dec 2024 12:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733400915;
	bh=otE4SGQQQOEOXe8kbkzhKoyw2kCK8dxjt0QPi5mvR/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q81DvHXiqTu1FnIbPP+8I337ekkRISKqEsY66bf1+JvhgXb+imi4pVg7R2Ztx4G0h
	 9q/EBdXeGbvGEEB7cmLCO3Z0ahtSIfqoZU6OZL12E1O8qq/jA5hstoqiDjfXx+lpwY
	 mEBvcv9AiK+FfOHT3Wt5cG/LyL5330XB7r58jmJHks5j/7VvHXmANC0miB8NbJn6ZO
	 9fcXyWtsyP9u9gW1YQUCCTMJTk4lWOWztClmd6EhpjQvhSkneISVvJvyFiwPv3vF5t
	 b2pi9SEEjCKLFFJV7spV50ZlsncjGg5XYDKEg0CfktIhfm9lVVYzXwbOP7VTVMydhv
	 J41QN4ClCEExQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E58417E366D;
	Thu,  5 Dec 2024 13:15:12 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 05 Dec 2024 09:13:55 -0300
Subject: [PATCH 2/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 compatible for mt8390 evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-genio700-audio-output-v1-2-0e955c78c29e@collabora.com>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
In-Reply-To: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041517_139751_0FF57C71 
X-CRM114-Status: UNSURE (   8.67  )
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

Add a compatible for the MT8390 EVK. It is compatible with
mediatek,mt8188-mt6359-evb so make that the fallback compatible.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index f94ad0715e3239653c74553e27231f1395babefa..ffe9347b543f5c687433862a21ad534b8aace27e 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -14,11 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8188-es8326
-      - mediatek,mt8188-mt6359-evb
-      - mediatek,mt8188-nau8825
-      - mediatek,mt8188-rt5682s
+    oneOf:
+      - enum:
+          - mediatek,mt8188-es8326
+          - mediatek,mt8188-mt6359-evb
+          - mediatek,mt8188-nau8825
+          - mediatek,mt8188-rt5682s
+      - items:
+          - const: mediatek,mt8390-mt6359-evk
+          - const: mediatek,mt8188-mt6359-evb
 
   audio-routing:
     description:

-- 
2.47.0


