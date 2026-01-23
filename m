Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F288D6CFAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jan 2026 01:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkthldLffXYVms3wxAD2lbP6j9gBgsHsKO89SXCZQ54=; b=RT6Otp0+NIsZx0kIWiA8+S8IJr
	v7obtbAGFDX9Bay+GQwkIku+KA168JDHaNxWjIBK6yhGMuqGGdC4pKNd7pNDFE1h3GKmgQ72Z405O
	QNLVDv7uKCiS1FopBRci0+xhapJ5+p9N3RCIZsuGIO28hFGTsIkINfOE02rTz32fbLF0IomSvfUPm
	2wOA2DSgIvl9oWYF3Uwcn7c0DzdQqf/Wp8rr4LLjX8QIeKZCQGSHbqOj8RgGDSCzjf2kc6jUfjewP
	Oaw/FCrVaQiwFNY8nER8TODb6hbsjXNxQyWPRMEDB/goexEhNozgbWLiATavOSCwRD09NgXdas98o
	CjSAScpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Cm-00000007yua-44g2;
	Fri, 23 Jan 2026 01:43:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Cl-00000007yu0-2BK3;
	Fri, 23 Jan 2026 01:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7473360018;
	Fri, 23 Jan 2026 01:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFEDC116C6;
	Fri, 23 Jan 2026 01:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132598;
	bh=tkthldLffXYVms3wxAD2lbP6j9gBgsHsKO89SXCZQ54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uLcTcLran58oZgank16uYJiybGF0GSvNw1wlsmWRmd2bHG458ZEJRs/yn95lUTUKG
	 jEgHvG9TzAM/JYI0kmiLz15iIoqy0S6sZ9z/ThLHQv7bczkT6fKcfvUI3QsbORTAb9
	 A0Dk2RUgIfp49c65Fm9UqVoQ6Fv1uZeLhZUmXyRdVELn9iBbrRIwONnxLVpv5m1tRw
	 GZMADfi3KLM8zVKcPRtppjOtsOluIS++kqv3uyPT2iqth1PCHtmU/u3H1QVBOXCHl2
	 wfSLYrMb7yh+PQ5uKc7HTb7EC9qzbyDuHVlL54NKF6YfziHvdQy6oC8Lm2sKIEe+MH
	 nUY4sL2MTrtWw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
References: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Drop __initconst from gates
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, Sjoerd Simons <sjoerd@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sjoerd Simons <sjoerd@collabora.com>
Date: Thu, 22 Jan 2026 18:43:16 -0700
Message-ID: <176913259630.4027.12058255654210765589@lazor>
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

Quoting Sjoerd Simons (2025-12-23 04:05:17)
> Since commit 8ceff24a754a ("clk: mediatek: clk-gate: Refactor
> mtk_clk_register_gate to use mtk_gate struct") the mtk_gate structs
> are no longer just used for initialization/registration, but also at
> runtime. So drop __initconst annotations.
>=20
> Fixes: 8ceff24a754a ("clk: mediatek: clk-gate: Refactor mtk_clk_register_=
gate to use mtk_gate struct")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---

Applied to clk-next

