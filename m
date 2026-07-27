Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3084BC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=; b=J6MraGU4BpCXsmhHCW9xlV3Of+
	k7WXkyjfT7T27Dz0Oa4QAYOu+HyhUCMaY15OlRQ8xyqFf7NEJ/59XpJeV0qxcsL5EtpifjDeFzKgE
	GmMxAGkS+pZ2kL/PE49RA8/ywZzPKuIPotJ9YiGLTPWCg6WA5E1JtNBW8svDLrtpQt4JuRKmk/rai
	Y0x3P1TrbWbTDQ7gQyn+B9ntA6Iu1i//jz23zOTXK9yhRSKQmEJdmPEUQbCvGycu/+g4uLuvnuznk
	HLyGloy+duOtAPrsN6SsiNNTLgJwyxfAZhmX5k+PcjZjsdZg5+JL5SMAhYEwncBCFPLSGhmWyKuvI
	ckGwdxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHny-00000002LiJ-03B8;
	Mon, 27 Jul 2026 09:39:26 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHnu-00000002LgV-3oF5
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:39:24 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-80814edb536so30481807b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145162; cv=none;
        d=google.com; s=arc-20260327;
        b=gTe/OWcU2dc5ZcP4H8Py3fbdOPPslWGk4drfqorZxi8k+OH55H96Ctx6lU1z6Z1irL
         JdNTUHuxOFN0b/2leKfkXqtNgRUTLZayW6y7XdEsAWboWXRmJZ+YpKEdRo+Pc6os7gJ+
         J8G9ol9xfHjOCZI6DD43k1LGqGHkLka/qjnN1FsDMn6amvTUAih46OeP+/jyLVT3rkPQ
         gzQ9ggRyWZbvVxG+WO2e70VoS9KaOeXopDiXs+wRGgr5MCjoVHuojaypN83wFIf+6xaO
         zJ3kFcuMupFo3cVn+AEi1KbapZqoEjspsWMZoGG4KRUIvyy1b+RnZ84SlCFZAfSSg6GP
         cPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        fh=mbnS4cZFgaDGBTWcLAEeoOTMK8mB6E9YzsqwYnqbSog=;
        b=Tc9FsYBf0CtDdlYnXjiecESrSWoTv42PoOtzgoHIb6TzGqCOyBqYUhZXNVT4CK1hj9
         76iTvGuKYsyG9QmJhcJ1P67UegUeAPgvCAgUzIKz5qO3P12I9EYqPDU94OiAW530pFcp
         RRDQxuIlptp+PohuVcWVejG2/wSr5EauXE4edi0MwmUrFriAmHMAyGalKFftG6P3WWqq
         57ZgPqzT8zJ5r4ISVZjq2XxJMdUk3JFyDJ8fZfZyCbcTL3Ha1rZRKEo7qW0n9V1VydcC
         7W2bseYIf4nWlGH5fkEsMG2FkD/p63/xS1fgJ933FOXw+5j5fVAOgFXMKm7GTcc2yfl+
         dBVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145162; x=1785749962; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        b=VwB7w0d8uJJ4YQOf/AAyHXI79Ef4eVFh+0oQuSq2CFR9qsxZ/w4wu1INIAFBi4hvWO
         Ev+zX/xu/F+BX4d3jnNFD6q2GrUNoWdf8ZVCR3ZShD8nkbzA1Qswb+yC8lgLnzUiij+l
         hEVfUdaxayOkxdaF4XqFPfFqlUC/TBOuOFSKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145162; x=1785749962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        b=Fco766WZ55Hg0F2sfTxmEjZz5Ia3HDH0PfTIew2rTVJz0pdc2TG3gWB6AFl8h53h5j
         +YeaPN8cecL3HqTe/DjuA0JAhpBBasGxHI3Pn7kI7hEnFqh12QBtGp5yx194/UhCIU/t
         SBm0RkizbvRcGKl8MqWWmPkzHzFu3puyKAUSOtczk81lbtFMbgS+nRYBz8HCKLnkoMyq
         C5FH9QkZ5mF9ZEO/jw82sM05uUuek9cymMfLB3tzN87Fbj/iuOT94A7XMBpSqpr3N9w2
         HqLF7hfd6CuOPoVEU2fbFUhA27aPYvHaeGkcfTSE7cbmTGoQkSoYNvfvaFFhuWfcVZ58
         CQ/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp73AuRUf+i0m0nRs6ER3gBBWfcg96BSDNeNtlIxMbJZbdCotVb++nuWiTVqrl4X4JG9gxGSfoYJfq4OYFjQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhzg/PSU4wwxmd1Eojd+UjtJ6I2VuPOFxeHIUtenLZSmmrNYlv
	gndK4U1xUNTN51xaexjP56P11o8yCQgUJkQDjbgvx9cXBzurzwnWHScH0fEvTlq66pOrc9EgQ8E
	yLJvGIWtlnFkF3PyQt9gJiQ92jicUEWlOlFFlR8rz
X-Gm-Gg: AR+sD11a3NE6YNNd9+Ih9kstbM8n2kTg4/NSH8DtG9Gbgn1p+3C4/O/tSLGCo+S8T8c
	Z3HtcwCdcqCHwudfu24ZfvumphJzwqvaOTQLZ/Z1LHQFAE0Fde+sBIz4BaCF7Efls0AERkR4mKU
	3KYxQHQd46mF4xWuDPOBebymQ4FsB6Mu4q6FEqKlH9nlSBpmuT3UXPcm82E6Fb5b0cXJ/pu+2Kj
	kJYeXyRCtBkUrvzzl/cTG0kfnj9wL0PfcaVxwADNv8cgkr0sxqNOJL8g97qQotP7U9F78D6nT7+
	YJiD6gRn71bjzTQ=
X-Received: by 2002:a05:690c:22c1:b0:7ea:809c:2af5 with SMTP id
 00721157ae682-81f69dec43bmr26374967b3.37.1785145161730; Mon, 27 Jul 2026
 02:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:39:10 +0800
X-Gm-Features: AUfX_mwlgcUapUfGZW2dMAil1rMukXcM2pCT5Z8U-x1BRJr_pwTehuo1NL79Xlc
Message-ID: <CAGXv+5Et=hVYp74v8p5FhdrifjUotPbtp8XqyNuCV+NvJ_LMGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
To: Carlo Caione <ccaione@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_023922_986848_1E9D7095 
X-CRM114-Status: GOOD (  20.30  )
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

On Mon, Jul 27, 2026 at 3:40=E2=80=AFPM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> The Genio board DTs provide serial aliases for all enabled UARTs, but
> the MTK 8250 driver still registered every port with the default line
> number. If uart0 deferred and another UART probed first, the 8250 core
> could still assign ttyS0 to the wrong port despite the DT aliases.
>
> Read the serial alias during OF probe and seed uart.port.line before
> registering the port so the 8250 core reserves the requested ttyS slot.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Matches what is done in __uart_read_properties(),

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/tty/serial/8250/8250_mtk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250=
/8250_mtk.c
> index e6a56cf54ae0..841d64f6a707 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -521,7 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev=
)
>         struct uart_8250_port uart =3D {};
>         struct mtk8250_data *data;
>         struct resource *regs;
> -       int irq, err;
> +       int irq, err, line;
>         struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
>
>         irq =3D platform_get_irq(pdev, 0);
> @@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pde=
v)
>  #endif
>
>         if (is_of_node(fwnode)) {
> +               line =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +               if (line >=3D 0)
> +                       uart.port.line =3D line;
> +
>                 /* Disable Rate Fix function */
>                 writel(0x0, uart.port.membase +
>                         (MTK_UART_RATE_FIX << uart.port.regshift));
>
> --
> 2.55.0
>
>

