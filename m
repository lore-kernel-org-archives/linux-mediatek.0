Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03656C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euwhIsXaz0VLvDyOMBm+aGeo2N9PmOW4/s9hUBEtSZo=; b=D4ym/Q38fMGr1VA9Jr9CeJqsth
	aVhTZGAUm+G2r2UeWyaTXUpk43nOFqVrlvbJ0ZOWfSDcHMPJWoppfHNfBzG6ekvZPWLaNz6BaHQr3
	EMcO7YM5Wc0LIokLkWhG9338d8/hTFvyxKN/Z/c4ciJvI26PM/LuEEsA+Bhx7b/CZREkULDQSrc4y
	GOSwjR6BIq2ZmSUNZiCIBOOCrLUalHvfvxixo35XT/E7T1wOWGzWX1wWl/xAZpp5OjRIR0qZChuIe
	DVETqh1Nrx/g5SF719Lj+tRm5C+ziehdvP4XvH2O+QSd0cdTMxRmADJBP0oo4Nxauz0R57uoIhzI1
	b2gXuaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCq12-009trK-1X;
	Mon, 11 Dec 2023 23:48:48 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCq0z-009toz-2S
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Dec 2023 23:48:47 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-da819902678so4647387276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Dec 2023 15:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702338524; x=1702943324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euwhIsXaz0VLvDyOMBm+aGeo2N9PmOW4/s9hUBEtSZo=;
        b=e9jx9YJbsgK/vrxVgEZ1UBFM9X9i0OTciJhH+XqM1VR9jI58JDkcxl7s9FZvBPWLTe
         mA0eXf/AUsGvFdrWcX4Tu2EEoThDmHldbG9iSkELVpDDshIEK8zBZPkH8YGso77SZ7yS
         Umo0WbTWbOTCXcezUpOwjc6XaTyvQfkT9DG5bqWfS1rlRZD4tw71rWin1e63oFnrGZWK
         Le5k/U8uZTZrPBdYNJSX4yY128kfM0AF8F0glh9Hrsv5GG+MXmICxWRwjUyraWqwS8ri
         jpuspaVYSM2h5iMuSibt8HXm3wH2OI/3WuXTwMypbCl0pxHHSsdgU45SYSCM2rQKmeJ+
         Homw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702338524; x=1702943324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euwhIsXaz0VLvDyOMBm+aGeo2N9PmOW4/s9hUBEtSZo=;
        b=boCF6I5aXk9rv3/i5NaHLrPNVknfpQR0KD78pefvcsnxJ1gaZPX0UdBeAAev8X+Bg0
         3gh0VT4/tKsZNeR4/Pm/t+isYtWEQ8LulxPEKRY7Xq1dqto+VK4Y6shaIbuQu3EVL1W3
         iMctuBkGxyLljSoCYD3e3bUoape51AELkhRsHVW8ydspFNNlqBYf5hAb1Oml1L8K1NOX
         bpEABKhGAr2eMI0xkkce0tG+L1wgrEEC2nuREDTm1Th3KBprDkAqRR1PKK1OdY7rIkFs
         a+3jaoywiGC1GNigyRQyKpHgURQXBkPgDwLQH6e/wlEjLih13kCZMWeYVqE7wIlvzuAJ
         vhoA==
X-Gm-Message-State: AOJu0YxkTIGBKqe9QeI16XWu0WSsR0wo4EVXlcCUBwWHESCxoSUq68qr
	LoCgqb09ySNYNmMh3qPkg0hifQw+tt6bV4ZQP5xeoQ==
X-Google-Smtp-Source: AGHT+IF3tcL6UUeVPz0zW8dM+eYBEA/+XZsY8k/PjoTsu5zg1gtMmDM1MoplNrzJcbsk6c/SNpSN4vT8MNFw/3YCimY=
X-Received: by 2002:a25:254:0:b0:db5:4715:da36 with SMTP id
 81-20020a250254000000b00db54715da36mr3859002ybc.58.1702338524206; Mon, 11 Dec
 2023 15:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 00:48:33 +0100
Message-ID: <CACRpkdbbDAph2gUyvPCPD0s6LtjekK8zVBPLMg1ESB_1SMow_A@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_154845_819168_CF2B3DEE 
X-CRM114-Status: UNSURE (   7.83  )
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

On Mon, Dec 11, 2023 at 8:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The struct group_desc has a lot of duplication with struct pingroup.
> Deduplicate that by embeddind the latter in the former and convert
> users.
>
> NB. The function_desc is in plan to follow the similar deduplication.
>
> This time test-compiled with old GCC 8 for arm64, besides GCC 13 and
> LLVM 16 for x86_64.

Applied to my pin control devel branch for v6.8.

Yours,
Linus Walleij

