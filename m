Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D700C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeuexoKG/LaOP3hFvwdJS4K1f46UX+qVDmDmCNN1d8c=; b=raVdcyw+NOfFEXHx4ZZ0nQOWs+
	fNW6gUKoOTDZsQH8jCyAkLpwL7gwyJV1zQ1xQzYYYIvfXIiVONfmSwIXIOAKaw0u4xf/BH6cnVchS
	eCwq45LZlC7J/Z/ANmTbCXIJk0U1yvhLHyxNFyiPiyaPwxHZ5XFom/fy+IO8NOBC5kEKtXpdKAIPz
	c2m/otyWb8hNXKQzfoqGtmdmlZzlNCDqeI2Ye8YHE/tp2byrRJ4yABzSErVEckB+N+JS0eI8kk6d2
	R9GyOrMfY7mXEvQQPxPWHmDJxSK4dMqRdqaCe5LyEZMRpc3/PfrAcg1hY8h5f7mFLuRm34gpxiHQ+
	eL5Irm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzvU-00000007YRv-3aMD;
	Sat, 20 Apr 2024 01:54:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzvQ-00000007YR0-2t7p;
	Sat, 20 Apr 2024 01:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD77961B4C;
	Sat, 20 Apr 2024 01:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1849BC072AA;
	Sat, 20 Apr 2024 01:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713578035;
	bh=H0U+uv4/liInL2qHfZyN5D6gZvXyBkXxbB3CdMD+QWQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BSWaSrWED8YZ5BJ94DbOdp3O+QP/RcjxY+1SHo09SPwpyLWeImGQ5AuD0UaPeo4J9
	 3OmOqXalwx00c1YgvjAm+xATatXkZdzAo2YlDPib69qM3mswDnS+qYg32gBh/X3lUs
	 NYo6CkLLUW8im8oIQwROY8sqjMoXHWzn1SoXdE3dCEjb4Ac4P5tPdnnm/lJviSVoM+
	 u+X3uD7taONV2JYCblkEBSfsTsPcjfR0znFJtwy3rUNv+DPkLBSwgICiAb1pEhi0uh
	 B/D+id7DKnby3m7uEm8TiCOzUcenSbbQ11c5Llk4gLck0AR8sQcffT8jjyKIDJO1CR
	 dJUP28Nq7KZdw==
Message-ID: <8a305f2938f64ab084b3e92c6d066c1f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com> <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
Subject: Re: [PATCH v3 12/17] clk: mediatek: mt8365-mm: fix DPI0 parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabien Parent <fparent@baylibre.com>, Jitao Shi <jitao.shi@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Markus Schneider-Pargmann <msp@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Will Deacon <will@kernel.org>
Date: Fri, 19 Apr 2024 18:53:52 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_185356_879346_86FB0087 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

Quoting Alexandre Mergnat (2024-04-18 07:17:00)
> To have a working display through DPI, a workaround has been
> implemented downstream to add "mm_dpi0_dpi0" and "dpi0_sel" to
> the DPI node. Shortly, that add an extra clock.
>=20
> It seems consistent to have the "dpi0_sel" as parent.
> Additionnaly, "vpll_dpix" isn't used/managed.
>=20
> Then, set the "mm_dpi0_dpi0" parent clock to "dpi0_sel".
>=20
> The new clock tree is:
>=20
> clk26m
>   lvdspll
>     lvdspll_X (2, 4, 8, 16)
>       dpi0_sel
>         mm_dpi0_dpi0
>=20
> Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---

Applied to clk-next

