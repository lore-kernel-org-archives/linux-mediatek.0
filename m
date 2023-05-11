Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B6AC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D78NZFIyG9cTjRHg49tXEf4K+BxuWLjB0MhRWS4xmE=; b=v/f9J2H52W/LvPWgo5IjT6xh+M
	/5p713nUh2/estiRm1XCmLbkycHsc0h91ObZTN4XWeTaeAUCPGiDZzu+YfqQn9KVjtRoq09TWexVx
	bRrKaGeDn3IORZ2zUiFgEJWoNc8VJagRz9aYWfqXe+HV1KOr4OYyKGrekF9ebpEz0SiVHzDSCAYsX
	f5efCdBf5oBxW4WqK1nb/zROc2261c2DVpA3d6LWpikscTySXd6jJv+Y1YYVHxd7nF0fYcbGzlatV
	ybsXBnsYAz/EPyWByOuXuFQuodwk7g3zb53gVjHNLukmB4b1gueRrtAlJ2UgmXVkbROADkjkjgjxe
	rECYxiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEv1-00ACsV-2t;
	Thu, 11 May 2023 22:37:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEuz-00ACrQ-0m;
	Thu, 11 May 2023 22:37:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 619E565228;
	Thu, 11 May 2023 22:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADDCC433D2;
	Thu, 11 May 2023 22:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683844667;
	bh=+D78NZFIyG9cTjRHg49tXEf4K+BxuWLjB0MhRWS4xmE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LNceuXEs3YJ/BM9/ZeKGTCnwt2V1n/VFVwM1GOOT+pRx8Jf9wscrAqwTj/yh81exC
	 CVFH98y0ClXaApMBqZbmjlRBCp2+5t/v2WkkmpzCWUyz41EMcg4UwyrGN/uXf4H+Tf
	 3+1eKv65w6Fc4cSVaR+DMFgduf3ELmaNoULr49Svan9i2eUIsMVZgj3WygJnpEjNfp
	 PCia0Bv0Qpej5ElOPrj0wAcf2OM+Dtu7CMf+3ZPLv7kgVlNWE9qkCIZUZyHkljWprr
	 fsJN6fecyaRUyKevsnMySmDkh3zyfTUxDrJbCGt5ZwvIizy0bk3IFCk7DY/uBKkntu
	 E7rb0olHklYXQ==
Message-ID: <ead66129a75a558badf81b07955b7cec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230511092654.6d8fab41@haoge-QiTianM428-A376>
References: <20230509021214.17105-1-gehao@kylinos.cn> <b35458250af972d95c708792633c9a58.sboyd@kernel.org> <20230511092654.6d8fab41@haoge-QiTianM428-A376>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to avoid resource leak in clk_mt8173_apmixed_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hao Ge <gehao@kylinos.cn>, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, mturquette@baylibre.com, wenst@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Hao Ge <gehao618@163.com>
Date: Thu, 11 May 2023 15:37:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153749_344878_5C695FEC 
X-CRM114-Status: GOOD (  17.00  )
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

Quoting Hao Ge (2023-05-10 18:26:54)
> On Wed, 10 May 2023 14:18:08 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Hao Ge (2023-05-08 19:12:14)
> > > Use devm_platform_ioremap_resource to take the place of of_iomap for
> > > avoid that we don't called iounmap when return some error or remove
> > > device.
> > >=20
> > > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock
> > > drivers and allow module build") Signed-off-by: Hao Ge
> > > <gehao@kylinos.cn> --- =20
> >=20
> > Is this v3?
> Hi Stephen
>=20
> yes,Perhaps you are too busy,I have not received a response
> in the future, so you are unsure about the status of V2.
> So I adjusted the code and title make changes smaller and
> sent V3 for it.It is precisely because of these that I did=20
> not continue the original mail thread.
>=20

I'm waiting for the usual mediatek clk driver folks to review the patch.

