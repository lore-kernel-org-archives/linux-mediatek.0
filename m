Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F0BCA1013
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 23:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfjSYheYrlVR0uqLfVkFYD26bK3rG/XlSeZtdEtGwIw=; b=UfAa7sJUKpMqIR5GHV7wq1g2yO
	m6tv6/0oje6lmoLRfrkrIr2EIY6kH+a6qNG0N5xH2qKn8NbFBtL7r4Ro7KZaHChgv048OZJGRxbtg
	PVtuFUkdr1c5qwxiDbBBnmgXWE6g/a6mVGEEUoXAlzHcLW3uIRjFnj7XM398708FXenPg8//bcTRP
	yflDlL08C32z4lkhlxMW47Da2UXLz60VN3K/1QMvcKuFY9CsMhHV5Kn0OelNSc0EUTmXvwJWRbdAT
	I/MFvtFu5YDAbSnZf1kAE56cBPgm8TVdI5rVGq+/Sw5vYNZMKPMuMHfLvULJyYHBDEyBar0QnoreA
	r03VMJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOOv-00000001St8-30Xt;
	Thu, 18 Sep 2025 23:50:57 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOOt-00000001SsP-3eQi
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 23:50:56 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-30ccec59b4bso1096360fac.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Sep 2025 16:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758239454; x=1758844254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfjSYheYrlVR0uqLfVkFYD26bK3rG/XlSeZtdEtGwIw=;
        b=eg3uFgQZ3t84aZl8ulL51SQLAS+yVnCfS9U5EWy6q9J9hmhi65Tu70B5Hu9GMlc+Ll
         LmweggCazn9wDL9tMKaDl+qFf9BaH01+9XAxx+sfx30Gh1fvhw1qQIyi4eR9vOkV9/ml
         lVkRZGV27y+o48MquXcJo+EP9C6G9tNFflZ4KDHzKQ/TD6+e+MsMlGFtYKcHocCpL4JS
         eQqAYRPuwy6tfWsB+JbGek1wnukPykl040JY4xXLmH8FzjoV2CSm5j6CZT69bJ1hflrT
         rjfa2bycDJ8P4zloyRA/TmSGYieIxGwfI1XS1dGHZ/lvEjmI0mJl48WrPxeHOsH3F9Yd
         PTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239454; x=1758844254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfjSYheYrlVR0uqLfVkFYD26bK3rG/XlSeZtdEtGwIw=;
        b=C7DvuznmXnAPIkxKfLABD2f5Xs/uSnvFJ5sHwmNJBCXdQqlumLdNdM+8kfzVnjNxyk
         X+GCMlsJNyR4y0UoRHN5sV00KVwFgsqSvWrWGJwFuR02rEVQWoDjnuSLudLqwiKfWZYB
         9Q1VIaD27eeDbvneXbon9iYyN1CUyuJZvh37GPb1av6goNRrjC3EVf57YR1KaCcQEK3Z
         uqqtFiBWTiLOIZdsFhfOFwFUBuC/3a5n5EO7J/eGKlAuNk8gbMx1xleH2j+W2esj/wN6
         ESfVjk7LsaOSD2wsg/WQ9J3mEmYI+3aTQ0BWBSNvm5nAHdAg2MFXpUIljD3h2VP0IU0z
         8INw==
X-Forwarded-Encrypted: i=1; AJvYcCV4pNnWEr5Ra+iG0kCZU+D8nhuNlQ7U0E1huOEVctbn6eUeTVz4cPHMKK1zzc+6YgRu2V8j6S+Sa01Ak5WdMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoy/m4Xo+FrdguSA0xPA9UisL0cYxU0Sxo2tYPW2l6UbikTlA9
	Di0gFR7XCIR2pXXx+SlGwzRZIA8i01u1CkuUQhbjWxOD70nHYPqUXeIugxP17PBSEwoN9qMElxG
	uz4h/hYeA6b9zt5JfK7y2KyOIjDOfWus=
X-Gm-Gg: ASbGncvb96NHtTGPtbqCTyNT2LSrPLfmXfEYIaNAdV9wPBqmsC+11utcEe/EzKYGT9G
	/Tei2cKgJvYQT4svpkyJdMHJB4HZbWOleAoHHdJ9kI9IgWZSviIsms8kSxuyhV5K0vmIpJDrSui
	mmRx5Zh/GcMF9CJMLDjo4CuJ4bVJRU9CDw8GVsJAyPjBBNRKfY/FJJY3FsOTejTZjvojU5iBQ1P
	WYy2pcI5jggnUHJ7fO35u5MwYs=
X-Google-Smtp-Source: AGHT+IFl61ezr6lGg9Y8huzd4lUuItQQFeCjeYkcbAulR0oeCohvd0FtJ04m812XYlXTYo+4qdyMj6+Phytv0CLbQXE=
X-Received: by 2002:a05:6870:c151:b0:31d:8964:b4aa with SMTP id
 586e51a60fabf-33bb3ab9686mr861868fac.6.1758239454270; Thu, 18 Sep 2025
 16:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com> <20250822021217.1598-3-jjian.zhou@mediatek.com>
In-Reply-To: <20250822021217.1598-3-jjian.zhou@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 18 Sep 2025 18:50:42 -0500
X-Gm-Features: AS18NWC4m9av00lwavoKLMq8wYvsb2rbN1xJZakR6WVpJIjFSlMM8j-tfAib_HE
Message-ID: <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165055_916313_D2973A5D 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek.com=
> wrote:

.....

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct mtk_vcp_mbox_priv {
Maybe 'mtk_vcp_mbox' is a more appropriate name ?

> +       void __iomem *base;
> +       struct device *dev;
> +       struct mbox_controller mbox;
> +       const struct mtk_vcp_mbox_cfg *cfg;
> +       struct mtk_ipi_info ipi_recv;

Maybe also have "struct mbox_chan chan[1]; " so that you don't have to
allocate one during the probe.
Also if you have  "struct mbox_controller mbox;" as the first member,
you could simply typecast that to get this structure.
Something like "struct mpfs_mbox" in mailbox-mpfs.c

....
> +
> +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox=
,
> +                                           const struct of_phandle_args =
*sp)
> +{
> +       if (sp->args_count)
> +               return NULL;
> +
> +       return mbox->chans;

return &mbox->chans[0]   seems better.

thnx

