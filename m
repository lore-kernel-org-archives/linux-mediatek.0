Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AC9C4451C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=; b=oy12p84UHeBeqj
	90oR9kE+kT+iNBsDVD1zZrRHQvuRiioxuCVj7Q0xR67K1BwjF1k0OjMDsCdiut6NMURRC8Ka4WD+4
	VGuSgrbuR12/TlFKKSMMTUXjGy2JdvLZExDnqfja5vz/KS0+TZ5xVNt6yp49Ed0UWUbc7nusER/+f
	WhppaJhnAEK3BAo6RMsqJ1gBW3S0zo+nXjljLyp4DFe5CtYk93OdBqaw9OQM3NkCYVgz2Ofpblz+X
	Q6Lp+yopiFkqh60FnaR4luyDnnxbW+wxralRQ2Gl6EbfUafxTUIcCWv7xzEKIb+n+3U3d9cs8udiq
	kNOvMwFGvj2bGBI2wJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNkI-0000000ApKn-3FZV;
	Wed, 22 Jul 2026 03:35:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNkG-0000000ApJR-1uiG
	for linux-mediatek@bombadil.infradead.org;
	Wed, 22 Jul 2026 03:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=; b=lHgdKkaZgRCsQWQKE5wy/xUA6V
	+XKl95+pwxlgH6m5NYeH4MwYLYzsNwo94jKOh6RQ+Vm1MOUixjAV00HIuDz5Eb5AXyMPNaPgwFVM2
	jG1H/0hZC87LRXcVkvfkyirS5t4htLE2KKkR9p4/Ok7vbhfB3wxkdrTCjqLws/YNv9/rY8fSgspMe
	v1yo2JxHgs8WesJaK83EYegKJ56YCxVma96kSZ9yzewP4+/PZPz3NknCoiBo5hjU+xr6B6zIzbaG7
	WMrDyqUTUGgNZzK3tzxIrcb0WzlHuweFnpn2/yOYsenAunEGNVDuOltXf/64yExDV8jeUzjJ/afAw
	jNnd5LsA==;
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmNkB-00000000TmZ-0jAV
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-80a123ef90aso78408567b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 20:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691334; cv=none;
        d=google.com; s=arc-20260327;
        b=C5bO/+ax4FCoMak5cgxfLnv5eESn+c8ydmeW/bKpZ9EVFu4lQkkgrgNNWY1rBH9efC
         thVcSnvJaPXzCoW4tlisKZVj96I0emlTLvnCi4oLZPByVtvwxWtF+mz7Nx5xNJWpfQ1Q
         fAFdwDf+x+kF1pn32+2ooMdW6afrAP5O5FImmHhfIjR08oFcJXNHHUn9Kt/BtDxM/NSx
         7DFiLkpGZonsXXy8ykcQdb+CYFSPhIIdKLRj2Kh+sTR0IRlxU2BRCAultnh65CQ+mDEU
         cYkqtJdnun5UcDpqjiRvS7qQZ/+F68lMla2Wwy8/8Rf6LaS7KV3gz8zodyImTNCYxmD9
         Yi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        fh=Nmni19ArArRC4sQx/mtX+TSCeoRTTy3kyi/7L27gesA=;
        b=HVqe+mOgmqnN6fkgaaByjX6jZ154rl/2p/MoZGAqkXhMQjOGFUtT9aSS5u1Db5cRH/
         1rvZs6qkL2isu9A8uIEmmBa1lL6ajTYgr+IKnEHxOCWPxWa3XWFrAMqhKAvT9Vcd7ELl
         zGN4/qp9qgGk/G6aXQ34g2STt3oG61cqXSY68dPjAiCoMT1w6aeHCeGaMRKi/qd8qm6U
         tdNzOL+zi+Bo3CEsWYPj7enjrM/70BbaW+ZmEjLEZ/ngsQEA/h7eYFgH3xgKv7Q/x7y1
         JDXc7M3xxK6tLS0ew6KjJhEXgiqps/Plfj5BlzLuiOMgKv6VwJbtDUgtTIU64scq7O0q
         L54Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691334; x=1785296134; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        b=ofBCccbqYeR5eTFvBPWV5epGOEkkDwCZSZOWTC7ZCGGnoWZ40lEq01eT4Ew2OG8qtX
         mmTJdffo54yXmIUOoxjczKrbG1E/0QP+sH7ytb+pBg9JjWYHfEZN/RaBs2vyk/VBLmCw
         agDmMIef5sHLRgdGcO7W3/1TGmDEtAq1s7TJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691334; x=1785296134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        b=f4Sv0P1bAtQqaFRg34nR0Hf1oJThsMnM9eJbpwCLf2ET3n5eyYUd0ApRywRQ/z5BLC
         hEEepDE63cXzwDLtqliA3jb5qaA9hI0hx24Wnfh8WqroJrlcbk+J6BqsJd9PYehMQc3r
         Xo96EcA5l+g2M7txxGzadGmSy1MpYFfG4opaE/5L30MpGpcZpUz76ZxmbtEIFhkkXIy2
         pnjXt7e0euoU6dRJ/3voKLmNYfYiwivUXDzRqU7T7CnW5Of2c/YZCQM1BfApnS3ZU1tG
         j0lPO0rwOnFCCBV7kDV9uQO0rSQHp2GFvYLxzZDNsR8mnzNJRRq5tgT3QUMDr7I/P/5U
         /FOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzaJsOjWfjulXH3QPR3YiqEx7A/TrwRYhCGvjUqYsbq5/sZfJO5hfYaB+nPhi5Z8YGqMqGU7inkMOb9cVigA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzznG3AqJfFY4bOQ3PNIMcpokzHIxK0/AUrVimFwEf9BrpPuseY
	wlGJwD6v74lv54/LX0dTQFFP7OPmYkHUa+3QAP6+/cNuyeRj64uhkasZKM0zh8YLndXMzPRJ8A8
	cwGhWYyb+xgtaOWPDqs1A7wWWk9F9+71/134KZrPW
X-Gm-Gg: AR+sD12mFuJSezxKF85QTVj6Gkm6Ob3NQ9JS1fVteQY9fiYrre8/aVtWtcOJjpaj5bY
	Q1Ysfjb+RZsG0OO87SYyfaEzpaieYZ+/mEWxssIw+21s/csoGU5ehv9F+rl+dQlpH9SuYKPFxdO
	F93af2vTDOa/ChC6S41ue7aUA/HZB9QjOis0lxbuqlbiI7MfHG7JoLfhcgludNhVsWIi/tYOAuN
	joFof1scCbFJLxaXmLd+p0ywbzUBp4BHIHq14gL0DSXwbGa7gDbTnN45fkKIV0n/TpVLs7ehc91
	w2jKh4+JAAl39wA=
X-Received: by 2002:a05:690c:c4c5:b0:81e:f308:cfa3 with SMTP id
 00721157ae682-81f33bfed62mr7716127b3.14.1784691334267; Tue, 21 Jul 2026
 20:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com> <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:35:22 +0800
X-Gm-Features: AUfX_mwF5azxEMhr_2WNLIrQ4cJxk5YI9R_dQgFYT_P0qpGKSy3wJnLrxRQxP90
Message-ID: <CAGXv+5G-mVf3b7ygb8h4sTtYkACjc9B-VenTqOvbBQO9Pasgug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_043539_588698_54D06D3B 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, rafael@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, jiapeng.chong@linux.alibaba.com, laura.nao@collabora.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, daniel.lezcano@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, kernel@collabora.com, krzk+dt@kernel.org, lukasz.luba@arm.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Both LVTS-AP and LVTS-MCU may be shared with SoC-internal MCUs
> running some sort of firmware that checks thermals in order to
> scale frequency, or to take action for critical SoC thermal
> protection - and this is seen on most MT8196 boards.

Yes the number of MCUs on this SoC is a bit crazy, and the OS
has almost no control over them. :D

> Make resets optional, as doing a HW reset on such boards will
> result in either an immediate thermal protect shutdown or in
> a rather important and usually permanent system slowdown.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../bindings/thermal/mediatek,lvts-thermal.yaml     | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.=
yaml
> index 975235130670..29f431fcdcd5 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
> @@ -94,12 +94,23 @@ allOf:
>          nvmem-cell-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - mediatek,mt8196-lvts-ap
> +                - mediatek,mt8196-lvts-mcu
> +    then:
> +      required:
> +        - resets
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> -  - resets
>    - nvmem-cells
>    - nvmem-cell-names
>
> --
> 2.55.0
>

