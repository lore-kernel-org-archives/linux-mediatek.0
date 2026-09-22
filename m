Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E529C982FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdjfJuwG39xJ8UKBBZ3B2DmqMr8Iaea2RjCzPLpqpn8=; b=Lf1kT+S0gLk15lj/76kNS8YTgp
	XrANyglBpFlRSuvBF2AGlTu3+o0Xk4a7hgssmKoqiZPNxZ2Xo96XkGxNkYzrbYy/eZt5Ws0nWzMhl
	tRk7Cb37NEYw9tNalxcmtNJLu+Ri9EFm2pxYccfosIG9lN1dH89B1cptdLWWme/nsAs8icHMBQNuZ
	ifudy9gLe4Oft9USvsoYKfgO1GDKKghgtt9/z58SOBU85VlIg6XPzeQEoAHxZsPfW3M9EFpsZuHqN
	wsmPQbiTRPva+Qz6iaakmQnWfrpZXM6gMdX0aKIGQ1Rks2mAFFBeVytU8C09AW2a+Ts1Xylaek+pJ
	OqlKEIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xrh-0000000546q-12PT;
	Tue, 22 Sep 2026 10:36:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xrf-0000000544i-2uUz;
	Tue, 22 Sep 2026 10:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0016960DFF;
	Tue, 22 Sep 2026 10:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA7D4C2BCFB;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790073402;
	bh=dDQekg1LQlY6rPoeTkrWeGq/YZnkxUkZ48YS2x0iegc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iOBPMOzRtTyRPfojvnBiE1w9TXJLQrrlHasnxGlUnzJi8vn0btL1oqHASMoExQJek
	 bmuil3fJVLZ/pZdnnc70aBDduGLiTTZPG3TIkcWA47PkbfDY9Qca1+1/5o0CeW0sYK
	 2CRhHvoJhbOeyGe2nDfc3vUymWbj+UgqIJJF6DOb9vDgq78E6v16fnL+URPFZQVAJz
	 AlIMC4BYvUwNZO4d3sepbnrOODCQDqpPYsD+6ccMElz0obEoU/6XP8oE9jymhztUCE
	 IqdqwOaUDPYxn8klqh5L38fjMO7QWvJ9ToFPFrzFDHMFnqNdwUIqx41RC0BDvv2Lh4
	 iWlfy20mcfOvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A682C982FF;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 22 Sep 2026 13:36:40 +0300
Subject: [PATCH v2 1/3] dt-bindings: usb: mtu3: add mt6595
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
In-Reply-To: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073400; l=868;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=0Wzms1rnoBQB2Z9NCd6dczMgNHErrKSjaFIHZnHiWu8=;
 b=u+zdx4TMBsgbMFqD4aogBqgvtNP2oLM0oap1dKWP/exd0ovNr63e4qRznv6SGBHlXhr73Y/qr
 e9yj169YIX8DiJ5Itz5VHLQjjySdfwzg22yP/gNw9Rt9Vhx5seUMy8D
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..4538df164a16 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2712-mtu3
+          - mediatek,mt6595-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8186-mtu3

-- 
2.55.0



