Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF177C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/5gYNDF0nkUKp5M5EY3mkMekMIIUthcO9+zxPUgVLc=; b=bovJ9peg8yKWtX3d43wh9w9DvZ
	ZsNO9JDfj1Bp/nreZKSTYsgX0Cll34MkiQcOXPw4pgh5JKxkUIEL+0b/cGtE/gLPHcdJXbpgUrb7u
	pBoLUyIht7N+jO1IlFty9boiwOMSQQRppisPssN1ux3P145YAztSk8W4poh9hWRE2ilXh1+Zu91O8
	wOYavRNC+9KDNCA0ugHHocSfv5gSNrxM/xiPUDaeCoD5xWMuZB4TtmS/oVecASV7Ggpudz+DDqjv2
	ubD4o3hRixEHfw8KZiD8odHNJQrR//iLtYUY0PsNb70WlOWREtXTVOUJW56NtQzRTluRevX1m+byA
	EiuRYRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX36g-00000004FGQ-2DFO;
	Mon, 05 Feb 2024 17:50:10 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX36d-00000004FFi-3qbO
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Feb 2024 17:50:09 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6045db1b5a1so12268487b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Feb 2024 09:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707155406; x=1707760206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/5gYNDF0nkUKp5M5EY3mkMekMIIUthcO9+zxPUgVLc=;
        b=S6mAZL4gmbi35PRyEexzdJ8/WY0KIlkn9NnmGgh1sBIlvoIWH/mGVFb5oKFjRo7f2s
         Uk7aVAW/ioaUgZQZS1IjBJg1IidyrLRQYKH0XWUPn2o3/tBOsQyHp3qdIopdzl/TYXAw
         K6+jwlKXdpJ1qipqQJ0BzFsbZHvNVWD89WINcdd+gbIEiYPIeBlSEwaa+M5AK5PKV7TS
         0T26w8Uqku2+JjUDGdggVJHs9TVWZLdlxXutB5dGojeTj1vBqHLcUNrF1gxLOUoE5d+Q
         B2OSBzh51u38f1ux1jLxiz7jB/vCeFiKg8cymYt6jUiqtYAWaGVEswkksgDYPFN2OJhD
         7cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155406; x=1707760206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/5gYNDF0nkUKp5M5EY3mkMekMIIUthcO9+zxPUgVLc=;
        b=X9PxeD1XSxjTNOv5dwAUkHnT06WYNztuhHZZ+T+l4VXHy34ZxUMwm/yFeLmd716lZX
         Lu7Dg5io/d/dY3K7dfkBRQu1wOUoojeeBDyF1io388mzsHLduC33QLnkuU77rXQNtC+K
         lgyg444crjIGiOoG0SunoetB0gHC4dDoT0fM+zB865G+KgqfsqW/+H31EVR7l/LAmWLA
         2BKEqX6GGGRZtzXK9qpvT0ceaKvPdC6gk1s/0lprxBHQ0fOqRyMPWGzulJ+UU3wfDsCW
         XmHjPQJZX0LXPUHIVgKfLai5hR3Uf5ISOeFJLvRMNmuRjG+TK/O3ncLyYEZvOMWcfPJf
         sdGQ==
X-Gm-Message-State: AOJu0YzNWqA72SPRm2Piv4ZXDHTpBnXhBs8JDsozzquAlHBc5Uj6hPAj
	2bj5kJl828Fc1MFnqb1OGHV8OvBo7TFDWOO5w9Nm6A+Id0BBM83WjToZUSc1F3IAeRLnVGzZaio
	5lhBXcmd+UqIqDaeLe1tvFVwnWjECWqyv3XwlWw==
X-Google-Smtp-Source: AGHT+IHk5yq/jXGQCbTN9oiaw3qxJe+nFI2U1PdUPgItb1jUnBVqkaOpdjfeCkgO3RgvntvaJHN4Aox1RUdQzALx5WE=
X-Received: by 2002:a25:6648:0:b0:dc2:1bc4:e06b with SMTP id
 z8-20020a256648000000b00dc21bc4e06bmr95682ybm.51.1707155406596; Mon, 05 Feb
 2024 09:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org> <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org> <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
 <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org> <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
 <78241d63-3b9d-4c04-9ea5-11b45eac6f00@linaro.org> <20240130223856.GA2538998-robh@kernel.org>
 <CAGXv+5FwaNe7oesGwZ=yR0Pg82tEzEF3B0zjoex4qw+6zsSYbQ@mail.gmail.com>
In-Reply-To: <CAGXv+5FwaNe7oesGwZ=yR0Pg82tEzEF3B0zjoex4qw+6zsSYbQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Feb 2024 18:49:30 +0100
Message-ID: <CAPDyKFofy24N7ymzTF7wiADc17Tw9FiNTYMnbxgoioMBwDKVhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240205_095008_005341_766807FF 
X-CRM114-Status: GOOD (  39.68  )
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

On Wed, 31 Jan 2024 at 04:39, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> (+CC Ulf Hansson)
>
> On Wed, Jan 31, 2024 at 6:38=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, Jan 30, 2024 at 05:25:38PM +0100, Krzysztof Kozlowski wrote:
> > > On 30/01/2024 08:47, Chen-Yu Tsai wrote:
> > > > On Tue, Jan 30, 2024 at 3:37=E2=80=AFPM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >>
> > > >> On 30/01/2024 04:32, Chen-Yu Tsai wrote:
> > > >>> On Mon, Jan 29, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski
> > > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > > >>>>
> > > >>>> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
> > > >>>>
> > > >>>>>>> +allOf:
> > > >>>>>>> +  - $ref: bluetooth-controller.yaml#
> > > >>>>>>> +
> > > >>>>>>> +properties:
> > > >>>>>>> +  compatible:
> > > >>>>>>> +    enum:
> > > >>>>>>> +      - mediatek,mt7921s-bluetooth
> > > >>>>>>
> > > >>>>>> Can it be also WiFi on separate bus? How many device nodes do =
you need
> > > >>>>>> for this device?
> > > >>>>>
> > > >>>>> For the "S" variant, WiFi is also on SDIO. For the other two va=
riants,
> > > >>>>> "U" and "E", WiFi goes over USB and PCIe respectively. On both =
those
> > > >>>>> variants, Bluetooth can either go over USB or UART. That is wha=
t I
> > > >>>>> gathered from the pinouts. There are a dozen GPIO pins which do=
n't
> > > >>>>> have detailed descriptions though. If you want a comprehensive
> > > >>>>> binding of the whole chip and all its variants, I suggest we as=
k
> > > >>>>> MediaTek to provide it instead. My goal with the binding is to =
document
> > > >>>>> existing usage and allow me to upstream new device trees.
> > > >>>>>
> > > >>>>> For now we only need the Bluetooth node. The WiFi part is perfe=
ctly
> > > >>>>> detectable, and the driver doesn't seem to need the WiFi reset =
pin.
> > > >>>>> The Bluetooth driver only uses its reset pin to reset a hung co=
ntroller.
> > > >>>>
> > > >>>> Then suffix "bluetooth" seems redundant.
> > > >>>
> > > >>> I think keeping the suffix makes more sense though. The chip is a=
 two
> > > >>> function piece, and this only targets one of the functions. Also,=
 the
> > > >>
> > > >> That's why I asked and you said there is only one interface: SDIO.
> > > >
> > > > There's only one interface, SDIO, but two SDIO functions. The two
> > > > functions, if both were to be described in the device tree, would
> > > > be two separate nodes. We just don't have any use for the WiFi one
> > > > right now. Does that make sense to keep the suffix?
> > >
> > > Number of functions does not really matter. Number of interfaces on t=
he
> > > bus would matter. Why would you have two separate nodes for the same
> > > SDIO interface? Or do you want to say there are two interfaces?
>
> There is only one external interface. I don't know how the functions
> are stitched together internally.
>
> It could be that the separate functions have nothing in common other
> than sharing a standard external SDIO interface. Each function can be
> individually controlled, and operations for different functions are
> directed internally to the corresponding core.
>
> > Right, one device at 2 addresses on a bus should be a node with 2 "reg"
> > entries, not 2 nodes with 1 "reg" address each.
>
> AFAICU that's not what the MMC controller binding, which I quote below,
> says. It implies that each SDIO function shall be a separate node under
> the MMC controller node.

Yes, that's what we decided to go with, a long time ago. At least in
this particular case, I think it makes sense, as each function
(child-node) may also describe additional resources routed to each
function.

A typical description could be for a WiFi-Bluetooth combo-chip, where
each function may have its own clocks, irqs and regulators being
routed.

>
>
> patternProperties:
>   "^.*@[0-9]+$":
>     type: object
>     description: |
>       On embedded systems the cards connected to a host may need
>       additional properties. These can be specified in subnodes to the
>       host controller node. The subnodes are identified by the
>       standard \'reg\' property. Which information exactly can be
>       specified depends on the bindings for the SDIO function driver
>       for the subnode, as specified by the compatible string.
>
>     properties:
>       compatible:
>         description: |
>           Name of SDIO function following generic names recommended
>           practice
>
>       reg:
>         items:
>           - minimum: 0
>             maximum: 7
>             description:
>               Must contain the SDIO function number of the function this
>               subnode describes. A value of 0 denotes the memory SD
>               function, values from 1 to 7 denote the SDIO functions.
>
>
> ChenYu

Kind regards
Uffe

