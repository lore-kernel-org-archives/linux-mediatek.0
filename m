Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A28C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxWYFypKe8y01eo76tZUt9hvhCGD0P07VdmXzqAFk9k=; b=hrMJ6+KDyQgc6wz3BAnvRsFgyY
	xraM61eKHDvO9rtMjaj0MLJf7qN0fBr0vimGSBcI1WkgFkSO9JipGgNvpnxaFTTcB3C3pQuS+4DXK
	SEca4dFs1CDHZ8qSHeJf/+2bCSLMFTA+3chUXF9uidx1uruC9QOkfW2nktmIEx2OwLLcP63PUkgaZ
	jcI4jubdlMPZ8kpF/DBrfvsY+8eDtknyrARdyP/XjtiT51A+He1kbx6NrRZf2DwutBzr1Smu2+jQb
	LsXuSyL4y2TzL9aRV1583NEeXLRE8NpV6545+MKpzSLNgLbMTQd7+c1eWEErGI8AysKKRrckwobE/
	MuFJ8SEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWTW-0000000GpLJ-1AWR;
	Tue, 30 Jun 2026 11:17:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWTV-0000000GpKp-3a92
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 11:17:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CD9E43C1C
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 11:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849351F00ACF
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818277;
	bh=yxWYFypKe8y01eo76tZUt9hvhCGD0P07VdmXzqAFk9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pp/Vx9o7LARmVE3umUis2ryH3Qz50yuFOrvN1AuKqxQxVgl/uCM21huHARJce6fxb
	 vD+t07Qv00g6zt7be1w5gZz3ffqiNv1HQW7ipXiqStxNDOwenJwP7Gp5xDKaRSV4C7
	 ja2LSY31tZelA5olPHOj2jrJm5tluwq51U7wS3l83bjh7WXp9MGLiLFPKmKCTLo4As
	 /GlJnrlbMbJi3ziU0JrNCqZQ1DO2drar+VnBvf9MvpGud5XCoQ5DtltoC+KVv0AzAM
	 7fwoPnbmYaMZ+xi+HWaDeOpDpHwweSSBwn4n/1fKr8+Atl28omzYNCZIfOk/bTvw2t
	 7KKysrXAoyD+Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b27812c96so1728021fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 04:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYy7X7dY85X/hzlxBQy7VPMYWaI1DNyuDmojcjELjV9CI4Uwpw1riRsMn0m6/WgGO9d3DuFRY04x46Z3G8HA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuSfTBk8bUNwmqAepKx2sg2I/i6Bc+ElUIsdyKCxT97rUR1DT8
	DiCDqpgpaUeTMQcno07vP4H/VBb8XNVse2vJY+Vlg9CfxMt15a3pdxX8NUpRKEMQOvtViXA9lGi
	AApkTBnGcA3Tv0eg7wRtkePLB+U24vAY=
X-Received: by 2002:a05:6512:12c8:b0:5ae:b7ce:9ca5 with SMTP id
 2adb3069b0e04-5aebdb9f97bmr823000e87.18.1782818276164; Tue, 30 Jun 2026
 04:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
 <20260530145800.1029920-7-y.oudjana@protonmail.com> <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
 <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
In-Reply-To: <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:17:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmwYVGbfJk5WpN1kBJJ1r74Ja4JOfNB6iNdvDCAvB51NA@mail.gmail.com>
X-Gm-Features: AVVi8CdsW-ifP9tBu011_-zch5iumUPieAs3JkBwAhQtx4Bpw01RxsGY5oIOGnw
Message-ID: <CAD++jLmwYVGbfJk5WpN1kBJJ1r74Ja4JOfNB6iNdvDCAvB51NA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
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

On Sat, Jun 13, 2026 at 11:20=E2=80=AFAM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:
> On Monday, June 8th, 2026 at 9:41 PM, Linus Walleij <linusw@kernel.org> w=
rote:

> > > From: Yassine Oudjana <y.oudjana@protonmail.com>
> > >
> > > Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> > > also supports the pin controller on MT6735M, which lacks 6 physical
> > > pins (198-203) used for MSDC2 on MT6735.
> > >
> > > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Sashiko has good comments on this driver, look into them!
>
> Didn't receive any comments and I don't see anything on the mailing list
> archives either. Am I missing something?

https://lore.kernel.org/linux-devicetree/20260530155503.9A6C41F00893@smtp.k=
ernel.org/

Yours,
Linus Walleij

