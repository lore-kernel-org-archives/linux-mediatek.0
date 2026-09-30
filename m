Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0827CA5FAC
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgLNjcFeGNUMR6LneImuRXAc6L6Itov9WGhxY/Of5Fk=; b=RY5Xfw7C55TTJI
	IeLW2MORo7k84ee3tKxV8aosqMUZwACaGZJ6FFmju1WVEMCSTI65ss/dOzbRoy7t8inIP8b7oYwFO
	YnCaEjUfK/DXSdWZlYLloNOFAcjIiaSrN89/ni471zFtdHtQsx57T/zvn6IDkcFNSIn5eYFS65w7t
	JwMlD+YVEgAQ83T2RjUPQzGrm/yKjNj4UNaZWdS4hPHTzagKM4iWU0LGu+pusubaNpcqD0fTCX9fN
	vzDmn7i3O8zRbaqT1Xd1kqSvbpZjWoZH9VozSzgnoaPCisNS538oDtKHJxa5LZX9nwAz+5T30quAO
	IMO3KDf8NnCSbIPN+RtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuOm-000000068Uh-1zF9;
	Wed, 30 Sep 2026 13:31:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuOl-000000068Ti-1UIK
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 13:31:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C956602A8
	for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 13:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB981F008A4
	for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775062;
	bh=DgLNjcFeGNUMR6LneImuRXAc6L6Itov9WGhxY/Of5Fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7p2nkR3qhmiuEq08pq2mE0/Ks/nhYF2CFMiAxJX8nUQfMloqhbLZUVo2Bs9BtjN3
	 iEoKbt2FAgpwwZKii4E+nfC9OdoP78DYhvgRKbKJLePgG+w4BQe5xz9DGSvOzwKu6B
	 tpNqezunsZOBK+Y2GtOxMav0/zcICTJaM0eTmU7Yd9lSn5YxIL+pFhtGnG5byTNqI4
	 qnsoffa39xDmZuDlvMp8qZU7b90+3mcNvEf2F1UA44ijKPgI6wo6HoxHOtr8xYbg02
	 A7XZ9u+op/EC16t1oWpDHhEjd5futLwZ62eY9x0rBGTiy6wUO2RBaGUIDvfyCnbl+E
	 qhySDJpEgc57w==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a66f8bc23bso34514031fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 06:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3sCEr1l42XWokXSQmBMTpM9/hFx9GEdfjbakKDUIs+8deDabNbBO8E7RmZ0NZFBbxYlttTvPSntD1g7QmGg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKqcfsYwozoO9VrT4PuHa5TgTOlMUSGjqiLUdQX8qMTxNsVvwS9
	Cy7fIV8BJcTzfPTL6JDOGbVmrx1kBGwKK44WgLZDlklzrLuJdJIWYxJv7Ip+BxwpFh1oomn2HBn
	qakrc208JGk8kaqgu7JmXUBkbYlLhaWo=
X-Received: by 2002:a05:651c:3241:b0:3a6:67d9:af17 with SMTP id
 38308e7fff4ca-3a779224357mr4581961fa.12.1790775060845; Wed, 30 Sep 2026
 06:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-3-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-3-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:30:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3w5q=bb=nzQicBjRd6xJAxr9WsKvauF-_x4eue8owbw@mail.gmail.com>
X-Gm-Features: AclHuK80elw9ImXmT4mImfPwVaF2TBSlxvLDtJVkK_HN16dU0cX72iILdS784_g
Message-ID: <CAD++jLk3w5q=bb=nzQicBjRd6xJAxr9WsKvauF-_x4eue8owbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> GPIO hogs were tagged with name "?" in recent kernel versions (7.1+) due =
to
> commit d1d564ec4992 ("gpio: move hogs into GPIO core").
>
> 7.0 showed the unit-name which behaviour is restored by patch [1], but
> labeling the hog directly makes things easier.
>
> gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
>  gpio-0   (                    |tx-disable          ) in  lo
>  gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-2   (                    |los                 ) in  hi IRQ
>  gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE L=
OW
>  gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
>  gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
>  gpio-21  (                    |tx-disable          ) in  lo
>  gpio-63  (                    |?                   ) out hi
>  gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-70  (                    |los                 ) in  hi IRQ
>  gpio-79  (                    |?                   ) out lo
>  gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW
>
> after the change:
>
> root@bpi-r4:~# cat /sys/kernel/debug/gpio
> gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
>  gpio-0   (                    |tx-disable          ) in  lo
>  gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-2   (                    |los                 ) in  hi IRQ
>  gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE L=
OW
>  gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
>  gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
>  gpio-21  (                    |tx-disable          ) in  lo
>  gpio-63  (                    |pcie3-cn14-hog      ) out hi
>  gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-70  (                    |los                 ) in  hi IRQ
>  gpio-79  (                    |pcie2-cn15-hog      ) out lo
>  gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit=
/?id=3Dd54a489c8c4b627775445d54a6cbd32f209bda8f
> "gpiolib: use of_node_name if line-name is missing"
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

It's always good to use line-names on boards for tinkering
makerspaces prototyping etc.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

