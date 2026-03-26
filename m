Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8456B109E556
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 06:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=; b=FzDGcJQieHAdOYPczbFD+uShpx
	QAaHEZSoomdJDnQ9ZesNX3bjN4YOi6jogAfjCwwgw6ISBdAFF4Y3Dh7SHP8/luKvCGU/pln7FKuU2
	e7w26hJEb87P5fL+QyP8kofy+qdmpPtiZazwi1Yh59CGCDujTtMcv/fdwHBf+hs6QxWrCA4kSlwAx
	Pa9R2sg3kDow9l+acFAmPCtNIxSGrj6D60KRXz3k5RifUAhwFPSTNI1/k+jHebJJ+/7Q56zS/7OQI
	+AeOLSx++29fbtqktoP6q+RkJ5UqYOvdg9juNT/08K1dv4I8yDHvTgT8I1EXpjHqBXZ92ULv/6+eM
	+8lZGVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eLg-00000004r8F-2AI2;
	Thu, 26 Mar 2026 06:37:44 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eLX-00000004r6h-3iMi
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 06:37:42 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-38ad12fb595so16296891fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 23:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507053; cv=none;
        d=google.com; s=arc-20240605;
        b=QGlMCj3ON84FIhRl5rNzQuA7veIAOoPMDNOsrB1j1wrV9RyCDYu7c75dkHS3ijmLjZ
         eX8WpKVrhWt+5Zy6jhMY+kgSVIc7+oERHKb7jQPYgyhvgT+G9IPypp/PxUSc05OKxMCd
         KCR8/Gco8+0xAd9b1GUa5/5u3kHE6nq4eUz17/0IFg8FZCPMAQ3aS7267xevMoErOQ6y
         P5SzgyE2rSE8CnKlvcz22ZOx+hhBTf7kgs93yGOca43GicmyRnKxzi35la6Vt4Fi1Ss2
         GwKZNu+cTYmwJf9ljfPYIabvqx5iRgSpmHx08hbQuH+fSqQFNEoOwakZ3dNY1P7pSHLC
         T/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        fh=fK5Q3UonNQYTeQwpaLLytUj7dx9hA3qpae3bcLTvv+o=;
        b=EGQYP88Ag+6UgcNon0j3buwlbvUQVthzisI+NZnkzf3mlqMSgIIQtUZ53Wz6EvzQoz
         lRTosUDv28t8S9FbQ6uEhDkBOvRm4EvKdOGqngQcScFaPQu2ePb2hgbwNNXh1iE+RgY2
         SvoRDMynIVvZ+4pDrF8pi7i6bS7/jPpKng+fQhSc9Ihw1VrXaEPEk3nz9XTlKKvkJ3Ae
         1V2IiCHXApOAnDdbbsgDWiuyAHCuaVVYl61aP1Y4nabuxKOR3yM4uow9VxLey5+XhGjt
         ojWJufheEEGkqgx0d94x4gP8UL5qV/LkQ4IGSKTgoQBWCnUKR7DDvSYyVrP6dK2SGwIv
         b7Wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507053; x=1775111853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        b=Zr+NUrxv7MUeZtcMsGoBuGf15fTu/ODJP2eeb6Z6h6Shkq5l/RfqM/2jKi8eYmiIh3
         2hlDkR+v6sbyzyGWN0/6jjA5+iAKUqi3kblICMdjvgwoGIs78qW1yStgYG5/EcoG4Z9z
         FI3Sl/Osj5+kWCnhuVVVUj9S7GKCpN2/RXquw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507053; x=1775111853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        b=km3fxFM8MUsRypszlmMr+i8KrJai53TyjRClLD0l5P9drfeVfAh2ecXOOb/OrlUwGA
         6C5KIm+e7m5tJTl0p0RaRBBRxqYCUe4MzYdPq17R1xLfxaNLPnKHxT/YuzQP1kjnLk16
         UIE+0Ky8OjjHkJJ2iU+DkKmkAbftiugu6CTGjn05LxMzeC6fBEC2/cD+KY5Sj8vkTqP/
         G9Qis7me9NEqhFc3DmfGe8EP9KbaUyxuFZhBX7j3aj8rqnTNKqgEOSqxEd6W0pQjAMye
         D0JyQ7zL+/EouySMMcHNGQjTOA/5v8lUrtAVBSqhlL6z3eGHugsk6VRa1g7UPQdcq4qr
         443g==
X-Forwarded-Encrypted: i=1; AJvYcCVvDsZzioDkXjaHiDyYAGhuIBA2WzMms0qZb74GDb5UYfxSMy1LU6ghGvZqoZAwZK+QWr5hOaTV/pU43eMKDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw4nhJnURXFUZBHxl/8goUE70etB0JLP7huA38RKFnH6Xoj40E
	qHszaHrMqRxk2SIfOKMulpKcs47qWCefu+Nq+KRdLzeOvCdrkH2RnMrek6iofeqVIPfcC0MvVKA
	BO1rTVtBNnNvmM013f4fKB4oP6z9frbae8vfKoDyT
X-Gm-Gg: ATEYQzzdjr/MVdGoLQN2e3vHkuNyEzu2zGPzvLfqseZyq8Z2Lo2WCdhauAh0gvOEb1I
	NxSsi60mpnFyaeTrLWyOVO0XFkMZu+8Ir2OtQ8vXu0YfpWG2xAMuUCKi/Bmt8zXCkXtOZCSP8nY
	c8sqMiLYrZVovvyQo9cArhyhpJpbogj7eQjtai6kR76mvFmG/rCDCxNo4NsHP5O61LiYptOycDk
	CyLM8aHhUTnp7fwiN2u1uzq2QOEf0rU/2K0WXs2SsPAsyEsrpbhFtnKSIQmngqH3c8/zobOrJ6x
	GZOVqSxMBMCPMF5lOciXO0APvtGvurdsaU5t/g==
X-Received: by 2002:a05:6512:3f05:b0:5a1:2e7b:d885 with SMTP id
 2adb3069b0e04-5a2a50927f7mr203717e87.25.1774507053537; Wed, 25 Mar 2026
 23:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:37:22 +0800
X-Gm-Features: AQROBzCCmaG_qIJQfQe8KdYGB1bTw6MFFgF3aMq79sEp0x0VqbdbLLlRtaaQZUY
Message-ID: <CAGXv+5H2GdeEVf56apai56Ak3-b75DEK89S7SJgMO9YK5S3y=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_233740_289616_F91A2800 
X-CRM114-Status: UNSURE (   9.97  )
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

On Thu, Mar 26, 2026 at 1:09=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
> a clock gate nor an update register.
>
> Add a MUX_CLR_SET convenience macro that takes only the mux register
> offsets, bit shift, and width, hardcoding upd_ofs =3D 0 and
> upd_shift =3D -1 so callers cannot accidentally pass bogus sentinel
> values to wrongly-typed fields.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

