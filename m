Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7420FC87FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=; b=r0IqD8xgFWNTqPoWdgHcVAXzcw
	qBXwFCa0avBrf1cYdlDMDsF/m4zOHJD4aRe/Qbits1igOCcN9e4JWWObHRKL6vOMwL6eHXbe7FN7q
	vHOFlIix5wVaBPey1iQy73VsIRMlmL3Kd/VRFZWwVYSxcnbr2yWaV0iQcSiMnbXZQQrih263OhGV1
	4PMu6RyIJ59ybLiClfB3I/MQv0WVwErjSMm+HMB7utwO8PVrOuERvPxUiKV/nDX0q6cQNCJcTNlRl
	eWtN06H/ZtRGbC0cxtQjvrw3WZSMm4x3PbvAN78AY0TYReFGZ1fdyilWn1Y0schRlSND/+wDVHeNx
	n6fryhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3WR-00000001AsL-2oS1;
	Wed, 30 Jul 2025 09:54:55 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3WO-00000001AqC-2FkY
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Jul 2025 09:54:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55b827aba01so321012e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753869290; x=1754474090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=QbEdC91KDi1VDmOsyei3Pmk9KLKN5Sclvgq473nR12RIwg5wGwJNMgXyKc7IjKTPuh
         PScNSz7a1iAaVQP/NXZjAFAqPOQFe8pHuW/sIfS/95nHvEM1WAqSEl37MSn+tccULt20
         DUB3JBXHNQcfdv3ikEv+gEsHeGai1ERAhkugGlP3J0olwf9WjzmCCsEy20e7cqlE7k02
         DHzk574MYAz87T7EVrlqz1DsjnF3PjsLg3K3Emxrb0L3XddSDswf0rqSaH8zRPwQWCIJ
         xvZoKY9W4laUgxML1aGYm7ozX6W1HYKRUAG7HLm9ve0zR71E2J1zDQmIaSkRyykyhFoj
         EvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869290; x=1754474090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=ruK2PAR3BVLe+c4eGiUWjA+yn1OJn3yjKLD97zA6DeaPrtext/TMeUo4Sirbh+jYWX
         m4lTwzKPYPOyZh8myuZLW2SeVUk2dvMpztgqLANg6S179ZRvMrT/U4BDW+x4jI6NO01v
         Jd6oGZPkvgE3j0UoOqMpE2aB7m97qH8rZlkPErkzkenjNuiY0NRjUlsuGP7K1lhM9tMj
         5ZnJxs1Env90z196Sa92KD110M69aptYTetAiBiY3J/NlVH4E7ZXUMf3u3X+TC+Aqvnj
         PZkZGdJcksIlyxQRMVUrIU9xZDBwLa8XJxe92byXzChOm3gvdgxUHYFuQxOUza1XZK7z
         y2/A==
X-Forwarded-Encrypted: i=1; AJvYcCV+JHR1NiN9SzXjsz1AMAqtQl6rZdjRPgyOv9ny3FZY/yWZiRbRf5s9u+9KUKJq9VzIsrOUh05HvKPXRZiACw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45CxroMhp4CKvo5w00ClyiXDWz4/C61gOf2OIJJ1aH+PQ2MF2
	WekE2Ax1S4wsKt1zUTSW/AKE0RRMQvhYbX4Ww0cOiYZC3VP7Xwr74VJ6pDQtIHb+BXWJlAaf2eu
	deN7OZTNMYe0S8jBGbcULL2gH1h9gE8IWplOVprJy2w==
X-Gm-Gg: ASbGncswL0iYokY6/P8X4G0J+bmnOsjdKEG7YB5nU1ujpq8zyKLwcClbdD5fSYXvlfa
	io39wLYX8+XFrJSYSQiiTH+ELkt51BGLmrrzIeXiYzt0vnJFl2NuBrmuvxFBnVhI7jIOEyRYLMX
	OKmtechGmxhIzc5WZlgfZL1ipZEbfPiFhlVdMLA6K5hsnzZSXNoUW/UJ21fTIup31gevE7bb4SU
	yIaYeSYpilmvd7DOAQjp4dURKFHYlEY27uPcb8=
X-Google-Smtp-Source: AGHT+IFD0mC+adTu2tQIUqoYqi4YbEm6lb9KfHl4WlQUhUVwQ9owZPBnvnUOvhF+89ksRVwAv/r0YIR9B2aVVdKhoAo=
X-Received: by 2002:a05:6512:33c7:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-55b7c0b0f66mr939851e87.56.1753869289592; Wed, 30 Jul 2025
 02:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org> <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
In-Reply-To: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 11:54:38 +0200
X-Gm-Features: Ac12FXyouWksKyGI1Z-cYawOTPPQ3IbuMxJxWat2oIDr-ST0nxIlLBCifNIDusI
Message-ID: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_025452_807413_A4ADFDC1 
X-CRM114-Status: GOOD (  10.13  )
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

On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> >  struct pinfunction {
> >         const char *name;
> >         const char * const *groups;
> >         size_t ngroups;
> > +       unsigned long flags;
>
> Not sure we need this. If the function is GPIO, pin control already
> knows about this. The pin muxing has gpio request / release callbacks
> that change the state. Why do we need an additional flag(s)?
>

I'm not following, how does the pin controller know that the function
is GPIO exactly, other than by the bit set in this field?

Bartosz

