Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1CDC5321D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=; b=2bNMSPOhTwaWTkt7ktZ4bRTUxB
	FhmBvRxEEbq7/dVmocyGKzpYkGnD9fldEhIug92tp051TtRceVcE7Cs+F0dFHqhZItcPM/t3c4bt9
	L3VQhFPFZJpr/kNIWD+WQFicnlzqhXN4+lliqvO0CTpvZLflsr1f2O+uIeIAKkXFKaS0aTbUDeZXb
	cb6IrHDuONHP1i8oS7A9NeG2jUXRpZbYHBTcVUkZp97cEdXazOu+E2KPYNyT5FejzqgMQE8JC9OpF
	tp9nT2Guguxk7uZ+qziz3B/Df78HMa6MDTPcBJYbQ+xhPkgpXjivqvN6NWv2U9Xlaosgj0QRrhNnf
	ms1Ci+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWUi-0000000HNTj-2l9P;
	Fri, 23 Aug 2024 15:46:32 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEZ7v-00000003TlG-0z0z
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 18:43:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e95a883101so76675841fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717526596; x=1718131396; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=Xxf4XNkqAC6rholynCA3SqOGhAo8BUqRq37NXoQzSdC3piUeulDatJuN7+i4rmbEdk
         2wfvbAkMM34RTg5D+meS2ZND95a7XO6/m8dsoG0E1/LT+8s9UUxO64fGiTehk5qZuMS6
         MBo8+JfaUsg5QeesbqCVleQGqgsC2ywUSAfbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717526596; x=1718131396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=fH4xLt9s1Pk9Qe0PmT80pimAM69BWvAXaFumXCXhv9YM9+51fSzKJRicHTHxFUtFMw
         oeP4WwmRbz4tbGYSiMW8B9zWI4pscLsW7+xeG+z0meL2phJHBt/CtyMnL/p9AiHYXZG9
         903oFEJPKJPj7BlJOQtSO9Y/YpAUzzKh8t5sJU+swUf8+s0IAq9FlgPIWLaCPzsgHgea
         yQNxfLiGXgVZ5wK3BNvNY72xkA4gx6EWPMTuY4FrbtlYPOd1kf+u1XHxNu0WbNqWwOPD
         IuZZ/n/rXrX6CigmKT7Lb/p4JouJY2Ehdsv1miF7yDHJtGelMhP7tgvatyQrCRTGhq+Q
         68AA==
X-Forwarded-Encrypted: i=1; AJvYcCV44q/L8YbB+fVaKd1EDeYoQPUyrCbLZv0MDH2ZXGcV54HldC/4rYdHgK4hiBIyQkRRdPGWqO4Vki2LdL2cy/Q8uU+/hNpMTqodZWCGlck+yOxq
X-Gm-Message-State: AOJu0Yx4+CU58Ru+pNy9V4N9oIyl8Nii19Fwp7AnVyfvxQCg/eEUB4Jt
	k2qtNlw0eR7O/ZSMZLxBYmCeYpqf1xF/kGj279NGhHKFNbCekGVH6FilW2YgzWogmnOWZplnX/w
	12aOBuw==
X-Google-Smtp-Source: AGHT+IEPxlI8OKxsXkkafrb6eEIHi6jAtrpALmB8UZt+1VRQF4Lmx3Py/hhNB6P5yKgUfsMnMXM2WQ==
X-Received: by 2002:a2e:9007:0:b0:2e9:81f0:8597 with SMTP id 38308e7fff4ca-2eac7a920d3mr602221fa.43.1717526596265;
        Tue, 04 Jun 2024 11:43:16 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a76d47a57sm2670919a12.27.2024.06.04.11.43.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 11:43:16 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4213485697fso34136515e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 11:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB4YQnbGhxGk+OoX3bhwalxlFYKTqZ+tHYbqJHxSjgjE3o/uu54jArDYoEkbIzpXZpTqMHm3mmYvpkasBbqN5sWx2w93grAkHugdxCodASZzeV
X-Received: by 2002:a17:906:54b:b0:a62:2cae:c02 with SMTP id
 a640c23a62f3a-a69a024ce40mr20818866b.61.1717526574326; Tue, 04 Jun 2024
 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com> <Zl9b_Wh_Lx7Aln1q@intel.com>
In-Reply-To: <Zl9b_Wh_Lx7Aln1q@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Jun 2024 11:42:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with sysfs_match_string()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais <apais@linux.microsoft.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Johannes Berg <johannes.berg@intel.com>, Gregory Greenman <gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang <stanley_chang@realtek.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>, Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, qat-linux@intel.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org, cgroups@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_114319_287107_12F25403 
X-CRM114-Status: GOOD (  16.34  )
X-Mailman-Approved-At: Fri, 23 Aug 2024 08:43:05 -0700
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

On Tue, 4 Jun 2024 at 11:25, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> (I believe that the new _match_string(str1, size, str2) deserves a better name,
> but since I'm bad with naming stuff, I don't have any good suggestion)

I hated the enormous cc list, so I didn't reply to all. But clearly
everybody else is just doing so.

Anyway, here's my NAK for this patch with explanation:

    https://lore.kernel.org/all/CAHk-=wg5F99-GZPETsasJd0JB0JGcdmmPeHRxCtT4_i83h8avg@mail.gmail.com/

and part of it was the naming, but there were other oddities there too.

           Linus

