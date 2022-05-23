Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42762C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdVUeSwOV1Q8UD0fX6ZRG4UgDNpTl//TqH2dxibVyZo=; b=dhbPwveWN99otF
	LCoucxQupC5qJNYWeUZXZdhMyCPvArYm8H4y2VzBZB9ISjzV2CpowDTM2jU2a6MEqE32WD8ono/it
	9QQfqbUgJM1jNwnCWSR4woYQ1ISUlkJ+JOV1lOX3Wuz12GVbC0no283yuLmt8/MJziAUgOVg6VcTU
	LlDnZ1aZ7p4X20qZdIW0ld1vAvc1B8Y602d+jDdU4qAiQxFZsIA43NtWm7goEoT/ZWQkmqXXKC5pS
	4hAyqt8xK3Mk1jdkiKY7LIYwOHVUfbq08Ygww05K8rSo0eGE+eZzwFYfpSFVpdYoPosDQWe5XYEq/
	pdcGVY5MT9Kff3iKk86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntAmv-005D1N-8o; Mon, 23 May 2022 16:20:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntAkr-005CBM-9y; Mon, 23 May 2022 16:18:03 +0000
Received: by mail-pl1-x631.google.com with SMTP id q4so13536351plr.11;
 Mon, 23 May 2022 09:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XscYd2XthDWYUhAkxOPgE7MyEYQIXOYcrsFO2Eyz8Ag=;
 b=Ki7jD0kLG6A9jqBBRwOmAbgHs0YQEKbXmx6QN+gwUBEyb1ZJYbe0yDwlxp69FhjUtX
 qsk6JRwaHKF/LdvjW02F1oQkQ3EO8a8sybq4xvqzTFZustbTvuMALd3Tp3zYkYSe9QiB
 CYdSSNUMnTaQQWR7sXpox7RUL/FhsZ9xYoUAAsthkKLyRmkaOrNM8YInpISw61yB8jes
 iPVNQMygQbILNZoj4k5QKM2PTdrG3i/l6+Hv24SlCqYc4+6lNm4QWn8U/YiJfYegJDL8
 yOW7DGQXrfNNIbRLSIXEGXh3pgyWIfooUG6qyZGFshjMWk3DGk6sJyFzp6xgRBkxE6ql
 ORKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XscYd2XthDWYUhAkxOPgE7MyEYQIXOYcrsFO2Eyz8Ag=;
 b=upIU8OPF4IQp/m5SecyXV9G5M0hOEg6/9VuvDNj9QXv4fcziZTZI6l1GyitP3Wdy3g
 xLt81gXslTUYcpkphiVRl+6kK4NycV9tHKbVJbw3Rx1JqaRg0AzVIkEe+md3U2F5HIDq
 itCBQ7SpSS4zsTMkwzm0eSFQtpJUbwbF0cIWoGPVNF+qnwBcuBr555OQ1n7zPFvMZFWA
 odil7y4fXO1ws7GyOt54eouBRHLShRv/xJyUPmiuCcBvpNhJdap1eC48+YVdLyE6erzm
 BW8hQ0f2E+rBx590z3rL9R4JNDzkyUPXG6PnW7UHOX46N/n09UJrGg89DOqdDlexPanz
 7R3g==
X-Gm-Message-State: AOAM531BmyNdBrTjE02E47fZZosd7NzfJnginbw2XITn+6Uvb1IezMvA
 iUvMypdFmxWO3K2cWHBowKo=
X-Google-Smtp-Source: ABdhPJx1UvRPNtRDvXoFm4s4GFCfRU43KQsGhriUzOMYUgwZZJJ8O6kkqdWzCkCAWMgpP43D1W2s0g==
X-Received: by 2002:a17:903:11c7:b0:154:b936:d1d4 with SMTP id
 q7-20020a17090311c700b00154b936d1d4mr23608030plh.78.1653322678114; 
 Mon, 23 May 2022 09:17:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d84e:5dcd:9d68:ebbf])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a654104000000b003fa95b940bdsm595341pgp.88.2022.05.23.09.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 09:17:57 -0700 (PDT)
Date: Mon, 23 May 2022 09:17:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Input: mtk-pmic-keys - Add kerneldoc to driver
 structures
Message-ID: <YouzshxT6bjxiRqr@google.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
 <YosOsgPwMGuLk9dv@google.com>
 <56598535-5aa4-020e-25fd-295416f4d979@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56598535-5aa4-020e-25fd-295416f4d979@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_091801_433422_F6B24568 
X-CRM114-Status: GOOD (  45.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 23, 2022 at 10:54:03AM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 06:33, Dmitry Torokhov ha scritto:
> > Hi AngeloGioacchino,
> > 
> > On Fri, May 20, 2022 at 02:51:28PM +0200, AngeloGioacchino Del Regno wrote:
> > > To enhance human readability, add kerneldoc to all driver structs.
> > 
> > I am doubtful that this is useful. The reason is that I believe
> > kerneldoc format is only useful for documenting cross-subsystem APIs.
> > Kerneldoc for driver-private data and functions simply pollutes API
> > docs.
> > 
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/input/keyboard/mtk-pmic-keys.c | 30 +++++++++++++++++++++++++-
> > >   1 file changed, 29 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> > > index c31ab4368388..8e4fa7cd16e6 100644
> > > --- a/drivers/input/keyboard/mtk-pmic-keys.c
> > > +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> > > @@ -34,6 +34,13 @@
> > >   #define MTK_PMIC_HOMEKEY_INDEX	1
> > >   #define MTK_PMIC_MAX_KEY_COUNT	2
> > > +/**
> > > + * struct mtk_pmic_keys_regs - PMIC keys per-key registers
> > > + * @deb_reg:             Debounced key status register
> > > + * @deb_mask:            Bitmask of this key in status register
> > > + * @intsel_reg:          Interrupt selector register
> > > + * @intsel_mask:         Bitmask of this key in interrupt selector
> > > + */
> > >   struct mtk_pmic_keys_regs {
> > >   	u32 deb_reg;
> > >   	u32 deb_mask;
> > > @@ -50,6 +57,11 @@ struct mtk_pmic_keys_regs {
> > >   	.intsel_mask		= _intsel_mask,		\
> > >   }
> > > +/**
> > > + * struct mtk_pmic_regs - PMIC Keys registers
> > > + * @keys_regs:           Specific key registers
> > 
> > This new description of the structure and of the keys_regs does not add
> > any information for me.
> > 
> > > + * @pmic_rst_reg:        PMIC Keys reset register
> > > + */
> > >   struct mtk_pmic_regs {
> > >   	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
> > >   	u32 pmic_rst_reg;
> > > @@ -85,15 +97,31 @@ static const struct mtk_pmic_regs mt6358_regs = {
> > >   	.pmic_rst_reg = MT6358_TOP_RST_MISC,
> > >   };
> > > +/**
> > > + * struct mtk_pmic_keys_info - PMIC Keys per-key params
> > > + * @keys:                Pointer to main driver structure
> > 
> > That is obvious from the field definition.
> > 
> > > + * @regs:                Register offsets/masks for this key
> > 
> > Ditto.
> > 
> > > + * @keycode:             Key code for this key
> > 
> > Yep.
> > 
> > > + * @irq:                 Keypress or press/release interrupt
> > > + * @irq_r:               Key release interrupt (optional)
> > > + * @wakeup:              Indicates whether to use this key as a wakeup source
> > > + */
> > >   struct mtk_pmic_keys_info {
> > >   	struct mtk_pmic_keys *keys;
> > >   	const struct mtk_pmic_keys_regs *regs;
> > >   	unsigned int keycode;
> > >   	int irq;
> > > -	int irq_r; /* optional: release irq if different */
> > > +	int irq_r;
> > >   	bool wakeup:1;
> > >   };
> > > +/**
> > > + * struct mtk_pmic_keys - Main driver structure
> > > + * @input_dev:           Input device pointer
> > 
> > I do not find this helpful.
> > 
> > > + * @dev:                 Device pointer
> > 
> > And neither this.
> > 
> > > + * @regmap:              Regmap handle
> > 
> > Nor this.
> > 
> > > + * @keys:                Per-key parameters
> > > + */
> > >   struct mtk_pmic_keys {
> > >   	struct input_dev *input_dev;
> > >   	struct device *dev;
> > > -- 
> > > 2.35.1
> > > 
> > 
> > In the end we ended up with something that now has a chance of
> > introducing warning when someone changes code, for very little benefit,
> > if any at all.
> > 
> > For driver-private data and functions we should rely on expressive
> > variable and function names and only use comments for something that
> > might be unclear or requires additional qualification.
> > 
> 
> Hello Dmitry,
> 
> it's been very helpful for me to see kerneldoc documentation in the various
> drivers across the kernel - helped me understanding what was going on in an
> easier, more immediate way, especially when looking at drivers having some
> kind of "complicated" flow.
> About introducing warnings when someone changes code, I believe that this
> may also be helpful (for a developer) in some *corner* cases, but I agree
> that this is unnecessarily tedious in some others... in the end, it's all
> about personal opinions...
> 
> Of course, some of the documentation being obvious is unavoidable when it
> comes to kerneldoc as you either document 'em all, or nothing.
> 
> In any case, if you really dislike having this kind of documentation, I can
> drop these commits and eventually add in-line comments to some variables to
> make them perfectly understandable, or I can avoid documenting at all (even
> though I am strongly for documenting things clearly).

I might be mistaken, but I think what you appreciated is not presence of
comments particularly in kerneldoc format (you did not generate htmldocs
or something to study the drivers internal API disconnected from the
code, did you?) but rather the fact that some drivers have been
well-commented.

To be clear, I am all for adding meaningful comments to the drivers
structures and code, but kerneldoc is too rigid and adds too much noise.
As I mentioned "this is a pointer to an input device" description might
be OK when looking at HTML docs on the web or elsewhere, but really does
not add anything when you see "struct input_dev *input_dev;" a few lines
below.  So my preference would be to add free-form comments to places
where intent is not clear. For example the original comment to "irq_r"
was pretty good IMO - it called out some irregularity and explained what
it is. We could definitely add comment to "irq" as well to tell that we
expect it to fire on both press and release.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
