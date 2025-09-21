Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF918CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIiAxC/XQi5kAsbB5RMAD24FdJ00xv/HkAENco6zOtM=; b=XSxEveoKO5d0IFf/VTG3xTPnza
	iEU2xIyZ9NMtT+5d4oRnq7kjR1lp6VHATQAdo18Khb1HJ6+2mmmaVmTO2osU8wcIwEDzoODet4nuk
	wW7ytoVnTL3xsRl+bvInKrYg1rvv9vTpx295MQt5txJIWbdGJWBVaqz7TmkPruUzMBWpJaDJJp4fi
	6nZoSkJhSTv+x4a/q5RtHCQ5dwAoZ1F+NMpqMMyc2nt18ierwztlqbo0TiETai7jutwtTu0KPSQj6
	lDwY3HAhiLdjIyUZD0DuMvxC6rESu3dRvmWDBVXQqpMuYU/T+b6LzfCskGir17FhaDN6OJd5dvtEU
	JMxILUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJd-00000007pDS-03BZ;
	Sun, 21 Sep 2025 16:53:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJV-00000007p82-3K92;
	Sun, 21 Sep 2025 16:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2425B60143;
	Sun, 21 Sep 2025 16:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F59C4CEE7;
	Sun, 21 Sep 2025 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473604;
	bh=IIiAxC/XQi5kAsbB5RMAD24FdJ00xv/HkAENco6zOtM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZxGJoJppRCzkQdYXNUS8VZy45a058m4wsFOfd/pae4xdXeSlPzACaLdfJjIo8Ewt3
	 TQBM8NJPRDAcZ3ZUzGPJH05PguSjHbAnM/raja0b3GrGv2p1XLkDJy4TOOYsUAOtrx
	 c5AWHOGzXJLeW2kb/Un1N8sj39bdvPYbI99NLOJvnNuW3Yen7lnpbsT7Qbyd32spHS
	 kxZ2S/0+hM/BNc/jn1NNGQRJVzh9FqngiMJhkGaAvy3Ygq3/3LVxF673PWp7q/HRpE
	 LGdMWAvM0WT6kdupb5qkxfpR77UfJLG0pv9+uJsrKwqAlhBUSbKZ5KHCFNPqqY6YSw
	 y9s/IYi17gFCA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-5-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-5-laura.nao@collabora.com>
Subject: Re: [PATCH v6 04/27] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:23 -0700
Message-ID: <175847360333.4354.3214551525095431061@lazor>
User-Agent: alot/0.11
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

Quoting Laura Nao (2025-09-15 08:19:24)
> On MT8196, some clock controllers use a separate regmap for hardware
> voting via set/clear/status registers. Add=E2=80=AFmtk_clk_get_hwv_regmap=
() to
> retrieve this optional regmap, avoiding duplicated lookup code in=E2=80=AF
> mtk_clk_register_muxes() and=E2=80=AFmtk_clk_register_gate().
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

