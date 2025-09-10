Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43297CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=; b=U8qUOlCk8rD3x43WQ33+y62E6a
	t0+7wwz/BqKm1cdQbdR5aFfXSNEAQs7a2gZEQSzL/AVq4pl/z1s5uoiEc85C3tXF5bXecmowGPYEZ
	I6vPmqoe2bvgZkhxqHQg/VVPSQy0/qq0ouifJkrH9+ImuK2x9NQHnhpfoC9WyAyJGmYkjnGA1tdfr
	rVf3c+3q4K1SsoC8qBVj2IS+ESUfLz6N679bZOd9tfHmFpXR6xI5bDW/a1O1KoTMjRqMyPPpCuaUi
	/1I0nSVG4/EGTQTWbpHnkco7tVdwOfpYYqH3V7uEXNyMrmkXgf04sj00PqlG922+s0vPgQyjKTKHa
	e82un/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGX-0000000CYsq-3nIM;
	Wed, 10 Sep 2025 07:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGW-0000000CYsD-3yU8
	for linux-mediatek@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=; b=UCWYOpO55pvcSWDdwz+B9pVs2F
	BmR2+8bAz3nfV/5YhoF66Yc20Wu0jqiBOhPFuIwXxTNh1F0trvMjfImMQgk7HQTrZpMq3fQZjkxt+
	SvssjoNELHWt8KmQYemCGPlKTFoCdKuLJkK2Evu5XjSLin7QBBCOgxTzgjFWCVUcBPCu4xJnyawpB
	6wWFhqNdwpg/kYmxZ0fDkt6/+YgS/mIuyvsh0rOutAqjTNBNagM1W8iHlgR+VLMs7iHSPlgGdNWTl
	zfn6SAhDstE6XSE2BoDuiBC8RkTXBTAxANBFA0ReMtE+ESOP0U6ohqTKtExJxZxbc8TQnsS/Ej6cC
	2GYVA2oQ==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGU-00000005lGY-0Ynw
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 07:29:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f98e7782bso483183e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489352; x=1758094152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=cN8QsvhKILhBU7aDpexJCtKHBnzhf3ViXym34VfmTNzXZNmDkInQ4Y0Us3b8Nr8LLD
         4Suh69d3kMCBcQ+EB9+EBDuFAZLIQOqRDjAOHskyj+Rqt5U9xWdvRsdwkRiceaZyg1Oe
         84LYJnhoRAOINpDanAaEg7rPstx4GxgkRkWgFsduIt0C+04SEoBNg2yVAYL/8RzO4Fg6
         ZOuvzbq4uQAgwuCgNPyKR6/oPdeNGcvKAm1Lp0MH4DRzkWKdNv9/cEz5nQHJLzPMIqsm
         E4Gtw7Zld+PWCqnVolxKTfrJk7IAk2kzTp82NrFcGjrey8V9adE+yvkQMMtvebqoaR3e
         9unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489352; x=1758094152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=UTnjU87/HcXfmuZS1vJspU+T58GKnOpvjUk4M7B5sG84+uG79sSEn7T9zxHCqbA4PS
         AbSRZv2NiUATEkseHn+KldoidkwemAeTOsd94yVhk2KAhgrrFhormji1cvSTwC12Jxa5
         m3Wx1BltC/BCqF7/wTBSR9ccnp7doM9pJgwMsV6Pg6TGv//x+mBIWXbCt7V3fv8PnwHW
         BBg6XPPqnYk9Z7d3eNjK4H9IgHcCWdvG17RMmvDyHIHHl4sK013avgID450YbWI+UbeW
         BRH0wK9N5hDNMCL40sYalzcJ0xeYDuYL9qzgEJTNksFRKimG4MN3VYn7PcDFy+VdJDvW
         lpqg==
X-Forwarded-Encrypted: i=1; AJvYcCV0oByCsNXahyGMMuE2jXu3QtMZV12l3tiUsoxVj1OGFSM6n1vXkMY3h+AREBZiIyRUfDtOkYPGaWUMOEHS0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyHGFuZDZTr51QQeKrDzjeIynuqf5KcPbFRwMfNYE/e2cG9gRr
	G1c7yg21pcv7G0gt06aEOpzJ4OxyvE1x+/oadOUTEKamnRQLjcCd93R1sdRD2PH8ZKcs2S+Dokn
	WZ9Judwdlo1GsAbWOPdJPpiOfzOCPlirYzGKnNp1alg==
X-Gm-Gg: ASbGncurSxZsDY2YJclbD2p9xf1zuDsZ3wZWP84+MWX4/GKZLL9nurYVkM7iw+6XSZ/
	Bl72fIR4kdC/voQ5TwJtrInyesz1zAbEo1hgxoUaShwYY2k0OuXdEH++gz7UFk1SkS0H4mxCTac
	36VsjsCWUphTClm8cbhwnw6b8wMNjU92ejE0sYuFja4FMqKUfzxQLL0Kx31poMt80mLtOD9O/eQ
	vXJcf171iesRFZo/kSh7z4hBg+GsJxsesWvLiw=
X-Google-Smtp-Source: AGHT+IEqPJ9kigcz2GLj3mP+JOGINamypRE0PiCaaHlUwxbs7HlrGNQFZsWt9jHWryRE9N3BOTU+Nqgodo1ymFIXUx4=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr6704484e87.7.1757489351780; Wed, 10 Sep 2025
 00:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org> <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
In-Reply-To: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:28:59 +0200
X-Gm-Features: Ac12FXylJ9GUUlvsjAHDZW0ZjH7_XucWxGNpk3CSzJ659744jxYcf8C0LoVlvQM
Message-ID: <CAMRc=Md1kLjELc48-fvjsgpZH+t+kE00v0uMDztubooM_AJ2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_082914_351988_655EEB67 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, Sep 10, 2025 at 9:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> In case you want to take it
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Otherwise I can take it via my tree and then PR to you.
>

I would prefer to apply the whole series directly, this way the
conversion will be done in one go.

Bart

