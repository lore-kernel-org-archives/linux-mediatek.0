Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2F9C36010
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKEBoXrCiMWH3OKIjSGQxmpl36DpxjBdQvVyTSGdPlc=; b=He4XGuIaY/a3dXaf8zQ9EUcMJi
	C9dgL3YgU0GYh/VKGHJgTl9lrNYBjvzsGYDviTVhNq4sr2tFudlFG54YvGOftnGukKwYdWRF9RP+6
	h5ijG+lyPlh0eVz2SNJCINVwGHCmGlAFCrxcvoIIdjIVdD59FW82DolzOIaw7vSEPrM4DnUsUMsAH
	QrOh4p2LO7OtIWEjlmoqNRHRtfX/+A+d657LFZR+87+bd8A4OPieDgbnSh1/kmjtT0lcsPOBuz4W3
	grNaDBWOoBfckNFVUn7Ch8EGXjqXIZLu4bYRZ/jsiarqXt9nwAvqqq50+h6nU4e5trbLrjcFfQZw/
	tSIjNZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4b-0000000GPu2-1Ca1;
	Sun, 30 Mar 2025 17:03:49 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4W-0000000GPrF-3wHm
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D82782FA7DC;
	Sun, 30 Mar 2025 19:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354218; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xKEBoXrCiMWH3OKIjSGQxmpl36DpxjBdQvVyTSGdPlc=;
	b=s8IiOi/GgrcHrUA/t0GlzR9VBCXstrqTZTxwDSzMPJEUfI7SDS/opH1WqBgRwxSlkQZopB
	fZueoo+4GziA7+NarQK2gKXrpgC8wvrBRmA+94ESQAWT3I2bUeMR4xwufRosjuM5XThEJX
	gBkYxj4nOI4oVapaqyL93IAebfPU55iyjwD1AxHU2uCywLZHXfOBNyrfwR/6TC6I2A9vpX
	xw5xzm/hLS+mjMrFowwYcdrncopodvLoWEhhoUK+6ifXjrTdA8GbEZJsZfCziLzIorybY3
	IYuFntXpvbD+8QCYbVdBzHsiidk4aLpyiKtqL3i/96Sr25Te84pix80Ht01/3w==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Date: Sun, 30 Mar 2025 17:02:57 +0000
Message-Id: <20250330170306.2584136-2-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100345_169750_635AF166 
X-CRM114-Status: UNSURE (   5.76  )
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

Add the "econet" vendor prefix for SoC maker

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..371f6bb81f81 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -428,6 +428,8 @@ patternProperties:
     description: EBV Elektronik
   "^eckelmann,.*":
     description: Eckelmann AG
+  "^econet,.*":
+    description: EcoNet (HK) Limited
   "^edgeble,.*":
     description: Edgeble AI Technologies Pvt. Ltd.
   "^edimax,.*":
-- 
2.39.5


