Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76648CD5BD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2026 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=; b=d6E6R15FaMkZK0mU7NLCqyJ0jT
	uv+82XprtHXLgbkyBoCUsmJnh3OpgOe+UlUrv8CIWVf1aOmbFqfI7oMmtjYGcxc3fjZ1eQSp9DYhB
	hPuztNRcbRjRepXn16qPHlTfFGPLfRbOZ0iAnBBLwUVw+lwjjQysFHGg/tZTQV7wxOYA1Wyy/Vha+
	DYfhtrhoCgXqiNkM4Jr2FzLzLSWCwVOsCJ/TNGaudwaM9jG5DJdEYY1XvKAmkLIe0Bjkva12BNkDs
	CQVsFFLBb3B8ipqU0OZCClKqEKOkNl9Zvw7YV5CKeD4+ZhzAwvHOfJhm9LfvSwxPotMX2VHmmeBOq
	JQ3Rg/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsAq-00000006vIJ-21V0;
	Fri, 29 May 2026 08:02:32 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsAo-00000006vHQ-1Xve
	for linux-mediatek@lists.infradead.org;
	Fri, 29 May 2026 08:02:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bc85eda6b6so69419255ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2026 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041749; cv=none;
        d=google.com; s=arc-20240605;
        b=LrZx6QY9fZ3hN2L+5NTkLCdEkD4ekT6mSWCpYb0pSiqd9VOpXulI/WgJYILcKhrk8O
         i3E4P6XlwovzUsF2SYXaj50cr40G3qC+3sxlntI/1w06B19R2CUcu7DNhitZWNihMhaD
         AV+AomXn5NAIX8gnI2GOEHJbleD36LJSNDMWTxYYn64niONhAor6lHPNVMNEAcRVKtAb
         M2c05x9DRXNR+o/VLgEX2b/okaf5vlqxmBIDrZrLQsOOZwjPDdETb44ISsi29X7v/NYx
         Rk3GqZYCpNprju1ygKG4nHZHLc+47TK4K8JmC3SBMSWWNQOY6I+JD17l3lq80jg/kgI4
         xvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        fh=KulYJh/wYgyM5hu53CgEwjoOPfgtHcu4gT5ffTxz7o4=;
        b=afmRhLXwKT4E94hN570Nqs0Y8k3uU+uFLBzvwZxIIqoRRnEjw3cVQHCvMt93PIFgxN
         +BfJQIxxyP8NiHXRcH7opZulzLH6jR2u+rDMCC8ozfV0Xgzsb+NeSwqUmkwKvK3fB/fM
         jvO7ZEdIRAxxbyQDNpfaEJYQ/4F3vb7bz0DZGNKhCLeXHGpToF+UyoU1t8A6WcJ1lQZL
         zQ+1UpCA9uNp8an1TDG3DnBILfylTNt+wNZBmK0EnphlTD1h3huB2+4UNybWuENivkrk
         SVmYkpvbuwE+mUz1De071Dfc4uzoXyk+057pKyF8HrLgw1Cfmoykz/OXDl6WMhCmx9im
         vvoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041749; x=1780646549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=njEQ814Mff7yd8+WoMZITyqiy+IkM7EHGGvme5x8t2NXtAZDm2MA1OfqtCugAWFy6a
         Qk0j+qB5Lw5M54UlJQJzr4U3Hrt8FGuBe6zpRLEVXbhU+eaWGpbYfEjlNvGhXSLH4xv+
         MBKeulUArJ0WAM3b4QkU62/UoE+a81KeOLfoDVF/FrP3BsxgZ8Jn9DDfLKC4MCfgwkqv
         bzueZpkx3eCTAHkeOMEcyac1o3YjmHe3ylTJ3YXmAKZnn/PVkWZqx9h1jFAw57kcNmnO
         0vO3ZGIh7yQQaPTjK5xhYPs4YWT9x9IZN5ywNFAnwmULdLyS4BC7YWTyysoj8bofQfgP
         K9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041749; x=1780646549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=HEP7jShriVqGBMEzBDhjrYLjlemiVZ3UcqtJ55h8Lj1zjewbHnkXYfdOcxjTMSqFmm
         zXmygdBvpf/AbCsyiFIC4ReT0qTeCj6JLV2285+kw+ZU72kJF3GTlg9tu5TkjZRvmvPy
         c4IFjIiPUWpU0wOa8F2fCpejrh4CDr4NyZNPAS5+HqYJCNyNEEW8Es1qNsi2zLBgupwk
         vJIpoDnX7yUSR09TgXZdTJS1R9FdArow5TmMAvcpsOM0oTC9janJGxW8Ox6fBevl5nPY
         ouKPZNyD935ByHRZFYTBKbOgQY7tddzl+UNZtTRG9DGXtxnG1wDTDkHUagZP2axP6iEW
         alCg==
X-Forwarded-Encrypted: i=1; AFNElJ/IjoqfgV4KqJOGi0IAMH/1DTHQ8lRsLNxqzKJTnnKf60KszuCZjq+PXCNaTKr+Z6AiDvAXzgl11u/UBudq5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmi2T7lA4Tu7clh+kRHVvSEZuPqOBRE21V17oC62Bxkw4bpNIj
	NnKT92RQwrYc4p4/weubqcZKBWXlg173McZkp0HOF+riMwFvINWO0lHFKAAi+w0v917D8lGr+Mj
	Kapjo428gFQUNg8XlLC/dCBjeIXRNNkQ=
X-Gm-Gg: Acq92OGKa9x2sujue+xXmR2COpWXSCosg6CAfyNuRncvCnHM4MoFyjFDvHIUuFtubgX
	5IH80WziUeaAztP461GCP5a/JqNaDPpjqUtYEg8YCtc55drlfNdtxSnmjz56aq827unQj+ke+Ti
	HkNfLNDVP3VPX9HheiRD+Vjaq/uyN9LHSHYtudoAq1K00Ot2/3doi14CA0l4WZ2Dp486Kce32MX
	tmncQsiSzxNl/m6tkJ5KqfDpnAzvogN/vWfy06N+94MG6qTc6Dg9Ab24sWJMzJhYPrI61rUqR3G
	voUS4BtlDQHNwIYzQco=
X-Received: by 2002:a17:903:fa5:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2bf2053340bmr25566605ad.4.1780041749021; Fri, 29 May 2026
 01:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com> <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 11:02:17 +0300
X-Gm-Features: AVHnY4KLQby2GKgYCaNbHrRuPj0X0-ETK3PqgCK0q7F1iL-UnUKeln5tOfAvRio
Message-ID: <CANhJrGNyB7aqMhR5DiLXd6OPmsE4Vox=K7UwMPZ1ZZc2-Ciw3w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Samuel Kayode <samkay014@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_010230_410342_EA6F8A1E 
X-CRM114-Status: UNSURE (   8.78  )
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

ke 27.5.2026 klo 13.48 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

