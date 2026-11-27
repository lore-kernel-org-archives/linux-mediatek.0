Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1115606A6AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 03:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5/OSkdi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIHfEZxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ToQWodcxbp6TDI4d7JfrnA0mE0aAS8hR2DG78GF23so=; b=S5/OSkdix52OPIK+tRgkd+nrHE
	PUyPCfL1n8bs2Cc0u1KC9cZyN3+aFmWaO3dgQCLR2/pBgcNKMlWWQ2KLw6+mLOn1aZAclvxsGPY5P
	Rm8FxIYeAuufXztoMHk2QBbm5vbbp70Sb7uK7rvd2/krIPH1+VjNpB9z+UACUuZ6HMCh3Sh+S6Go0
	rTM85v1hFvlC8alT7WswzEXCb3Bgn5MYCak4vJ2u3FG4L5tsxWi1WjutV25XixCg7vo+OuB32YTpn
	2rH7pvYtHCxRzLl39z58AXfYEN4aU5aQouXe0CTjDsOiHdBPWwO26ab+ka73cI1B4/9d/u+XXsOXW
	HmiIuElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmCN-0000000Ep7f-2Vtd;
	Fri, 27 Nov 2026 03:00:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmCE-0000000Ep3V-1J6h;
	Fri, 27 Nov 2026 03:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0071743C29;
	Fri, 27 Nov 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748421;
	b=KxHcSQFTTYCLx/YjcE7X0BuqtIR/Me8LLOaUFRAaeiz9h0Bg5zrUwoCXu3ffASnIFw7j
	 JDaLAwwTdLloYDNM2S6nzQD7uhYTE/Vh9zUn/TMKjdlmRU7nxWgxbKDS0BfDkB1iXY5mr
	 6r4HoWxJUWBwps9p3t3BEXEL9QHKocVoM6ULCEfzXO9AsRs0hzPZPbtOG0UL/wSouniEL
	 J1HK2Z5vgA1vyHpo9dFDShHFtbuQDK/lLINknvfqel33v23jnIy3O0W7Bd/9TTPNoYrla
	 5wFnk+B96E1EfqB4riWi8WDn+ihQOeNaHR4y8bSe8LQE5lsT3mm0fA9aGoKmpW1+65A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748421;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ToQWodcxbp6TDI4d7JfrnA0mE0aAS8hR2DG78GF23so=;
	b=16bCMicUW9uzypO5rMVTMHefFKtQLFWrN1avylCgT8YlJEYjeDqbvEB5yBR9w5euN+4j
	 VorPyjzkQCe/h6CwNaM+a+Yv5GCYc+aSBkzUYNEbj2wXiJ30waPVeUztTWDOGTwap9S/p
	 bre02UjmFttMpU64tdfjjbmWilmClSSLTB36dZBffGU1IcJo7Sy8m6gvrjn+1NZ1NenZF
	 lsQ+MhjESph2tJt3/vZtRd2EZoys7vFdOFYK+1cayln4soRlBnXaqJSiABlPhDggyUn/4
	 4oEfBPJ+hhiPt1N/0gqK2dQG7C/HJogJ21raPCTrdxJ43eaVIwLRWFlhbPj29Nr90cg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFD051F00897;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748421;
	bh=ToQWodcxbp6TDI4d7JfrnA0mE0aAS8hR2DG78GF23so=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=iIHfEZxzUErxrAs+7fdTyUdshFbQZvhad4bYWTRrujxQ0p0ebd8aq797tVFucPMq8
	 lf/L0A5nZqDSAA4NqDogOjb7Z/4+qICtfklj7ahUJUnMplnMVyO3PAoUK9mlMzLKph
	 ra3gkZPGLxP+Zj325ekoNzRrjUi+AGXG6bLpeRI39rf9ZfYJnrrGVflmwXgnORLdqI
	 Rylv225BIawdth7qQ5/TnZYoc8JtJgiImLhCfqfg37rAgQ2kIPvJ+ZPCKpZLNwRBY6
	 cXHAa8frMOdKiebBInHKPrpO0aDpclhsXVa9gHlcWxYMvDiQS/Bl55NDIQ/pMU34rX
	 owsrZSLLYYq9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 320ED4B515;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: amergnat@baylibre.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] soc: mediatek: pwrap: Add MT6789 support
Date: Fri, 27 Nov 2026 03:00:09 +0000
Message-Id: <20261127030009.10572-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748409; l=1101;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=YvdzdmSvb+O0Tz8QIZiIDOVYHG627P6PfzDQt/Lq8Qg=;
 b=6ol1S4ut2o32IYsWppY97ebccrQQdihnqY7cQQMQ8JdejL4H5wJdiPHLSvNOUN8CCy9Vq1Tk6
 0N4L6GYMyQTDB+Q5Achp3Bh8N9SBikFzrk2bdEvG0gWLoxIIcQ5DUct
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

This series continues the MediaTek MT6789 (Helio G99) PMIC wrapper
support originally posted by Arseniy Velikanov (on CC):
- pwrap v1: https://lore.kernel.org/linux-mediatek/20250715225746.1321-1-me@adomerle.pw/
- v3: https://lore.kernel.org/r/20261126031001.27288-1-iasnezhkov@gmail.com

Original authorship and Signed-off-by are preserved on patches 1 and 3.

Changes since v3:
- Split the unrelated spi-mt65xx binding patch out into its own
  standalone submission (suggested by Roman Vivchar).
- Add sender Signed-off-by on rebased patches 1 and 3.

The v3/v4 rebase and arbiter fix were prepared with an AI coding assistant.

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




