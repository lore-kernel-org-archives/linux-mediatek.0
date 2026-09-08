Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14924C79FA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpWyJTYIhbVracld8cQF0mcNxtfIdKPzFYWE/IbkTrI=; b=qJsII+Z/3nq10DdA1eYv6JyciH
	wW53RcVQTVVjli5kO8/Bx0LypHo/o/GnUqj2cVGAaYtUK4wNb57Y/yGlGRhomVcNZBirfKreWnfBY
	g9rlaGn2Lrp9Vtj5y4PfIGnalj1wb5h2r2jwBiNjYxA0O+xbczjyDv+iB9BtSZI9sv8Mi4V7hC74i
	KLiyuVzIXtPrLlTc33OA5ba+LDaxJugRyZs6KVGFAY6uAeKV+y/06RB1nVcChQyKeoGzCXmr4YC2z
	t1u84d6yTO1Qq1zixWUfBATkrGpCMNddH6SbzpKbH0SFBuUWy53aX962RnL9QHFPfX4e+/n1kJecl
	8lcS4//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qx-0000000AM0A-3PkI;
	Tue, 08 Sep 2026 21:59:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qq-0000000ALvc-3Hd3;
	Tue, 08 Sep 2026 21:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1A036022A;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 326F1C2BCFD;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788904774;
	bh=P0qNZiLTQV7gn0UuncV6cdn6iEieMHPrHFYC39KFYEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iqm26a/yV1ug357w6VwTeYtp7fJC7QQiSaxeVV3Nrbo2zXD9b9TH6LfKNTBldEQ0v
	 MGcPBnsZcMCYjT1GsEv792p6QsQ1Hf6xl3UzjSgMzxZVgbjlvHsqOC3JWXfzgONf/u
	 hjnu4n0ktg5rF/zfFoBTNu1yBThdpIfLmQG5mFaQk1yppmibyLG0RmckPTYydKjkFx
	 ReYQyJKz7Yt9eEGExPiLvBuobIxB0xpcBsAZGZe+pIVZsdG1uiufwOKSMwJkHNoaZO
	 +wXdkoPusLGKHAoW0KupTl6EeHc6oy9h92jY+AOIvq3e2Ib4+v/pcsv+3kDX8D+52f
	 Xl/nFLsItoc9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECBCC79FA1;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Date: Tue, 08 Sep 2026 23:59:15 +0200
Subject: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mt8127-amazon-ford-basic-v3-2-fc46bf1b6cb2@mailbox.org>
References: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
In-Reply-To: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788904772; l=801;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=6yb/XWefb2wuZDPOBmfMPSdJsXYrkjPox9GtsLygo8Q=;
 b=sMFKiD/2GwzKF6d3GNzPKgkcUEADwWjdd4VxnmDVNy01sA43lzYh19cVJCMiFZLQzBNjFB/d9
 ven0HoGbl/fAW6uhnnr6u5r5kjEHBdffi7Qm93MES4UX2N4vsP9kSMV
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh@mailbox.org>

Add entry for the MT8127 based Amazon ford tablet.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index cd4040ad3437..180e6e4948e7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -122,6 +122,7 @@ properties:
           - const: mediatek,mt7988a
       - items:
           - enum:
+              - amazon,ford
               - mediatek,mt8127-moose
           - const: mediatek,mt8127
       - items:

-- 
2.54.0



