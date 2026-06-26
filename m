Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B15C43327
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4vDT4EEZn6+2WtampBAadESwOoT43cMWLomjnlvLJg=; b=PC0mcZ7HKphref9SzkWH6rKD6V
	Vq6StYWeoqLTJSwhy0Fi8+hha5ggGbc2mjrSkKVXhY0CTGsDqK7BfIKJFwUq1U6oFdP8sQfEgCu4F
	pC10r5YIOLXK7nIUAVGZ/zguNO9GauBgzHHhzpPuj12TqXL30MBqxetxb3dqdAEmpJlIjVSCHgE75
	s95rIoJ9lxLXjVDW45S3iF/gN3YumiLNVKJH6khnU89lQxDSUEShZPbLLw5ragvaz+ZI/CcqULlQe
	tf4DLU8HfO/Ejas1BtCUmhWfm5wisFJnmQ1Flq9jGGqim9ILjAv4gZSKf/+hfACEUQu2KtQBZNJ5K
	sy75p+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6R9-0000000BMKS-2gmL;
	Fri, 26 Jun 2026 13:17:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6R8-0000000BMKG-306R
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 13:17:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8602600DA
	for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 13:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7761F00A3F
	for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782479857;
	bh=A4vDT4EEZn6+2WtampBAadESwOoT43cMWLomjnlvLJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cVDfBXK1wi6sHolMrytW/EODPOA1l/owd9gBTTKRIYXOCo/gww7kswoB5d0AqptLL
	 kdZvipirsxhGODtRWARvvUjKBZjQZIZhlQSW5b/iknOvjsy7mV0GsUj3eRqlky49TJ
	 VMax3fOdEQvqP2nFB9Y1cxvp8JYEKg2WI98hMMz90Yc6XwDd8FgasAtKx28u8NLSLD
	 oNlBLRyCiKtak8tkdiWBASSnjXQLeovB0UkeREaHdWg2RgkiANkAM9UdHrUpRjyjon
	 HTbwzFIO9wrRc/KqKEwtnyjd+tutcI2wNZjVlvxHPxsihab+3+ABDR6Jwaqg9OaULN
	 zsNDuWsVvucNw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39acf7c6d59so8580301fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 06:17:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvPt4XsmC19gif6Fs6Im+cH5pUh6BduxI5i89zlHzQBf51x43yVrL7BaS5nly39UkUo9z3VrK1P2VzmEwUDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxDE7eU9jUsAlu5p3S23znBOL/hbCmd+jNbC90PSJDLyXlj/B+
	hKNqHf49epoD0xtRc33BQPBcbRidxVBp9EG2uMaLW0TqifhHRBLGVQgn/VMx8u+cRN1P0lDg+uW
	rcSYlYUKvsRxouJOQygen2YTffJqYAk8=
X-Received: by 2002:a05:6512:838b:b0:5a3:ff6b:cb5d with SMTP id
 2adb3069b0e04-5aea1f48ce2mr1706345e87.19.1782479856436; Fri, 26 Jun 2026
 06:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 15:17:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkD1MPDoHwRZKdjXXdxrQQy4i0ng2vFeRzOt_KO8b8jow@mail.gmail.com>
X-Gm-Features: AVVi8CfW5xfvvAY8G8GzrRwn7wrX5MX60w2BIJRfdRQUnR88TG5fMqB_kg5azE0
Message-ID: <CAD++jLkD1MPDoHwRZKdjXXdxrQQy4i0ng2vFeRzOt_KO8b8jow@mail.gmail.com>
Subject: Re: [PATCH v4 00/32] pinctrl: mediatek: Enable module build support
 for all drivers
To: Justin Yeh <justin.yeh@mediatek.com>, Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Justin,

thanks for your patches!

On Fri, Jun 26, 2026 at 6:01=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com=
> wrote:

> Sorry for the quick v4 - v3 was sent with an incomplete cover letter
> (template placeholders) by mistake. This v4 also unifies MODULE_LICENSE
> to consistently use "GPL v2" across all patches.
>
> This series enables all MediaTek pinctrl drivers to be built as loadable
> kernel modules. This is required for Android GKI (Generic Kernel Image) +
> vendor_dlkm deployments where vendor-specific drivers must be kept separa=
te
> from the GKI vmlinux.
>
> Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros =
where
> missing, and changes the Kconfig option from bool to tristate. This allow=
s
> these drivers to be properly packaged as vendor kernel modules while
> maintaining the existing built-in option.

Two things to fix:
1. Squash all these 32 patches into one, "one technical step". We don't wan=
na
  have to revery 32 patches, if this doesn't work on one driver it doesn't =
work
  on any driver.

2. Consider this Sashiko report on an unrelated patch by Luca:
  https://lore.kernel.org/linux-input/20260621083053.A3B641F000E9@smtp.kern=
el.org/

----8<----------8<--------8<----------8<--------
[Severity: High]
This is a pre-existing issue, but does mtk_pinctrl_driver in
drivers/pinctrl/mediatek/pinctrl-mt6397.c need a .remove callback or
suppress_bind_attrs set to true to prevent unbinding?

In drivers/pinctrl/mediatek/pinctrl-mtk-common.c:mtk_pctrl_init(), the driv=
er
allocates the pctl and pctl->chip structures using devm_kzalloc() but
registers the GPIO chip using the unmanaged gpiochip_add_data() API:

mtk_pctrl_init() {
    ...
    pctl->chip =3D devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL=
);
    ...
    ret =3D gpiochip_add_data(pctl->chip, pctl);
    ...
}

If the driver is unbound via sysfs, the devm_ subsystem will free the memor=
y
backing the GPIO chip while it remains registered with the core subsystem.
Could this lead to a use-after-free if the GPIOs are accessed after the
driver is unbound?
----8<----------8<--------8<----------8<--------

Well now we will unbind the driver by rmmod as well, so this needs fixing.

Please prepend a patch fixing this to the series.

Yours,
Linus Walleij

