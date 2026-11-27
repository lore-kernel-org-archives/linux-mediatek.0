Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55D606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 03:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0dYZqI1+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eq6jpS0/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZYSpWaydzi/HLoHbkGjLDcru//1qD664DYcG/RjHYVY=; b=0dYZqI1+srtODEkzh/RMlNQqAM
	QIYMn+RZXOZ8o8M284p1x98bgvfe2COZd9M5CjqlaT122oO4dNHL8JQkn2eEmBEXdmbR24Dot65yc
	LtqmLJTJwF2gxJsSZns9TFBuuRnXYPUMqLxI4EQBGNHDrp8foeZ+DRTb3U4JeJ3m5rq/LCbzozoP/
	hv22rZWLaLps9WXe44s7PRdXPPe1IfSBANytjgf4bhiqyAc25xlMF/uNT6EZ0kFKcT/d0D4tLgQOe
	f3gmeC1j7OhvF3wfnCTAfMRUPpb8cpruLsgNszIy8XEZrA8jFNxQ5aJpX5DwfhNEgThSDamjZWHRR
	9Lm9+pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmHU-0000000Epdm-2c1d;
	Fri, 27 Nov 2026 03:05:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmHT-0000000EpdW-1D8e;
	Fri, 27 Nov 2026 03:05:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FFE96182A;
	Fri, 27 Nov 2026 03:05:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748745;
	b=l9QC1lSpILgi022u5FAIXRNTIscTWzvR+262C0YALSspXQdkkAbK/JtZy5kw43dr67FC
	 z9Gu282EjEQ316B7C+kLJ040obDm5wi9xOIzQ/iXwpSvekBeNuYg3qCUKVPIjUyD3PhQM
	 DJODhw3km01GPxdNh06hlFhClc9m7vjrvn6XkKDPO/OwJd2WC0wsmqzHXQIfv5y9FZedo
	 p47q5gFiEBmTKRAX53S5Hg4WyKAtiz7gCZ6vDV9CtHm8OQQ1YxYLuR5ozSjdBimr2yLYm
	 jvftXMHXKXSOcpDDT7X2Z2oxKLrn6IfqMPUUhxh8f7qTrfE2vgprWJGGapTAgmwx6BA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748745;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ZYSpWaydzi/HLoHbkGjLDcru//1qD664DYcG/RjHYVY=;
	b=SfmdIoEIHlqQmM0MnFk/JzRBbORM5KK3rWlGJbU/pfYxvCy677UhMz6lYo5YeQpdNFK5
	 JJD582IpFyHf4bKja0FxD5U/KKN5OE2s4sG+k+fSdfe4I9oaCRCLzetHZ4qxZv8smy+ep
	 cnoc6tQwFKS81F2F1Bl2YGkv2ktjrmeK0OiyxMm5H/84akoLy6bkea5E4fXGB7Hj/BO4u
	 Hn5pkL9Ks46wKKely6A6mvNMthBtnKA/ZWUg56JsDUB8U9I153VuaGlSuV9tXGNfLK+Rp
	 semWs/uEWIvEfwRPnxhrMFz/ILaPeCp5yJKDrnoAvfUdIwHSqUNWU4f6qb0v1eK7yDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7512D1F000C1;
	Fri, 27 Nov 2026 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748745;
	bh=ZYSpWaydzi/HLoHbkGjLDcru//1qD664DYcG/RjHYVY=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=eq6jpS0/kyquKPPhnRS6PUnvyvttlOX5AzWJCYyl6NAMRpev2N5u9dFI7Ij+Z5hx9
	 8KRj1nD6JLDPyn/L6kce+HB39rmn44c6tMKFuuxOYoknI83E3mlVvX0fpZ0KA3jpiA
	 jDQ8GjSXbQzvKO8KHqccA4yUh5ECYmYBPZ2sWcMWq7Z4Ck4CxNLvtmb9qLTokkqWTu
	 qz0wcL8S2EiEK0zGWEgvdf5g7nTUA5DEj+y5rDr5M/4DHntaP4HYtSb0JyZJmcIGDg
	 ycJqGzKlcfgKDZcvO0eVw5gjz/z5xdVp6fHN+02MqppxefikEULjbHfCPILMALX5Pz
	 pvCH59F1cf4SQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EAC424B513;
	Fri, 27 Nov 2026 03:05:42 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 leilk.liu@mediatek.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] spi: dt-bindings: mediatek,spi-mt65xx: Add compatible
 for MT6789
Date: Fri, 27 Nov 2026 03:05:42 +0000
Message-Id: <20261127030542.11696-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748742; l=1611;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=sl67F/NTDPcA/UZxNAmRnJaGzbkAwbuNN2+Fz3m685o=;
 b=Hy2FnvqAyjz44CTPE4b1DcOaO/n2DUIuTQY/BcngfHKgXNEVNbvB0xCQPBkIfYHpR827nRR2h
 aUl2X33T4xcAXuxt7RPmgmphV2WGxgaMxUVCZc1yb9VSOSqmb5NeLy6
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

Add the SPI controller compatible for the MediaTek MT6789 SoC using
mediatek,mt6893-spi as its fallback compatible, as MT6789 SPI is
programming-model compatible with MT6893 and needs no driver change.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes in v4:
- Split out from the MT6789 pwrap series into its own standalone patch
  (suggested by Roman Vivchar).
- Use spi: dt-bindings: subject prefix (Mark Brown).
- Remove review-history wording from commit message body.
- Add sender Signed-off-by.
- Link to v1: https://lore.kernel.org/linux-mediatek/20250715231921.4527-1-me@adomerle.pw/
- Link to v3: https://lore.kernel.org/r/20261126031001.27288-1-iasnezhkov@gmail.com

Rebased onto mainline with an AI coding assistant.

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




