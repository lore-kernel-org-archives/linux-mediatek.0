Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94192606A328
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NgCYKT1p;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2lXRFfX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ipkAqbggt55e8owGiWNHCkmgjpvjuLsbOQoZe1ToEhU=; b=NgCYKT1pv/sLaO
	TUjPtwXZGj00WE843ioNS6jztDwrLH0LA1yyap+6ILxY6iA092KZbSpcHJTu++qhGgvbS0+wgP4Yd
	Pjpydqckcb5jYgu/Dcae60FizWd4abq8+CcByjaL3RT5w7cQa21w0sddBcb+B8ZukvN3EyEc0ecpt
	qh2Iut9pqbDlDe7tqg83vFc23USvapEu7qyt/Nz5oVvWlmYw/434vFYJC4iCACIbXB+FvdUz8EwoM
	Vkdi7dkZnyAb5IZ/NZE4AZZAyYz3vuJ+9Na1kL7m7Pl2N+dFj1y01d4hzr1FPYuz9gmLYLJNwG5Zj
	JdXf5Wy6KtC9h/DAjpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOb2f-00000005U5P-3AHG;
	Wed, 04 Nov 2026 13:28:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOb2e-00000005U57-0XyS
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 13:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CF1960F24
	for <linux-mediatek@lists.infradead.org>; Wed,  4 Nov 2026 13:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B4E1F00A16
	for <linux-mediatek@lists.infradead.org>; Wed,  4 Nov 2026 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798919;
	bh=ipkAqbggt55e8owGiWNHCkmgjpvjuLsbOQoZe1ToEhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T2lXRFfXZaLRNZ/0XiTfwEfhqfbR/AxqmiJ/PC48id2dU+KepIz8CsgB/a4Xk67h2
	 7JAh6FXQ9U0YT/jtJK7cG4KAAhceexawpksqe7tvilSADeR9nKQ3V9J/Iq5li0qQcA
	 ii9LuccCIOogG5K7/sYje7YG/OIwCrqbXpUhtOauxI0PX5wJVkn02lUhN1Fse1pFKu
	 2bnCsKzc/NRVJfJzrrpTojvgbZClmYAPEgp7KXnmQS27x6F0FeIBY5fj42fvHJeIad
	 s3nZOmI5k4euB7uEzu6BX7BtwLHl6jNetFdv7vFeRkJYpFupdnXsUI9EVJ6XOgFWGx
	 xhCD2R/KEoZxg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so699146e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2026 05:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByJ4p4PZ527sF3UKfZPfgEq7XTSWPlXUsZUbcUltQj2Q/rGjGF+fVHM6tj6uX5pFw2RCKbM/0l3JAQsQW3kXw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9rjpbRv5ewA1QukFm2+RQBRd1WyrIhCy5fm2tMqzcUWbrGhrcI
	ak+V/s27y+QuLxqkx1bWjrkmt+DlEuTD0PSLO6ZGwk0+w0Ws6LsGWn0cIkKIYQOxNLmfT8WHLXu
	z8V4oYZz5Jgu5dWMDLxgX9o9Ce+9jjlY=
X-Received: by 2002:a05:6512:124a:b0:5bf:d60c:9f98 with SMTP id
 2adb3069b0e04-5bfd9583912mr6161437e87.59.1793798917566; Wed, 04 Nov 2026
 05:28:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
In-Reply-To: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:28:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
X-Gm-Features: AclHuK_cAGzrhoW8feJiHqlVa1pPLSLWgUyyK-IC6FwMXxU_M-CdGLm6sZ7z9jw
Message-ID: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
To: Vikrant Yadav <vikrantyadav4802@gmail.com>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: lorenzo@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 7:57=E2=80=AFPM Vikrant Yadav
<vikrantyadav4802@gmail.com> wrote:

> In airoha_pinconf_get(), the last branch of bias check
> "else if (pull_up || pull_down)", has no check on the requested
> parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
> is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
> PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
> earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
> reaches this branch, which returns -EINVAL. Reading back a pull-up or
> pull-down therefore always fails.
>
> Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>

Maybe Christian can ACK this patch if it looks right?

Yours,
Linus Walleij

