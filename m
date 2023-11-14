Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC61C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOI0CPqc9rDEial0ZWLikbzbAhp2oEQwcaX5s3JL5lU=; b=ZEs98zBKFQnwcAVrh2vJZzgRn9
	96ZMr1Rs750LA4Uf7p0cmFaC2SJxqdLayrr4j0id8MyY6Qe8qrXyf8ZiXpDhez9eudnCgF4fMGuaS
	gg/nJuNRKuKsZQzN/rVxXGkdYxBXiafwnLLjRl0hb8stSgDwZmmvcoT/fyyF5sjTOnkacRbQmtvuv
	4d9ZIVaESw1xTeZJ0gtJ3ukozpL4HbqRPha0YmRF2s2+03M3Zx/CCkrx5+a6LBWB5o1U6yPPmH9AK
	xd9sdPZ7F08h3yvUfkRWez0y812UhgxavgtpQ4Bw6ONgkBM60FF/uwgDuoWJBbka4zMTLeGYXaDLT
	uNLuJU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2p22-00FPgG-2p;
	Tue, 14 Nov 2023 08:44:26 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2p1z-00FPfP-1K
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Nov 2023 08:44:24 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507bd64814fso7839831e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 00:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699951461; x=1700556261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOI0CPqc9rDEial0ZWLikbzbAhp2oEQwcaX5s3JL5lU=;
        b=b+6+3hS+TxEyRmQAXL05qcBOp00tlkq5LulC74b/TjH3m12jsrR8WUzDk8j7Fn35qg
         cIqztjKsqVCQB7DdsXMkLJ7Dz+vEd97/ilvMfuWucuDSiqEWSqm4qfYTVicar5+sKQS+
         YanmTon1vxJBx1SeUUx2FGtMvEJgb6mYMtlc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699951461; x=1700556261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOI0CPqc9rDEial0ZWLikbzbAhp2oEQwcaX5s3JL5lU=;
        b=iyxcCGX90mrhAoBA7p1Y4iKN4NqF4xSyAumn0ktPiYIdi8uM+BerWDhsO3pIlZysfN
         Y5eiTR+g1Bu0I9waeMvsAwjF6h5ysFqzOkQXNeqXz8YSZorFjb+WmieDlFodcqtlBQwX
         qwxWnK7Yvqv/K/O+8lemhIJfUEQS+zekdY+3ZjLkXus/6yiurCR5e5ZZ4FUz5tzbDAYC
         NyD4FoqtWB4KJRUqHLNNfEx19pAWTbn0Uj5Kgn9lDPAUKhz+LfYPrHXiWJL34RN+AL/L
         TrCcvFuKyVvHtdHBBVwqxog/7H7ClCG5xc7ILxm7lRBKuV0x+HC8Lam+z4XVk17IvE/y
         xq4w==
X-Gm-Message-State: AOJu0YxOTQoLIkxHhERIquUMA5KI48Fq6X6DjPz5UyU+lSE+po3Mqgq2
	tYZeC8HcyOHJ4Jh9Z3Rxp0i1ag87us+7bpuNx17eYA==
X-Google-Smtp-Source: AGHT+IEa6VnEgDgdb660juJcwqvPMHNrvPtOFZUPkY8aSdfT4qRPasNYPWnpX+E9xWBXVGeBHiyk1pNobLJZBUesJiM=
X-Received: by 2002:ac2:5dd6:0:b0:507:9d70:b297 with SMTP id
 x22-20020ac25dd6000000b005079d70b297mr5427659lfq.60.1699951461277; Tue, 14
 Nov 2023 00:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
In-Reply-To: <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Nov 2023 16:44:10 +0800
Message-ID: <CAGXv+5GHFn_Xr0ta7b5M9WMBJzCE6NJWo_PR+XOYXO0oaoPeaQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_004423_465560_03B094B6 
X-CRM114-Status: GOOD (  32.12  )
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

On Sat, Nov 11, 2023 at 8:22=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Nov 9, 2023 at 2:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > The driver as
> > implemented currently doesn't deal with regulators or GPIO pins,
> > since in the existing device trees they are either always on for
> > regulators, or have GPIO hogs or pinmux and pinconfig directly
> > tied to the pin controller.
>
> I guess I won't object too much about this limitation for v1, but IMO
> it would be good to get this sorted out since I think part of the
> power of having the HW Prober is specifically that it can handle this
> type of use case. You have a little bit of board-specific code that
> knows how to turn on the regulators / GPIOs and can then probe the
> devices.
>
> Note: even if this is "board specific", it doesn't mean you couldn't
> share code between boards. For instance, you could have a helper
> function that would turn on regulators/GPIOs based on some type of
> table and that helper function could be used across a whole pile of
> Chromebooks. If a Chromebook is sufficiently different that it
> couldn't use the helper function then it could call its own function,
> but presumably it wouldn't be hard to support a bunch of boards
> without much code.

I agree this part is fairly generic and should be implemented.

We probably don't even need such a table. If these components share
a common connection to the mainboard, they certainly will have the
same GPIO lines and regulator supplies. The prober could just scan
the nodes looking for -gpio and -supply properties, de-duplicate
them, and turn them on.

The reason this isn't implemented in this version is because the devices
I'm currently using do not have these resources togglable. The supply is
always on, and the GPIO line is disconnected from the SoC. So I have no
way of testing it yet.

> As part of this, I think that your main "HW Prober" for Chromebooks
> should be in "drivers/platform/chrome/". I think that the only things
> that should be in the "drivers/of" directory should be helper
> functions used by the Chromebook HW Probers.

Sound like what Rob wants.

ChenYu

