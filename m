Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4611606A32C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ErNM6z1b;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIFdvnsq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7bvCI+57wri+mzNR0HTW5gRIi4+VJmG0S1QXuuUNuew=; b=ErNM6z1bihe3inH6Sbz13CB1VH
	zQ+spmi2tZcP0NJscxe4E8IoSnlxS13k4YjDSi0ycKxQg8asTrQpob4TD8z5iIYB/8tSkwmhMPyiU
	55kPk8rAzAaMuYm7D2uyHlKaJG76w1cGyAmpvBpUc0gx2ECHyw3mYitCXEfQcOkrGsgtwki52Sx4q
	W27ABQgLOvtdauw0Bh2giEip00A7oJNN8qo7MSmLYzvVCDO1XYgVigEgssmvUv76P+6nZJ2Mvnoa7
	SMijIiNgYaZqI2NKYzVeXPGGvV2YYBcX18sS4CP58SBMgvFxezOhzB4qMhz3BCQksQ1Od6BVkUIsZ
	qY5fkxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsK-0000000By2h-1eTp;
	Thu, 26 Nov 2026 03:10:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsA-0000000BxzR-0ahY;
	Thu, 26 Nov 2026 03:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E052D45DA7;
	Thu, 26 Nov 2026 03:10:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795662609;
	b=0qbwzi95CvTMPDKyT5JscuLjQ50M4F04q3u7sFn0sE+6r5l0HliAjQCc7HKpGjpRlw0o
	 Cev/KgUOp0voDDQqTK4uETO+WlJf7zq7PUkQ11ceSzewbla+lcmXf/QBkJoFseBbUPf3Q
	 gOYozWmrsrg0BotOSz7u5jbwqe0pmD2hvxg/HDavYmO6I2lclmzHybacG80NbK9bgJqxX
	 TQ6wVkHkYnVxZmpbXBGBiKuqFa8o7qUhRWLg8nTf7ETgk+JJrw//8ImupuhP9rxSSxD1L
	 fgIb87Zhh+LPVbtv/8aXlpwvJc3oiIhVh+228E5sgKCEuGpsdMOXgpdv7Iu/3cZsKKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795662609;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=7bvCI+57wri+mzNR0HTW5gRIi4+VJmG0S1QXuuUNuew=;
	b=wuA4VHQTKYoBsmQqz7qN1lqKmISGfMTR5bFXuL6+2IoWMRLOQTHat44os9kOj1oZNM5c
	 EJLQfzi6SaW7i2utrlhnOamd2Nus15ppXXnWOegBGCnILeYBmgslWz7xiMdQP/BNbT9+p
	 ykhPQVa80ZEv3pZslXzSrHJoK3+Zi+3xNWLDZ26jCf0rtRazRIYCmTF5dvhI9BbypC+bk
	 immFHnyP1w+qN6G0BbVZDqBJDrgHkJhxoGuSZxpbQhWTUOi46B8MDjLBffY9pMGk0EIbM
	 J8Ze+xh+juUglVyWucW7zmq99o2JWJxJ1dzo15W2l6Jkc3wt6aJ0Xzg4lva3/FrXLfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D8361F000C4;
	Thu, 26 Nov 2026 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795662609;
	bh=7bvCI+57wri+mzNR0HTW5gRIi4+VJmG0S1QXuuUNuew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=eIFdvnsqGw99Ft6VFpT3/ZVo66mugf32b1A3GYyEy0IJ7Uuyg0nBYpUsfezVQwd7d
	 qsDoCDFq7k0xsFkzzE10FOBh2wh/CPAxCc2Vy1q2foG16zxw0RiK6abSsRJxqMzSJx
	 Jg/kah+voTi/U3yqIUIojPK9NnJfB9NgWsdNvVLqIdtXITxgdwARyr7eLY4FpGKoiU
	 4C3JZV/2pe2i18eic95MUae5LKxrqO6mlUpCrke0aq3Tbu3IRhA2a0Hn0V2x0REDDY
	 T+VDb03eDXvL5NHB+emFs12QnHlPyIQYJ5rLbyk4BrV8Ch2n+ke6BiVWdPGJP8lJO4
	 P5V7YPS9jywDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF5BB4D1C1;
	Thu, 26 Nov 2026 03:10:03 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
Cc: flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, 
 me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6789
Date: Thu, 26 Nov 2026 03:10:02 +0000
Message-Id: <20261126031001.27288-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126031001.27288-1-iasnezhkov@gmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795662602; l=1071;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=LfmVvg7Aql2KLn2xC/sbkpfApa1X1JdB+MH4gLa495I=;
 b=d2eSehcrzHtooK0YqCNF5v8FmPES28TCUhN9VCRfVX/jwI8Ky6U7QVg5ZRxh8x9k58jwMrT4Z
 MT0yF/Oy9dcD1DZW5KJJSeSs01nu5Rk5nNbb3GOB6qM3qjxriCLglBx
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

Add a compatible for the PMIC Wrapper found on the MT6789 SoC.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Rebased onto v7.4-rc4 with Rob Herring's Acked-by from v1 preserved.

 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 79b7558..0c5ebf6 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt2701-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
+              - mediatek,mt6789-pwrap
               - mediatek,mt6795-pwrap
               - mediatek,mt6797-pwrap
               - mediatek,mt6873-pwrap
-- 
2.54.0 (Apple Git-157)




