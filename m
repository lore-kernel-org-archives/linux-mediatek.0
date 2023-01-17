Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A9C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=; b=W8t5CrAQO//wVS/1TNDNSeIh0P
	+WfATwWv6A4GB9AeQcFltO0+pRQi6JAW6qyfbtf5nN6yC847MQjIY90gjHmzRhd7gye7FWEWCXps9
	sU9U9bYvwzLlg/orhcI+CMETpXWqSH0rF4ybsK85OhfPiXhQMJ1kWZLAOOjTWaHA5uzoLpdaE/EhM
	+483XRy0zKz2iyGpH+HDj0mV6myMhOp9WkdE0Zq44jitQB4GOybArtaQGJbhJIZuED+b089T3uRYt
	/AjgJvXuXPLDCV/u2sypOISzmHYrjK5oky/OQFV1/XNp7IMtBufIajkZJ0bv801j5QqEmKnLca0RD
	A8X80Wug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhjF-00DPaV-2n; Tue, 17 Jan 2023 08:54:01 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhjC-00DPYl-UJ; Tue, 17 Jan 2023 08:54:00 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id h10so21190628qvq.7;
        Tue, 17 Jan 2023 00:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=;
        b=IN1tCeVLnwqol5mOOyaSKxyI6kXzBL3oblSeLXVIqXyUFgWIwbZ0AEzA8olwW7upIy
         FObicSGhLmkCghdvzFXSEJAyGxharJCShW7z0r+lEuvRAdFgw/Mxnef/EERBExtq8sMy
         Mcp+PQsHnyA392QlG4twkaHS5FodAKoH3B3yaJJT0FBlqe7JmvyILW6DXybR86bCuoQC
         UqoyUTTaZe3pVph9PjUnNC+gdZK/JhrtzzJA5+OSVpLY72U3uaJRq46DnYklrCW6khCa
         fPiWIzKX0q18Q1gHryK2/LjCQP56sP8q10LYVdVfp1q/DwJiFCOzLG6iIT0dwfrQWPTz
         2MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=;
        b=X5k6bIil17w65W1y8qqcL/iZ0LsTq6oKxtlpEGNwqImQA3n6yFR9m7Xsp6j7UoXWyv
         XteHJiSzV6IDBTFSgAdylYhBAmwdU/nXQQRIHltThPJTjmft2NERgWgsnKN+LFzDzLda
         AuQaD4WS1oN4GgmZeIJsvhwnfXRcRhdMM4TxKadVYthh8wNDNxGW8NEMgwo9wq1Am3qX
         L6qmoMGcF2NA0BsRmjWPfpx3YcHKAna+yg+fXUB8q8Ne1feQ7d2lLY9lb0PYr1NiVhBA
         0BOCv0XPfb/5tVlT2jvjHBmyWZOgkzj7XTnGKnQ7CUq2y0itEgaS7MsAycYu5C2IRR8U
         nPjQ==
X-Gm-Message-State: AFqh2kq3jKzzSoX+Sz18bFfjpsj/g27HPO6dR1plvRytE57KhzeVCFue
	cANUQsK0/tWT2qAsu6Fe6Hf6UFNb5gEPZiX7lFg=
X-Google-Smtp-Source: AMrXdXvLiqXj9jIN/w78ICHR0nICmfROd8xLwBZS8MBQVeGvCEuFhhD92MzOr0asWEhyUaMDPd3N/hzGbdM64AxxTSk=
X-Received: by 2002:a0c:f6c2:0:b0:532:2dd4:fea3 with SMTP id
 d2-20020a0cf6c2000000b005322dd4fea3mr144148qvo.48.1673945635919; Tue, 17 Jan
 2023 00:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com> <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei> <20230116204452.il4gase2szipeexz@SoMainline.org>
In-Reply-To: <20230116204452.il4gase2szipeexz@SoMainline.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 10:53:19 +0200
Message-ID: <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device properties
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	openbmc@lists.ozlabs.org, linux-imx@nxp.com, 
	linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-arm-msm@vger.kernel.org, 
	Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar <sravanhome@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Benjamin Fair <benjaminfair@google.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Patrick Venture <venture@google.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Benson Leung <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhang Rui <rui.zhang@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Christophe Branchereau <cbranchereau@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman <avifishman70@gmail.com>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>, 
	Guenter Roeck <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andy Gross <agross@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Jishnu Prakash <quic_jprakash@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_005359_005608_A3B6F790 
X-CRM114-Status: GOOD (  23.43  )
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

On Mon, Jan 16, 2023 at 10:44 PM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> > On Fri, 15 Jul 2022 14:29:00 +0200
> > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >
> > > Make the conversion to firmware agnostic device properties. As part o=
f
> > > the conversion the IIO inkern interface 'of_xlate()' is also converte=
d to
> > > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence=
 OF
> > > dependencies from IIO.
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > +CC Marijin who happend to post a patch for this driver that I just acc=
epted
> > and hence probably has hardware access.  Any chance of a test for this =
series?
> >
> > If not, no problem as this is fairly mechanical and we have testing on =
some of
> > the other drivers using the new code.
> >
> > I'll probably queue this up in the meantime but it won't end up upstrea=
m
> > for a few weeks yet.
>
> Jonathan,
>
> This CC just surfaced in my inbox while searching for our current
> discussion around missing labels in qcom-spmi-vadc - and on the side a
> userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
> patch's fwnode_get_name change - we could've caught it if I had not
> accidentally marked it as read and/or forgot about it.  My apologies.

Does the following addition to the top of the
adc5_get_fw_channel_data() fix the issue?

+       name =3D devm_kasprintf(adc->dev, GFP_KERNEL, "%pfwP", fwnode);
+       if (!name)
+               return -ENOMEM;

--=20
With Best Regards,
Andy Shevchenko

