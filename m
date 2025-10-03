Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F9CCA471
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=; b=E+5xo56r3WaUtWwvpvVLpwd1rq
	R2tknheKDLpgmR7IuFmk8Jb7u54ctKd9Rd56AufSbFa7bDty46wUOpyL/RT0kCaKMYrPGLUyOBOAL
	eZk6v/SBryo9MOXhKWs6pedTw/1IY8v3Rslk0wUM5UUb6VovGbvHLmW6eB5aEK6SAPtaLnwVdGKgx
	lgPHGRzzhLyT3gcL67dlo8+QoxkzZk9SKmYMbPev+rKP7PmShGITuQxNoImz6u3BW3soay59LXetW
	sLiHNg6TZT0JI4ILm6VSZjR9T3IjLrR6b9WrKf0AJkmbkE5RBcibSXfYQDdrg8+z93yd5hq546Sib
	bxfOtwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kK6-0000000Cuzo-3EyQ;
	Fri, 03 Oct 2025 18:16:06 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kK4-0000000CuyZ-0MId
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 18:16:05 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-633bca5451cso2742722d50.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Oct 2025 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759515362; x=1760120162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=;
        b=JrhIqG4XNP9c1swHX504IxhFg+pDEbcPNbAikpCi6gsG0c61bIli0NcRIPh2RatPlL
         W8n3eCJafFIUcmXESMdb9+2Ww3nwOXLUgGHLo8glnyDlcdI6G4FhdRQwgdeA6u8np5IA
         OG6a3gBAvpSbJhVTqUje8d5LvoOOZm0KErYfKfGsdSprxMWsQrWyriDRmmHPaYo7nqTt
         EMMVNyyfUPlW7sUumdJdyfYuXFTh19vtUK+BnTz1tP+9SDnOisxzD4jIIBvKlRyxzBJn
         uhAwANZvQzz32oHXPG3BxX8sybBPIlwleqvRDpsvptNCmKDdw3IEgCUK2gl66JLhzzVT
         POzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759515362; x=1760120162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=;
        b=dEPwhnxXiegXlNrM+0RfmOqbNjOEgeBJ5lkGsyPZzTSoC0RbOypDOSjGRrhSmpcubg
         6UflryHxTR2+ggOiH6zoyHdtI97PtZVrgaMgnQ4MscHuAjm34ERjRZxNTlqIM2RnvHN1
         DlwEJa3lfsgmAk/II5CcWjj0n1ko9QrTIoRySvla7o/4iN7siPunF8+VkQ4Ln9oZUBmm
         jKqXjhxVw3r23CpowcAwwVL20nra//8Y8IqbFPXekgR8GUHstVffQSLVowibzDDfR/KD
         DZD33ZHI64wWri/kN4aIk47WDucMUyJjU1VifvdZWa3sWsOyyg54eEynr5Oi2q9kMc1K
         MK8g==
X-Forwarded-Encrypted: i=1; AJvYcCUyg08ghMX6tWVctqLMWA8+Ny/bQ859pGwmrOeaJX3daoTWbAccCtd5uE8OEhA6BHKUgpGxmb8dNYdG2U88jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5Tp/l3Lv0Ajh8Iu9Vj9xn+mkdfz93HyeOu86iv9bjTkOFPzq
	rHhmtUgbMsG9gV78CIjpZlxZO+tnwozu/pRQ+o/TgSw8MLG+ndWkpCTZbEeL89oo9NcfXFjOOu5
	49X8HzkZFPAmDGaXpRvHUUJB+waZOTig=
X-Gm-Gg: ASbGncs9Kvze2SusfB+hK78UYj3qaK8qmYZib3067CcUQlZsCIUEdo+j5ztA/7erHv+
	uC9n0YBuUO+7PjhGFl+v7uChtqwjSpvvSojWu/HiEj+TKBI2JpHFIt6r8hAwzzqta1y5jIDrlpy
	/BSoAi+NE2tZMuZrbZlPXKFdCnXC34WhWCm1Iua4A1PG3Y2Q+/WCj+lbCMZQbJ5hWqDNmY9Dgns
	F/Ut9Xm1Atm6F8UxmTr6LWkdZDJUXWBoEafMDAfmWKkCEpg7mofBYRfT5jAGHijH7hZ17i/J4yT
	ze+v96+a1UqU6xDGbWRDlOGIGBTGGIU5
X-Google-Smtp-Source: AGHT+IHcaFQJqVTztaB0e9RyZeNiAagOyj3g8KNYxpfdC0wTuijqki+QAQ/mSLPGzCBtgMgInYIWdXqQgPlyAlcpaNk=
X-Received: by 2002:a05:690e:28d:b0:604:3849:89a8 with SMTP id
 956f58d0204a3-63b9a076118mr3027885d50.16.1759515362277; Fri, 03 Oct 2025
 11:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com> <20250929-mt8196-gpufreq-v5-4-3056e5ecf765@collabora.com>
In-Reply-To: <20250929-mt8196-gpufreq-v5-4-3056e5ecf765@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 11:15:51 -0700
X-Gm-Features: AS18NWBanN0MXtcDFrnukKn4J7dSEQIT7fLhFbzGJzYOporRHK4S0vyKzeHBSFc
Message-ID: <CAPaKu7Tz9tw=fbz17kpPn1Pj_YsGRJZR9o28zkfiBgvxL3rdxg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_111604_134826_D966019B 
X-CRM114-Status: GOOD (  20.50  )
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

On Mon, Sep 29, 2025 at 12:47=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MT8196 SoC uses an embedded MCU to control frequencies and power of
> the GPU. This controller is referred to as "GPUEB".
>
> It communicates to the application processor, among other ways, through
> a mailbox.
>
> The mailbox exposes one interrupt, which appears to only be fired when a
> response is received, rather than a transaction is completed. For us,
> this means we unfortunately need to poll for txdone.
>
> The mailbox also requires the EB clock to be on when touching any of the
> mailbox registers.
>
> Add a simple driver for it based on the common mailbox framework.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/mailbox/Kconfig             |  10 ++
>  drivers/mailbox/Makefile            |   2 +
>  drivers/mailbox/mtk-gpueb-mailbox.c | 318 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 330 insertions(+)
[...]
> +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D data;
> +       u8 buf[GPUEB_MBOX_MAX_RX_SIZE] =3D {};
nit: move to inside the if-block below.
> +       int status;
> +
> +       status =3D atomic_cmpxchg(&ch->rx_status, GPUEB_MBOX_FULL | GPUEB=
_MBOX_BLOCKED,
> +                               GPUEB_MBOX_FULL);
> +       if (status =3D=3D (GPUEB_MBOX_FULL | GPUEB_MBOX_BLOCKED)) {
> +               mtk_gpueb_mbox_read_rx(buf, ch);
> +               writel(BIT(ch->num), ch->ebm->mbox_ctl + GPUEB_MBOX_CTL_I=
RQ_CLR);
> +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num], bu=
f);
> +               atomic_set(&ch->rx_status, 0);
> +               return IRQ_HANDLED;
> +       }
> +
> +       return IRQ_NONE;
> +}

