Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFB8C8303F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=; b=ywmit/gztFY9zBijS8H4fk4OHn
	4f5aW8/adDinwalKvU2FiY7us/co9i246rUGErmozfpi/DVQDVz/FHCg6yIuxZJK6GDKWNGk7/JkI
	CYSkjw2PL7RhMqXXwf/09LZlkIxCSY5YX/1bZTEM4ZGU5fVBuiQcHYgv+NkXHaeUcz/g/UKcHjq4r
	itv79qjMqhQrvNWNEjgU6p7mQeH8bJnU0Z+DXup3CPqyFM7vJi0S3g+9bJrVkyTAArq9+hxZUg5qQ
	gBsxyGh6H+GeKM2gLOke6Q0zENCtuq+7TmIGTkM6wUcZ/7pqy62H/SluoQI2uN2GzjINXqF/LV7oV
	O2hJWz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgP6-00000002UJ9-3VJ8;
	Thu, 28 Aug 2025 17:27:16 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcoC-00000001laD-0MNE
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 13:36:57 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f3ce45abcso1090247e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756388214; x=1756993014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=;
        b=0tpFr8/8rYgC8gRDfqX1A10KfzMSBhFe6MNsyUy8AaCN4C02fddS6lzhqVqu1F2PCU
         uwxwrAiA08vEqLTfzHxuvwlxQRlvM2S9eGn5Kx+QceOG/3DtJZ69nfmdPCZvNtGS5EmB
         jdq3d3sDZpzmNyUnex3MyQ+ttV+RucDqLracW1PaOWROAoG7i14sJsBeYQoWySCyYYt7
         fMxFIc9vUvy09StEcYWuucdhiIcDZPepqp3Twf3lBLmaLNXznCqtwC2lGXwlLKqguOA1
         /lfQJSlDGw/96uD4mjUDolOAc0T7vT4GaYf5cU+6FfHR7zoyIX/0ZiR/lHiNA7rQAj8w
         iECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388214; x=1756993014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=;
        b=QVSWi9kJA5GRgOlfqwLZalidiy0Z9vOotupCvarb9MAB32CktRSzY/c7R6SRWOCjcA
         E+83zyN5h99syHPGfJQb2Ei2FG7ht4YbK3qkzPAsC+3lmLhaCDD4sHLsf/dkDi8HMhz3
         in3CWcPx/dxfXpOvBmqggDatsVHuYUgEP5P2YcXjIkzanrAXovSfZ5Z/B2LfjK0i4N7a
         wLCSnwAbHAWxWRpn7pPPCYgjZLtOonC8jT+TcArzmDh54bfHKElR/MUx8pQNgNS49Cjn
         SoQLEVDJ8UPQia4rQvX6YkPCH9+wToyUA7uTgzyKPpHSVEGrqeqGlcAYLnNk/bMIt4Yj
         XH5g==
X-Forwarded-Encrypted: i=1; AJvYcCVYNTPe3M0nwFGNIZl0ClCdBTpJG0PV3uMblCSDsLMHOlvFLZ/DNc2+5sW9QepYnquTqJFktUxuMNZ+bOvXkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw90d6IvnV+7RK6sVY5EGmKbcGFl5SS4k9QJXMOa4M1B8WU4DWt
	gR09tJdUHIfhzL+so62QH6KN51Z4GkbHAl5Ah+z0YNMv6UzU6ZKzOKS/BKgGKuGVhLGiZA72jTQ
	sRqFmlSdMQ8WtdIhLPRhjkvtvP/zfBow0dnBx2e75gA==
X-Gm-Gg: ASbGnctVqATf954jQug/AeTvDqRL2pi6WIGDFj1yAvdNO8MYpmhKKnJiH+7tLQ9AxKY
	rm78zt3kxmprlKHL0yzbCcoS2wXoKk1SYpg4N1bHNqXyYJupy5D2h8AIhpKa2Uc6Pf4PwQ0cTiU
	d/iQuI+9BPcCIIi8FUJ/3hBAl8bD9NLuIc8B+X46QxQtgg2Zk5LnMgaT5CwJAlooqxSG8xksyp5
	CIq/AOAvA1mvGvLMRfYK/ydZDBW7sRa1pbFnZw=
X-Google-Smtp-Source: AGHT+IGjT2OYHV9mzILkObbuSFLpi9Xf+oP+6Uws6rzp7smTv5kAfs8i0u8RIWSnII9gINWFQq3zddWVjDxSq4eH8MM=
X-Received: by 2002:a05:6512:245b:b0:55f:51b3:9419 with SMTP id
 2adb3069b0e04-55f51b39621mr1791521e87.50.1756388214118; Thu, 28 Aug 2025
 06:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk> <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
In-Reply-To: <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 15:36:43 +0200
X-Gm-Features: Ac12FXwlaqUs0TeuR0_lKNQwkWNyJ4q4Po7liyAa4ioyozolnG0jRU9pqqtYG0I
Message-ID: <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_063656_363157_F6F87A51 
X-CRM114-Status: GOOD (  18.68  )
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

On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Aug 27, 2025 at 06:46:28PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > I've just got the log I linked above.
>
> > So, I've been looking at this bisect email and clicking the links to
> > LAVA jobs and I can't find anything. Does it fail to build? Fail at
> > run-time? I'm not sure how to read this.
>
> It's failing prior to putting any output on the console.  I was also
> seeing an issue on i.MX6 so it might be all i.MX boards, same issue:
>
>    https://lava.sirena.org.uk/scheduler/job/1697667
>
> so it's possibly all the i.MX platforms failing.

Not even with earlycon? That's weird. There are no smatch warnings on
this patch and I can't see anything obviously wrong upon visual
inspection. I fixed all other issues but this one I can't test. :(

Bartosz

