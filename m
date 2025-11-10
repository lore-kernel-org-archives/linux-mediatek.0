Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1EFCCFA13
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 23:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=; b=VgI5WPfTJS6Un4Oo7Ut5ldkRZs
	6yFIbmMYhor27ECVe8Acgc6qMWwd+XdgP7hQ1FBulQB/bO7KrqeSk6k+HD0+VLvyd6RvUaVLbXkkA
	XRGPmVCZJBEPvFNYp+e/uN622C3oRl+UlXB0FjhwH8bOyv184QYlYFxXaJzlm2UdSC7icM1nR12Ef
	aqT3Pr9B8fu3LpB9zQsOuSpKyRGR2eDXTcj0sGytZeKBUxfjhq6qMofFxUeKQNR0lSAL0rOI94gCq
	2aaKlA3wqVFtNfWWhWoVPmOY8skKm8EwhESvYJEUrcwIvScNHLYt8LGtGlw7eKgXmrK1iz0OlNbHa
	a1HvbErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbbE-00000006Gu9-3Fhr;
	Mon, 10 Nov 2025 23:47:04 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbbC-00000006GtA-0PY2
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 23:47:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-591c98ebe90so3764710e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 15:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762818420; x=1763423220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=;
        b=DDW50PcPnT7J5/0DVPv9aj7qjt+jCwbY1BNnSVd6NshP3MuxV7Y7a9TDZ0Cs9+PJGB
         Dr/8NGC/TOGRN7GutKkSsCtRvJrV9ucMFe9jJSkTrNDAaZ1+TULYj116jsXDF5avlb6i
         +U0RvI+BEnH2heW9z2bhEVBftlXNCEwLM5uLnzzt0o3PhIHY6wqTKarZgRV9E+ef0cp1
         KAyc0vEESJL4oGFS38ZX1Ar2g+wW3XO58cysIkQ71Qj+yGinbx8FIMwXQtS6CC8FUuDM
         xAjOeSbGS402S/fNa6b1Jiv+s6TfUpDHk9OobE2wE2tqvI3k22oDYWW6Qwb0lYudUTPQ
         PNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762818420; x=1763423220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=;
        b=Ekog71NAulwz0U7/dBcvfnlT7AiqhIh/gDGOkIGE3ZYPhi+OezNrvJAp/auEgZqppB
         L+NXeaiYJeUbK+guxymUTISCvVa3DERn0koP5mH+1dVjROxYxGBwpyvyhPuGS2BAUEBL
         iVGIq5ShwALRe7QbTbj4Qca9Unsxyo4LXjuwPg/ybGrz6Te1jbkEDnVj0jOH83UIDMj7
         SbleIkd1Q1EKVrKYooOpIMa1m8TNmreXhFdl5KwFaCc9A6gr6JuB0bxrHMjnkmrS1BpA
         UFWPknIJoFD6WZVch12T56DSjW/ZYOkVs4HoVOSZxm+hE9ltULSHTEi+jzfm5GCS7jIZ
         4f1g==
X-Forwarded-Encrypted: i=1; AJvYcCW3XTEFG8IU8jtIyZ+aEiYw2QM6bJRgLzSLez4IxdIH+Wi885dXUYttXKPCXxknKOwmSt9FJW7gH54BaYrg5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCiHfmmESAVQgElW1erxzgQI1AAASO51z/Tjs6jAM1/M4TQFX
	AMgS52NmJiMFdaQ8P6kSHhFwtHYBf7qSLJChKqosJ8ycYqvDtAnkbJdgyfs1zE91xPYHkacS97R
	cHMIy1yYodyahH0hZvZcF3jjvQgoUQUJNsfJ6qSi8TQ==
X-Gm-Gg: ASbGncsXmFJq+nNowXE6ZPfV7bNPGh3elrd4tHPY2Oa+/QZ1milpY3U3orWXvY5MTx/
	qMb4Ad45oIzSIX1pxmcA+N9Jy2iPMlQbVHijM9Ky2keXRuWLD8mmvu/77zbu1gUJvzAnyJg7xty
	BeysoLM0Qe10HjD+GcJNiUtZVsyTIGwluw38j/o+g5NWAcM2h1BrnKCl5lnW9HRXsuRkwaXn/HM
	J1447LDE65rryh64ZD4RptoQykz5wTQ+g9pkieMowszrwHUFLRn/Yoz3a/jnOn+CKl4WCke5HlC
	DUG14w==
X-Google-Smtp-Source: AGHT+IEYlHtlcaIbYzh4uIcS3eRGPuN1bn7uG7yYIbKkIFRYhenhwAQ61nxtn9INckW1qFWU7tGOevIpEsnyQ+lU0tE=
X-Received: by 2002:a05:6512:b96:b0:594:5545:b743 with SMTP id
 2adb3069b0e04-5945f1f4346mr2601951e87.27.1762818419930; Mon, 10 Nov 2025
 15:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:46:48 +0100
X-Gm-Features: AWmQ_bmWEn6D47GtrYlRXbtf5iV6J32LnDgS7NEk87vjG42kQgZzdgtZdTywXVE
Message-ID: <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_154702_175066_46B11742 
X-CRM114-Status: GOOD (  11.52  )
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

On Fri, Nov 7, 2025 at 12:57=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> This small series introduce support for Airoha AN7583 pinctrl
> support.
>
> Most of the changes are generalization and cleanup of the Airoha
> pinctrl driver. These are needed as all the array in the inner
> function were hardcoded to EN7581 and didn't reference stuff
> from the priv groups.
>
> Everything is changed to match_data and priv struct so
> adding AN7583 is just a matter of adding the structs.
>
> Also the schema is generalized where needed to address
> for the small difference between AN7583 and EN7581.

All looks good and bindings ACK:ed so patches applied!

Suggestion: since this driver has:

1. Exactly one group per pin
2. Use some accelerated GPIO operation, .gpio_set_direction
   in struct pinmux_ops

Have you considered implementing the new .function_is_gpio()
callback in struct pinmux_ops to tighten up the GPIO strictness?

Yours,
Linus Walleij

