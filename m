Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEA8C636D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 00:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O17TpLv2rzGcV6KNEtb8pOubHSD4IJycA+cYnh9UbG0=; b=Bu9xk8F7iomSed2nmAptFzdYRd
	1RZdW4FOZ6PODL+ON/enEcga06S9oYMh5j8hb5hQNsn0N7Vnj8QLqo5SPnqzT0W+mxpf6wp+yTJQM
	rznKSLbV+14/gKFopu7YrpuUFtQwyTQ6hlCIPkTkAnXh3ARXqjEQ416NJbbx517n4tZxnzCHTFWB/
	kmTYnHQqQbyudDV2t91nVWT5S1Vi20D4MMWHw9fLAwrV3XukhvBk9k/coLiYko5n4c806F8YL9Yl7
	8h+950RqTwCpEKNCKWe75ikq5eSF8WJVP7hKgICHlDft3RXF5AL73k3yLNMrkG0Y20dn64mn8DSRR
	IiDrnN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdSr-00857j-T4; Sat, 11 Feb 2023 00:10:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdSh-00856C-Gz; Sat, 11 Feb 2023 00:09:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1AA4AB825C8;
	Sat, 11 Feb 2023 00:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8CCC4339B;
	Sat, 11 Feb 2023 00:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676074186;
	bh=JpPrhT2vVnzQiP5rBpSlpuo4AwVIj10bAclyrzmf5ZY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=St2jEyoVlTE9fWjmGHdkRP6Z4gRt3kLUhlK4ikBJ55rY1bbo9xw6YizY+t/Dpz5bk
	 XB+nhdGs/1HoEL2G5B5OvwMm1V8fc20X9d4jQ07v/oB70HXOGkGqdeShy1hdtk6Juj
	 AqfLv5fJk7FfpGTR8tUL8KPOq2bWnX2JYjw24jsjkgcK8GduQBvf9Wra0HCkitIS41
	 jOcg4QAhejNkYaluNlJiATWycfZ/8bIuVaDj8Wn0TeclkWnMs0OGMC8h1OlC2f3h2y
	 GqTI1h93gUO3rrXdJja0eutqxEnHEekLHk/m0fI3/FIOLLzMqx63aNkkSacgUQYCuG
	 OkapB+G9uoOXA==
Message-ID: <b112829214b37d53846c0a4588dbcfe8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGXv+5Eo4es6XF6m9LQDhHdrFs=18_S-VGGvn4wQF1KWmzGcEg@mail.gmail.com>
References: <20230207014800.7619-1-moudy.ho@mediatek.com> <20230207014800.7619-2-moudy.ho@mediatek.com> <CAGXv+5Eo4es6XF6m9LQDhHdrFs=18_S-VGGvn4wQF1KWmzGcEg@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
To: Chen-Yu Tsai <wenst@chromium.org>, Moudy Ho <moudy.ho@mediatek.com>
Date: Fri, 10 Feb 2023 16:09:44 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_160951_737197_568A766B 
X-CRM114-Status: GOOD (  12.29  )
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

Quoting Chen-Yu Tsai (2023-02-06 20:29:21)
> On Tue, Feb 7, 2023 at 9:48 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
> >
> > MT8195 VPPSYS0/1 will be probed by the compatible name in
> > the mtk-mmsys driver and then probe its own clock driver as
> > a platform driver.
> >
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>=20
> Stephen, could you pick this up for v6.3?  Otherwise we'll end up with
> two drivers targeting the same compatible strings.
>=20

I applied v6 after fixing it by hand.

