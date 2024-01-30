Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F9C47DB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVSWuVPedMZ0hCiYeV6t6vWEzmV0Yu6IxhjiX+iJPeQ=; b=INFevBhRN8kIsjd9sobh9YCGMS
	LeHvxQyyTzrFdIWW1OvW55Hzm2ClwKVnFZevv0XSP7aJO3KFajZg9pFelihNTh6mVTgow57IpfU6k
	dULMWDlOyFb00F3Q4KcvcGN5HRn1OyqttK0ephqRpE9T0RbHsvRp0GVfJ0v2iJgUoqe4pi67asIZz
	98gIcqSGAeNXCeDo4+kJ6Sz219CG8prgdx8DKqDo/cMmHMXPK3ZUmDDgx96kiYx6a8Kvt6bcRZULf
	ttLlJikguo+h/qgfxJg9x87ibhsMYIPOA+Y7hW2uRN3edy6RQXiAaCvnlgy5oM5GwdCbX3aTQ3d7b
	wCHfwvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUerM-0000000F8U1-3GMr;
	Tue, 30 Jan 2024 03:32:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUerH-0000000F8Su-37Md
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 03:32:25 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51030ce36fbso3423647e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jan 2024 19:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706585541; x=1707190341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVSWuVPedMZ0hCiYeV6t6vWEzmV0Yu6IxhjiX+iJPeQ=;
        b=PH9rBNAJdIWv4s2B6WKuyz2Tyce2MgUVoZswh4AxHfmfMpnS4kuwdNh9w5V2NSON14
         TeLk+LNiikGNC1Lf4iLXtgNr3wkPz+nh7K2LAo4p4oSRzIRJ/itMes1vGXbFPGK+I9VX
         zvoATqirLesMtq+tpNUZrNgcDoEy5Kyqhk0Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706585541; x=1707190341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVSWuVPedMZ0hCiYeV6t6vWEzmV0Yu6IxhjiX+iJPeQ=;
        b=XFBudYJ4UJxDXmp3lVSmKPxXrIeFuofU3I3Qq5viMhy5nTZ/U2hDMJlNQndUhyY2i3
         sQZoGqRkFqRtBHee5ACjMW0jZhSspQpTa6zrFIxiHN7JAjo/YI8c4BmOqfOkULXAV93K
         bGJmA4GLLZC22TZ4NnvULOKG6vsgI4BMMlTlnuny+2lT+tCdkp8AVMzhMJSRSZVg8F0M
         f/LETieK9UQ3Bm/Bov3UAdKEfvve1HIr9YM5cQkuDyxcMU4fhJLbSycXjfWhEJHkVzsR
         A422F2SKEJRF3sFc5j6N8Dp9VGuBt+6I5jF3yNbt8GqIFIMwyrVX8Dhlb68XG821RTIN
         rNMA==
X-Gm-Message-State: AOJu0Yz7OZ5nIIHFSCLg2kpzYa3uJbW5bZNgdv2Izii2HNqyVSTc3b+n
	bD3pWm8ZkyBG3dyFStF6I84czSmEl1rXBHi015YbiLAgqgbyTxlkGvkmoLBGDGMwJYHiec4KrLL
	aK1Ubvlk6NziHTNALzSSE4Am8/8pUxNgds1Xd
X-Google-Smtp-Source: AGHT+IHxJ9h0TpEGL+1arI5K15dK7ZMfTGGFT7sxI5crnwlEMm10GtDatZbLxi1ebhRtIB1BUsGi7EDALv4X9Wo6UoA=
X-Received: by 2002:a2e:8496:0:b0:2cf:34b4:63de with SMTP id
 b22-20020a2e8496000000b002cf34b463demr4704323ljh.35.1706585540108; Mon, 29
 Jan 2024 19:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org> <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org>
In-Reply-To: <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 Jan 2024 11:32:09 +0800
Message-ID: <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_193223_831876_B2ACC4AD 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, Jan 29, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
>
> >>> +allOf:
> >>> +  - $ref: bluetooth-controller.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - mediatek,mt7921s-bluetooth
> >>
> >> Can it be also WiFi on separate bus? How many device nodes do you need
> >> for this device?
> >
> > For the "S" variant, WiFi is also on SDIO. For the other two variants,
> > "U" and "E", WiFi goes over USB and PCIe respectively. On both those
> > variants, Bluetooth can either go over USB or UART. That is what I
> > gathered from the pinouts. There are a dozen GPIO pins which don't
> > have detailed descriptions though. If you want a comprehensive
> > binding of the whole chip and all its variants, I suggest we ask
> > MediaTek to provide it instead. My goal with the binding is to document
> > existing usage and allow me to upstream new device trees.
> >
> > For now we only need the Bluetooth node. The WiFi part is perfectly
> > detectable, and the driver doesn't seem to need the WiFi reset pin.
> > The Bluetooth driver only uses its reset pin to reset a hung controller=
.
>
> Then suffix "bluetooth" seems redundant.

I think keeping the suffix makes more sense though. The chip is a two
function piece, and this only targets one of the functions. Also, the
compatible string is already used in an existing driver [1] and
soon-to-be in-tree device tree [2].


ChenYu

[1] https://elixir.bootlin.com/linux/latest/source/drivers/bluetooth/btmtks=
dio.c#L1414
[2] https://elixir.bootlin.com/linux/v6.8-rc1/source/arch/arm64/boot/dts/me=
diatek/mt8183-kukui-jacuzzi-pico6.dts#L86

