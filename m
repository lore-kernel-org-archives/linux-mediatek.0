Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79098CD98C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 22:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62bFE+9EiC4Wl6sR/gNVDtGRVBnRqEmz0YnELUX+5Xs=; b=tQxXdqI7ziSvM7z3HcFzlWlRxn
	l1yEYe4k3ATLyFfcxFXt3lLoENG2hWv/lOdLGG48OhQnQxDY2FRgbdydG4dJLs/Ja4zIj7iX+mSBb
	Zyth8kdTa7s0VvIyFfVzjA7apVyXh+PxORocqjzkO8MCNpN2RV/m/YEOlQekA0A/T8Z3cTFup2dUL
	wSrXKraPO2UNeL7TpI1/dvqc0rs12h9FfqE5KswnxJsNXsv9MzeacFWCVf+EqGik06vJgdJ1yhdZV
	awmMHKxnEOSXgUsKiMlVQ5b26FabUcms/7wv/MqE6Kh3d6FEDmBPCE7Cy34FlWnyYuYH0Px0XSaQh
	mSZSHp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRdu-00000008QA8-0yq0;
	Wed, 10 Jun 2026 22:43:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRdt-00000008Q9p-0LtL
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 22:43:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4246D4463F
	for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 22:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081DA1F008A6
	for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131404;
	bh=62bFE+9EiC4Wl6sR/gNVDtGRVBnRqEmz0YnELUX+5Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GCDhfGUXvvVNHLXhr3frkjO1Rp4OtsKp0qM3R31fePjb//IULavexvDmNUUwA04Ub
	 Dzlzh2pzRTGy59f+l+FcFl6Yb7JHo1erepIH9ag8J/kku0Cip94/n/lnMR10AXod+E
	 Eo9yh0/1Iz8nn2Z2avr7KPAgjzoa5BEPnlspQTzlg3rKjx1wz7yacqY5QAT1hJvXmc
	 p+h4mmaqYQXlAywwxh+PM6aAWHmctdeOpMdFSOJmYCYFWVtcq+mLZQz8SbOiIU5i+B
	 W6h3yZfiZGrVAGQ4KxdyXBJ5+NYJjpIS11ozMi8kHTJQg+Iz/vEkAJtdxm8C+VNjjZ
	 1YzD783Gy0FgA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso13150022a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 15:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GrMJWQde5G0XBYPDC7x4JilDRNl4Ddssi2ga4V6EnZC71oMENbCXN6QY1nIv8fJCE8tcvgg6xErPPobZ5YA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8U90zAOIF1j7dflOHcjRldEQnA+9R4lRqiryJF3W3DhbZaTt0
	ifvgtWdhHoFlwJmnkV75poy2fkkXXIb8UUiWqRsLzeC4NblXogLUFpKhaOtalw76gnXqYRHMTK6
	mX4ckkWeRiQ1EmzP9o1vuD30cHegpWA==
X-Received: by 2002:a17:907:c28c:b0:bd0:df77:98bb with SMTP id
 a640c23a62f3a-bf3702817fbmr1479114866b.9.1781131402612; Wed, 10 Jun 2026
 15:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260609151212.29469-1-ansuelsmth@gmail.com> <20260609151212.29469-9-ansuelsmth@gmail.com>
In-Reply-To: <20260609151212.29469-9-ansuelsmth@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jun 2026 17:43:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
X-Gm-Features: AVVi8CfnalHGFSDJtFBoMIJ88H-i-Yw1YCOHz7GBxBm4GdczRrsSV4xJzXraBNE
Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support
 for "pcs-handle"
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
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

On Tue, Jun 9, 2026 at 10:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add support for parsing PCS binding so that fw_devlink can
> enforce the dependency with Ethernet port.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 136946f8b746..e6584a2f705d 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-cont=
rollers", "#access-controller
>  DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")

There is no such common property "#pcs-cells".

>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_interrupts, },
>         { .parse_prop =3D parse_interrupt_map, },
>         { .parse_prop =3D parse_access_controllers, },
> +       { .parse_prop =3D parse_pcs_handle, },
>         { .parse_prop =3D parse_regulators, },
>         { .parse_prop =3D parse_gpio, },
>         { .parse_prop =3D parse_gpios, },
> --
> 2.53.0
>

