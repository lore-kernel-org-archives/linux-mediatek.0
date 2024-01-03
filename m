Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D669C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGZnPvr4auoaajRItapwmxnfamYJ7VBP+86V+sLoGb4=; b=JK5rIFvJKKjNsPJ3WPNMXFZdQX
	KfK9Hp0YIhMH8NGtYCYlKmfRq9D8E4q97Tq/ljDsu0NPDOsDJAXpU/LBX/2EMM/VFHB22FxwM7wjk
	KtJLvI64LpyMWObyHklbNmkRG7x5r29EUTOTvFlQzhabg7yDhgo2bP8CwxRjypI/kF3BaiHdqt4nO
	O6Rm6KIKopageKoqD5VTrfy9wDE7gE/TGjpZGQPIrj/7RG0xxlY7ukEqt8u88fujr0WGIhRltUbsz
	HhLmQChVTMpRnQy7b0kX8FQJnWtuHqHA4gJbcL5UC6Jeht7Hv4COyky/w9BopKh8UMapb45gXuPVf
	MGNZPMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpVQ-009QjK-0p;
	Wed, 03 Jan 2024 00:53:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpVK-009QgY-2Y;
	Wed, 03 Jan 2024 00:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 54CF4B80F93;
	Wed,  3 Jan 2024 00:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA81C433C7;
	Wed,  3 Jan 2024 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243184;
	bh=aGZnPvr4auoaajRItapwmxnfamYJ7VBP+86V+sLoGb4=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=ainNOmnHtaaIJl0KzcZotI236oO9X74rU4MkN06uP8GnxgYcAfDwYGG+xHhcTDfDN
	 59Ts0/btu//SjYmKXBxs8gxnoPhq0JGXFBc8hoVJ7xbJzbn9B+CZAkkatU0yGU8qbx
	 Ru1Wdny1bVPm9nVDPWQCrksx1laTwYFp846LE05rpRZP3MB96N3mYnzHFsMcNGiPt1
	 A/QIzLXl+9QsZm7GTRR3MYuk/gfFxWDcMjVhcCmBm9pspOxL+efu2RfuJUtmEVVIND
	 bPLPuC+pCg5MmSACZXozS6mIeo/BjOTmX/26D98814JBqQXLTgwhu+RNCH1V7+gqbq
	 7xTw81vDMx09Q==
Message-ID: <d64b67fac1a9087c825bf1a86be17af7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3b9c65ddb08c8bedf790aacf29871af026b6f0b7.1702849494.git.daniel@makrotopia.org>
References: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702849494.git.daniel@makrotopia.org> <3b9c65ddb08c8bedf790aacf29871af026b6f0b7.1702849494.git.daniel@makrotopia.org>
Subject: Re: [PATCH v7 4/5] clk: mediatek: add pcw_chg_bit control for PLLs of MT7988
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Golle <daniel@makrotopia.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank Wunderlich <frank-w@public-files.de>, Garmin.Chang <Garmin.Chang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, Sam Shih <sam.shih@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Tue, 02 Jan 2024 16:53:02 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165309_240637_0F21C545 
X-CRM114-Status: UNSURE (   8.49  )
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

Quoting Daniel Golle (2023-12-17 13:50:07)
> From: Sam Shih <sam.shih@mediatek.com>
>=20
> Introduce pcw_chg_bit member to struct mtk_pll_data and use it instead
> of the previously hardcoded PCW_CHG_MASK macro if set.
> This will needed for clocks on the MT7988 SoC.
>=20
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

