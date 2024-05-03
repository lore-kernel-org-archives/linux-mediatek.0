Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D88C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKji8dql2Q7HB9ydxb8y51caf9/agXzCr0gG3HSWZek=; b=Zplln9j8i8M+yU8HQ9+olVB+g7
	5ZOrDhvQKJbhooZA4BuLDceETdYpjnb4AlldLollIxzpUTa0VsLIgWyRaXhMfQwYqhMKfSUZBiwkL
	8kZE72dEy0GwEkNvFIGB9BTX3kkzfW9WG/jh5zqlC0FnqdLwUxBTMylN/cEXvk0frr4OQsGAc74tI
	R1qLPOKjALFBevOjg0Z4C1/8Egsm6y0cmWSiVojGb707OBjd4SPqwYwQbWPwWIj5GciW5AGYh7+sx
	WuQKUVYA3kBSZHOZYKkPQYS5ejwKTCeJuiWm/rJDY5M7DOq8pNRvWc9XLjWgNTWrb4zY/Z/Ymgy1M
	i4Khfiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oWf-0000000FiXN-48S2;
	Fri, 03 May 2024 08:44:17 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oWa-0000000FiTb-1BjZ
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 08:44:16 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-de604ca3cfcso4973699276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725848; x=1715330648; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKji8dql2Q7HB9ydxb8y51caf9/agXzCr0gG3HSWZek=;
        b=ctVCCfmVsgD8T8eGOv0mcqXK/5sgj2SwM10rMMdsNYOWMdwp4tPPhQY2EMQNuSbJeN
         uqsXiI0A1pbirryTsy9pM1eLGd3lAugDGGSeOl4HdCJcIwT1IuDlupdsfAlS6QJjDOXo
         ADQDhcaAkGG8GgvLNB9mJ1FKdOgx8IQ3oFQwv9BCntDTYroPIzVGFIhGvrMwU14yBrrn
         ELxzDc9LYpya6sGXtUVRbfBoNyaDX/YdNBLwerDvDjyR8IGFfaw3maHtBL/mljbYPFzL
         HUpwJIyi9t9Jz/tXSfHgJI5tNCTeyUga3Pw5Iub+fQptbNQ6MO2hS4bakwZY0z9V4ah6
         Wk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725848; x=1715330648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKji8dql2Q7HB9ydxb8y51caf9/agXzCr0gG3HSWZek=;
        b=JY4fN275eCTZVlZtUEYMf6Mb/Ev0Dzoadw9qurckj6IOicSZ2GQRFdge8zuxbUbffi
         H3NbUkEypHJTyQFBXmgYhs/nJq2ICr6Tg4uTEF8eNEJXwz0baj/O5skx25pYcGFzgc2K
         fzQo8Lu+zCvz9rvz7cNE8iTqEMR4xUhrAUUESQFrBNl7414a4kyHnNtEVY20hY+gkhac
         nNFhjAq2OC446JrUKZT6r7a37wyZ8uJTi6/3hnTUxEr1kPC66JBHLO5wTFI0VoyTXsTs
         aKC2HAgV7HCQvxDsT4ZRksrD15JA+af3mk+D6GFHY+b9SUk/fRZVTTVrs9qRI/W2GWSE
         JUQg==
X-Forwarded-Encrypted: i=1; AJvYcCVUTd+56cqz6+tadBphtAcLkaoODXwPgfufBFEb2GHhurXA9r0P/WbseSSdNEykEykEOMyGXx+4S7acA0DHXvIzqdjSl8vQ35dvuIsZolmGW0uT
X-Gm-Message-State: AOJu0YzafZYkn7ikKaS/tqBy3YohO1+bklFHpwB3BBNnblIlrjujDAYv
	zSXX39rOU4nZwg+2Ux5v1lKYpyYReVao7Z/QL9zKDgeSZl38WynRdMNcqt3Gv/J06iipc+gclfT
	epYFPtlRHEfJGY45FF7/hVduop7kENK1DGDyy0A==
X-Google-Smtp-Source: AGHT+IGWfFGtExQ0NqT26L1KYSVbcOPkIAddlYuzm9qz4w3y6T+dxyxo9KKnqe667MkWqy0SdR4KIs+Wq8t4EpB4aMM=
X-Received: by 2002:a05:6902:2011:b0:dcf:2cfe:c82e with SMTP id
 dh17-20020a056902201100b00dcf2cfec82emr2421680ybb.55.1714725848634; Fri, 03
 May 2024 01:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240429104633.11060-1-ilpo.jarvinen@linux.intel.com> <20240429104633.11060-8-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20240429104633.11060-8-ilpo.jarvinen@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 10:43:57 +0200
Message-ID: <CACRpkdagd3W1EkJTv70pGBf-=J+yuV+osisR2YjHKuT9Oo5Caw@mail.gmail.com>
Subject: Re: [PATCH 07/10] PCI: Replace PCI_CONF1{,_EXT}_ADDRESS() with the
 new helpers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_014412_345895_F35E5691 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 29, 2024 at 12:47=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:

> Replace the old PCI_CONF1{,_EXT}_ADDRESS() helpers used to calculate
> PCI Configuration Space Type 1 addresses with the new
> pci_conf1{,_ext}_offset() helpers that are more generic and more widely
> available.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

