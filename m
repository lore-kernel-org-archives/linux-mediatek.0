Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC24C5472E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L5y1Dv6ivY3eszYnYmdXRYc401x9YYY2yBAmmyUG/k=; b=qEEKp+J+L1npxcZlaXGEQD4HLa
	Xs8koEIOwGqlsKW9xVhSivPoCa+kWj8TZgKkZ5l7v03gyAUuQM4x+a9Y4kbvdKtZCFPUeFQMRG5lr
	8Ri60f4oo77+cTS5KpSVHTPppMHBl3DRu3nae3k0/Y0FJBi4Hv3+O170Brl3zm5yM0n+Mld7thO1Z
	e21fzY+Z4rTGRbl/GRaJUpeDoiPVckqVdRyDDkKjXvkD1J9BDSDXPCl4TYD4j/ZTnpjnqS32CfPzq
	gUBMymV1UDAkcbzNh5gfE2suuqO73iQOh12JyG4vLr9H3H+HCBDMTlTLhIx+YiIc60TPJUn2oFrJC
	yWNdC6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWUl-0000000HNWW-0bBM;
	Fri, 23 Aug 2024 15:46:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGa4h-00000004AxN-0tFT
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 08:08:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5295e488248so4550157e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 01:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718006892; x=1718611692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L5y1Dv6ivY3eszYnYmdXRYc401x9YYY2yBAmmyUG/k=;
        b=kGoAeKFbqy+nLq7hEXuWHKw7iCDxqjWa4l8EOwFJ8U6/fE2YPd60LemIQZ/dCe7CJB
         vIf7xEnFalls2ctgTe5Ce9NuG0rwNEClgfrRrMy/OJcDM+Z+hLgZ1lGeiAF0AJ7BH5cP
         WCeuGW0A4wUzM7P/eHFfvpUfJg7ApUCJA+Jn8Ww5rQzoyhSPu2C2B8sC0A6QV8ScFOH1
         ReYd1VkCKrDTR/6p15aEW5UBLvvvkzymJYHWVd7FyI79pESEAuF7DHdv6roFG0Ok3zXY
         +GefGb8qUYhtm5RJIiR2W21+QXUYmIwuyFZ/eYX9h+peKxr33g0dt7V+tn0Wo5txgRPy
         7nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718006892; x=1718611692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L5y1Dv6ivY3eszYnYmdXRYc401x9YYY2yBAmmyUG/k=;
        b=pMnSROJ8LNttCY49miyVFh3jjuHonw4YzwOfRmBUdCDapRMQenluehaG+Xxxm6hh1/
         Tng7E/jaPkFRDiB8jNGSHYU0qkvgUOW8g91+7pNbSIRMhDR7NL+zpxMn3wGULxgzt+IB
         nPJboqFvUycYUBgUXAUcLCm85vLMsg+SyQwDzs2Vo/JkD56r3FZWh58PxEA4ScekopPC
         37YFnuqn39l/O4QcEzvz5Sj3nv8WZ3h45J09x/pZVwIkM8yZCIdNZgCttKSF6Bc7Tcvi
         4KSjRak+s+ctWbCqcJ/iw1YsSEKkcVq4iQbbS96BPBs7omaI2AKEezCp9fwuXoO3uW88
         kseQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6/JDclEGMFK1RbagHKnetkcFj2PhSbtHgF+4InMGofHlKYxNbTwZuk9oGndvnRIlfQlQ48Vv8LkSvKMg4w8Q718ZrjtInnSPqZGCQH+GwipcK
X-Gm-Message-State: AOJu0YwEcUzIa70yVVihIWby4cGFanDWlaKBVldPGm37mcKZH/6sdRiu
	PT+rjZClzI1lO54EKqHQ58g/KyD87W2MvA8XMyDdv12w67+/LaxUF5QPFPRmHzQPd6fSlkuokc7
	w9zxnFtkZYAF8amNGtXPhfbbQnsQmAtyK0h9R5Q==
X-Google-Smtp-Source: AGHT+IEoIIaopVbMhKiBzu+ZFeFG117iZrYhuaSy1PLsnicMvCE0nAaF1iUL9hhnUeVtUHqe9i20V059/u6XmSWe6yI=
X-Received: by 2002:a05:6512:234d:b0:52b:be9b:cafe with SMTP id
 2adb3069b0e04-52bbe9bcbadmr5940256e87.21.1718006892189; Mon, 10 Jun 2024
 01:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com> <87tti9cfry.fsf@intel.com>
In-Reply-To: <87tti9cfry.fsf@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Jun 2024 10:08:00 +0200
Message-ID: <CACRpkdZFPG_YLici-BmYfk9HZ36f4WavCN3JNotkk8cPgCODCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with sysfs_match_string()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais <apais@linux.microsoft.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Johannes Berg <johannes.berg@intel.com>, Gregory Greenman <gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang <stanley_chang@realtek.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>, Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, qat-linux@intel.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org, cgroups@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_010819_385492_9B0BB246 
X-CRM114-Status: GOOD (  20.11  )
X-Mailman-Approved-At: Fri, 23 Aug 2024 08:43:04 -0700
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

On Tue, Jun 4, 2024 at 9:46=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:

[Maybe slightly off-topic, ranty]

> Why do we think it's a good idea to increase and normalize the use of
> double-underscore function names across the kernel, like
> __match_string() in this case? It should mean "reserved for the
> implementation, not to be called directly".
>
> If it's to be used directly, it should be named accordingly, right?

It's a huge mess. "__" prefix is just so ambiguous I think it just
shouldn't be used or prolifierated, and it usually breaks Rusty Russells
API rules times over.

Consider __set_bit() from <linux/bitops.h>, used all over the place,
in contrast with set_bit() for example, what does "__" represent in
this context that makes __set_bit() different from set_bit()?

It means "non-atomic"...

How does a random contributor know this?

Yeah, you guess it. By the token of "everybody knows that".
(Grep, google, repeat for the number of contributors to the kernel.)

I was considering to send a script to Torvalds to just change all
this to set_bit_nonatomic() (etc) but was hesitating because that
makes the name unambiguous but long. I think I stayed off it
because changing stuff like that all over the place creates churn
and churn is bad.

Yours,
Linus Walleij

