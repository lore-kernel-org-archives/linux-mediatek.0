Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F50CA1009
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+a63vXZQbYfBRMYForQk38b20jSe1QhqlF3QJeCGYE=; b=tLuAl7et4g1pKQmupZR5pzFJxB
	ZlFtKt9XBXsbMBwBWCthbUn1H0Ew5qUHSWWPGkwcMaoUsmNKdDOzS8zFz50TjEsxKyj4o8aOHHp1Z
	nxHo5bT/sD5HUNKbByVGZeIofZtB3Cefkq0501trgHzeyVrAzbgR6yQZMSMLOOclHuqBG7rX2V04w
	086dBOLaleFUxSio3qCegTDacb3B8Mn4dZvjj/AGD8Yf6tP+zO5KkKhYOo58dBy2ylsarOnvm7IWQ
	5C/bpf639A05GkWmAKZ86RSykrlbKSNSqQ2VpmvRNRGYPHN6bhDGN6Qq9PMhTaZAy7OMrnMk70GNf
	Y7VMiOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiSb-00000005NM7-0EtK;
	Wed, 03 Sep 2025 08:03:17 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti19-0000000590s-3122;
	Wed, 03 Sep 2025 07:34:57 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5299769c79cso3040233137.3;
        Wed, 03 Sep 2025 00:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884894; x=1757489694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+a63vXZQbYfBRMYForQk38b20jSe1QhqlF3QJeCGYE=;
        b=gng13eDuO7lrnEzEqFRwJalOzGAKK66fGZsEDC0qIDb1oHUy4rq8elPhJEXEHkJSi/
         fL0PbI0eeYpOxug457Paa60vNb7CMnGJlC9Cpfg64PGnB10teJyldOmuLbJXfVygP/Uc
         ZP3zERDnElnz/GD1H8vZ3uW2ZahzZ9UVJyYy0RqQGqnA4UuLfocS2Cc+mZiAZk7ZKiJp
         a6pSKsGUbi7KKbWAZ5MQagnZ9rmgQWovnFIw/biBydWa9yYqxajFXlvx3UQvFxNHCB+Q
         LXixypwH8aScEd0VdpFj+minuk/upbHcAd/2eCDh+4TU4yqbJNE3aYJBsDkmPXdDyHsS
         0uog==
X-Forwarded-Encrypted: i=1; AJvYcCVaF1HEVtU++S97B+w3iauqOlo8dw9LmjKxtI39aC8WC41CbPQZhpjFnhy2WEKAtaOvJy1b1AcC/8yQV+vHrhkl@lists.infradead.org, AJvYcCWUN6KjG+sBcNyjkIAu9vL28NC4Gb1c3BWMSlPvoPQ9KUzSj18lMrEVFdyKmqMczmhNYGe6FT8ylY720yvE79k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuFM1985NNws8vGOqGiP4Cf9kxJjgc5fDuIflah2ajmQyjMK8G
	Ts2iTBxgKJL3Z+qfaeBKDw3rpfaS1Ygy68baNY0VArqhVxxtG3jpZqsEiofd18bq
X-Gm-Gg: ASbGncsIMHr5hTHWliUfHGnoZgv36tifV4vx1CHnmXpgWFG1MUMUwzmkGxLtTmnMBXZ
	nyMhOZeZFW/4RH2ytuMY68XL2Dk9vBCLYylHDzWwAM7X7//pRtbDDPCj3j/SSZNjjGHu4FHHO6T
	JfHqZ4B8QZwSMrkPGhBoCEk25vni4dY0RCpxuKdQ9Ids2jbZ5vCXBrvpyqLcrpOMVLh81pDYX+k
	BiQxSYcBaPmhm3Zxp5UHCxEQg3vN15NW6o41dTuq3TLo0kcgYk71Kn5Fp43vT7o9Qzie6Txyx6Z
	5KkG/nhSyQGW/f8LcPbbwIpPJyCXMm6dmrv6OaWpDhtH7RnNWhxUlOYTO4DSwskenipr7xbzKBM
	AR6/5lmjNHKbjFiQ0qGQHu1Vazf2tD8tMrexRAS7kq/7I+qdPiaNYVndfhiG4WFrk5s+NrxQ=
X-Google-Smtp-Source: AGHT+IFjNwq1UOzlE33K+y+7pbu3fSIpd3PI3n3K8ZGeAp2V9qNeY6BmkJqkHQMkSq2C8QNLn4rzdQ==
X-Received: by 2002:a05:6102:4b8a:b0:4e6:d94f:c197 with SMTP id ada2fe7eead31-52b1bf3bf2dmr5232060137.23.1756884894418;
        Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-899d7986b82sm1104143241.17.2025.09.03.00.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5309a577e86so860691137.0;
        Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBiUzxV1sCB3ZTZjLboytjoVHmpUglVl6XEQcVtRmjgFh5lWRGFxXt8z1wAiEE0ifq2sKqkOD710SNSktV3Fg=@lists.infradead.org, AJvYcCVSEDAvhK+FbpR3+PFhLEQl6lG+M55J4gxG3qakjXADt0AU27L6kTTPDBCGacd+X81WmyyC96vZsWoxpbj8oj95@lists.infradead.org
X-Received: by 2002:a05:6102:3581:b0:524:5266:f74c with SMTP id
 ada2fe7eead31-52b1c8811fdmr4486002137.31.1756884894118; Wed, 03 Sep 2025
 00:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
In-Reply-To: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 09:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd1PeUbdkmrhaFstknwP2x=03m24gacJBJgEeCDf7toQ@mail.gmail.com>
X-Gm-Features: Ac12FXyh8sb0bID330gK0HQPUvNSBJ0mn18x9ggidNhkopon3DqspiWAPKYplC8
Message-ID: <CAMuHMdUd1PeUbdkmrhaFstknwP2x=03m24gacJBJgEeCDf7toQ@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_003455_755597_8C32943C 
X-CRM114-Status: GOOD (  20.87  )
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

Hi Andy,

On Tue, 2 Sept 2025 at 22:46, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism t=
o work?
> >
> > What even is the "generic recovery mechanism"? That's the first time
> > I'm hearing this name.
>
> "I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=
=B2C keyword).

Your original email had:

    Content-Type: text/plain; charset=3Diso-8859-1

Bartosz' has:

    Content-Type: text/plain; charset=3D"UTF-8"

Note that the Gmail web interface does show me the Kanji character
instead of the intended "=C2=B2C".

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

