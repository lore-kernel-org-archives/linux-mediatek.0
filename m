Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82430C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXBuHUSa0yoSSKIi58cyfyt8k6/rczE7CI5TV0Q9sbw=; b=BvZ+Ytdix6uLGIqXBc8NAI+jR4
	inRN5HYpwTRdfJUieyOHLwdYSLyO6YvlxiPEU1rhNMv4j2RvVMcGQecPP9iefb+IEeFoHstEDqT6C
	GFPoGJekcE1x81Svx+OE0PxXnHEGcCnl/2mP322McpORLVNQEv2dGhfrri4zlcCoO6xpCaCgQVCgt
	tL1V8KVo9gqf3lOaNW9iH4n1taWKyfQspo9iSETGqSuHfM+N25K/MUHnwbGCydonLJaGsrZtpJIJh
	Gj7UkHhTY4nU1um8dzA7wsHnvp2VB/MxtnGr/7WLaPhOvg2b/4hvQesi1xpo5V5kXmcMhbjj2A06r
	p6cXoevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMD2H-008j2K-0d;
	Wed, 19 Jul 2023 19:40:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMD2E-008j1T-0w;
	Wed, 19 Jul 2023 19:40:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AA06617D6;
	Wed, 19 Jul 2023 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69EFC433C7;
	Wed, 19 Jul 2023 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689795628;
	bh=EXBuHUSa0yoSSKIi58cyfyt8k6/rczE7CI5TV0Q9sbw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f5KXu4u18pX8w/bhoDCQEU/VXLVOFDy+kF4NEaBkkFZABXeZ8jy1BL1S787JwxTwv
	 rKhEOnhsY4ZkAnKE+PGC1Cx8tiA1n58V9nnDl7IOeR7eeJiOQvk3ZM8ibD26xhC+nD
	 whoGLUIpr2YAiXQaS7fo2g+6ssJYS4wEOve7uGVH5vo9glYucZqXKgA9VEbfNRlh1t
	 KW3v52Yx/bm74MaVXnAhALXkw4wpJYB9Ap4mGoqE2sNLorFDNkBBDISObAy1BCIECE
	 mcYk8QHU7dMdxWKaAitMdNPINI0BmLQQdK765y8qDO9kwkxXN6BpwNw6vo/GeiYEeL
	 4tl/Gn0p63HAw==
Message-ID: <25fd7919e449d2a6ffe69c8cb50ba34c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230719074251.1219089-1-wenst@chromium.org>
References: <20230719074251.1219089-1-wenst@chromium.org>
Subject: Re: [PATCH] clk: mediatek: mt8183: Add back SSPM related clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 19 Jul 2023 12:40:26 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_124030_376338_26668981 
X-CRM114-Status: GOOD (  13.47  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2023-07-19 00:42:50)
> This reverts commit 860690a93ef23b567f781c1b631623e27190f101.
>=20
> On the MT8183, the SSPM related clocks were removed claiming a lack of
> usage. This however causes some issues when the driver was converted to
> the new simple-probe mechanism. This mechanism allocates enough space
> for all the clocks defined in the clock driver, not the highest index
> in the DT binding. This leads to out-of-bound writes if their are holes
> in the DT binding or the driver (due to deprecated or unimplemented
> clocks). These errors can go unnoticed and cause memory corruption,
> leading to crashes in unrelated areas, or nothing at all. KASAN will
> detect them.
>=20
> Add the SSPM related clocks back to the MT8183 clock driver to fully
> implement the DT binding. The SSPM clocks are for the power management
> co-processor, and should never be turned off. They are marked as such.
>=20
> Fixes: 3f37ba7cc385 ("clk: mediatek: mt8183: Convert all remaining clocks=
 to common probe")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-fixes

