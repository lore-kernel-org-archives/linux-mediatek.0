Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCE606A8B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRHy/spV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGi1XVgb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pgH79hn0SCK9OIleCkqIqypKD/2WKW5SYdyENUBd9sY=; b=BRHy/spVkumQx/oUhwGyBs9CMx
	T3qCGpIaet+LOCmpeTj16pD9WU4yfZRmaXvaxW5/kUuvbdt1Fy/0p5TaavjZTsNTLXxNj+HVZupOR
	fXZkiEJWRPwkL7nypasWGuAQ/4V2oYs6123vNAyAOXw2BCUqUVV4d/vKJsUYoV0OM3S1Hm7yd1nQn
	ohVBHKxzcx3tt94o7NhBwYfPRHDKOI34D5TGw5Gb3E+MXbqqDrZL5zynswDuknoTJUKY29d8HQD3b
	bl11cYXr7UH69iLH3t0/Q2voVIX4R9AL0+x6W9H9SoUg/YfZQMpH2AzY9m9p0xUveVZBLw5efP9gN
	Y54KaeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE5-000000051vT-33UZ;
	Tue, 17 Nov 2026 09:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE3-000000051sc-2dXE;
	Tue, 17 Nov 2026 09:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54F0545BFB;
	Tue, 17 Nov 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906699;
	b=EmD4tqPOhkhuxelT2rIvGqL0r/JWpzxFZYGY/va84A4IBvUl0wdvHItl9pCkJyoWJX3b
	 gV+DtqDvbV5SKuxpTxji/PbE4rsd881XTcZ+jyQl/8G8KHNxlf3xAZHKL1svI0jm+jnvP
	 +eoba9jmjLPKoPSldyaJ18wq9HQ+j5b3kiuVc9vcfvCoZKIh7aRaGmEippSrMbcfgOmOY
	 nQSpkf4FLGRY3yJwP+KgjWgWF2sH7dHOBGZozSiagkMcRA4Fk2F3WHZTpddEQpGbW7uvM
	 ZquZ6KyTWltOJ88Hi0znikiGKWRDX6HMWgEoyMeGBYgVVVx+cdS1uxcUG+rXMy3DOGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906699;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pgH79hn0SCK9OIleCkqIqypKD/2WKW5SYdyENUBd9sY=;
	b=Cy6IWZ3vZVbH4wTAxx23mEELlN1oMqHiUdvUqthECphFR6CSlEvoYipEBsa5SeT9hF16
	 0CDkyoNmjHFdzbbxL5LI2XT0MpRqCwR776SpwX9ODVG024EmqzQFCQ/NTmvg10VCr4KXi
	 fgrc6jRq4uouyDQBSS1l4e7zHwbPc5oCK5efh3We4MkFfc8PHcksnThrxQ2n4XydzBJ32
	 l4hLOIvhTExwfpDDD/C7dlTqgK+WWY3Y0yB5EoQiYMsRxbRy6Cc/8AsDTreXz7LDuk6Tc
	 SvTghNsLR+4tI3WWsbfl368SQpaHRAbHbNtYJ3TgY9WjqQykdEObeP2FM1t//LgkSmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE7571F000C9;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906699;
	bh=pgH79hn0SCK9OIleCkqIqypKD/2WKW5SYdyENUBd9sY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jGi1XVgbSgYjV6isXuCw1zTSInR7yYnhL0YNnG5aYUk8iXklNDBmhEfk7i3RgOZnG
	 mQGGPnYPjwcGnxJ9xrnYdqEUcnd9br8lOy5pd3tTbrTXTNZhFyl688VdYKAvrNtkWx
	 EGeJsoKAdoUNtG3Lwf2GJm9ZDRB1LCPkAIG3jDuMoaE8ojZR7P4Z3/d0xiCCFpqmJs
	 fIKU+QI4arADso6gFEMJ4WWsCy+zibcq68wRM1+pf0Ks/lMfKqBnz7OzlEpv7W+GqD
	 v4x7e+6z2IC/H9/t7dWZD9XjfDn+87ueuGY+YRyX9rpRrlpJBkSDfOeYNGSvPv9Tt5
	 6VCrGD3WmX2Xw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 308E24A773;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Tue, 17 Nov 2026 17:11:31 +0800
Subject: [PATCH v2 1/5] dt-bindings: arm: mediatek: Add MT6833 and the
 Xiaomi Redmi Note 13 5G
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-mt6833-base-v2-1-058a0685c40c@udp0.com>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
In-Reply-To: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
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
 phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>, 
 Rui Cao <i@udp0.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906695; l=997;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=GFyoNWGAxLOiNW5P7U3cZx8tiVYOhuPhOWyXLc+W+0Q=;
 b=+PL/AuT0FA8iW/Q8KV20KLaBcgLP5YqhtlQdcoSCjLAcMb01U+sp2+tjoAQ3PEsrSfVe5OaCi
 XoTUjWGfst1BEC/NiAGORsYr08KDucu8bzQsdhed6EbAQT67EVeqAkt
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

Reviewed-by: Roman Vivchar <rva333@protonmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



