Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7081ACAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJ33OKXzP02F+Zwi+qtD66apY4JkrF1rf2QHlzvAMs0=; b=vuM3X8eTOa7OYvXhPQIwEPumaP
	6EVEPvH+qj+Tvm2tGJUQUrlt0boqqwIiKUdliCScUKzz3NKLYE/hRIOmGeNqbABhEj0iIxz0c52Xe
	beRnu1/iHTF+Hd80Srf2d+VVIk0NsC+TAJ8uwe0fgplqe15PsOm4iFGXIGNL93Qqx5o1F2UsQV6UV
	sb8Nd9/skLYeT0Guhhqb5yFEU8Ep7+HtpE2p+WFzUTMzR4NHg7yNXgvSZVqUC7WeMV8yqYVbE66NM
	E/W1VVu2dCpc1qXkN/MT5F+CCgIXPwsyoVMQ2nM2NsiQHryArx2atqb6sBsXxrocRmIiBbqTIxrYl
	HXYq+qVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJm-00000007pMx-2MLh;
	Sun, 21 Sep 2025 16:53:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJe-00000007pF2-2UUP;
	Sun, 21 Sep 2025 16:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4072E434A8;
	Sun, 21 Sep 2025 16:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023A4C4CEE7;
	Sun, 21 Sep 2025 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473614;
	bh=PJ33OKXzP02F+Zwi+qtD66apY4JkrF1rf2QHlzvAMs0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jjG5m9OKipv0wXYbguYj+nPCt05D3kplw6rzavR7mHmJPKZmWUU8yRMjs/ET/fFRN
	 W74y0bo6ElE4RTJMyCaY9GDLmyT7KiJhmEORSWYkIHMk5w3nSISyNTlfBU89lhJhx3
	 3kFFUEmnizdyAGeK7koZ8Ro68wTcb6hF0MorLzIcYHz/inNJ31FnL/JFxxSTDxMINT
	 gP/gG98KMQMG7c0IofmKMHmymnNLUIRIak4q1KHu53wo9PzmmK1JrFFp1cAUwWesZS
	 HM7mrzbKA6xn4mGtFDiFmxDtYmeyosxbf9SjKhR8DmnTbSeiHwMhGE+Gdis5Kcj5Gk
	 2bXFZgg8GWLvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-7-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-7-laura.nao@collabora.com>
Subject: Re: [PATCH v6 06/27] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:32 -0700
Message-ID: <175847361261.4354.11188825521023748179@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095334_662368_1A4BE6EB 
X-CRM114-Status: UNSURE (   7.83  )
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

Quoting Laura Nao (2025-09-15 08:19:26)
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
> it in struct mtk_clk_gate. This allows reuse of the static gate data
> (including HW voter register offsets) without adding extra function
> arguments, and removes redundant duplication in the runtime data struct.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

