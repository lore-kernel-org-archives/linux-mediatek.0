Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEEEFF8864
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=; b=D79Bt9j9B+SGytLyKCkVqfdNrD
	wCLoNuOr6DOXzBqWFyEP4Yw9CPFie57ZW0tdPMQFKljIAfkrq6L9nOek5FLztX7aUZn09v8VYYkUd
	HVU+9BNQ7L/QkCm9oBDCS6PFjtPtyTZNShTwZuVxlzJWhH2QQg23vAHYTv0gURDbT37k1IFQmEr2E
	D+Uei84lpddYYJ6rf+jrO55vz7GbePyqclR1ht3HqyeoZL6tGCw3uKBgkJisoFY2xsDaiptQvnP1f
	73X4iE6nn+rsDzyIOb7v9JbYl7ygqC/myHaHp0d68PaL4iTnMUY3CteSBOq2fks0hjkYDPNbT4JoU
	/yAVwS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0qA-00000003Hdn-0Jmv;
	Wed, 29 Apr 2026 09:04:18 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0q3-00000003Haj-4C0d
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Apr 2026 09:04:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso10029671e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Apr 2026 02:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777453450; cv=none;
        d=google.com; s=arc-20240605;
        b=XfCtd8f6pLob3rC4Hqj92PpH7RS30iKJEDQjXEnSVENoWLh6u7rZtZyOXIO/pu56r4
         AyIk+GSbVUNX5P0QjGKR0EgejGqeoo5nca/QqYDnhw+XlVYNOcUuKg4GXSOVgEBRD+6n
         HXyVp2J8Wyq7Ukr5lXObx3eggFb3bcJFskZ0yFWd261mlABloywID+q61np4TDChZ15h
         yRG/uLjurxEmFEuD5yny+ot0SCwtTeDgkFDP5gbcUjNwouTUoUBO+pn6+L8yzfbX5Eyo
         KKzZlCwjuObUG8oIeoL7sVUh6tspR7FqrokttMOkiTCuuI+EiET/jcNDM24D9sYwEQaH
         ucnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        fh=6cx5eH4mFq0cFlctSTQLOFxLD0X8s4E0NrMuIwtF2Es=;
        b=AJSYPLBabGF5Ybeq4LHNJmubmM6O7f88gdiG1KP7k85lsoXhAN2eHVLI4V6oh3NwnR
         YD0MACXGkEjZBXpvHHjFrjE38NJ5Xg+4O6zeJWm3xZO8ZU89G0ZjL/V0QmsMlLKmNxE7
         G8WodxQizjWUGMC1lXD+xSQhhOkB+pHuomvhmkhzTYeEJMmQgFWpL7ActshCombmRUIy
         5QUA3KqSiQ4x4sxxBzz8SfB8KZZHW4sBaQ3l7kk2Xg93V8vAuLl+/1f/VBeQduCUKETy
         gNZlX/UGesNpbv9pmwCtr0/MmBnqSISY2oV74zar1NBQBrZvtsG66Wwgeb4PgmgzjqNv
         Ddtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777453450; x=1778058250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        b=es05zT1sCrCGmHGooXZjW2bpRm3r0vN53Ys59CDvN8UnKKEIX1ohxlOos3HwH4s3pq
         S83MEvuHdD5wRvZfuWBea22Zy62tCQvyHcBAqP7uIYbYRe9sYNaXlvfjKkV0iU/dj3Kd
         eH3ydD/OUTJrwgqbKH+Do1DeNi1QPXsH1E32g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453450; x=1778058250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        b=pDPb4uxMMZXEXiHP/8Js0MMp1IXQQQRuXMC+RIjFOiXhLB47soVt0urlqD9Gfd7Mx3
         ExzvOogD8SoM1BJZaTCtAId/KJBTAYWVzTPXzWAuQ5oG0MBg4pVT/CXgp2R/GD4PFj/n
         Q5ivoTse1ZVn+7ZCBtrzt+5DbpCRBG2zH86waxx+uzvCVFZQvVgaUKAO/3VtPX5f3c+C
         /mCn2Rrx1L3ryV+uVV4r7K4Bqe7SMfMQpsBNud5JrOqoBH1s5GnTP9Wr3h0FeaV7Xz3Q
         YUUVmuHY7a2CDDWXXSbRdDyEDPJo7ncWB1aNnovwmGD9MpXUXXJeH5HJoh7GTPex6Y3Q
         K8Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/m+TCIXb5oqgE0UTYxGfaLBHLbeFUZTl2VJY1YnOIogGZ/Iu6ibsFsvvddd1a39TxggEfFtAYwyE5nJNGj7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgqtxLE4HkNiSBmYZ/RlkCDYJ8BTyxP4OqtuJrghkZpjugT4xe
	WTzNN51VMibsQdHyp4vJ3wPOZNufWOVZY8oxLTp+SvlQ/3t/2jyEY4PlobRrTRZfotIGMq01LOe
	qz9HF4MkluxhUh+KG47Z0i/HfXBfya5oyhHrc/igN
X-Gm-Gg: AeBDievjgdIKq9m8VNQ2ISL6L0AmkgNcS2FCha0IZ7TFo4MX1K2Q93PiCLEqWu7ZlEa
	5hjmkoribE9fDHoGsVyg7XFmUrTKXpTfew3o5aZvi92SO0fGLhjcdUH124XVHII5zA6Veh/dstd
	Zpb7yUeO1KWgUv6Zx4LTze2O9H6IyG3P/bMfffCns+ym8nWM3lrMfOZnFccFvc6yqbFkZ1MvPw6
	JAniGyC7anqfkuYZTX/qqxtKim1nD+VeX8QNixO4jGB2Mr1AOJDw8mUa7HzIMtgAZcLyat9YrRU
	YaR7hn0zyXdJTWengQ==
X-Received: by 2002:a05:6512:3e20:b0:5a2:b802:8ccb with SMTP id
 2adb3069b0e04-5a746408066mr2496679e87.9.1777453449817; Wed, 29 Apr 2026
 02:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260427021021.2049015-1-wenst@chromium.org> <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
In-Reply-To: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 18:03:58 +0900
X-Gm-Features: AVHnY4Ixa_LZNIgCLfsb9GbOKAlcF0QKkeNUnPhDAMaXwaGqxThuDX0TJXAaFJ4
Message-ID: <CAGXv+5Fwc3a-pedzydrE6OiCDS=a+6Mkqm2=3JX2NmoBg0nc-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: paris: Directly modify registers to
 set GPIO direction
To: Linus Walleij <linusw@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020412_210395_3397B60E 
X-CRM114-Status: GOOD (  21.38  )
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

On Tue, Apr 28, 2026 at 7:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Apr 27, 2026 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
>
> > pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> > the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> > Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> > the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to chec=
k
> > whether it can use a spinlock or needs a mutex. In this case, it ends
> > up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> > takes a mutex. This causes a huge warning.
> >
> > While this class of Mediatek hardware does not have separate clear/set
> > registers, the pinctrl context has a spinlock that is taken whenever
> > a register read-modify-write is done.
> >
> > Switch to directly setting the GPIO direction register bits to avoid
> > the mutex.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> You are essentially decoupling the pin control back-end from
> the GPIO front-end, can you try to do this a more friendly way
> that doesn't wrangle registers out of the pin controller like this?

This is essentially following

    commit 8df89a7cbc63 ("pinctrl-sunxi: don't call pinctrl_gpio_direction(=
)")

And in MediaTek's hardware, the GPIO direction is even further removed
from pinctrl. GPIO is a function that gets muxed, but after that the
direction and data bits are in separate registers that are grouped
separately from the pinmux registers. The pin controller doesn't have
to be involved.

> If you insist on doing this, you also need to DELETE the pin
> control back-end function
> mtk_pinmux_gpio_set_direction(), which is what gets called.

You mean delete the .gpio_set_direction field from pinmux_ops?
Sure I can do that.


Thanks
ChenYu

