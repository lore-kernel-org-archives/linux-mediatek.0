Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1E6C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXygJ/RMTPQNrcPVAiG6RR6YqxRwAnw6sxAPhTT6WAQ=; b=zGqPs7jTrr2jtyzR7bXo82epxm
	NJ/goEaKxl5CsAojbrPv3mwEdZw4YpnZdq8U3v/yeO5G1Q+/6pYyTwSGM/qxS4T9DDmdFVu1Qyh25
	1V9HLu+PYuDIXb0LUi7+9aR9R2uuWzVqAHS83rpBXVz0lE09VWEIp0vGEzv0+KOvT3Iyg91L12Q4g
	r+GL7B9yGblO3PFT/rNEJTxP3KwIsAz68xBD+Powd5MECsmvyvD/lDbMI6D0xZwS4LStMGaXKfikN
	Dj0+3ayaPzNkGt4uSseIBD9TUq6tolixcGLZSPpGddfaCdgV2osS+BcaFIfOEY03K0IeHBi4ECN/L
	4gsYsy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYTj-0000000H9vx-2kmX;
	Tue, 30 Jun 2026 13:26:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYTh-0000000H9vk-3ZRo
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 13:26:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 314C7601DC
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 13:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4201F00A3E
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825976;
	bh=pXygJ/RMTPQNrcPVAiG6RR6YqxRwAnw6sxAPhTT6WAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dmgyYO+r/cqtUF5r6CPFKYWEvoAeyK/FSjcn+dry/Y41At+kX7GtDMuHKEZvta2hP
	 BexWcZI3mbV6524/BbhQPJD2T5IV+I2WBJ0U7PyNYY2m70b8cTetFZ3CcuqHaYR8+6
	 qV0vZvmnFmUs8pQpn3RoaM6q0snZsxjfKOKYyimMcU8VFDBQlJtNt31H0UzfDuDUuC
	 hh+iqyi1nPhfmqyLcQhslNQ65XBXgRL4G7KHo8EtXetzpVyN9OAzGRAwgVEn6h28hj
	 FnzI/7sXqIFIwEAZYdIe41KOl1qVK3A/INI51/ndogFTFvyNqUGX6cNf6MRHYHeXOR
	 /8dd44xkBBM9w==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b19e7d6fcso11407941fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 06:26:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEo72enzKIl6R6i/FY+WymKLlp5Zw9RoJMraPTmmT9Xi1UeZuT7gog33D3Pzezc5BbcM4mIYAM/B6WouFnZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySH70cgSQ7D08/NDniPeHkWuH8BNIrIwXtLNCXbhFuu1KAhJMU
	O4e4ioVQSS2fvmICO7onZLs5c47yuAMLKrau8JVpy5KmzFK6lFXLSpzodIfWuGJAzU8MBUQROav
	9EWKqcq+bb74GdvQsD9sg7vxQWjYT6lE=
X-Received: by 2002:a05:6512:a354:b0:5ae:b270:505e with SMTP id
 2adb3069b0e04-5aebdb7d428mr680479e87.1.1782825975726; Tue, 30 Jun 2026
 06:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu> <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
In-Reply-To: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:26:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=W6oTH6SszTXzESrQfbnb4=MDhGa2MwFZJTxtfZWrL1Q@mail.gmail.com>
X-Gm-Features: AVVi8CdMqlD-NNESA5p_L_MjCXc2S_nvvYlYGQu1Hdjs5hWQXyMGqa8I_zRSf2c
Message-ID: <CAD++jL=W6oTH6SszTXzESrQfbnb4=MDhGa2MwFZJTxtfZWrL1Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
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

On Tue, Jun 30, 2026 at 1:09=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Wed, Jun 17, 2026 at 5:37=E2=80=AFAM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
>
> > This patchset
> >  * fixes more airoha pinctrl issues
> >  * split combined driver on common code and several SoC specific driver=
s
> >  * improves an7583 pinctrl support
> >  * adds support of en7523 SoC
>
> No comments for two weeks so patches applied.

I realized there is v5 and v6 which are still being discussed so I backed
these out.

Yours,
Linus Walleij

