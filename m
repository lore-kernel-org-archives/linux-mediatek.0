Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D5D10397
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3ew91ZImWbWhfHK6tR0O58sGF2lXLkOfJoWIQesi1U=; b=fTXjQNRTB1p/bEZnWGEVUbEAw4
	GfWj+hgySmlEkr3WpdQGw2AFRIE/y6h1WPhXkzSw26/VIFrEZFEQSM4CNbQy1LAYXtYVk+IhT4V+0
	dEMLVODUKytiLCSWmDw9H8PYIutie2OVBWQSDBIT+AUy3CQutcsTnh7BPw4P8hhktEwo7kcRjHXbE
	UkzKmVyMMOWJ3iaP5FjguHwu37G7ZcN2vMQ0DfIsLYIPJdJb2tf8SAcQ7oZXFRdGsIW69n+7+IGEM
	u+j5oBsIXfJFP9I88Bhh9g+tdXQUmzGu4CaIwJwvKI4K09IZ+pvJG1vIU0h4H06keh38TcyqD9HcQ
	16Si4N9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBXi-0000000Egke-14JB;
	Wed, 26 Nov 2025 09:10:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBXg-0000000Egjt-1lti
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 09:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 813AE601D7
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC37C2BCB7
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764148227;
	bh=1Gh+v9gZlx4T+2vP2/a+CEj14Wm+hS7qirELQBW3q2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y0jZqolvA7hXFfMAw3hJ7asvZznjTxeWPgdjxIsFuK7HKMO4Aup6xgMuchtbnJrWK
	 xwHhJa5s00+VgaGP0ML7tieVIDbVQF+iwIWSKLuRdn17r7ZCfmOGkDvaz5chhKzg10
	 6nuZs180dCROf6d0BqFD4aQrPkytxlHR4p3UdXOoYlzcUKG7y65OdDl9AqZWj0YoUy
	 yoPsX6VqQHAnD4aQTu5svKlJ0TOQMUtEl97rI5l/4ARfHFMSjCpLQ4gBbxMQy16n5h
	 WNQsEGuhpZqW72YAf+JKsA029R4llEpPHQZ1GKjiJ8c5kBmdrVYOY+MXl0Kiucajop
	 ciirWL/s93zAg==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64308342458so3853830d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 01:10:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW02nO2DSW1YWDMb7uE3/rFi3uUjpvaEMM/9r4dlZLTRT9ytou7kM/mEgmSEgByymz3p/nTGqJAXOLJ6pLQwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznd/GekbiD6+VqnMNJAbO1QJP8LJcfArzVWL5ivm8oaQE2S+Y9
	7EaDKEBNhdXWkbW0L6W+QBSF3VpufOA/eP1YCYzsw5YIz7QRzXVH7qMdcdb/z2BYeL6KPah+BVI
	M4IBnDg7WD98EXENY7XaAtuIdo7R9Y/I=
X-Google-Smtp-Source: AGHT+IEn+dWU8mxRAWLhMi7GP0Lw8+OC8N4aZc4Hh63NWSD8PewoKHoDsfkyUR8ez/7yCP4Jhv1U4PvoktYwLmnE7yE=
X-Received: by 2002:a05:690c:48c8:b0:789:552f:b576 with SMTP id
 00721157ae682-78a8b490616mr155805427b3.15.1764148226208; Wed, 26 Nov 2025
 01:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20251125023639.2416546-1-lei.xue@mediatek.com> <20251125023639.2416546-3-lei.xue@mediatek.com>
In-Reply-To: <20251125023639.2416546-3-lei.xue@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 26 Nov 2025 10:10:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmlrwKgRMkbTd5MLDMlxjKIz8VWVRw6PHOOri4KCmVC5vDi2iUqAwHA-0o
Message-ID: <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add acpi support
To: Lei Xue <lei.xue@mediatek.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, yong.mao@mediatek.com, 
	qingliang.li@mediatek.com, Fred-WY.Chen@mediatek.com, 
	ot_cathy.xu@mediatek.com, ot_shunxi.zhang@mediatek.com, 
	ot_yaoy.wang@mediatek.com, ot_ye.wang@mediatek.com, 
	linux-acpi@vger.kernel.org
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

On Tue, Nov 25, 2025 at 3:36=E2=80=AFAM Lei Xue <lei.xue@mediatek.com> wrot=
e:

> Add acpi support in the common part of pinctrl driver. Parsing
> hardware base addresses and irq number to initialize eint
> accroding to the acpi table data.
>
> Signed-off-by: Lei Xue <lei.xue@mediatek.com>

I'd ideally like Andy and the ARM64 ACPI maintainers look on
this. (Added to To:) and CC linux-acpi@vger.kernel.org.

I'm not aware of the best way to deal with ACPI in combined drivers
but things like this:

> -               hw->base[i] =3D devm_platform_ioremap_resource_byname(pde=
v,
> -                                       hw->soc->base_names[i]);
> +               hw->base[i] =3D is_of_node(fwnode)
> +                       ? devm_platform_ioremap_resource_byname(pdev, hw-=
>soc->base_names[i])
> +                       : devm_platform_get_and_ioremap_resource(pdev, i,=
 NULL);

Just look really quirky, I think there are better ways to go about
this and sometimes the ACPI maintainers give some good
pushback about the firmware as well.

Yours,
Linus Walleij

