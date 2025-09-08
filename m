Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB85CAC582
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Sep 2025 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=; b=Z6mJRtoBbrYRjArpvxeZzRqCc0
	mJN3O/GizWQB1zdRRjRupxWZm3E5fq1zcO/9BFEz6TO5ATzsCavHz/OjoRjlQrlhXZ8ULXcPblqU6
	GD38YuxVU34iGqi3dy6LdgOOW49KkZypjGE0N85QXdBqRBsdjTWN287Q/2I2byX1tXj+GTqH4jMbS
	7gsCNgzEK1jTUbC7ZEj9S55VWJZmVHmzoDpiEs2ThozqsYVvJjJWQ7Xg0i4TGcw2UwpGHCWMyCPUb
	4hG89DdHS2wgQ183z475/HQNpoVHGnmlJCtC/kEok/fBRK8ipywRVXWwZKR/acqt5KLLELxOtJOlA
	XoH3wFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNH-0000000137G-2Bou;
	Mon, 08 Sep 2025 17:09:51 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbXd-0000000HEmb-0r1O
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Sep 2025 13:04:19 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336d3e4df3eso35228521fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Sep 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336655; x=1757941455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
        b=LG9qxWmSGGga/p2DrPcLGK5KZUzdp7XSPre6pxyznhmVbJ9OvO2R+0OJv9retifgYp
         U8NSZ94sSl7WxMQFwamKhSE9d/zrBSvGeW2ORhsJSM3bQb2nIPBu5Pf9wu7P+Y7KIngv
         Xz5pksd+5lGQULkIxM12CGrauyeqFa1Ky7WKmzA5L2Iq98mUzyB4ntjAtU5b7s5lDLSj
         kixHO42UMivgrOfM0Zr6466fq/NpTc7/pPoEmHh2bkjwj+qWgGyc2Z94fXvurZGj2fpU
         NFhSnO5f1Ktn7aA8qCR4nuCx3GnJkb0y+Zp91qk9KKoh0aiClK+w17rIjxPMSiPb536r
         io4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336655; x=1757941455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
        b=RdRgpDMH61d1VoXN8XlcTAtzm6a9eFFbIwHyYydeWu+7qKn7B2f+p1Xb0ggxzi8yQg
         AgGIDqIolikG/wFPplEjyxsDI2pDcVwWcUeo1N895v34i0QqKWt5Y/TnB1njqngs+G0e
         x5p6sKRQcUQgzBqtZbN0aXQDe6haI9hTSd/ZVLqC08bO4CeAhJzNwMg5afRGGgWKXiFz
         RfummAAW7/rhM7QQqDc3AFFiON8nBjJgxM4BGZ5RvXDFAfTt/YZuIn5b0CaFDLgLrXMd
         UtFJxfpoLbz8aqdb/4D2qXMs2nMBoSIuXQug/7KZ/x+rxsjRKlh4+/i89f8hAfqe/zhQ
         aCAA==
X-Forwarded-Encrypted: i=1; AJvYcCV/pYDKJDGbiwyzZUMNkH13Vetj/rOrjHWmxGRlFrWmVm7nUrJkrPHTxI04gr2X93DYD/NlImXO6EMIctMtew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG6dWBVjDynoaG2wyPlAHwsbxEFneNe4QKvLLtHdBU4sAfcZMm
	aXWe3YPUKdu7Zoc9d2kJ9ViNKa3VBSAHukpqZKJrsWeRi0WlySTkK3C5Ru3AmSxizuFHDJMs4cr
	2Uz50Vw5mbRAs3n0B5LNgvQr2RGV+SNXA9XNpTZRgqQ==
X-Gm-Gg: ASbGncuFIp8+RoyciPBXoPosNVBV4V39grXNpU6NA9ame5Z0Cv495DLtTTc/45dfIkk
	vPBs8o9TiINin7tkEt/+L9ax3ceDqGP4oDO/OcmSBnkdZgdhr86KRtfjbnzQG8T6uY2/kKKlFJW
	7M+ADX5peItnwqWAUNc8yiGpE3gOKdL6EzOKAEpzxOzUCFWoWYR44tJE9m23QyYzWO2TGZQHWR0
	7RHdEw=
X-Google-Smtp-Source: AGHT+IGg4rogX0hb8M3wkRrCGyxcIS8n1x/nra5mMODdrlIDHhbHVFLHqNZGqHHGv1GU+9Sji/glMKNv4ydxz2WaN08=
X-Received: by 2002:a2e:a78a:0:b0:32c:a097:4140 with SMTP id
 38308e7fff4ca-33b485c2616mr21948241fa.0.1757336655209; Mon, 08 Sep 2025
 06:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:04:04 +0200
X-Gm-Features: Ac12FXyaXKE0nskg1RjYMc8Puf3_DYZA9QjaZBlexnTSmjTh-Rk2P6swvJ94zgM
Message-ID: <CACRpkdYYYAeqZZg58-2De-gfJkovYxABssuRk4xrS5SAC5=YQg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
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
X-CRM114-CacheID: sfid-20250908_060417_457653_6120DF37 
X-CRM114-Status: GOOD (  12.36  )
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

On Mon, Sep 8, 2025 at 1:37=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
>
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.
>
> Applying this configuration permits correct functionality of any
> externally attached PHY.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied, recorded Benjamins response as Acked-by.

Yours,
Linus Walleij

