Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D5C7EE33
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jun 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTD8j9buc1zrixcQePxBimfH8rUTdpLMSY0EwxCjj+Y=; b=gbihT5Ae7xLXmZr4wCiOy4dMt4
	ese33xULGZldR3S+r9svv4xJI5UDoCGoopmHfrGgUag+DMO5PxVNHdgpw6oTy3gRVjFj6U5xZjQUI
	iJUwO+Cc/LZk85b1FNF6hkPJH1Mo+siPv/PY97UR8PG+mTbHqJ8aAr6VsP3UbKKS4QdL7eosznv95
	i4A4OI6qxK3OB1TXjpE+2+lyGRqp4AvBosHmAxoCAvh/uPVNuBJjv1lDi0WS43Q9s1h9zHM3DUpzV
	YX1cg965d2A2oIlgdBaK8OE+45p9BqPoCjP2VHi/XATaPDzun8GenIlrKw/ZPbUde9HXjU5HiZXzf
	3gaqNN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUj5z-0000000BAUa-3B34;
	Thu, 26 Jun 2025 09:40:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMp-0000000B3AJ-0aLt;
	Thu, 26 Jun 2025 08:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEEE05C5951;
	Thu, 26 Jun 2025 08:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6556C4AF0C;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928037;
	bh=H0v0d6tjzcWb9GqSlLtPRYMtkUgH3T7WvDid9FYTX2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dkPPbuZLz3ISzb2mnswAjz28m1vP2MAWLCLKP1z3HPeIZiCfwCBtvCYFVD/HM5CCY
	 AvKAPMa4srJQoqR/Ks6rAxz08MIdMAbzfC7JJGv+LHK/NBZxPD6L0C9ocAGdv7gFO2
	 ReVu5ecU3jYb4zE8lIsKzrLd90LqdgslZ4yPQprbcUwjuChqA3bKfx6jDxLkgiMsK1
	 dBlLeJsLdRqTQC/FNAR02JHP6gDSQoWNxOHdwvRcHQbl3++i7+unjIHitFqak4vMEt
	 ywgziacEtFk1Chk+GE+CxyWLv1Mzv/uwL/7ZWHEkTfcq25FXt/hZ1Xlsk+pOFr5qSt
	 1IB23vUcyCHEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2207C7115B;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:55 +0300
Subject: [PATCH v2 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-2-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=1081;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=ta3ujqr64pHbaGSlqm/Z8V+hlQFPt/BKX+PtFYGGo7c=;
 b=N7WTUdWGPF56DU0xKHYlV34F+JsC61gaqGOETMQ/cWPTeHSJpWFwZ0sT8FgqTbNhOMlTH8ukC
 tbzCPLf5dCoDQiqRY4nhQVb9Xv9wiKvGRZ9NUDILa9z5KakOldtmVE5
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015359_280322_07A97104 
X-CRM114-Status: UNSURE (   8.55  )
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

Add a compatible string for sysirq on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index 123d24b05556c67374fbb87abe5e16c65031d2ed..30d76692ca87b507900076cd2f7d2e7ed2605b33 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt2701-sysirq
               - mediatek,mt2712-sysirq
+              - mediatek,mt6572-sysirq
               - mediatek,mt6580-sysirq
               - mediatek,mt6582-sysirq
               - mediatek,mt6589-sysirq

-- 
2.50.0



