Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA37C5B572
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 03:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=; b=IEo3oKAsOZ6YoL4tYPmd+o9p/b
	25iuANymWlc9HR3ilVtqh4o93GrknR/OIwkr2o7B9jQ4IgMXj7OS+Uj1JYRz8z1PBoUtuKi5Cp04e
	pBrCbBvdJ+BXv4SiLvCAqQw+qT09Q0VdxAIhWcQsjWuKHbVxA5b9wHZECaYvCCUZLL8k8zEqwvMb3
	4nNn/VUiK182ZaSngyq+GC3r2iE7jPU5VrXIHgxUZSDilAR14VoV4nc4HZlMcOfCiOjaZ1kjJ1DED
	uhr/WcfO2lWdzwbvnf8tw/yOEh10xIIGIaBXTz0SiCllFuv2aoytaAvXzUzC5uQbkxCVYY5Q5cEcc
	hZjPazVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuM8x-0000000HJoG-3I3k;
	Thu, 13 Aug 2026 03:30:11 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuM8v-0000000HJnT-06Uu
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 03:30:10 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-66b2179133dso1714291d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 20:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786591807; cv=none;
        d=google.com; s=arc-20260327;
        b=VthLmBg5qiv3YCdbePZWiru5Z4HM5tPN/ZS4v013jS9m7Tzv2oTBFNtjDWxke2BoHW
         VRNX7kJU8eI2aKQTqZF7yzcmwcgioP3OV9V3GdYHY6+nmbJyj92RhnWK1/J1p+bFa8lm
         z2SsbA0RGnQY4Bg3+zdgnFpRrFv4sqAQjNXIw98f9F8voEX3fKbnaSbQyZ3K1CGQkB/N
         7weC0jMwcD6ckf12UniYeMVjSTOdI6jz7n9dDR6zHlTwVhdBOopbfMMV8anzdUSSK19+
         pzCUXU1qnTZukLjFkAN2MIukpLB6HkGL5aF9o8Is3S8ADFAq5ZmlL0prccAdJpkpXjjL
         Es3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        fh=1OBf2xZzF/eCjW0mekJrQQzZfHPUs2wG3gS2d7o99Uo=;
        b=giuWzP48YiNQYAEoaZ8rUhMnxZbkQLE17ZCG1ufCHvfhleWj3x+G7r+uINKpxSANL5
         jZwvigjH6cTLRm2CanEzS0OIVy+MbJAp6nCHee4B+aN6TzsYJGBI09QMFm/og4SYfal/
         ntqeDkvat7272FjSFtH79YSyp4hPjiO2HCy6dtbYhpJpfvlErDstlKzObnVSa8k64snm
         bm/UZ4L7kLOzSV0mRUXLi8Kxl+BvLP2SLFAnt/c0qFxISX2srFNLMizoTFczdHBcw0/B
         qdDshnIVNg501ILhbcC8z2QQ65fw/lQpxO8GjV3pwU+nP/s5V3rmT9q1kZVrsoi6nQZm
         8cyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786591807; x=1787196607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=NTYwJIHVU2WhiHcg5wUGD+kcK9w6Q251BNxvsSuuM/hMMm4PTFvWPmmcJup+FziAFK
         FRzI5vZW9BtkBTNWEQseWgbqtgpbsn6auBsLUKLaKw8N4Iv4ukFV/5+dNR5zPFMau+oC
         k1GeEpmHwGL5o3lrjsj+Ce0fkJPRVO3vMw9nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591807; x=1787196607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=KA37lkT5aqEEgeIv7Fhvagjz/SFYqKXBCJ2ldV1bRdKTtQoO8nKCk4xwsfnDpZJ+lW
         vZBxzFQY1R67/8UgR3k7N0hPN96r4bNyXe3D6rMZkKy0ixG8n7Z9UbW1QKrCuN7+vGFU
         ibXPsFgymrvwo7kDYg9VYS0+XLx/65XQ1DYu/XgHgSQOeE21Y7g8LwBIoOGJ6qwH9Koc
         5lGMPlbtq2ewm1YjhBs35hLGX/QQTce9TJ8U7db/jQsjDW4Lz40eQI+RnTjvJB43xcdZ
         0ghYQe3Qgg5x3YGJbHJNVtQ71tp6B/HS7VLPipmE/ksDYMrVc8Ag1LSF7FH44LAo9NLE
         Kk3A==
X-Forwarded-Encrypted: i=1; AHgh+RoN/PSAGc43YYzvn0TfdeR76g40NdYaHvuM/S+eMR9gYncxDL29yyDXJjUnX54aIbvcn/LHJFdI3psywVok2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUNt+dZns4c6T6LRSPWwQJ5tZmupTzcZwGkLiqZ736tgcPtFBa
	MxOF9NUHPLq15MUI7wAU22EZ+5dxx/wgznjMwOMA7BjkaYnL2nVpYCMjVIqlbJyPhu4WixCDKtB
	IMvo/GLWNEeXn69Ad4zUCZ4yxjnPueYeZYUJ6hxgr
X-Gm-Gg: AR+sD12SuEOx03axnl60hRzSMo2+NOoa8Yo4uND0aYC4BNDIqnJMVzxrWs2bLQOVMuD
	ea5ebO4jAyofgqlCKsTQFI4Lv+TscPY0uEhmkB/FKQz7kNMwDlgoowzv+VFYL3H3+k7NO+SmjeS
	nMcGkwftGjEIHH++CXRBHxH55WGZUNN+Jjn3Z+/3tp9tlBNsa47UpdnvdUdT4s4oizWeNznNXen
	gXeisQjELz00J0y2cb00NXQxB5ksPG1nN84+NFsq1+3g05s/6jqQHtl/fr33zp8+t61dZ6Jsvbg
	/fg/5fYvLVP4jghpmt+LYajgUH599ppwGyQ5rdRP9RfL2Gcg/XpzNQ2Js+pRg14Jda5tc1eCSXp
	DtrWJJiA5kg==
X-Received: by 2002:a53:e5ce:0:b0:667:bae0:e565 with SMTP id
 956f58d0204a3-66c515b62fdmr981398d50.30.1786591807078; Wed, 12 Aug 2026
 20:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-8-wenst@chromium.org>
 <an02idvk4GtZIMfn@google.com>
In-Reply-To: <an02idvk4GtZIMfn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Aug 2026 11:29:55 +0800
X-Gm-Features: AUfX_myrCG3oNTwmlZwHDJSbsoCHFr7jcGIFmX0-QgCkqwSa3XLy1HbTAXteqh4
Message-ID: <CAGXv+5Gf0sYKvvd=JsdPsahvHCKr5rk+YiVu6SCY6ZQicJzd6g@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_203009_102686_C25E963C 
X-CRM114-Status: GOOD (  18.68  )
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

On Thu, Aug 13, 2026 at 11:14=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Tue, Aug 11, 2026 at 08:20:07PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> > [...]
>
> This looks harmless even without the aforementioned patches.

As mentioned in the cover letter, it is harmless, but will delay the
probing and subsequent enablement of the trackpad.


> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux=
.git for-next
>
> [7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
>       commit: 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c
>
> Thanks!

Thanks!

ChenYu

