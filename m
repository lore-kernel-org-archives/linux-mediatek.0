Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF75606A32D
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=27HfdKBj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I43RLY3e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ObL7qkms1Lrjmbt5Lzf0B1k2VOPxe5HsW6sjzBjmexA=; b=27HfdKBjjQQ4tI2FJk1eWxbHLY
	tS0ax6m5ltAe8Q5Mzm7jOmiitp9hKOfqt41LA0boYTgNF+FyyRng+Kwp6cobabWlsCnmTLkkBAnG/
	4+SJ8S5rOK/LQ6IGQIXrENhQ0O0C3rP+O+P2GxCDIODNJ1nDfZ9RF9Lk5BA/slcqaABbSxzpl4E1o
	LDDgIKxcCw/4EMcATcHQJwC+86tbFeGjzr44IluO5h1aAuQmyWpCwfFdO72bLwk6U693PEL1sRaHP
	NXPGnVaPkxQFqHjntumt5WxV1BFGKDVvMkppIenT9dAhe8W32k12OixHqm1G952WUG6lrHopyc1Mi
	nLDMPAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsi-0000000ByDb-3TjF;
	Thu, 26 Nov 2026 03:10:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsI-0000000By26-1f0C;
	Thu, 26 Nov 2026 03:10:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FAE41B5E;
	Thu, 26 Nov 2026 03:10:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795662617;
	b=dtWNbakKg0F/ii1z6qWYkEeyD/Qk5v6YHXsxx7UDPu+vo8ArRWM62AU+G0Ag1miny3RE
	 8NZRwStwoHRVYxAtLQEylJqP7xVoLBGtM0dmFKqjPdrrCgOGKigPZvzqYiuI+8DA1UU3Q
	 PZpGLmbP6xhnUObxdgeqrJi+6eZCVKsQ5ZKuDBW1Vv7/aU2cbgF9kYpf64sGDdyd2HfSM
	 vjQa7GBEjuL9Z7iOEzmULVbqtW9n1+3QuN/vO3tIWT6ZU2xfgpVABs3/BmrSsrv79w4n7
	 WSmbsCmGlDgIdWZVCRMg9QE0zElxWZb0W8bf2f5lqVCSvw/w+QFJQrc0fgGL+Bs65kg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795662617;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ObL7qkms1Lrjmbt5Lzf0B1k2VOPxe5HsW6sjzBjmexA=;
	b=g/c3LUJRa8DKhruPLsW4V+8RVqWvJSOGoSY1E0E9LflI7LOqEdbfz5B00jLj14vhdym9
	 Pj4fXH6hU58nbIy39G8P7MC2nzdmztP6v0Pw0+F76IbvO0rlNsTxfUiUMEpGi2nSfqqGP
	 Vo/r4H25F7llAI1vkkzmLrEDpg9aPAOW5Vd8IByNBC87JyCoI8hKqZJoeOIa0APHhVHpy
	 VoQEHZrbB2pjFAh8jwyZLdQfwXPD1Xcf02XEtcmqwlg9vUw2SAlgW5ZPUISHKrRK2S6ZX
	 obJc29cIPQEt/AXceaPIH7gMLo0EIynP4sEiWK2ZJ6SkRLLmgzJ98SnMIEju1uP+ORA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB6A51F000D0;
	Thu, 26 Nov 2026 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795662617;
	bh=ObL7qkms1Lrjmbt5Lzf0B1k2VOPxe5HsW6sjzBjmexA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=I43RLY3e0Q+FFjcOTpoJO5GeG/DdbIkq4rOOZ39tJG5jjDTHCpOD88zvAxqGSxmYy
	 3jj7139C72fTkc/6wpJnWqYNaP4gL301QC+plSYAkOu6R7kj6W4a3h8ctuwlIVD7CQ
	 l17ca3KBhVugmZWpI4U1BNWKK0k9F1rlcms8A8EVKznYwP1fffzOjk/2tAGEoVoyH8
	 1BRHp8bJhuvizvyhEUfEcDNHwa4wEOHNBg7+6+l5O1oXHsr5Bn3PuEkFVN/dGfPBB2
	 412D8tQ0UGUhatfn5uCipNsdJvON8k5ezcD1jmQEgV7uobJIj3bs9BfmZ+Bkd7jBWD
	 CLY8r+cZobEWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3825E4D1E6;
	Thu, 26 Nov 2026 03:10:04 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
Cc: flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, 
 me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] dt-bindings: spi: mediatek,spi-mt65xx: Add
 compatible for MT6789
Date: Thu, 26 Nov 2026 03:10:05 +0000
Message-Id: <20261126031001.27288-5-iasnezhkov@gmail.com>
In-Reply-To: <20261126031001.27288-1-iasnezhkov@gmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795662602; l=1154;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=V05m+8yF0Wxx4QXUx+4PM5IgqsffZt/x6aXxrp5Z1ew=;
 b=cyrtbIKhBF62/LrJJ8VXUTpKkPx24CbpfjUK0Apof0fUGKsAQgJ/Iqhvq4HDbPgkaU42WO8Am
 o2A7VFHFbC6AIajM9Sn0kLWapBgjXwKIH4wjbbdvRd7xrR0H9xy+yDU
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arseniy Velikanov <me@adomerle.pw>

Add the SPI controller compatible for the MediaTek MT6789 SoC with
mediatek,mt6893-spi as its fallback compatible, addressing v1 review
feedback that MT6789 SPI is programming-model compatible with MT6893
without requiring a driver change.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1..7d82369 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -39,6 +39,10 @@ properties:
               - mediatek,mt7988-spi-single
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
+      - items:
+          - enum:
+              - mediatek,mt6789-spi
+          - const: mediatek,mt6893-spi
       - items:
           - enum:
               - mediatek,mt8196-spi
-- 
2.54.0 (Apple Git-157)




