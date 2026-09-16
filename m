Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C52C982C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=044CrMqm1hX472GyboH+P8q+RWHr3VuP6wQdlD4joxs=; b=p1C/u+2eNJvsEgV37cZj2sCYY4
	AISIpdO7RI/Jp2d8/JiBetBaoou5Ev82fadTcHRqsrOwwQzUYEWIzmorT77d2E6bpdCE5KYOsjbig
	JbGdmiT0MgCAXDGXRf/B/haeF1+xFINEN340MAJOPlGSRff1W6kWFCGZOz30giX9A+Sq1YwpYxIVM
	Iwf8hfIIV/YTKXcSDcvxpArs1hZD/W8hI0Z93xCafc3MEMQHogPWefxnWr2iyzAylxhOLU/wHuJUk
	YQgu2OMnQ3egNMGnm6De/BMUGEFG9vNdlY8zTZQFQ7iKGp/asryk3NifEpIhFJuTlkV/Oqy1ccHGj
	rP8iCogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sbe-00000009ks8-1xvF;
	Wed, 16 Sep 2026 16:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sbd-00000009krH-2A67
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 16:35:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 770626022C
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D81D1F0089D
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576532;
	bh=044CrMqm1hX472GyboH+P8q+RWHr3VuP6wQdlD4joxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ev8qH/SxBCpyuGF3HU5REG17ahp3YJOMTf5VMWq89VmLTcd29cME/my0j+xE39SBh
	 753CcdI1sS4+tA6b9wrI4PtI4S0Juz6E7sXIBeOvJQRwVcMP3knbNwUQOjO0aypvo8
	 i2Ah48QVlUpeykjmGRWTci0GzvQU8w1ZY9GoZEaN4zUkY07aA3+VjZ7eJL/jH2yZ4f
	 x/oA2Hr74NxP5/ed70hXaRmYNJhbqYxKPxjo2CWTAXqlUHBaJnUPY2Fu4Mq41e5p/0
	 bMZ6JEMmisL3sPEO14aYX+EVc6AkO0TMRDh1/7HE/WPIAE5whK0oCWO/zbmOyOtxrV
	 6VngY2T8yyjEA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2341844e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 09:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwn7lEGnj8VZK8dL9KqwLjhWA0HI4Cs4i/bYedTPgsNfl1+JdaNlebZcW4QwfJvkzzNGsEcW5bwPLlEWlxrfw==@lists.infradead.org
X-Gm-Message-State: AFuF++nzmhe4/qQDQf/wvbbqHXCnhUwxQF11UKKOt4vLSBh4mT2LqASv
	W/PBQprpoyE7wvGWASoXd3N/E5ByLg7DHQx9BmBiVYg95pqrDu7gH0Gri+siq7nQIYBzbKQqz2d
	sjX/GcfuTj0ozCD+K9GFAlz3pLnwC5QE=
X-Received: by 2002:a05:6512:63d7:20b0:5b8:9999:2f14 with SMTP id
 2adb3069b0e04-5b8ba5eba89mr50407e87.19.1789576530843; Wed, 16 Sep 2026
 09:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260723035823.2041832-1-justin.yeh@mediatek.com> <20260723035823.2041832-2-justin.yeh@mediatek.com>
In-Reply-To: <20260723035823.2041832-2-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:35:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=3YWAQsYZUTiRUpX_WOkeNYe5NdADwNeoFky+gY=OX5w@mail.gmail.com>
X-Gm-Features: AcwNN1VvaG_CTHc5Gx7LSXS7f1odDC4A4LezNnphRUFVM6XIRyS7EcYx1dfz_o0
Message-ID: <CAD++jL=3YWAQsYZUTiRUpX_WOkeNYe5NdADwNeoFky+gY=OX5w@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>
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

On Thu, Jul 23, 2026 at 5:58=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com=
> wrote:

> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
>
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt81=
35.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implement=
s the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implement=
s the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

This patch does not apply to current v7.3-rc1.
Please rebase and resend!

Yours,
Linus Walleij

