Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EA3C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5bq6j8LEU8gFq5ov2kLQDkOrcDe7wXqTnM+mc70qTY=; b=GEHusdx4qBpE2vKY7o/NLDca2c
	IF2O7iqdRmtQZFy2F5SrPnbpmh93/DsSpmzhr4Af6XRrutd4EMqC4sfVvZPPWeQVXu5borFMvDrx4
	F+OR6wvCAUuAWDlWXIXyeKXUmy1Lv4I6GMXUWKn3xqCMaU7waIqwnlEDqW2t9h+cwLOpYNWYmOe5m
	SWEqlIUkDwn7OBguBKaO15OIgaL8JvH7oVfEhnd6VY2gMjcKoxeNaGcbhaZZ9UstNK9CGoxHq5SfW
	QWqc3lxtFPEYVN7G0gJ25sSmMP7roc4rEiy/kseSzuvYPcCVbxpIs1kISYzxtchuncd7dsibMaMdR
	p06arQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8B2-00A1wg-P5; Thu, 25 Aug 2022 08:25:24 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR89Z-00A0fn-J4; Thu, 25 Aug 2022 08:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661415812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MtJ7qO+Xey0OqUrFcFlQLD/MFV94IDDljpcDonYCDi+xJR7JLP3ZGbJn4HSz1sR09qYKtRUP9jrqtc3z6EpUFGHDG0WRGHgNXkxV1vUT80x5dwmy5rls0dBLAiq5K4cHEZDD1sEGSGzdGqAtjjq8POkFrARtIJTs1I+5YIFY9e8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661415812; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=I5bq6j8LEU8gFq5ov2kLQDkOrcDe7wXqTnM+mc70qTY=; 
	b=n/Kug+OgPMP+2t7a82U9d0RXGa2v8GMcARaf3Mxa2+VuZ/eBWQvX7rXEAlLDaymfdn7d0iqlYjP9LAxa90RJmLWxm82DaOcDCUE504DAaE3xTAJI+a12Qn6LYqFPlXtCui3HA7zKb/LsPcYvWE6nKKDx+SWvBCQGTcFUvtVEfi4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661415812;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=I5bq6j8LEU8gFq5ov2kLQDkOrcDe7wXqTnM+mc70qTY=;
	b=A34toTrjpjQZRer5OVay2c+cscs6M5rMuNr1niupaMk5klthplykFKgvtBiqEeEz
	zCDHdPYiYTS5uPif+2znv9Kc2ACXWGUW9VAJSeTKJO60FsM8R++POhlg0OwveZbMaL7
	tSi/lBE7XISI4zroArUjcqLgQoLDK+PpMZFwquPw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661415810501649.5584786900944; Thu, 25 Aug 2022 01:23:30 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/6] dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
Date: Thu, 25 Aug 2022 11:22:58 +0300
Message-Id: <20220825082301.409450-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825082301.409450-1-arinc.unal@arinc9.com>
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_012353_704355_A4F57AA3 
X-CRM114-Status: GOOD (  12.83  )
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

- Add description for reset-gpios.
- Invalidate reset-gpios if mediatek,mcm is used. We cannot use multiple
reset lines at the same time.
- Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
There is no multi-chip module version of mediatek,mt7531.
- Require mediatek,mcm for mediatek,mt7621 as the compatible string is only
used for the multi-chip module version of MT7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 35a3039825bd..16ddda314b5c 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -111,6 +111,11 @@ properties:
       switch is a part of the multi-chip module.
 
   reset-gpios:
+    description:
+      GPIO to reset the switch. Use this if mediatek,mcm is not used.
+      This property is optional because some boards share the reset line with
+      other components which makes it impossible to probe the switch if the
+      reset line is used.
     maxItems: 1
 
   reset-names:
@@ -165,6 +170,9 @@ allOf:
       required:
         - mediatek,mcm
     then:
+      properties:
+        reset-gpios: false
+
       required:
         - resets
         - reset-names
@@ -181,6 +189,22 @@ allOf:
         - core-supply
         - io-supply
 
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7531
+    then:
+      properties:
+        mediatek,mcm: false
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7621
+    then:
+      required:
+        - mediatek,mcm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


