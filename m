Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A7EC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 May 2024 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8CC5FsbogjZoptEYJG363eKljb3vexCvHMr6xKGdvw=; b=yxCT3Hp8Q1ab/V
	oenJeXcq9COkr8TVpD8YigZTiajSjSoIbt5iIkXCCOtC5R13zcYYjF85XOTktRj7yVFcG+/2Akl42
	UPyEMhzttLKJlCGMfZR9WKNcUI+tHlRa7fdFt/kx6sqzap2x8pQviJLq9Gc8J3BaQmbwOAjHIGcQD
	gTPiZuEHFRKUdYWwdt7LaJwSpLW4aX72j53XUfkir8TVJq8coIAidMwAmnyjqGc5OcKHsjiFvBEzI
	nYrBtbvBP9fiYCy34HBjOgvFPh/96eTp6pogCDsBSt1llOiLiTRxEKeDCflIsB8FV2SuLfNXR+qJ8
	NQt3ffSS8ZJzyIYFZk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f0J-00000004q01-0mbX;
	Sun, 05 May 2024 16:46:23 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f01-00000004poi-2HxG;
	Sun, 05 May 2024 16:46:10 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id B7BA160028;
	Sun,  5 May 2024 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8CC5FsbogjZoptEYJG363eKljb3vexCvHMr6xKGdvw=;
	b=r8Xd++4muWmwyDD5Xd+UwQY9nTveijg1zPeMjggUy8ABSeGpRrnJg0Edse6gx9psCUjak4
	Tu1rFXrgeZAKX/p7kuDzOYrW2gMQVu4PvVgoFn4ByFsQ+Bgvp/r9S+c6qY2Fdo04f2RYxU
	60KRT+YKBG/xcSdWM7ZqeOmT7JSu+Xo=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B6869360233;
	Sun,  5 May 2024 16:45:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC v1 2/5] dt-bindings: clock: mediatek: add address-cells and size-cells to ethsys
Date: Sun,  5 May 2024 18:45:46 +0200
Message-Id: <20240505164549.65644-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 12140d7a-4053-44a5-aee2-e46c434d17da
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_094605_747347_E67BDF05 
X-CRM114-Status: UNSURE (   7.65  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add missing properties already used in mt7986a.dtsi.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/clock/mediatek,ethsys.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
index f9cddacc2eae..ce953a35f307 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
@@ -32,12 +32,18 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
   "#clock-cells":
     const: 1
 
   "#reset-cells":
     const: 1
 
+  "#size-cells":
+    const: 1
+
 required:
   - reg
   - "#clock-cells"
-- 
2.34.1


