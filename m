Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD886C98321
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 17:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Epk7UhZ5gcKRlHUrHbKgkjCtg/Lgn+z/n5ZSjQcdqpg=; b=GdSehssdwqev6Nf7lczBvJZKPY
	kWUB5UvaSc6+BfnCRzaoeQBaELTab62+5iWhQFXM48byka1jrybaU+xB4UWaBjSGXegnnnNfT/fOM
	w5w48ExIYE6sUDQ9xXSmkP3tLoHiwgz/YqgQ0Wqf21L9C04P5sJTHtDg6yxIR2flvxpqEej6Xqy8y
	PiBW01GvwYhaPPY8fHcQO6KAdWnjm9JuQHnhW0dn93ajW/MgxqqTFw0AQ0vKitYykJM3jRpiiaMtC
	wHycaxv68yYYF+UZ3DXN1qXvlWKKLqNPQduMHML7onXK9DDq9C0yk4MZw4LYJ9KOPHUghVxfetdUk
	lE1+EOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9l8-0000000E4Nf-2MkY;
	Fri, 25 Sep 2026 17:30:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9l7-0000000E4NS-3DJd
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 17:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31F0B444F1
	for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 17:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BF01F00922
	for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357452;
	bh=Epk7UhZ5gcKRlHUrHbKgkjCtg/Lgn+z/n5ZSjQcdqpg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y/XUqu531F/cGxWNwQZP2KG77Zo/WMA+a2WvMMRbN7BfMI9PrV3w2grWHN7FeDQ3P
	 V6H1WGyGtemPdDpa86l7/FirJmYdVcLZ0afDSQpWpcaagB9mIMo/4IimSgl+irC+Ba
	 7Uwoa8O/oiLOgSfajuan9d0VUnzxBFnHegatmVAc08ehBPOnl/k7CrIF5FSxYGlwcI
	 qbUaMkE0+tJgd54/hu7JN0b8vSKyHceLGyOzCKk/ZGOcik/F3I/rchZ8mJt16+4dqM
	 CRH8mXtTHa/HDfUQiyO8mONN560pa+TrMq2oukgjlnIkhq8Y4dwiri294Ymt7GhEjZ
	 1Q3lnD9Gbf4OQ==
Received: by mail-lr2-f25.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso11439121fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 10:30:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQTnF/tL74RHky3PQbOrq2y2gEPf7RSfut88QLXEH95FmuEG9sWD1t0apAK2D/Eel5D/79KL3B+uhZC5yjEw==@lists.infradead.org
X-Gm-Message-State: AFuF++nIEPuOAiBj9JMKKittFPhqzlTTbak8jkYaht51oi/iY3YF7UKx
	KLyNOPePLIWPcsK+trF0VlEofAlSzZz45lseJGul8ZXccYG2/ORwv1kWveiLTydhRl7wsry+Xwu
	8m0RoWabvgCH+aXDc6IWwkuklfBLBDGE=
X-Received: by 2002:a05:651c:b1e:b0:3a5:f041:d7c9 with SMTP id
 38308e7fff4ca-3a63c2fbe45mr14867181fa.22.1790357451157; Fri, 25 Sep 2026
 10:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com> <20260912191156.185448-6-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-6-sumeet4linux@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 19:29:14 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j49-yEYmZXm8-2xWzy9OV7-8dUEwMonzPjbscgGd+6qg@mail.gmail.com>
X-Gm-Features: AclHuK-XXXjTpNVDNNDdptaZZX-F6i5Cfcawa8JfiTGZUJ-XQXiTSEwpAEK52uE
Message-ID: <CAJZ5v0j49-yEYmZXm8-2xWzy9OV7-8dUEwMonzPjbscgGd+6qg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] powercap: intel_rapl: Use %pe to print error
 pointers symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Sep 12, 2026 at 9:13=E2=80=AFPM Sumeet Pawnikar <sumeet4linux@gmail=
.com> wrote:
>
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_debug(). The %pe format specifier prints a symbolic error name
> (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it fall=
s
> back gracefully and prints the raw integer value. This makes messages mor=
e
> readable without any functional change.
>
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/powercap/intel_rapl_msr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_r=
apl_msr.c
> index a34543e66446..46972ee1ff84 100644
> --- a/drivers/powercap/intel_rapl_msr.c
> +++ b/drivers/powercap/intel_rapl_msr.c
> @@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
>         rapl_msr_platdev =3D platform_device_register_data(NULL, "intel_r=
apl_msr", 0, def,
>                                                          sizeof(*def));
>         if (IS_ERR(rapl_msr_platdev))
> -               pr_debug("intel_rapl_msr device register failed, ret:%ld\=
n",
> -                        PTR_ERR(rapl_msr_platdev));
> +               pr_debug("intel_rapl_msr device register failed, ret:%pe\=
n",
> +                        rapl_msr_platdev);
>
>         return 0;
>  }
> --

Applied as 7.4 material, thanks!

