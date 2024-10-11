Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4ABD0EE12
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP4DXQKOKvv/lM32GUvNOJ+gYTLb7iWosUhQ3v2aWhM=; b=QmSJdBdne03zTNxQn8Jjj43Rkm
	Kw7NDzwOmYr9arH4Q2jELJNBPlk1+acZyA64qTtyleR3yNkXEoYJkGBD1hqhQYfQobjl0s86fYl1/
	xVgtInBjAJN5axxuxKYjdXLJwDYB1i3l0i1lbofntsQIf9CwFlDf4/5kd5ltieIVvONZUkCV6+NIU
	sSe2xXuuYAE5tjyjYuTBPODTjtGI4KyGx1DGhuudi6eoRv0ZtfQ0ADRYE/K/+HN71sdVQ0kYZvjRt
	PMkQPDz/+O9fvLxZ1afewN8dIVeomr5JwURQQ+XNhjbZtwm6MbjV/+qJwmYDp8if+bQAy/prmSdvW
	6aWSDeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szJ0l-0000000H2Ow-2KaY;
	Fri, 11 Oct 2024 17:01:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szIyd-0000000H1w7-2btK;
	Fri, 11 Oct 2024 16:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11CC8A44B97;
	Fri, 11 Oct 2024 16:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E9DC4CEC3;
	Fri, 11 Oct 2024 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728665934;
	bh=Z1+E1JGeVbHwFfLhXSVM5s/2nmC9ov0l6GX58bhyPrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtsUMn7XTiN63YG35ddYTaNvjY0tQG1iQePfIoXL0FZI+zQlUs6ToKaiNXAptWVfM
	 HKCt722/vxWK+QUka+ZKvzL7U5tuF2HOgxrPY9fg3AMHEIQLc91VWsztZbNv4CkTip
	 6peTxbp6Klku0Dyigz0yx5PSflyLRSO8mzC/hM9/QAqhYpAhMbLBtLQJOlucYOo03o
	 VX5sULcYfxYJAZEqLjJF0eHyoMV03bTwIj2Umni+pHzm8vxWDPIaBTdk+vcLoPQeOw
	 TcKZEZImsLBpdnI6ObhTJLOsE+e2dOZg/lWV2EhFxqg8VO58vwc5MDzi7KcAWuMzDr
	 5f2+r7OPgtq7A==
Date: Fri, 11 Oct 2024 11:58:41 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
Message-ID: <20241011165841.GA2504125-robh@kernel.org>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-7-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011120520.140318-7-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_095855_745878_AFA13614 
X-CRM114-Status: GOOD (  11.23  )
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

On Fri, Oct 11, 2024 at 03:03:51PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT bindings for the MT6735 pin controller, which consist of macros
> to be used as values for the pinmux property. Each macro corresponds
> to a unique possible pin-function combination.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  MAINTAINERS                                   |    6 +
>  .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
>  2 files changed, 1154 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

This should be squatched with patch 7.

