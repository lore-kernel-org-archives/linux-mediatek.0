Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F95CA1007
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=; b=FJuqFlnAPTjKlYGu75wa2NtPED
	MBQJfhiFpqDDmMt3mZu79fucxL8fIp1W5rqKWnngojlQXG6J+r6QVi3BgsEx9970A5CeY5LcM9bLb
	TPJ+BKER+JhVTzsJdcxMtXptjkCMwPahZavcOmt0sGNlgrCNi0AlTcwZSAvIl0Z0BQT5vBvKzXeQ1
	jx4SLyi4b81UiZyu9YcVJk7NtyGsDWXJnsxnZaFfl5ekGxoPg4UiIrIbuunJ2MOY6pDY13YczlAV2
	PhwzgEnUYCbzdINp3CWNYUi+TILvvGB72BJvBEDm7XRSPPwYpXPym95KMuhMOrWZ9iiaIHDp0xjC4
	ZWJSv4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFv-0000000EXzd-08A6;
	Tue, 02 Sep 2025 00:52:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utA6u-0000000De9R-2GLI
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Sep 2025 19:22:38 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2476947e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Sep 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756754554; x=1757359354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=jL2JUjBMRbf+v0t8lsluvN/d72NJgimzSxS4ysjuYgN7ejM9g96aDUKY5hR/oTGzP8
         7ZdTWJfNmdcRSfMJ/etJaK818M62gQg5czTNKbhvePQSe7qkFz/tjBwmA7cglgGM+hZS
         r2cuIWDMa6QcG28CXf/I179XFvp9un/x/zDkyjq+akUQZjPvIFL5w12JsAgfyPI9tG4t
         4m6F7MhYfsgAJZvL7QsOpJ5UBXQn3MlA2s8JUzSWUhz7zkcAIhG+cIBkEn13pjS3Smsa
         dlokgt+xKBoLw7MUixtvVkVVNC/pGvvYTd7uDFNQ6YslIxzvHuPVrawreldA7KVU1AQB
         VqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756754554; x=1757359354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=N6HBQuql7S/vhv+8ac7zymqI40p6SIX6UdGrT/Sx5Sg+jVOHmA5FOs5NvdYuKcYsZb
         c3M+3v5v8Y2gRfMaSczGvwHGFLVpjR82eOtEQj34ERx8J9ZmKHLTHOxFFiG10E96sIDK
         GkqGeUWzxnuKPt60A9E6m52mn9MrdXOvYyA5NPipZQUBDwF23UdqYYbEbxS0iUHecwuM
         2emU0jnsGwuOVjNFnMr1HTSyg40MIvXxcvKs2gkUiqgeyTfHbPEhaecbUVsMQYgFv9l+
         Z6eZTucY3gM6wOAAN2e8Tyqt49gI9oJIrytbkHgCBHIKeiZJpDsKePb9F6XZ5kp2UQYB
         DxHA==
X-Forwarded-Encrypted: i=1; AJvYcCW3EoAIgedgjqWEwRgqLrPVm+muF2xwO/V3/2tQ2JgE2XXE0jjEpgiPJAB7hX4JqpZDGSluerrUzVT9HrNt/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0iX7H1jT0wLuJznlyJnw4+JschRImOtyg5RB1L9/qnsXr/D+W
	Zz7EGi2myIjI0r62AcqpaAZjgotc12lac0BAFtEUvkNyEsrNxkN1X4bTEHBrYkDmBkPm8V0APkG
	M+53v0tWiA8dtlF/t5lxhmLvbnPQpsTbvLkktaxHJgw==
X-Gm-Gg: ASbGnctSzloBU9E9H8fUdJP1dfvyDscXA6D1M36wInjVyxIu1HRbbLTczayY5rPEWYe
	ntbI7TBpbL51p2ArvuijltjLM5YSReuKKGvhTUmpRBnnr0Qp483FO57q02j0OXWYrXGqS7CO+P5
	kCVnzf2/K1TUlK4L4hOYKjJedUuw+JpGdNEFfzapX6JpXjqwuLmwHyh7w6/lf20ywy2ATBmtvyG
	TauNMcH0t4Td1ee7QzkotCtQAIYPbD3Apk3ctKQBMIgqB+UfA==
X-Google-Smtp-Source: AGHT+IFcWj/MxjmrVdPmxch8QritOIaLTRMlhZkDbys4s6fntW4mvCl/nwD9FPfF52jhBYUT32dL+MvS1Koz6TeQoRU=
X-Received: by 2002:a05:6512:1051:b0:55f:4f46:9f2a with SMTP id
 2adb3069b0e04-55f708b5e26mr2212325e87.19.1756754554484; Mon, 01 Sep 2025
 12:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
In-Reply-To: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 21:22:23 +0200
X-Gm-Features: Ac12FXzmS2jWw7xFpjYhhy0Ln3t9KFQZe_l3JIooPobPNCmkv86DLX_8q8OSWPk
Message-ID: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_122236_814111_CA366DBF 
X-CRM114-Status: GOOD (  16.44  )
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

On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
>
> > That's not a lot of info but it fails in strcmp() which - I suppose -
> > is the one in pinmux_func_name_to_selector(). Any chance you could
> > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > Is it NULL for some reason?
>
> [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
>
> https://lava.sirena.org.uk/scheduler/job/1758947#L705

Linus,

FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
be able to debug it and figure it out shortly.

Bart

