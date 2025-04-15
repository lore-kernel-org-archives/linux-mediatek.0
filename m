Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CA7C369AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=; b=mkseqztdCkmdaHiLg8/kzGz4Ru
	l1ljZ0xcIImmUc44BwLz9GCVU/sdoJB75Ou0QYhZfqnV3TFszPwEYTdeV2CwfKnPwUsWoMlpspzlc
	HCg8fsRmHi+z9ppk/XT+Esv1MDb0LLKtgvZsp5j5WCeagTHCRMN0WBk2Vzp7IA2wrl5FIozVEvTnk
	IiqoWTlBLTjDFAiDD7Vym3ksQVySeL3thLYaxxkE1nhu9tjBuxFl4N0WHB+uI/j/iMipUKERcj19U
	63SBPhqLNFZsFoAm9/0jmOw97tD49OKL+bCy+ju5/mbmgmPuc9oynvUxGtgiuK2FDnMYpErOX93lj
	iHJxvs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bQv-00000004wtl-1yhx;
	Tue, 15 Apr 2025 08:14:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bDI-00000004uTo-2SF2
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Apr 2025 08:00:14 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5256650e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Apr 2025 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704011; x=1745308811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
        b=nE2+W2uGbP9x3bMblBlojwZkmLC2DZcvK6vhTbY0aY4B7kICpfMzSVrOMlLqbRA+GS
         +yRwp/9z+WGQVisWeBWDuva8R/4stjsfEbh5PB8b09T+mnNT4uTCQ4I05ghCI6VZotw+
         e8A3VXU8zDI3uYggufRzA5YI7Wbi4cWGDHltVDghKleFLb6OjQxgapekfUwXzYw7SMnn
         95K3Jr1vFC6cnuKOLUMDHG3mhq6rsN+yP6R6iDBnMx4yheU2U1i0ANUiboJTKrgnAwYZ
         7/TGqpNkT1MWwi+Mo7lI6dV/4GEZV8mQ1ZwybpMmOzVntA6ZPKkJOpOPZeL5e3ctbgf7
         wNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704011; x=1745308811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
        b=nXeW7lSpNE2CR2aRKLMtRH85g1dzffGNIuDSG8MvXMFGtNQmx7ZI0kObvicm+DCj4v
         CGZ419yYfl3CLFYNb3S+zk6sPFWw6p6Pk+kep7amH7KPBk9JgF9fdtmbnCku06MEkSVs
         +6UUuQ5oMGmRI2UT34u9rZ4dTwbWx5c2M8h/W5nZ0ZP65psepQoWTmlJZiTsW43eA6kB
         A1tQl0Kuwi2iRL02RbHpLOX7SHkdbr3wNKVUCXZo9vtjKqz7R0gGkKaLh1S++ia8nFD7
         PtZYGRoyuIMgQEgVDOCHSNVKUjGdlF4xzYaph5g/oqi5Wa+CgVfuvysfNKeWTa17RV5k
         Lp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdeDxhDa0tWuNt9ldFxzBSD20ZW0cE/rDE/nLvbyD0kF8aQ9x5P00mrZ8pmYa/LPy8amis7T/6OvBotK6Wgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3bQ+G/LYsQtSpWioodnIatnezk9xF+V5n+yoAB8ZXkhieGXkk
	GqYWZpav2J8tisoSTnt+015RaPUmtV82OBzH+bkHJqxUX6ItIxgFRf8ZIDlXGS0S+W1KqB/rJn2
	9uNVKX6VPX4+z1UfR8abPj7DVZgBpC4O5ycR9pA==
X-Gm-Gg: ASbGncsnnjcBezttr9V+ObMUo5qic8uGMT/fqaluyMKvzqfBN7+ARCBRp5nDh5S7e0T
	aGX3r6iX4ka2u5TLsAhpWla7kaGFoF4QrsMnjl6upAB8QqPzHhnU0yyjpTrI0l7fEZA0u0yMjAK
	ErY2GnN08vc7FfGX60s6Z8gg==
X-Google-Smtp-Source: AGHT+IHnxXKT+pyd9gBpYCbMyVQZAO7XqVpYGkBSNYSVfaaSRz2f0QOsZvZ5bl34m2PPRdwZD5oWN80iP0qENOxIShY=
X-Received: by 2002:a2e:b8d3:0:b0:308:eb34:103a with SMTP id
 38308e7fff4ca-31049a7ff11mr54687661fa.28.1744704010562; Tue, 15 Apr 2025
 01:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250401135026.18018-1-ansuelsmth@gmail.com>
In-Reply-To: <20250401135026.18018-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:59:59 +0200
X-Gm-Features: ATxdqUE1-4C5Fb1JmQvyH7hBozN_RXpvZiZvSLKiPhH1VCoFIEKXbvFQJXlM6ls
Message-ID: <CACRpkdZdFhpixdhsmN=oCEmdAuabUpXtQ9RRh0cFRuxfYXJ0Ng@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2
 LED defines
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
X-CRM114-CacheID: sfid-20250415_010012_614565_C7D28751 
X-CRM114-Status: GOOD (  12.59  )
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

On Tue, Apr 1, 2025 at 3:50=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> The current PHY2 LED define are wrong and actually set BITs outside the
> related mask. Fix it and set the correct value. While at it, also use
> FIELD_PREP_CONST macro to make it simple to understand what values are
> actually applied for the mask.
>
> Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
> the register define mapping for 5 PHY port, starting from 0. The mapping
> was wrongly defined starting from PHY1. Reorder the function group to
> start from PHY0. PHY4 is actually never supported as we don't have a
> GPIO pin to assign.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied for fixes.

Sorry for the delay!

Yours,
Linus Walleij

