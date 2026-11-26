Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEEA606A339
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PyTZj06E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cd3lLmvC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8j16vSsyX3AB0xplGqOMKluI0qfwDJhup/OQrhGuZik=; b=PyTZj06EuV8ReqbovQr436mo6E
	he51ZyLu7WYetz4fRJJKLq+FLpozRG+vcJ6qLJB0qko2mYPczeLI3+G+rZ/FuL3nGyrZQlpVmBvHq
	Iqw/MCSYCtxNS39SabEEPkeEEBsTEqiu0MDC8W7d7hYyGBQ1fc66MFKcBUlFKdBPayYPz64ckM12a
	G+TAPOdR2Kxf2K9fRWy+wSpUs4YnHFGNHOlVkHFfO3+GkwneSKqBYmuv3XYiFEl4Nt7p2FxIlB17C
	78Z9wQcImQV3tPLJ2QmiPvnrdCCpCEm9Nl4okYRyp0Bsx5PECkgKtVunlM0bnHvQ6irKxiu8ILtVH
	ivVGsXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYnA-0000000DBJt-2aNV;
	Thu, 26 Nov 2026 12:41:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYn3-0000000DBDg-25LK;
	Thu, 26 Nov 2026 12:41:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECF6A626D6;
	Thu, 26 Nov 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795696888;
	b=g2fPBvDgaPzF5gua60fZ9xvF6JPSkMItPbvMitpb3QKhCvFj2OYpFjjXJ28km9qBF7JJ
	 ulgwZOfpTy4+taO9voV1/JKrp7MpK4tkXyRNtUpMg3OXfrgOM2nCdn5Ur8mY5xks6QK6U
	 8MPhyggpyU4kSIZL67LN5GgLxXbzCHZkoP/sRBsBC7OGLnjDNiwhCckUdnhqP9QJgpS+/
	 Cilr8aJxY6mgNKsxdSNKRS93WbYDvP6w+SPMGxg9S2iyxy7aonUvPuSojhXFZ3MwXTcxL
	 czWtB8BY15rZNJgoNhbnSDx3KvVL+Fzef7ZdHvEYyBORbRvs2LlBeU1v/rTQ/ySIKZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795696888;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8j16vSsyX3AB0xplGqOMKluI0qfwDJhup/OQrhGuZik=;
	b=Er8KFz6VQAoYOToOorRvN7YNZfq4tisAxzak7TQnEMKUo1oRJg5e5cXnJHLN9Nt/FJ1j
	 SQ4vAx1iD2Ya1ZAjyA03dua+bh/zTdykHKVCdDZkxq20RsOknDdaPwEU6XI72+4i/lK8t
	 EdbcUgVE7TktbsSYAaH9+Kzja5DwPwIsfqsr7JfpTLMcyuyExQzly+ugdGHK9yzTQQZ+B
	 OzN+QpcThvE2fmjrqc+8JaBTq03NdxGk1k8ACOr6UPP8ewD1r+50cMDkOkg9XarVKE5Y5
	 USBuJj+9GCPkUjLZogHcaldd7BXRjliolMj9UOBwRhM2xVi7Au+FolMsRuXtRq/RUWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5297F1F000D0;
	Thu, 26 Nov 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696888;
	bh=8j16vSsyX3AB0xplGqOMKluI0qfwDJhup/OQrhGuZik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Cd3lLmvCGBoB6dM8arTvwj2Bifie7LTZwsNcR5GjG7PR1QnZf4OqlvHYqac5FkiaB
	 oavURPr7evJx6N1TuyQm7SG7Ry5iEfszC1rBwL3osEO8swZY9pRThZsiMS30mm7SHO
	 hwGFw/X8rWlWgUoli3u0NcprZ4AszQ3DfVntqSB1sRJuAzoCqcmWqEfHElhU9X3k/+
	 nmai/rmiqeFXcpKsCi5OUfytDmjYsMJr9hL4at3PuPpszul61VBhCdpF5IazmXVnmG
	 A0cXoqaSyoRs1mB6Sia4tOei/yMLku7nxgupf5TFCRYg6HR/b3GiFSm8uqnlW/6qn5
	 Bgj+La3Vsw20g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7809C4D4C1;
	Thu, 26 Nov 2026 12:41:16 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:54 +0200
Subject: [PATCH 1/8] dt-bindings: arm: mediatek: add mt6768
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-6768-init-v1-1-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795696875; l=832;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=+T3AUDL+O5mAW6RfROgXyiwYY80LTqaNM47Mh38zQfE=;
 b=B3tbwQiqixOoeHwCb3U9Tf7kC2DuxVBpc4FUIiOnR5yoA+i9CgFFALnVOjc8Y0gt+C4pwvigM
 cqJ8Fr+90poDF2gy6Z0RmnHb/WV4NJ0DE9uvhzjEKKIDJJkl/KKvJ1J
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add Xiaomi Redmi Note 9 smartphone based on the MediaTek mt6768 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 26f096587631..37189fb177c7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -58,6 +58,10 @@ properties:
           - enum:
               - mediatek,mt6765-evb
           - const: mediatek,mt6765
+      - items:
+          - enum:
+              - xiaomi,merlin
+          - const: mediatek,mt6768
       - items:
           - enum:
               - mediatek,mt6779-evb

-- 
2.56.1



