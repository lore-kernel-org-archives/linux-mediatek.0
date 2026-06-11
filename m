Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A245CD98C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=; b=nigg/WNopEevViFqVfNfwQOZ+i
	erJA4lLpczjd4nSbpEG6bo+GIo+ncDTMDH78mfiZEVjXsMF/SA3M59GhyiMf7pGp2Qnlrloz+ggeW
	egfGI2yyrMpKgG1aLtLguZKCVP5H9pICrUPKlmhNfob+tTTMB6kgPXEY3Yx/eknot6qBfk2rMIRkJ
	9RySpVlsdN8mGPcy6hGqnImL9T3z1oQozHvbdbaCDvUMgzWREaz/e+uYzToHCzZUPfYh4WSDR+vun
	gnIowOngAfCe3u7XfvPStyki1Aer56yfGKvfhIYuBgru+gUzr1i7fYoXlYvAwGll/m32aokhy7M0M
	IdU0TStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi2w-00000009k0N-0Kgs;
	Thu, 11 Jun 2026 16:14:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi2s-00000009jzI-40gl
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 16:14:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bec49f7e35eso478166b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 09:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781194457; cv=none;
        d=google.com; s=arc-20240605;
        b=N6NRZLZJaDFdd3J7/tPMjbtpzOpYIIUzMESI8ks3S7wqoHrbKLNkEASFwXD1Xjt7wV
         316Kvbt65hBbTYbc31ln1+KA7MFcw3+JPpu3/Uc4OCnWTfjsMEtJQUhmSawiJFW1NR1O
         q3glV5X2KgnJO3PWlWgXwmwlSSHm3d6X/ciL0KBAm9tHnvXnKMzTT0BtyEaccjQMrPHp
         yuCEIPG9K9Ejhh9ZmbQgz0J0HKv/BYKDGz1wKmC6t9DR0s/bsU135FtAF+4aq5lwZx7X
         WKRr4VC+r2n5QQd4rAjG9DXFcc/cvt+xIRSsphNOsSCLI+L+f5fzhk9nbZMxdIcaB3Vp
         TDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        fh=bBTsbGrwRrzgYI/ve4mGnRmGcAjvBet7kvi8jlEvY84=;
        b=lJbeEWwOebPRMyhzj6qA/bIY7TQ2XsGX1/UjIzhKfpye22T22aEludWLR0GJTwfUda
         ag4JbSHy/azy8bUv20s9zILwAn6yAtnb3+0AVjQhLRRpTQ2FpCdwP23auDKeWpT9MSGy
         sJVN4htzKkCpZQdqadoiF90gplF5qi5a0fT50m8mtgPmmRYK3m0+e1HNc6hJ57CCiMRX
         OI2aRc9W5+Dpr+1RvvBOZ21a5bzX8FlXlFMHt5+CrT6Bz1MzJ0Uzzm/vBriNE0qZeDPd
         wMDLg24YQYgu06EZvknRP2/PAgjA0Wy3wDQfpqKCqYsIg5itr8LwH6+2XUqLzGe/4Znq
         Cvpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194457; x=1781799257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        b=jlJQnBrkoNWUMMB8lbKgO4/sWvJwRk9nFp+u5ye7fHkCw3GuibOT6pv+M/SUvZSFSo
         ziHsDAkZMuQHwDa/zuZrFDDEukAnxzdTY6VsrVtajiVTBoBXGcYj6C9utMGgcR01i4lA
         7qz9xS4M4q8T68aU0o0XtbFO4O8+0sB57XmM8RlD4BQ87mi9Z2PZCSr7T/6eWBeZNth7
         ixMuj9sLu7BDKm7KRTf/MsXFyqkvi6UGfYiEMMMbaz9u71POpjdjOmhQUq0qWyToDycS
         qMHc/4lni59axPykvTqb9Mle8N31pIoYidDRlpCF1wNXDtOy/AXI0wNrCpBAj+pLDI25
         9gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194457; x=1781799257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=As/pP/Wl9lgSZeirNEJQtG+sKd/tXccaEi6RDRuHzhA=;
        b=jhEpMqjC+qfTcvjvBuyAsy1MGhWUW8CnKajSu/v7gAZErx7rlN+HQ03MeMK1i3+Yqu
         t+Cfwklayc9pu/kNA5HpK9UB3FoUpQEoOsbBxPOx4zpmiRniOnHfIwD1OrfSH1HXlTeQ
         Agt1cZAc0YuEJMHLVHXsHDnQmAEkDXJcqL0ZLN8RkUX5g8VSyTZX7LffCCfrsCY71Xbm
         THcvJ4uRKEf7w2Lo/x8gaQSbeUNBIE32TR/i7eCQGervRrjkeuR2QTBdTaZBCeO9A1Xq
         1OpgMvyMCSoc3RPP6isd3Xcv/tx54jSfVyd0xxk8X+25KcOYBd2iSeOyZmdltiWhWwZz
         KRXA==
X-Forwarded-Encrypted: i=1; AFNElJ8O5vatM/SI3guUW6bzboDufyElPCUfoinPga0tDWomIrC/4lsW+h4Qg6POKMpZBm8Hi6S317feqlmqTbQGpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAndy3FDDTPSWzQnXn46c/BcWiT36miRKUL2FbqOwuNdMLEEf
	tIG2Xf4T2kd78hNnrTct0cRCCaBfN6YPxY/8sYIFRhNgNm/IkjKaBSgkRd+jNiejWEiQVmY8bYW
	YHTIcbhPc5vju1LNcGBpu2STcrsM/zpY=
X-Gm-Gg: Acq92OE2PO5aieHcZTNJ/xQYA6j1q2GhT7+foo0mPqbghIlUKx1IDl97SS8KnT9unGI
	MuzaBay7j8L9rtITE3BVdJ66U7BLmBSPgkrQ6yB+f/eloYP4qkLHbVtgOe6ar/7GCB+NZqF/eoP
	n8sDtADDzfHe/jGzO6Br53B8hEeU8RDeNGeqvMryrC0j4ItYMCvy0eyTontNO9yJWKwxqtdT9Hu
	1LsOho96Mx++/aWbSpizGNiBOAhiDABvjpz+V+UGeek1xiNfGbHOMyq6GW/H/84jIjqsyZwcqPf
	6ip13agJ+o40SAOgj462WuKjydRVaPNlXsJSvoJMzvtMhPQ3p989O33wGYnnrmX4dimf6wzO07t
	VGQjjRiAozdMTYRC9uAT3hz6pcFFdX4Ndna9cE2V19gYxtqSHKA/yaPftasa+R4mcqu4ctLNbfc
	j4Fg4=
X-Received: by 2002:a17:907:7ba7:b0:bef:1e83:8228 with SMTP id
 a640c23a62f3a-bfc87c0f243mr220203466b.39.1781194456320; Thu, 11 Jun 2026
 09:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com> <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
In-Reply-To: <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Jun 2026 19:13:38 +0300
X-Gm-Features: AVVi8Ces8T60xoHtEoplh69CdNS4vvYPyDhO6krvEnoKRWh_ilPPLEaS_PgToaY
Message-ID: <CAHp75Ve-+-xaWoktFO_qG1Xkyzh7D9JsBFw_qH9zcUXWhk_qNQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_091419_009406_D7AE91F3 
X-CRM114-Status: GOOD (  13.67  )
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

On Thu, Jun 11, 2026 at 1:21=E2=80=AFPM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +                            size_t bytes)
> +{
> +       struct regmap *map =3D context;
> +       u32 tmp;
> +       u16 *buf =3D val;
> +       int ret;

Perhaps reversed xmas tree order? And it's actually better to see
assignments first.

> +       /*
> +        * A manual loop using regmap_read is required because PWRAP is n=
ot
> +        * a continuous MMIO space, but rather a FSM that doesn't impleme=
nt the
> +        * necessary read callback for the regmap_read_raw and regmap_rea=
d_bulk
> +        * functions.
> +        */
> +       for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +               ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset =
+ i, &tmp);
> +               if (ret)
> +                       return ret;
> +
> +               *buf++ =3D tmp;
> +       }
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

