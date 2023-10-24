Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D649C25B6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fc3NKMfZoje2hmQNMCXwrEeKB9yHVquKxP4o2hHyQ+A=; b=nFRdHFoHYBwvYQEQfJbMomTufi
	ePnFuit1koqzImgrX3SgvEurlyMmLgEr3PnpQ73F+8dISe9N3TgLy31cXyVj6r3nBfQcYvIuhG9yu
	xtloHRklZEtxrNMkwvGzr/sWHrfVTSAUejrzbJgc2DgZjAtFwYZD5ivdYfyikjNEPF5F9WtwKSIu/
	usbaRqfz73xkUt6Z0k0Nlq8U5lNs7ecBmf77BjBdBVEKVkfYRm4tXWaEWyW7Db7ygUTrSVgcTwaK2
	u3jausnGw/b1VGo2rpabkaTsFZBOoFrJFNdlAgxfzgNV90+LSif2xqhgbGL1xAhZNMqZB6XF7VwAM
	KhDfBl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv6jp-008cYJ-05;
	Tue, 24 Oct 2023 02:01:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv6jl-008cXO-2R;
	Tue, 24 Oct 2023 02:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D1B19B822E5;
	Tue, 24 Oct 2023 02:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2750C433C7;
	Tue, 24 Oct 2023 02:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698112899;
	bh=fc3NKMfZoje2hmQNMCXwrEeKB9yHVquKxP4o2hHyQ+A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Pv5Cwg6lrfNB4MajdApvNEULjDz3t0D2/xLwROHqGAQ0KyWhnAq3U/HwPS07lav57
	 0RuuIPkEZCxv6FsT9lB1DD10IxtXfng+3fjyxJOAFuHJBhdrawOg3GJp6twfi1r0SK
	 ADO2tr3Smk5HojfVBb0dRqABH7e8ld9VsbBdRPeL8+TwSOZ7NGmVmjSH6IXf58AUiV
	 IzQzHFB0VOC90BRHf5tCREzTJhB5A+wR1rQj3Biykm1aXpIlgM33AtD2TWWZQQqHxj
	 ej7u+EDYAcEYkC/wnM8e5y8pbx8IxAvbzqzBM8GxULHDiQ3MZBRPhEOP1XV3vxcNBa
	 79E//dVbSaOgg==
Message-ID: <c113be74d0ad1a7c94d313716e2fb8bd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
References: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
Subject: Re: [PATCH] spmi: mediatek: Fix UAF on device remove
From: Stephen Boyd <sboyd@kernel.org>
To: James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Yu-Che Cheng <giver@chromium.org>
Date: Mon, 23 Oct 2023 19:01:36 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_190141_984049_999172D7 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Yu-Che Cheng <giver@chromium.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Yu-Che Cheng (2023-07-17 02:39:35)
> The pmif driver data that contains the clocks is allocated along with
> spmi_controller.
> On device remove, spmi_controller will be freed first, and then devres
> , including the clocks, will be cleanup.
> This leads to UAF because putting the clocks will access the clocks in
> the pmif driver data, which is already freed along with spmi_controller.
>=20
> This can be reproduced by enabling DEBUG_TEST_DRIVER_REMOVE and
> building the kernel with KASAN.
>=20
> Fix the UAF issue by using unmanaged clk_bulk_get() and putting the
> clocks before freeing spmi_controller.
>=20
> Reported-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Yu-Che Cheng <giver@chromium.org>
> ---

Applied to spmi-next

