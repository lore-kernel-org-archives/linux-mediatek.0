Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B135DCED611
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 23:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60OTD2MYzHbySQtVtLI9W8x5SUpoFaHcLB1gvcDRzsI=; b=T2Z63oJcGr9/1gpbocXz2fBJKy
	JEKWMw4U4uRnVMmZ0QlVnflRiJjIab9j8Gt/H0ZN/OfrX6GVTpt0vYX6Un3l9viGIbWjOSquSzB07
	gXLxuSvakbz3xtcMuZ1CF+Yum2BBtLysdrB2E5ppTo7ckfExkWYyYMwAYNsDGM8jOdVdSjOAirE+v
	Y1cvj/EQ3kJnCWJwuo/KIX0nwFtYxfzVAw7zWod90LuQP+98prNlBNSqRJNzzMNAQLgwgAmbJrBGo
	R+D3mUMrLYF4uPiO5KM/MVSDhBR12tBfTOq0/4beg0/QBDefjgf1u5fxNcvgX4zFYcuxF07Tt9DKq
	O+VbMXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syg2k-0000000B23N-2Ooy;
	Wed, 09 Oct 2024 23:24:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syg1N-0000000B1sr-2IrU;
	Wed, 09 Oct 2024 23:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A1ECA43616;
	Wed,  9 Oct 2024 23:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5D3C4CEC3;
	Wed,  9 Oct 2024 23:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728516188;
	bh=60OTD2MYzHbySQtVtLI9W8x5SUpoFaHcLB1gvcDRzsI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=glHVVIm+v5m1Mo48+bDF583js/Yh11lgt/F3vjMAhGAdUExGqhHslSe4HoCoqDd3K
	 O4OZDd8bHshGgG+HdBvmHsDo23Q7NffX2FNkrH0l3/Q12nZnQwGBJk5X+H22AzUl2n
	 p12cQNAp53ZUL5ABDG7toWNyyeSfNYQa+FbSeengoRFIVvsDeaWk2H6+DDEnU4e5JL
	 f0sXW9NLonyh0VKGprfNZ9LeIdniKAQSjkS5/z6SsKADGXLdTYaRCuENzPVHtwBc8p
	 q6Q68Nz9ZimcebK1oM6gTRjAw8NBqm30EKS+OMMf2zOKwQrYBJ1oLjjwbPqggARnAI
	 LAKJe18SNn/8A==
Message-ID: <1b9e1d9fb4f803dcbed9abb75e56a0dd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
References: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: mediatek: drop two dead config options
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Lukas Bulwahn <lbulwahn@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 09 Oct 2024 16:23:06 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_162309_669590_9703BBEF 
X-CRM114-Status: UNSURE (   9.86  )
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

Quoting Lukas Bulwahn (2024-09-27 02:22:32)
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow
> module build") adds a number of new COMMON_CLK_MT8195_* config options.
> Among those, the config options COMMON_CLK_MT8195_AUDSYS and
> COMMON_CLK_MT8195_MSDC have no reference in the source tree and are not
> used in the Makefile to include a specific file.
>=20
> Drop the dead config options COMMON_CLK_MT8195_AUDSYS and
> COMMON_CLK_MT8195_MSDC.
>=20
> Fixes: 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow=
 module build")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---

Applied to clk-next

