Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA48ACA1016
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Sep 2025 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tF31xmJcbc0qseWIsNrqZ2L4YD6Ay+rKlY4qBWnaoK0=; b=2Ly6AgPaSD9FoyN0hqDNDw6i8N
	L0Rps1P7yBeLtWJ84+SeRAtlMHpijwHU3mZb7ACPe1wKysLCJgVnH6zQFTl8xD4wVSToF1Osv3I3j
	gieT4fW/U6YiqX6+zrdwJ+1WJ/z6AFV0JrM4hKgZbVSy0N4cmCchedcGT4CjceuDEP6Im8Bh22mDT
	N4ZOW0nIGVG6Hl9df0frOObjZ3gCTozD0AxLMWEKLsoKNe8iMMn33/wC7IHxjG3P2/bpZRw7SLfUT
	qbxrJ1XQFxDzSnqfIkD0qUzDgfl5pW3gR+gteay4tE/gWkdFlAzEP0bdIzWFhwBLV5T5i8+SESj3J
	1cZAHLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNE-0000000132z-3n8U;
	Mon, 08 Sep 2025 17:09:48 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbVg-0000000HEJl-2Sga
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Sep 2025 13:02:18 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-336d2b0ea8dso33658451fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Sep 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336535; x=1757941335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF31xmJcbc0qseWIsNrqZ2L4YD6Ay+rKlY4qBWnaoK0=;
        b=K4PaeHAMctpiAF0fYM5mb8DRoyehqcd4ugl2rl/fvk3WLSPRIUNola6bMYT095Rl1K
         16vVD1Q98REac7bUtSYBWYuUwqKZbxK9ZK2wejRU1uLr5DKqARf2MvZR01yTjq7l6IV8
         PYhuMC9SKDlZez3HYBdXyRewERGgOfkPZpfsdz3Es91+KYcvkpPVAxiaXIwDRl8ubZ/6
         PieufsXpn1nkm/g/sgE0Hdn68aIoH2lsnTMs8dwuxsFrzP+Bk8RBVJnKOEJelmGrNpE6
         HIYBjEwXuKmEdBZeV5VKyO/nR9xQLrUAAisq+Bzinm0ffo5E6okLS0Xu9d8MDI0UL64P
         8IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336535; x=1757941335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF31xmJcbc0qseWIsNrqZ2L4YD6Ay+rKlY4qBWnaoK0=;
        b=B8RYzrmpnCMwtCLa0vVSTOwd7e4f8OculdVh6yXd7wdXdKx+pgmFtNYYUGHgemhsW0
         GIovjmwGGZKmR9PhHgU11kZYcSyKT4BNHHM953c7LlQmeZfUjx+DjsEBRhR5Dn/9JkAh
         msWR1R3MV0rPqs/DFg0w1A5IyCnM+EwWMkg9GdxgOKyXPCdMrfgBImANUIBTyAxwrYIH
         +sirdiG+XnTWBBgrWotN4xYPxWnUIwhn/wvn3s7nJWnDUKpjWvBnk+gdCeoHs6NS6Rsx
         kj/8vrTlvtJ2xna8dSULeaUS6pxyatD5pDvcOFpVF0eZQmt/xL9rTPYxIDjPSU/7d7Cl
         O43g==
X-Forwarded-Encrypted: i=1; AJvYcCU8ht+5PNWP31oW41Z6FYBXikAhXCOWQ2escVDjRTaG+UXEi1oxrCjdF5TsO0kW/RuPdjHkcAtzeyEkLA8Gjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YygKmKVjz+p1vnT/OKZzquty9rMm75nZ7LbcLF2jtmc2Y2taAwc
	xMjFeps1IxOn/wNy2xAqFV8z5rBKNyJa9b3706uJ+tcq89mdcd5lDYUk4yAtIHIN7Ax4O8x7omw
	N90MFZFicWj4WgSDfUVaj1zaM2n8F42BR9w1tdEE9nA==
X-Gm-Gg: ASbGncs6e/S2tOoCooEqEWdaVrYEtQXPCosHf6vgXPH8CLTBdHUvvsHTsPSGtsDpsAS
	uI7wZxCeypVU1LcDawSOJtbocKAoVfIoKZC8IgmM5R6DKSU2r5Y1GVTp2bUMmitCFD7wVxFof0Q
	wo69VIW391uX9crRuK+HJ3sBFOWSF7Yj1aQ0sG6ptKTF/P/xhtUYvluOPMu5slssu76c7lWzhWK
	paRIyvIQpsHKP2d5A==
X-Google-Smtp-Source: AGHT+IEDQrNGIVJ+srnhccYYtb5VT5e/nczDh/a0UTBab1jQ6lcNoipDjpuZsUUuvBbVHlbzfGsEUZMyzV5z27NtBG4=
X-Received: by 2002:a05:651c:b0b:b0:337:88c9:4e00 with SMTP id
 38308e7fff4ca-33b4d6e156cmr26649511fa.18.1757336534706; Mon, 08 Sep 2025
 06:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250908113425.31002-1-ansuelsmth@gmail.com>
In-Reply-To: <20250908113425.31002-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:02:03 +0200
X-Gm-Features: Ac12FXwmkJnm8MDVmgkMoi1FgB_EyiAfRHJw-rYt80JRUULYhM8CUT2H32uFUK4
Message-ID: <CACRpkdZJtHU_pne=48UDBgpfM-9FnJsC8sfN6c4zV4KmDWs4Pg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060216_629818_0124DDDE 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, Sep 8, 2025 at 1:34=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
> the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.
>
> This wasn't notice as there were no board that made use of the
> secondary PHY LED but looking at the internal Documentation the actual
> value should be LED1_MODE_MASK similar to the other GPIO entry.
>
> Fix the wrong value to apply the correct MUX configuration.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij

