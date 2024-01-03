Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F09C47077
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIc7vil6oQXNWIFG6TyLDS6yimIz2qi/c2PwKRpmK7E=; b=DxxcUMttzgx4bB+2x9pzJi75GB
	vWlExC94fpnB99HPEOEmu3dCAVnxNp3Wscfrj/1j8Q3PS4j3jsxxi6RVWyNdh4ji7yAlDpfb/m2qj
	0uzd0E+LtCLGvryJtaqAJXMTa5FMOg5J09Jx87oR7zUkE8zn5ms1i9HnqEvMXVZaCj6qrt0dK5Z6i
	+J701iQYwrI6rA91q/TCq04TOTm8N2+4mCe+Yb5hBQNyBDfDvri1xe+LM6WhxTQSvrI93n6iog2lg
	QxgDuXbBV79ycNlyCzl5s05rtpB183gObRRR6R+plrdvWL7Vo4qeMgJw3eB6KlKTO+ZA8Qawgzovs
	2KkpDvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpVa-009Qob-0f;
	Wed, 03 Jan 2024 00:53:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpVV-009Qlj-2J;
	Wed, 03 Jan 2024 00:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4C49EB80EF5;
	Wed,  3 Jan 2024 00:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88358C433C8;
	Wed,  3 Jan 2024 00:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243195;
	bh=hIc7vil6oQXNWIFG6TyLDS6yimIz2qi/c2PwKRpmK7E=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=SWGa1Atq4YkIusWtYtpoNkl5HcChw+0/A5eSXdtb8A1OjYGaU4MdVuE6ilLD7EZec
	 2gW0VoN12JDQdj1A4hEcP9+t1u5tGsD0W2PGerruosDQopLKPeO2eUYBfHPI3+GUpp
	 KC/x2uoNFjnY8yFsEr2qjANnVRwgAwvM2zsqto4TWm0UpzkSudUDe5gF4SyT5y3OLN
	 D4yS+eiI48qoSDLJzVg4HzyRFM+YNNj5mh3B2/3Sbq999WraoYZsKEu4/ygUiVJFWH
	 XKvAawQF7cR/gb1l7QepdquDnqHUdfe4wvT/Zxj3keNp+nl0N/I48/Ys6sSZF6Dy/c
	 qLCsC0035PfFg==
Message-ID: <f2ee0e96fc2467fdf44b960d0ffe94c1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c7574d808e2da1a530182f0fd790c1337c336e1b.1702849494.git.daniel@makrotopia.org>
References: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702849494.git.daniel@makrotopia.org> <c7574d808e2da1a530182f0fd790c1337c336e1b.1702849494.git.daniel@makrotopia.org>
Subject: Re: [PATCH v7 5/5] clk: mediatek: add drivers for MT7988 SoC
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Golle <daniel@makrotopia.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank Wunderlich <frank-w@public-files.de>, Garmin.Chang <Garmin.Chang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, Sam Shih <sam.shih@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Tue, 02 Jan 2024 16:53:13 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165318_016148_9F1061EE 
X-CRM114-Status: UNSURE (   8.63  )
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

Quoting Daniel Golle (2023-12-17 13:50:15)
> From: Sam Shih <sam.shih@mediatek.com>
>=20
> Add APMIXED, ETH, INFRACFG and TOPCKGEN clock drivers which are
> typical MediaTek designs.
>=20
> Also add driver for XFIPLL clock generating the 156.25MHz clock for
> the XFI SerDes. It needs an undocumented software workaround and has
> an unknown internal design.
>=20
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

