Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B15CCA0FFB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=; b=TRMNqD9B5zX1bDVFjT/7yjLcOX
	0bB8tyTibkCvEF5XHnDrCXqBWUPHaTmKMofvqpLg6vbQWp2ZZS7Gef+u6SZIkcvWyRaQiJxZI+TSK
	fFDd9bWvWHCvP4s+aDFutZ64+sRxs/wBSzxbuAy09/gQLJy93EmG5AuxOu4HvFyOHvtyXgTbPyPN8
	q/kbvF7105pGjJ1u7ux44S1laU5NHPwAF8UKnkBlHBWw4TUVRLxxhgfz0sgzkJfJzX3rlUTsLwiGZ
	aEMXKKog/pimpUyqKB4/2HnmzYeF3vyl9NUVcNRETnL/SexqlIFcuiYI/o7C0aUev/0VDk9IBw59U
	4hLMIdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLc5-0000000GZVo-1em1;
	Wed, 27 Aug 2025 19:15:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJII-0000000GDGS-2Okr
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Aug 2025 16:46:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f469ad067so85157e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756313200; x=1756918000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
        b=TUP0t8Y3oQ0YpICiFeXB7Ac8CnKUCt3KjonqFtL7zq1EY8XIhJVJ2v0awG3lJvA/rt
         R1xDLCJYM516fObvCJsV5ojrP9R9JkY1z/PqePuopqYHuSjuL9GlESH+xRHb1V+CERUz
         Py/IpgexMAzGA0h4dXNUYde5ffO7Ww/U3gi0rK1rjZ4/QRPbi+t/zC2PdCE7E2tVcrk6
         e3MkeZzNncfDK1zNpMZvyURKrVRIYPiVZVSpaAlqN/T80hXFFOy8rQZ2V1iIXnBI3BKr
         DJh2OWCNPzk83TCb7GmAshcGJ0cKWuXkz224Xkmpij7FbMQYpRghgSVzAyfXqxCsVkWl
         hcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756313200; x=1756918000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
        b=Oyl4eSCK0jsiZvektWa0pfMMC2J5T/xx4uazkpRaq3stFE+bQ/nAeP7fQ9fHkoD6E6
         jiA62ooyXWHr3weE3xF5MeWewf+3LLcSlnpNSAThmQ+9b1WZKrl79laWV4w7fSXH2cV6
         ZfSw5Sy34HLc2MU1kXzX+rU61FUoTp7IM4+NwQD02VAeDDyr7UlyfpXQVHNFkKf/gK/o
         6Hc6RwGL2+3a5UVavoY6gH3fVZiyqxBNf/TpV8oP+xYpy7xF6WPVL77hprOyZe7/bEL9
         zG8gFuze24atoJYimnc71GNtQctTmbcRHi2bl673GrgGUDQRAXrJsecKSOjPrAIB1A8k
         LhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5UQcwZKAwGzJYdgSf4pdJ3/ar6noTXL7Q00ftFb6PLajBV2g52Vl0QsGkGCWZOm2OaEBDGSrM95nNHYrCZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1VyDK70xnc4QpFV2749qJHi7fdgkULM3f/iNlUR9YFqzvhsO
	lQTXHiSjPVX/vrXW5ApuIF6KnElMBqdwzkPDKV36In5HHsLXGSTtneVEbFkq5yysHvgmoORcFSi
	AqzZLC4aH0RPg1lgB79tz+SnZIJ8Hq0zeKlbr81JnKQ==
X-Gm-Gg: ASbGncttNSfcC5cPEYtwr6u0Z6yscz9GNrSWA34QXciGDxKTnY8NBFH2iL/PWxX/EQ+
	ZIk2yLwqP5AmgMY4ftuQHCKjMzjlh+v68nGhQ5r+Ab0PfIc41IInifBjLTLhY/+pRPzDn9xcooC
	TiU3+hjRVzkTARqRPtnXAnRjSo6ksmOGs0M88k6qOuwlxr15FxRb/T5LcdBZUOKJY7Zk6aLEGe5
	t0lZy+/13iMLbXix7mAlrimx690NmX4I78SkYpL/GF0sXPCwA==
X-Google-Smtp-Source: AGHT+IH2vScJrK3ld667OkWoypLYcKly6TqnbjFjPvpTB4KCLVEthUMwQrvNGz6iiIbdkdd5rCAEnq3AM7MI6KeEyo4=
X-Received: by 2002:a05:6512:138c:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-55f4f4c6a98mr2026962e87.13.1756313200214; Wed, 27 Aug 2025
 09:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
In-Reply-To: <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Aug 2025 18:46:28 +0200
X-Gm-Features: Ac12FXzUBjVjZcm1OFCa8B8Pt22rGMmSNEEFj8GwunzU7aycJyqw28vaNlWwNSA
Message-ID: <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250827_094642_615063_E892DCC0 
X-CRM114-Status: GOOD (  17.20  )
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

On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Aug 26, 2025 at 08:19:37PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > > > The qualcomm 32bit platforms fail in next anyway so I dropped the p=
atches
> > > > for now.
>
> > > FWIW the i.MX8MP also seems to have been broken by this:
>
> > I can't test it unfortunately - would you mind sharing some info on
> > what's failing exactly?
>
> I've just got the log I linked above.

So, I've been looking at this bisect email and clicking the links to
LAVA jobs and I can't find anything. Does it fail to build? Fail at
run-time? I'm not sure how to read this.

Bart

