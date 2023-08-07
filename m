Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEFFC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXHryVI73wJZajWQdtZdeOA1bA7vsuYvfEUOkG10pjM=; b=FzAz7RQhVjU0o1nUYKR9uP5Zxy
	NEdaDVuHjWLbT3AIpqrkYsTEfi4CTjYcwNK+dWcEptK6gMg+UGL32E788oIFvxKAKH5hFlstjfpas
	5OvMoKVO653SUi136SQ72QfxkeT/D7NcAyCVnnn/3ZFvvpDRwUfqCKODf4PE1+DEr0TT5NQj8SBvI
	ughJGCp7FZck5acrccMMUnmdRnq6hXqwqr8xbGMsWek9yAMcoYUzYAE/2+Czai779w6PNwYqLKpaw
	fMbw+of4rQnW1GooDE+5nbRAkS6vRfp1zzCf2mxdXqyiHsGN5Sz2NNQgzMEWnA9B3QolmYbFqX312
	ETtZcTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzVS-00HF4I-18;
	Mon, 07 Aug 2023 12:38:42 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzVP-00HF3m-0S
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 12:38:40 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-583fe10bb3cso51222057b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Aug 2023 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691411917; x=1692016717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXHryVI73wJZajWQdtZdeOA1bA7vsuYvfEUOkG10pjM=;
        b=AqnpNcvlh4sds/xSatKCl2xVyvy0hZTCsSRIHJWRkhi4gXQh5XYOBErLnsSSRjPYYA
         DtoGOjX31CHvvksJ5c2oWv07QEkcWeSC7rmUtq0hIrzmxro6e+ZAMMfkvElT/kzJPJlc
         t9AuoFHtoOwwNzJmmmQmK5MuONx3kD9dehEunjV4UrwnGfxaV8yPk4o8z9OzMt5h0613
         5w+LsJ9M+J66JAPioTVd0vJ780jnYycbkjRgUCqlBWQUXuWooqelwI3y2OaYo/3DSrOC
         +vu6+XJj4vzfd9zgEHtlJVX20OZphLNar3wo6lLJyqaapiO9RsQnl13GNPLaxzqURbp6
         pQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691411917; x=1692016717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXHryVI73wJZajWQdtZdeOA1bA7vsuYvfEUOkG10pjM=;
        b=OBAu8jIP6+MEGUozXVZRWnydPVs0/PS+hpnTPxSnwrZ/yW5usmZmIvhZgPf8OGpcBh
         zvjrY/rGayJyQX0HB+H/zTUdAl22IcXkXevf8b9WdqKvOfEMjgr3Y08M9mOeDUslizmm
         4J0A43MKj5XXBL9NTlUlR/k0MYW1OcKPR0ntkkx1ejivNncdSm1SpC0boD05QYA9Ne/U
         5QHe0Ao917Zz3AZuZYDMz2SVoQtau/xwqRgBnufb5UIHUWzjINTJswu5tls5GmkBvJpW
         X55836rrxvPoMz1/+RytPkn0n94EwO4DQtVuTvK52QNLSEBqmsTWf4TBR0E32tju1zIe
         kYlw==
X-Gm-Message-State: AOJu0YxoezFDFcAysXwwV1HFlQWPKyv7EBhvKrzon2upiUWdJCndha0T
	U7mX636og2MNKJxb/tjKZ9XJ+m60etlICEovQOw9LA==
X-Google-Smtp-Source: AGHT+IGXtX8kyUWlc/nPtBroLcm+XO3U3aTNFbrBNBbUQrZKvcnLrSkqNj9OxkRfxLPtO3c4BvLombwNR/1DiZYcvcY=
X-Received: by 2002:a25:8404:0:b0:d3f:2238:8872 with SMTP id
 u4-20020a258404000000b00d3f22388872mr9540358ybk.63.1691411917691; Mon, 07 Aug
 2023 05:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdYzytbM0sN7Q-Niwq2jUgbeVPpREmwUTbja86eGROOB+w@mail.gmail.com>
 <TYAP286MB03159367B2B1932DD38252CDBC02A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYAP286MB03159367B2B1932DD38252CDBC02A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 14:38:26 +0200
Message-ID: <CACRpkdZgPNQ8HDrS95qcAisEN9m2oush1eg_FL72ndqRk=VaPw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same
 pinctrl request
To: Shiji Yang <yangshiji66@outlook.com>
Cc: angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org, 
	sergio.paracuellos@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_053839_199152_4EBD6131 
X-CRM114-Status: GOOD (  10.23  )
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

On Mon, Jul 24, 2023 at 3:31=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> We use pinctrl_select_state() to request the pinctrl and set the pin
> function. After searching "include/linux/pinctrl/consumer.h", I don't
> find a relevant API to reverse this operation so we can't set .enabled
> back to the false state. If I'm wrong please correct me, I don't know
> much about the pinctrl architecture.

I don't think that has much to do with the pinctrl core.

I expect the driver to set this .enabled variable to false wherever
the enablement fails, note that this is inside
struct mtmips_priv *p, i.e. nothing to do with the pin control core.

This patch appears to paper over the real issue.

Yours,
Linus Walleij

