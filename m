Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB5E606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 04:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nUD3jXUJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duy4jSeM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ppr2KyBlJNRHanEncBGAQ1yg1tO4mkhJrrpqPLXkPsw=; b=nUD3jXUJz7YpdFqkvIsAK1JVaY
	HtudaoWm3gt7KwlZMmwWKWMioagsVCnUY6m9LorLmwio+oA8u4rugxsPi09PuLgtCjwrWaMYmi/tB
	iYaBLCqguOl5nXCXcYjXXCL7Fd3cRYgTcKlpAX7GAAfuWxIEnYJfAmCWyjUqUSuIpzhXsZg1ySBIX
	qx9iRshliWdZk6Sta11yJIAjnZuNc5oGBZIU26FE0YC3Mbtvh/2zBr4hsWc5biuUWFe+p69FR6pnq
	dACqXjmjWxb6f7cfS5ME8xv1rpwDHCSVmXdyOl1IVudp5a7kr4x5QUOODXH9iy6Q62vbVSz0pcGB/
	fKjAbszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXABU-00000000NZV-0pXa;
	Sat, 28 Nov 2026 04:37:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAB3-00000000NNX-1CIH;
	Sat, 28 Nov 2026 04:36:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C9524398F;
	Sat, 28 Nov 2026 04:36:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840603;
	b=YpA0kUtf4qA+3AiorFau0lO21n38y+vwuncEg1A1WdWz0jwWBRj81iKo/SNoEzRcQW3H
	 Dp3uK888n+B990dddklTD/uLpJ5CB+7s+p5JFEUOg6VNQd4VE+0p5wY1cejJyD18bofmR
	 Mm25EilzoUgNRq0lNQwC4E1iH115Oznpr36rCkV/LPP2vJSdNZMiNvpkBE5Mbx0pvIWsQ
	 mS5kamm8q+JxTiXj8Z6DfkrhCjOKODSpz9Psx9PkY8TlawVDg3ptmFgm9AOe5h+6yv5Zo
	 Elnp465P8ACl77RVZzJWfn/iPsmuqxXa9/CbB75fTsLrn6+hVS6+MlVAmHHBl9WPpqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840603;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ppr2KyBlJNRHanEncBGAQ1yg1tO4mkhJrrpqPLXkPsw=;
	b=rtCNFRruHIQZ/De7eB87B1YAsJ9LODG6sMUDUgWVoh88Vhrg8adEredIXvTbvLrO3J81
	 nSrsEyWpnq2X/Rk/1WkYWeHYWpajpjjUzdnaAh1aGGIyxT3ov84YRj3/1aMsMFuH6HfJa
	 ELd3CHQbC98KtScx9tpBGlvScAC99Ai0yLV7u+UlK09nOW2J+0SJHinU/9BXiZ22HCEoh
	 pnq7n4rcvHOhzgpMkcr51y3M7yZzmc7CTxi2cxeydaKqBpqjvyB9ItWrk9eaHEkOlhd/E
	 8k4eJldgcU6s7FAGh0rr7+K6a+e77uGOqfIgxXn/YMTjNdx/wv5oTWQ/Y7dphwEydTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 488E01F00893;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840603;
	bh=ppr2KyBlJNRHanEncBGAQ1yg1tO4mkhJrrpqPLXkPsw=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=duy4jSeMHqCqXLI5buTnDwkD+4ne11XoCw0c7U8AutnH3qPy5im20urEseWr/nmLs
	 nSEqJXJFvzH4NvfMPy6zS8XRiysbADLqlHlS2L9pIzLdwJQasW6G9qUO+sWLQ84edj
	 M16BhB/z9g+1Iz3ubeGdeZbLyEVjtqnbWjWmh472kE4WIhP/dwpgX2V4s3+xHpfX0p
	 QRgAEKRUOKx8np9y6Nm3c23Ie017ZqlbjKoh1eYVn+45Q1zaHhPdvE10XAjsywjBJv
	 LjuT4Xcdqq5vMU7mUKTZfGSQgEb62pt8ckI71Bybj1k1tJ/lmBu8DtVuCts8NvLyzm
	 1dest5OeUU3sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9D4A04DFA7;
	Sat, 28 Nov 2026 04:36:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] soc: mediatek: pwrap: Add MT6789 support
Date: Sat, 28 Nov 2026 04:36:29 +0000
Message-Id: <20261128043629.67417-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=1370;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=M3zFXLBGQlmXviuDhtRSayyWoir9sMjZ4AHGCQ5FGYo=;
 b=nTBsL0eBkEhX9Ai6E73QBe9P1mZ2pYlG1y4P6k//RrP+7H9QLh+8I4E2EkzghMdTE4qy+MNJY
 X9h+AhJw2dODbP/PJDnkE2H4g9gL5dfVp3819rrvkGt1guyiTfrvbDH
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series continues the MediaTek MT6789 (Helio G99/G99+/G100/G200,
MT8781) PMIC wrapper support originally posted by Arseniy Velikanov (on CC):
- pwrap v1: https://lore.kernel.org/linux-mediatek/20250715225746.1321-1-me@adomerle.pw/
- v3: https://lore.kernel.org/r/20261126031001.27288-1-iasnezhkov@gmail.com
- v4: https://lore.kernel.org/r/20261127030009.10572-1-iasnezhkov@gmail.com

Original authorship and Signed-off-by are preserved on patches 1 and 3.

Changes since v4:
- Rebased onto linux-next (resolving conflicts with mt6572 support and
  the dev_err_probe() conversion in pwrap_probe(), per Roman Vivchar).
- Collected Reviewed-by from Roman Vivchar on patch 1/3.
- Clarified PMIF bank 3 INT_FLG/INT_CLR (0x458/0x45C) provenance in
  patch 3/3 commit message.
- Added phone-devel@vger.kernel.org to Cc.

The v3-v5 rebases and arbiter fix were prepared with an AI coding assistant.

Arseniy Velikanov (2):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
  soc: mediatek: mtk-pmic-pwrap: Add MT6789 support

Ilia Snezhkov (1):
  soc: mediatek: mtk-pmic-pwrap: Skip WDT source and init on arbiter
    SoCs

 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 50 +++++++++++++++----
 2 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.54.0 (Apple Git-157)




