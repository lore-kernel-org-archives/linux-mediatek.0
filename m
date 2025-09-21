Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF388CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ublLJ4/bfMGhwpiuCF/yslXA8jsHoGDaWOd0K/G9R7w=; b=K4xvoK7p1g8c6rT5ACYECqCKHv
	TxHjn1pMoHkZnPSdmmAzz503JHvbnHZPYAjeH1wNVQW18VL6V8g8Pl6lRW6K2muJBuHcL71Q6HYXr
	gPHNKYgUzjyFnMWy5va6nxsrFjy6En+LPvpDB1Gl+8RGlxr8qOB0Gbtr3EBvDsgPnrSyL3pOI8UAh
	v7wmnx6MPpiv821nRL88H7I7pUolyop6VbiJQogeL43iI+KawLuSmGxrb/J+17v0WcauqGcWXZIZx
	w3UXnfuWBdHQpf+Qtc1nBSgFS5XWm+WLzNdG3h7ZTq+nZVGetp4t4lby41UhHtZ9FcSuXhBjClSJv
	omoX9Myg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLW-00000007qym-11Eu;
	Sun, 21 Sep 2025 16:55:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKh-00000007qDS-1qr4;
	Sun, 21 Sep 2025 16:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1923843F25;
	Sun, 21 Sep 2025 16:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC691C4CEE7;
	Sun, 21 Sep 2025 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473679;
	bh=ublLJ4/bfMGhwpiuCF/yslXA8jsHoGDaWOd0K/G9R7w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GI1FTQdf6qQ85FG+A5Tt3YRi/YypsGb4ecGPA/rYtiErouPlUtaOEvtju8/n5hwR5
	 2K1ptSj7OtJqpdsgGkw4LU/lmtXaDiKfXhSDw6E/l9Q0SE4qs6k4qZzeGbtpqknJff
	 1dpPXedBKELfjLGphd+iQcdawG1tysAzTzczCStZ83Qs/DC1AsJfBf7FSXL9KkWBG4
	 zlNVkxjNq6lSM/vn26bRF+rnjs9v+xAIGytriijetSfHNVUtYe5YBHLb9LuQBMmFu9
	 5ohkR47GE4w7vRpA2z7YRcyc3xV2K+5WRJUpG8JWKgyT96QU80XC9MEXJn7jaGY4CQ
	 fSUIbHl5eocqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-20-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-20-laura.nao@collabora.com>
Subject: Re: [PATCH v6 19/27] clk: mediatek: Add MT8196 mdpsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:37 -0700
Message-ID: <175847367763.4354.10505203948558114838@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095439_512496_103FC772 
X-CRM114-Status: UNSURE (   6.18  )
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

Quoting Laura Nao (2025-09-15 08:19:39)
> Add support for the MT8196 mdpsys clock controller, which provides clock
> gate control for MDP.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE re=
moval
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

