Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D640ACA0ED1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 04:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=; b=mVuEmqrh34wrSXp5oreq+Ehdg6
	SBBAS9sc7jNAXVoUpgZ8f8lNnDjQruxYQb6bpXHi0D+6l5WvZKbNACAVLo0qte3q43P1tIIXhErg6
	qd9Uuhpzd6qzYHjYJSpsZXmmSGeuSDSVUETDW6uwRKn3maUTymnhlL9s2HMJwRABQIGIIJTof5EEy
	DzmEO67p/IfD1/v62ISwSZsfO18lifXvAF86U/gFUdhNITGk3rmSS57YI4/JxtsHgkBiaGVK43EEr
	3WSteBRaOOmTolz9zxZm0xpwQIerAeoAhGTrQXV5fScZQzvB2ftAh6Z2ZU0+bxdCyQvahPln+Bp5n
	TA7OHLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umPCL-0000000Fii5-2CR6;
	Thu, 14 Aug 2025 04:04:17 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP68-0000000FhtE-3qOF
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 03:57:54 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55ce5253adcso512411e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Aug 2025 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143871; x=1755748671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=QMzWiFHd1PubSEw6X9sM1Dg7Jm2iAOqJ2eMnUdpfr3wgj3mL5UOIJO0hqY2EB5bMP+
         rO6zCvIEBrWuJTKVoqXCUrEspitd6WQmNx6XbKv7FpsNI6gt8yuqqIfuBQWq7qaRwZq2
         UPJdIsIWZ6JrDFw6Hh9GfugB7kuoUGgfVM3Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143871; x=1755748671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=kEkL5fVlr38gOrspRWJKxzCaAPb139+pxRI3Nb9VdlWrckFkwKtnLm9ivheX8xgeSl
         U0CY4mHPPDoRz8iS43czHdfCDHGWEwOm9YkwjCE4cXdjDgIPKJjEg4zPA5QRYpRhwFmF
         tuaC3XzMkKf9lhOWWjkT055xHIHN13aLBoZk/EP1wrNJJPzPR4RB/AufITQEllvdb/7T
         LqlxYP3nHO6IDyTje1cW8S95lfXUm2/70nU6XFP6FpxpuAC4PKd0XVKlPHeyFhIVjDyC
         d4RlTSqLF6z7rW3iJTH7TajVUaTHb/nwo9MRYA38uN2u+mUXpELwbq1K1jZxljn/srLo
         9eew==
X-Forwarded-Encrypted: i=1; AJvYcCX8VjgAmhPIMkW0zmgefCrN4fPzeaLRee3GCnT+2qksH8lMX8R7auW0ItEtffjbwInkL4c5z80mccP0d8ZLRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVSsyWz1pyt+FTa82ciQZmdMF7eKPh+ZZB4d6NppBt+IiVe+db
	Z9y//qlGZI9fq51z3gM1D4Ub1YVHF6Y7ZMR1M0kruePwGM7aZFO1AAM6Ec6o+25gB6hhz9w2nF0
	7sgO51kFp09TOjM5sWfwRgkux/Qzi5LkCCY8k517A
X-Gm-Gg: ASbGnctX21ePVY4moqlq8hNDW/WHwVV1JqNMSMBlUFRu1RP3yeug0Lzpa7XWb1XWNLn
	M5ZA8XydF+xgl22Ns6zhgO4o3Yrv47WwntoJgLxF3xGtweCoAncBW189cs6eEcZcsvrETZr+/c7
	ZpuRYuDo0tUhw6LukVYI6Y2/ofN6ftOIBv0E4SXBOxre2sGybbRaxZaI3e/GrwueKGWyWJDuHyT
	VbTMo3NotWtv74JiBgntYnHF1iOI6Gxq5Fcrn3rMWm81w==
X-Google-Smtp-Source: AGHT+IF+5iKv8rMK9YHb6myK/q855kRCdUIsQfOlyE7uVil4m3zuwOKJ3gr0xAyECxLHg6Jl7SqsZkrMsfX9UPSHH2s=
X-Received: by 2002:a05:6512:b8a:b0:55b:8211:cc88 with SMTP id
 2adb3069b0e04-55ce508ddefmr488807e87.51.1755143871084; Wed, 13 Aug 2025
 20:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:57:40 +0800
X-Gm-Features: Ac12FXwH4SzGC_raZvHd6w5DhOOOwcWIZ0DYC3dWkFgv22xak8lk2qDrshBunvY
Message-ID: <CAGXv+5EDj4JEKAFC-Sv8kyiBNy8SViEXaepdssG5QTu_HtYQHw@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_205752_954009_BA78B9E4 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

