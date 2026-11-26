Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6950606A334
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QYIaBS4u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdbvsjmF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ObL7qkms1Lrjmbt5Lzf0B1k2VOPxe5HsW6sjzBjmexA=; b=QYIaBS4uj8kY9567r/tSvPqKjs
	CjEhSPO7Hy6eTS3i6MGyyR4yBX/6C6a9g0EC5HnVOHxrfhGKogtUALAqF8/2PkKi4OirnZ+fj+sHx
	bMeGH5BcAdFn3uweYTnA+yoXsyq6+ljcdQdyciJ5q5ZfsnzrHbub8oX7Qnf7xovYTytKQIH6NwAgc
	bGFM4U8hQkEKygBzH3x03LG80DRdf8kfaCDks04onyD0KTM3Z+aos/oFbr4xvfl2bVGhveiEz6vIk
	nBTwM+YQYekml71yl8bxqZWQTldxgFNtucS3FzUIUGugdwYWL1rKXyUHIzHoEauaCc7zPouxtrKHO
	BPqyGnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1T-0000000BcrG-1my3;
	Thu, 26 Nov 2026 00:07:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1N-0000000Bcks-2Y82;
	Thu, 26 Nov 2026 00:07:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5049D43468;
	Thu, 26 Nov 2026 00:07:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651649;
	b=OLBFJqnyiAq4VZP7MzWQXFOnE7QN3V7nqHRe+RSx7/I1V28vRCPQ5tAPBXdRzq2Jv8qd
	 dpSoTuM8axa77fbjVK4sNdrhLL/nLl2D5oMGt4jRhFI3acNrOcXB4iBOjce3v2OJxdceE
	 MqU7fiIOKBXMwz9k78AwdfogVOLHbDMhfmQFyXmDpyQxQXvK1V8WoyNeQnSWyn2w7Kd8m
	 HPt/C7U1HZX+IEVZNcwmpeA9V9MbMLzBImroqbF2hpq7D2qConBwEyDdYikeQcF5CUS7c
	 xgkpUg5LzCbClXkkFakRCElnz9sjvH0U8RPj1gG7XOf6JNW1TC6y8RtKi6PFSGtnZiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651649;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ObL7qkms1Lrjmbt5Lzf0B1k2VOPxe5HsW6sjzBjmexA=;
	b=vQU6J6kHBhnFvUYwKLYhojMFcPSgLIldnlesDmuY5iXwqGwoOuX+xEtOV5+i/mTjDBuy
	 T9J5+Rv3xclEfxjdYJY1zVazk1aCztZYZdqVNYXhBBuE+uMiPvylCdYKLq3v3eGrdK+2f
	 6937/8a1gWjd3eQCQDLBJAna4qXM8D4WbXC2JjFTTO2+/F4hzXM62V0Gk59SAUKuwg/Ea
	 SUiiEAiXRRxkq5myGTkAuYBjl6QCG+2ubW0bSyrSxbNQSSFsRio2x25aRSSRfpA2RtSRl
	 k8k1KLwOUUKMcXQazEe/2Ze8KL5RDmwnDV6ZhGutSkoq7nZXwpoSwyz7DhRRXfO1F8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE21F1F000CA;
	Thu, 26 Nov 2026 00:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651649;
	bh=ObL7qkms1Lrjmbt5Lzf0B1k2VOPxe5HsW6sjzBjmexA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=HdbvsjmFLf2ieillUX2Gq8I6S3IrI0jfvuEX3uciFwnDvK0xNhq/IOTOSOJb2eCug
	 fzc+sE5O2UtVipTuPCTlqXiiocvq14H/T6dC96c1wJ/QGu3p3ilx/KlUEWSKi2Kl/p
	 Vv7ayBkbcY4MgcXbzKBcxK5GUofboi7iEnTG8TWrprTGwMQrBNuHgyprwkS3RdDIyL
	 Qo2F61x1Mm1zxJyaEJ1NgCZW8Au2xN08TcCOBJFaGYWsjaxmkQ8IwcSFkYc82aWuno
	 0TiQYJT3tLJFLbjfQZCc+lqofBL1i+Miluy5hyCqtlBWMbIeR0ET4bBA6wMsO522aS
	 ZpsHnuY850ebw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7F2DA4D0F6;
	Thu, 26 Nov 2026 00:07:12 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
Cc: flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, 
 me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: spi: mediatek,spi-mt65xx: Add
 compatible for MT6789
Date: Thu, 26 Nov 2026 00:07:14 +0000
Message-Id: <20261126000711.16163-4-iasnezhkov@gmail.com>
In-Reply-To: <20261126000711.16163-1-iasnezhkov@gmail.com>
References: <20261126000711.16163-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651631; l=1154;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=V05m+8yF0Wxx4QXUx+4PM5IgqsffZt/x6aXxrp5Z1ew=;
 b=FlKE24zOWLr4KgLWaciPdna+6VFGJLGSaPgHPx8jDrL2p+sV1qICbgSAYGSd/ewv0RmWAriEH
 w16ZRglq/4sDeewna2FSUy3uzxmclhf8kcOoHvt8aPELZY6jzHOJ99p
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




