Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC22DC282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=; b=Oi8rCuEZvrta3kjs7r8kpGfpfl
	sZyD90g3v5PBN6HCFRBCazU11yXvyocbylth8yLMABo/O/6JYl9Jb2uddeu8xqqZ6JPWKC4FS6MP5
	ujQZ9UvVPK1J5uQvD/Czg2jRFSy3PNKcZqTQyd9gcDyVLatkglhTNGpYtVxt81056fGYOYY3lYkCZ
	w5CiEyIpJSuCRhwvg74VgNk8WEHvELYQoP3MXXoQl1BfluQ2WwJ23GDj3pKkKV9PKp2VjqldWCeD0
	7wV194hlseZND1AElE57Zhhej5yRWzW+sjbmWwCUn+lUz8F/F8p/9/B1XGGYr76k0wugspzKicbqC
	xGNEcrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1q6-0000000DktR-3VXB;
	Fri, 14 Mar 2025 10:00:26 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1oR-0000000Dkem-2uhX
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 09:58:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-549946c5346so1998716e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Mar 2025 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946321; x=1742551121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
        b=add0PYZVoCHg1PPN3WRsurP8PRzgCbeIlryy1Fi5vhHOJPux9yNVNP/6lTh2nVuMH8
         VHedmFnrhIENnNGki+UGEvHZsIxQeGxQP2iydwzwow/sIKaGWqdzPJBk6sPo3/jddkTW
         2OWTpGK+EHxMbDYyMQO4ZqHuTEuyuJBM5TSk3wGtJwG/NVs07Dg9T4qqJ2H7AqCTPU6n
         GkA+9xdd61SRIgy1yMIsyF6j+N1jsVw1cv8bx99nFYPf81kPxQo8AKB4+uFeGoynQ047
         TDb6pzkynN+uL3RG3jvDL3ZkNWK48NKExbA3Q+gmOd/nnFqzMX3zY1bVWqMbrPckI5vF
         Ys8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946321; x=1742551121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
        b=lCEM5urdR4+/+Uqp5gbDCyqLEbryGZJUb5N84suPUgJvLiwT+3RP1lJUPN4TkOeS59
         6yrDmbNJqmSOdmOxO+qTan4O/hLXU3TnJTR/d7rKR2o/7YrhwQqszjSy4HIZ3n/R5UDL
         zhVvzb6BRydYhkgZi6Rl6LfVnWYpEZr7qu0KpEWdh2HlUJdciBbKPqvKvhxn9cxr6Wu0
         MrwBJC3pOEa/8Ckpju8rY3Q3qk99e1HVAk0dhrskDX84KpzA0dk7punVHFjB0QTNoNhh
         sXyokPoX2hl8NodL8FrFYdDFvkxUWK1MvlbWMdG4vVtsurx7UCvqRdmdotcyLJEBh5kw
         f7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVR+3PQK8DpFEmq20R+OVtu9Tfr8mw6vETebF+ndlK4uQ/Dp2xJmJwqEVOsNPo4by3NtwPfHkLcaMc7tuCnFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqiEw+kx0UqPTQJuryymzqzSZvMUTsN0ppMQDkiQ00vDS75bcd
	zC5pt/CtWYEUdObzGppI+2ZgcOtpgGf5UQ1SuD8v9yowRtM1Akxb+ZTaU3YYuUzhVql+/0jqMq9
	LWYjpiZENWshdPwemuvcHpDzT7zVlewa2t5i0UQ==
X-Gm-Gg: ASbGnctMp/0gao0UrEAgyA/7BLxAINiX0BrzztuqrvP4CHi6xvmDyCQCBL/Ha2Z2KVa
	ObEyTXMzyqRCdpnQBovYhoa5MR6l3DLrkkugCflWUcy4gWGLhecbFOHmWfo0YSL0DJ8TTnO/vl4
	JpFPaBY+XhITVQ4L4dzQORnc8=
X-Google-Smtp-Source: AGHT+IGc3omYZ/PigNb3EELyzJBtPU76XiDZ8/lpHySnqIua+3ffxwK9HjrgiuZD5ypFcw6v7zL4wYHXWwqXE5nGVqQ=
X-Received: by 2002:a05:6512:158a:b0:549:8f21:bc07 with SMTP id
 2adb3069b0e04-549c38f1fbemr588651e87.26.1741946321224; Fri, 14 Mar 2025
 02:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 10:58:29 +0100
X-Gm-Features: AQ5f1JoobXwU1DJzGtfpxiI6KI8sg3dxeI7nlvijJlOYjKzE2Ra7o1u5ZIyffXY
Message-ID: <CACRpkdYSNMV2jymbHaxRp-PmzbbkEJ_eUcT20whYw3gdhEGOGg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add EINT support for multiple addresses
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_025843_741823_CF61DE90 
X-CRM114-Status: GOOD (  11.57  )
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

Hi Hao,

thanks for your patches!

On Tue, Feb 25, 2025 at 3:07=E2=80=AFPM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196
>
> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

Since the dependence series is not finished I can't apply these
patches either, do you want to send an independent version of these
patches so we merge them *first* since they seem finished?

Then the mt8196 series can rebase on your patches in v6.15-rc1
instead.

Just send a version based on v6.14-rc1 and I will apply it.

Yours,
Linus Walleij

