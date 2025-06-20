Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E552C7115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jun 2025 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9Zds3UP/situ6ISevmHMtuu63UMPBW4EEjyEou8xwI=; b=QCtdPnyz6oOdoK6mb8G4FNh3Si
	hzyjSv1XNjhkV7CGvk896wWVKS74b4wlO6pe0hDx2fUCrbhRrli6e0kTEUc8l4XOMhqNDotSrt3tP
	Z14FOgy7Ddp5Jn4X3N80R9HhzGOyorMAcGw7PICFu3FknnFf5Jz0CqpjSh5qR2aV1Y5NUVCMhQwax
	VbUqRxgFzRf0GcOyHZUEPjXYerC7Dy5rHKscZI2+Cdg3dxhbJ+rQQqnfbJ3nG3iWXwWchDWibADw0
	KeS0th/U3RIzm3+7ck06k7l6PF+VjtEVbKmt2PdhjAEuM9OgiOqXqTci47a6dnts3l7lW15ZTeEL4
	1DfBcKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeAD-0000000G4ib-0dTv;
	Fri, 20 Jun 2025 16:00:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSduF-0000000G1RA-07tz;
	Fri, 20 Jun 2025 15:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 762D45C6BAF;
	Fri, 20 Jun 2025 15:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96F22C4CEEF;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=7Cz9DeYbJNfdxqyC5I/LakjQd58o56ZwWd4MumaDT84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iUNZJO6O210/UFXdJnkMzN3jEh572jNTT9CA+bJlgZPecXkOEXKIWALsnO22GafiD
	 iwLEwD25S2oc3NDAZSIbrSz4d6oaTBYLhIGG3JBbfXvsFZQeyWOHLKygYN3kI+ZGU2
	 Urp1PqGcPHimYUaKZ2qhqVZBdHqzSCuOqSh0ik8DuijpsNYBzdGrc+iUtO0nGIvfeO
	 5ZfIoDRbF4WH2cFDPRKd9aA/Y3jsbRb5l0ia0WXc1QfKMxCk228wsfJ8/xJ73ix3bw
	 qmcx/MyfAhA3qNxER5yuUJRqaWOyTlJZ09s9k5nsyoYkVxSt7WKZrNYShq51i3DFKs
	 H+5zsB7z4e5Mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8653FC7115C;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:40 +0300
Subject: [PATCH 01/11] dt-bindings: serial: mediatek,uart: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-1-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
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
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=881;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=V5vXqZRhKe/QPDs6cq0TFRVUVaBGJI2I3Hr9UkPlHFc=;
 b=vQ6ta+L0cSyrNmAT6pH6n2zLB7oXQGEryTst+S7AsWcfCTKZG8qHMy2e8vJCnnwrSNdSGQ89l
 2Gsid+w4Fr/DaCDCS8FA2rfQ6IzGdhG94i/Dl1O9e8ML0+x+9zqmQkF
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_084355_144594_A52C3FA5 
X-CRM114-Status: UNSURE (   8.19  )
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



