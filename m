Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11281606A332
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XlF6ucA4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J1A215nt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PZLHsRq4EbmlCXf1Lob3CFtquTUkwplBAvByFh+39ZU=; b=XlF6ucA4vIWG2CUe5VLBLoK3Tu
	2ZRTKyyNpv6Q1ZUHKQR/Oe8SwU3My9ETeBBWwjnae7QeQEBNd+quMDyd9dxvZzraL5Cpltz60ECAe
	2CvLA0wVQuEuwtkuU5m2KH67xR/iJikWNGxgglC1J9z8hed1vdGxAoJnMK2pCG+JTMrURHvqiYZ6d
	EC4AvwqwaRDgtVm55BWZ+dPqF5YaAkPKfl7mvibLqGAI8fn7dFlKJSyYXt900Ie3SbqpVXDFAvvGG
	2VY77/CQQdXzf+HuzqFb7DSYqswFBGdV3E2xyvwv7RM+XgVV1hjcg+OoPCLiT18NvPJaNtGCfEy3O
	d3spBjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfQv-0000000EepL-3Cfc;
	Sat, 07 Nov 2026 12:22:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfQq-0000000Eem2-47aR;
	Sat, 07 Nov 2026 12:22:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33BB960DD9;
	Sat,  7 Nov 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794054123;
	b=xgx0E2VFqtwDynfIPrOeh24Co7+SucfsOxfsCPPSGeTLY6qWkJsihScCiRaF6rANVTVJ
	 wP8fkHRRpwxVBvmGbpcu9l0CdnEmjoQ71E6BNe6s+t4f/uj1nMyR9ah6DwrKd/IaTu+3t
	 mYH44pWYc8DCSwE0Op13FnSXZAAyRi13Hk+KMzC2Em++xnNfO4PGiMR0aBsF3jAFUy+sm
	 hoFGy3QC6wAMqwWvOPHUO2t9js3HYNnhTB6GhFLkbJGfZDi314tiwNRUtUymqVqG9F5kt
	 aw71yLLCEeRXE2zcJMxz78RbfduKLsZ6o+zXPengLXIndMZD1T6vKWhGcsBdJZOf8Lg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794054123;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PZLHsRq4EbmlCXf1Lob3CFtquTUkwplBAvByFh+39ZU=;
	b=y2aYWR5uu7l9dPp+LxPz3VZ43nn69uRoNLVSgHUuNDXa8mFyZuxDG9jsdSFFVFWTpP7u
	 TbhxuxU3QDYGSwTwFqsrD9LrAJiPB++2+scPgiu6vCrg2NLgHPYz2L0g1MUXoQHZ8/iLd
	 KQX/S4KNOOJiifoAZpBhb/c4MCZoSdYtIV0DGp03QcFdKRUVXPqoQWLssNSBAUSRhu5d6
	 amlHdzxgTARJtJmmwifBFWBDYhTh1sq43srTzQSKO9wDb6cQ6bQaS8xajHxXVKD6WdbA7
	 9fgh4vMlIiexjECLfiEVLhM4OVOhss5wa/mTpnlJB1nprEpiPm+UpypH+z5ShIGm7dw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 525491F008A1;
	Sat,  7 Nov 2026 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054123;
	bh=PZLHsRq4EbmlCXf1Lob3CFtquTUkwplBAvByFh+39ZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=J1A215ntz+CsGwWRHp3/T/kJRm+toIxAm6v4Mgy/kQMbfsmkQDwMkvx0VzVbEq4Fd
	 hn/8JWqQWVHEWJ1unfsbBqI8b9MczxWxotWJIEovxZ9tZjG3Xft/IyFipWciLHN5h5
	 XMh8KT6c69zWNf+mdAUkM6pMc48XFq2NVYWkP84k0+DzNNflyjxnm4/gIe8dy0j/9v
	 X0Gqj2rYWevX9iQSktJ98p6WHnKk5puXNqnvk0qBk4Q1EpcCBkzWpNaWYJCnyRr7Sx
	 0YFmD0be8DiSgQq/fovbGKLIrcELmKTG9Go5woZ6PNPyyYMk6iyrItGsZFCIYJ9O9B
	 wGhBWdOEkcUHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CAA2E47BDB;
	Sat,  7 Nov 2026 12:22:02 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Sat, 07 Nov 2026 20:21:58 +0800
Subject: [PATCH 1/4] dt-bindings: arm: mediatek: Add MT6833 and the Xiaomi
 Redmi Note 13 5G
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-mt6833-base-v1-1-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
In-Reply-To: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, 
 Rui Cao <i@udp0.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794054121; l=875;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=uNRP9WqNOZ9uVaqNn9d41dwM2xyX/yc6xIzymdwBqLg=;
 b=0UOOOfIfHwIQKYbayAqLFyPCAGDYBveCla4WK1KIfCJ9GeX3M+2VuO9cJQCJ0xAXcyRe522MB
 qiM+rDqx3wiDC/m8t3Uq+lQWZbO/Bhd7KZPE0pYxz38Xt6ebC7l7Uoi
X-Developer-Key: i=i@udp0.com; a=ed25519;
 pk=XZJKcKgnUUjjyw8KuKy7u2QeIX0JLY/L1Fxzwwje41w=
X-Endpoint-Received: by B4 Relay for i@udp0.com/20261107 with auth_id=1443
X-Original-From: Rui Cao <i@udp0.com>
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
Reply-To: i@udp0.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rui Cao <i@udp0.com>

Add MediaTek's MT6833 (Dimensity 700) and the Xiaomi Redmi Note 13 5G,
codenamed gold, which is built on it.

Signed-off-by: Rui Cao <i@udp0.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e..900f16b57dc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,gold
+          - const: mediatek,mt6833
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
Git-157)



