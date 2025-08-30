Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEB0CA0FFF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Aug 2025 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=; b=NJ3n9Vox3LrUUtXwpBPZVOFLUV
	je3g4UGpMHbpP53UEIk5d+NaDTcV72hc1dughucH2cL3kJFN7SqyW3Hl/3MBdgp53SJijnlr501+U
	eBPA9jzmaCX0eBtayT9oO3UHCCl3duV2j4o8kZ/nrFVc67CWW2O/Nb/jtNe9LbNzAA7TnaCbcXePY
	4OIaFl9/PDa3Lu8F56morAiWbKHCvRh0esQIf//T6pJtA9JnoOXelRXu+7D3BgIpPCz6F7U+JE7PO
	oxhNi5TlV9h1P07cOMikLurpUzfkoX8gB+aRCV1MnKnk+L90liqzrlcYy+zExX25HlbeeGitqU4eG
	Q3Qn8oRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGaM-00000007a5n-2xTd;
	Sat, 30 Aug 2025 08:05:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGaJ-00000007a5M-3OlN;
	Sat, 30 Aug 2025 08:05:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7a16441so420128866b.2;
        Sat, 30 Aug 2025 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756541114; x=1757145914; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
        b=YaTesmBvfqu1GY7JJBd+y0vXNImuZMDF8tPLAXbRy7lpQsrEZWDDHSlFXj3WlPOHUd
         l0g5X689kH/4gSCgwWlh5BaMVdEYwspvCAglrHmdEep+FoUCUlIDGv0KVkmsdKtDSKu4
         dHdd7zreFYAAfB9RopSmoSudG++D7KsLKYL6kzEVQWLVf7hY+afoQMTm0Xu11KoF6qtK
         bTu1iFnWUxVHp6KLS06JUFk1JMDZbb2DgsqPBXT4PrX58SOmH65J8dnq/O5xpW7IhZqz
         0oWK/P9ulm0+uPetTuQXd84nJSnnBDlADKE1qK0oMwaACY5qbYmXM7izB6CeTlfm3wWW
         yyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756541114; x=1757145914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
        b=p6TBzFaRoaOThQBMq6e6H4pVP47TBQl2ckvvEX2zN47rdYX/5d/8Bc6rvvpNQWDR5A
         2XFlnCp6EKdLDgyK0Y14vU8ogfmW3AjQOlC6RTfQGjmaQxTPAjAAWlmKKjLiEZRrqBiQ
         amnoN6qxUOt/rIUmKxzgz7D7b6R+JLPWKrv5F7/hp68hag5KbiSGo/g3v99awpBZNMGp
         q8jk+h/XL6JqdG4Z0HVZUefE/g5SYA3JSxZNsFEoyouBWDJkFY1tjAKbxeQXCNn4HUYT
         E6haCkEfyrvSQHKaHYffqLQQk1jbks96MFdtd1Ty9s0yraIjRO1ofavFuo+SyxvrZaWX
         MubA==
X-Forwarded-Encrypted: i=1; AJvYcCVaQtdRkuhErM+cq75s4z6eQmWPFvYEmaaj3JbhN3GUB/wzJO1YeFgX2TFLZIvn+TuOUX0hKeD4QCiRInrpksA=@lists.infradead.org, AJvYcCXPR8Q9gtQmWLQC7U85qwr4bLxLFwXD5cJ17p85LYKfXdZA6JSyl7mga8rmy2wIcyA8I0lgxLWUaPmcTfIRws+w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9TuPHir137fIhSXymK9p3SpSqKnwQHpcNNOtqCuEjX8yrc5uj
	ctvzw2oFSc/3FC5JojTzgT7JYzPClTUNng8OFimgaJ96+BFfsMzC2RAVox2NkGbygPC72Nxslcu
	7Y55ZVThlyDq+Crxz+uUiH/SVRzWp8R0=
X-Gm-Gg: ASbGncu9newCwWhnpfoVzkjmkD05QK/19TfiACBKyze51oY65CnyGJEp40bhvn7s+tO
	w6Cd/IWkPKRKP4YA2cwuE6tA3wFpceehBBb3xsTvTPKHy9Br8I+fS67JWIaiiUjxgNY7rOsHq7A
	omKsNGBS+HUrf9ZUvGiBMji48elXBdv1tl4+zVN6V4MbNNmcHl0Rguq4ypKEXLfizhk/tz4tUgZ
	IwBr+I=
X-Google-Smtp-Source: AGHT+IGzflFMFHhQCk11BPmcxfewbn8R9ACv8Yo0SSn9TtnTW1JgawjqxVwsmdBQr0ZCbodUJMXZIPy39a0Dt37TD0k=
X-Received: by 2002:a17:907:7244:b0:af9:6e2b:f30c with SMTP id
 a640c23a62f3a-b01d972f530mr112838566b.34.1756541113922; Sat, 30 Aug 2025
 01:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org> <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 11:04:37 +0300
X-Gm-Features: Ac12FXzW7SA_uUOkcPEFLfZfGLYsYzzZVOKlWfYhU6akvDLYnA0W6YgK2rZDIDs
Message-ID: <CAHp75Vci1uAcA9ahofn95hxufa+Yi1Fjt4w74HSObQq-Rz5zMQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_010515_852396_134EF79B 
X-CRM114-Status: UNSURE (   9.02  )
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

On Thu, Aug 28, 2025 at 7:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

