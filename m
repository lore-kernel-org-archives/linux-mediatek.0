Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D73C83013
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/S2zWt0V7SNEie5B/mNPlnQw+HceAf3rcOc1FySA3I=; b=CjM1FnUVbFRD3Nnd+PiK58Ax4J
	baPWU8QiLpgo1TCMAkc4zvae8LfdaKGKA4fv+rku+1Fn1pNFcfzvaPEnJC93qTPuwLnEaqRnl/6s3
	1kjZKWyRE7TftTycCKQJNnHZD+1B03ST17pqGM8EV6R9+rV8w98Sukfh/k5Wl5VLWSCz9nRlUU34q
	2vA01xfAZzayZuB7rkBaS1qrkKPYP3czQEUrD1yl1i7myhsJX9nRpwgEpjGBXMMebftfOTkqhj3q+
	46oOCfGoWSNE3oB7POFS2BexmPdpnSrZYY3HCDQhUgyXNnjqwh3AmaaAar3JIj0+L8ClaQloGl67l
	VvV0dsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvri-00000008Aiq-2W9y;
	Wed, 02 Jul 2025 11:43:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv3o-000000080Xo-43Nl;
	Wed, 02 Jul 2025 10:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 104A2457F8;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA6F0C4CEF1;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453487;
	bh=NtHVQV9EcFCMDX7k9Ycx1Wl9rCSucK710Cd1fER6oPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O5YVmvGx3GThJ7iO0u9reWOs98lTyQBI8jOz9aSi8JMallmGHBlQSJ+nPf6weI5yp
	 L9FvHzumOHtFr1jtKSorma/lgahl1Y26N3XsHEi/i6wHMW9LqQoDW4fBm5dorkm0J3
	 6D4VSq92znTmZgxyymCU80+78+PCHyu0ir/axxqfhlE1hPKWU4/TY9kNOFuFzakX5T
	 VIpAdyW+Gqe0s/Yu1k9rLf1h1niGGtpI99PapFJt7XQc+Nu2G8EaabDgVwxcokC7RJ
	 iU+PSI6SJy7CFt0wOJ9U0f11tuRgUebfVvxULS1DDFeQdgocjAJMSZDLnOXn3cql8f
	 N23jich/DJPzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CE1C8303F;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:38 +0300
Subject: [PATCH v4 01/11] dt-bindings: serial: mediatek,uart: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-1-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1028;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=DJTTfnpTHaaUzlVzY+8JNLh/4at1AR4THWvuXGzVm7Y=;
 b=ksOMgGPLyj0EeXyhBqe5loTt5hkWyeuS3aJcTlQ6WyQHrDsH87K8rGg4y9tdMrs28qt1LLbwB
 Of4VM0Bm5ttBsrDv6qPTl1jhLei7ak7PndEYt3AynUfm0I0MiuBEhg6
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035129_040071_C598A770 
X-CRM114-Status: UNSURE (   9.27  )
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
Reply-To: wctrl@proton.me
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for serial on the MT6572 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 1b02f0b197ff46e3530372d1d9303210cca9c2d5..fe283494188dea64bdfdd34a781bf54c8cbc1f05 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - mediatek,mt2701-uart
               - mediatek,mt2712-uart
+              - mediatek,mt6572-uart
               - mediatek,mt6580-uart
               - mediatek,mt6582-uart
               - mediatek,mt6589-uart

-- 
2.50.0



