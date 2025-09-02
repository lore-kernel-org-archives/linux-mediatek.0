Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DE6CA1007
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6qJ4Krbe8Eig8u7HuRNaH82OJCGzRpxUAzmtO7ZEgM=; b=ZJgv+iZ693tFc+qzNsqAK6VCzS
	nHfyV0A3n0n/gJOlixjGbdaX3QLtyiHWEN6C7qxZn6XitJrpw8UvnStx6/fd27AHJaFZ4yb7xj97w
	HtNQ17FxJCgBZ85KEm6TwRUz6rGgepBoPdKB7FKEr7pkrCriCG96EmwqP3JtxqD01Z+9Z5DxsSgRp
	off1hx3e9qi2ABfPEOFp6PZjQdUUqOUOx1BBH2Ssl2tdaNZD6nSBj2bbhCxxqt/FsnOJxUgueM0SM
	hz9+1n8p25ZMs/QdNHAAmnQlazGFFSYP6/2UPL7G0NYbwey6KsuIL3CeOc6tk4cUft2C4TmKkbhIR
	2zKpPbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm3-00000002AVM-1lCE;
	Tue, 02 Sep 2025 21:42:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRar-00000000ERl-0cMe
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 14:02:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f753ec672so3195056e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756821759; x=1757426559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6qJ4Krbe8Eig8u7HuRNaH82OJCGzRpxUAzmtO7ZEgM=;
        b=xAPtQ0rqZiTddIaqxyILysAHw2JM274OJCHM9RTQBaRZPVyQv+rCMvSM1LZWzVaC8n
         BffVpp9Ho7PClBn3nXivExRB5fmaV8NU/Gk54bYSYie2s28uq5YMn7GpvQ4X1EOAPBxW
         VqgWWRi/h/qNrt0raFTVvsZ7PG33tf8/kvSgb7bCpUH4/YAFa9oK4VqTWvIaiE9/liAV
         9LklbAySXRuJmcOjmyNPkYEe29ZOYYQlTBV/8P5aYTvDdRu3a8dzd4XJwvuJRYXMNW9z
         hFL9oKlnKOg4BpIiCFM9tpDrnwLgmmPaOMnwkQiO68SW2m7O0GMJKjHSLKHC3wu22oKo
         qiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821759; x=1757426559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6qJ4Krbe8Eig8u7HuRNaH82OJCGzRpxUAzmtO7ZEgM=;
        b=LLHCikiW/BgMnfaSSDVf/zglMUJBF0fR3QEpf3kaDp56kNF1dg3MapOv6pBd8sLDzl
         Qs14C3qP3j+O+AAOf0FLyy7xwolKWWkgtIoFojc6CJaH41qYzcWUTaHzWTaaTYY6BH4G
         83kEdKW0GgJielCSuiLKxpEHs9eZfq+OUVvoU79SISe62q+mxSJI/Y7Vv0Z5jnkbfHD1
         rN1t6UlirmCBoWZzyDDal/ZYZtY37B6T8zSMy53/qcOTH+JAP95mXVWV0lZIXbmgKFln
         /gUvC9/4lx6LkUnn5OehOawfBMwx4soDqpjVev6R8NoF1aMDHxENrtlZn6E7ivRMEtbd
         PqJg==
X-Forwarded-Encrypted: i=1; AJvYcCVLg2hdbgjoMEVLCGAKcQ4C15Fo+HXco2lKy8LLB0e8LvxVu9Q6EaGIaX3UnjhePDs9JKkPVC72ELfnvBRRNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4aBGsjgHDBBVBWC6k1XcW0sre6dHIgJthlHu6eqlS5o+qRSQT
	eZdHBXLAJ82L4CnRCk/zX9CM0K7JgMDFQCzgeTbZAx2P9tbcgVj8IhrUjfogXIS4U/OTkRQpobO
	86Yx8+wN8+EztBvQRGUDPccb6q5xpi1lhL2VyNk+8zw==
X-Gm-Gg: ASbGnctBhkjMOtp8Dcv1qhmzOjz8zXcCW/U9IdwI8e/7al6rZ3XPIdi2JzUQYpjcIGN
	i2iIuzhBY7l+p1JCHrp4vUg1UP4AQiaULlHRwUfB/AP90HDeJs9NPAEVmkdIAB+KpChfOKeadey
	3RKxI8OAWS0HOYZ0gmvpPExm9cC1BYfY23o3l1s42ykvlALofUwR0/9HwI5rCACXnNnNmbEi2B0
	pB+NHSh80eYEU2wSuHq3ctNb5RLZUJFrZ1ElXUpA6I5ue4K8g==
X-Google-Smtp-Source: AGHT+IF0XxTo4Eof/cAnsUmsXyl7FaRgZjHqhfNse8z4FzsrSjUbnY+JobcnARjelIxZIYceGk+U5xWeRaOHkRoNgZc=
X-Received: by 2002:a05:6512:1289:b0:55f:3f25:f03d with SMTP id
 2adb3069b0e04-55f708dbc89mr4083265e87.32.1756821758848; Tue, 02 Sep 2025
 07:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
 <aLbrz5DYS5Yxx_UE@smile.fi.intel.com> <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
 <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
In-Reply-To: <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 16:02:27 +0200
X-Gm-Features: Ac12FXzmmMVa4i5hYh_JJ6GZvRRv05y-_-Nk_APJiumjkhCqONHKECafTZ1ySu4
Message-ID: <CAMRc=Mdp2djgGbgu_uwLSkrtRPomAU=6-SRdzCdSbrHWzS2c2A@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_070241_191353_40C09558 
X-CRM114-Status: GOOD (  25.14  )
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

On Tue, Sep 2, 2025 at 3:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 03:29:31PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > > >
> > > > While the API contract in docs doesn't specify it explicitly,
> > >
> > > So, why not to amend the doc at the same time?
> >
> > Because this series is already big as is. That would be another commit
> > that can be separate.
>
> I meant _in the same_ patch.
>
> > > > the generic implementation of the get_function_name() callback from=
 struct
> > > > pinmux_ops - pinmux_generic_get_function_name() - can fail and retu=
rn
> > > > NULL. This is already checked in pinmux_check_ops() so add a simila=
r
> > > > check in pinmux_func_name_to_selector() instead of passing the retu=
rned
> > > > pointer right down to strcmp() where the NULL can get dereferenced.=
 This
> > > > is normal operation when adding new pinfunctions.
>
> > > Fixes?
> >
> > This has always been like that.
> >
> > > Reported?
> >
> > I mean, technically Mark Brown reported my previous patch failing but
> > I don't think we do this if we're still within the same series just
> > another iteration?
> >
> > > Closes?
> >
> > Ditto.
>
> I meant that this fixes a potential issue disregard to your series, right=
?
>

No, as long as the imx driver keeps putting stuff into the pin
function radix tree directly, this cannot happen. The issue was
triggered by the discrepancy between the number of added selectors and
the hardcoded number of functions (we started at 0 which was not in
the radix tree and crashed before we got to 1).

Bart

