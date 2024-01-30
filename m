Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62338C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrrtCIWXL3eiBU/IKZjiGTOMDFzcQj7B56yYFQBrFdY=; b=q6qJCCe+jSNAZTfK9TySsDgigV
	43vTwyqbXgt16AoWVR5S/J+xX68HoVMqEntSoPpO0Is2IJGh/su1ra2qGd/oTQ4gNVZzaAu+VJk3p
	5s/RvnAWCOo5rVZHUV0swVcLFga95o7pnDkVANdDeiwyRnYC17aGAwIZq/eKxs21RmaJ9FjIJ8Vzw
	0tgc4hvvcwl0p3u/fzfWjO6jhrqz/IQiB4meC4mgkieI9m+gDEA+F19njZSJPF/4GyERj3X1zvLbN
	R0RZDdRj2cWrv7uC2cNuBS04iSBGVwfBeYqd+/8h+Jz6ECkdwQun0Kp7cjWEXG6J4zUvmLTU+sh26
	I70QzglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUiqf-0000000FZuw-0D07;
	Tue, 30 Jan 2024 07:48:01 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUiqc-0000000FZu9-1kEc
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 07:47:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d057003864so7588371fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jan 2024 23:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706600875; x=1707205675; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrrtCIWXL3eiBU/IKZjiGTOMDFzcQj7B56yYFQBrFdY=;
        b=lPQfhna1+o+Mj/tGdY2Ch/PZpCcbvkZIld/N1CSI1+/e4qqa9b5+QEdQZSdB4w73S3
         zQ4aFiVhIJ1HEOSg4Pdtkf8S1WPFSooiQqOPwFKUJD1pum/ehuSns34fQ2cvi6cK9RsU
         V7bnedZ0/HaTOVtYIEVPrMURIFfT7xdA0Cn1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706600875; x=1707205675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrrtCIWXL3eiBU/IKZjiGTOMDFzcQj7B56yYFQBrFdY=;
        b=WBsmxF61WUv6tEJz4iWKoImsnIaC1iHYNqo/KHC5DSG5iq/RBrs22fqwLaH4Q8Hog6
         Hu2vfRSrGMBzVvBAStiQLNxtYpqBVYvyUB9rRFiLmmy23YoAD6/g73oJIp5Zh2+urFbn
         Z/YeeYmJitL+14ywJgyIL7lF+Jt5FSXK3cBduyYODqg3O/HMr3KN1vaSah/4NKVQArM5
         KpU5lHFQYzYadZm32jsBwYM6zO+P4Ag10D5/8SbhEG/3ZGb9WsZQIjSidZziTOGdUB1w
         fM/VQ8E2kKyz3x41qQgxoAtMXQhNztQSu9KHgUgPuSg+3s6cVkmu2EicdN9iNgK865J+
         bXJw==
X-Gm-Message-State: AOJu0Yyhudtxh28oEVgNRhoGWdHeojafsEwzOe1CqaFaOUIF/SrKgqmU
	cftVFRhXgzy1qBrj5zDAg+SwH5BirkWxhr4jkzal93b7suEBawbk5tmGF44k5PBF1SPNG61YRh7
	UKzvy6Bma3VEfOdGTHOKlYLTHJxuf/5uvMjs9
X-Google-Smtp-Source: AGHT+IFXKjnS+us0d6V3OrZKd3SFgNJjm8Z8sdbBJxjxbvtvtuMmj6Rg5rbxK84S2bRJqhxRvRxcNPSPjSDkjD+diCE=
X-Received: by 2002:a05:651c:b07:b0:2cf:4c49:a8fc with SMTP id
 b7-20020a05651c0b0700b002cf4c49a8fcmr6437489ljr.22.1706600875032; Mon, 29 Jan
 2024 23:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org> <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org> <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
 <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org>
In-Reply-To: <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 Jan 2024 15:47:43 +0800
Message-ID: <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240129_234758_505448_ABB539EF 
X-CRM114-Status: GOOD (  24.32  )
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

On Tue, Jan 30, 2024 at 3:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/01/2024 04:32, Chen-Yu Tsai wrote:
> > On Mon, Jan 29, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
> >>
> >>>>> +allOf:
> >>>>> +  - $ref: bluetooth-controller.yaml#
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - mediatek,mt7921s-bluetooth
> >>>>
> >>>> Can it be also WiFi on separate bus? How many device nodes do you ne=
ed
> >>>> for this device?
> >>>
> >>> For the "S" variant, WiFi is also on SDIO. For the other two variants=
,
> >>> "U" and "E", WiFi goes over USB and PCIe respectively. On both those
> >>> variants, Bluetooth can either go over USB or UART. That is what I
> >>> gathered from the pinouts. There are a dozen GPIO pins which don't
> >>> have detailed descriptions though. If you want a comprehensive
> >>> binding of the whole chip and all its variants, I suggest we ask
> >>> MediaTek to provide it instead. My goal with the binding is to docume=
nt
> >>> existing usage and allow me to upstream new device trees.
> >>>
> >>> For now we only need the Bluetooth node. The WiFi part is perfectly
> >>> detectable, and the driver doesn't seem to need the WiFi reset pin.
> >>> The Bluetooth driver only uses its reset pin to reset a hung controll=
er.
> >>
> >> Then suffix "bluetooth" seems redundant.
> >
> > I think keeping the suffix makes more sense though. The chip is a two
> > function piece, and this only targets one of the functions. Also, the
>
> That's why I asked and you said there is only one interface: SDIO.

There's only one interface, SDIO, but two SDIO functions. The two
functions, if both were to be described in the device tree, would
be two separate nodes. We just don't have any use for the WiFi one
right now. Does that make sense to keep the suffix?

> > compatible string is already used in an existing driver [1] and
> > soon-to-be in-tree device tree [2].
>
> That's not the way to upstream compatible. You cannot send it bypassing
> bindings and review and later claim that's an ABI.

I get that. I can fix up the existing users where necessary. A proper
binding would make the driver lookup be more efficient as well.


Thanks
ChenYu

