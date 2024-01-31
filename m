Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36985C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 03:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpRkgXkbQYXbK1cEg4XXsMfWT44RSVIecn26S5cDrV4=; b=308ydYLBzb5nJq20KDIU9aSDtm
	Ok1qDWoHQDDX8UlC1fzclDP1vFWjWBDmre8QVC5XA7PtZaCs9tsyKCYUG13pyciLS18f7hmDkwVyw
	eaPpoJYLUCX4x/GIp31YIM1xw1VyIhx9cCjpCLaK7kmfjW0vW0rFCMZkplpvMOXteUqAW9o0q071G
	c7P8QKTYojIMGurEMAXFQ0tRxhy4LLM22aT2tHLQ4Zg4yiSIUYEm/WgfJIWm7/bu4SJdp9Mz4Owuj
	+RaTgQEytYNln1krO+xzXf4x6BL2Qgue8X6iLRrNA91em1AN7dpgmSwPKSVbuAry0bKkUFVCb4rSk
	3lBQjAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV1SE-00000001OKJ-3bqA;
	Wed, 31 Jan 2024 03:40:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV1SC-00000001OIu-2HRN
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 03:40:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-511207d62b6so1389602e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 19:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706672396; x=1707277196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpRkgXkbQYXbK1cEg4XXsMfWT44RSVIecn26S5cDrV4=;
        b=HH2wlBxQHtpfISDYP9ze9Yv3Pv0iT6a+x6nYmiV3QiJJ3X1ORUXP4eiVD2GIHDEfH2
         IShnQngrLynD84D2yN6niP1ycpOiNVc9Na4jqWlYDm6hlxa2M/Le52fzOmQ4bmYxsKke
         zq3VvqiYhtqDUisII3YIUfS/v8MY5re6Z62pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706672396; x=1707277196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpRkgXkbQYXbK1cEg4XXsMfWT44RSVIecn26S5cDrV4=;
        b=ZNc+jsexiyS+4WnmOLSE5UAFnEdXKcTDRU1ltBbO07sFn6Ap2PX2R9gXn3ZdRcwMLm
         3+xaV66mKtM5NxRpthgopgeUa+MGfiCg76IfNuuT9+Z7H1fCJvl2e86y3QrGod+FewYt
         IrSRoubtih0a1GPY8kEMiBZOB9IflvCRA/taJ7qgXlkjmthQWTH+hnd5g1JZ5Bqh5O/4
         XxMszY6SoaPnTWVlS19zt22+vnOVuiDAIg0pcWWjdjcJeEBFTMYRyQH8ylewMgs1jNlr
         hpqGouXnL+QjKu3Mr6Eu0hQyIgNHgSQwQ/AYHnRtb3WuFo8jQTJsnVbZt/TmkCkmDwM6
         qMMw==
X-Gm-Message-State: AOJu0YzVXCf2NAylmwlg3iHJEyLDat3LSS69BFj4PsXH0jNU+0aW053P
	T5tS8MNQott0jsCafHo7J/8ej3lAZ4e+pt2PMdx2EvQJ1Q+xfmlctBETXopJyIcMM/fJQglvRV9
	HjIO4z67vy6Zr8gK1rFcSIA+XbzamxcqOsT9g
X-Google-Smtp-Source: AGHT+IHsCbNhf/cX1e7S3SrH8YqgH2QhUc3a53hHF1zco0XT9jtlWjG4rpYd5ZxLSwo4KK0lfHA3RvEPSDfNHcGvQqM=
X-Received: by 2002:ac2:443a:0:b0:50f:18f7:855e with SMTP id
 w26-20020ac2443a000000b0050f18f7855emr285947lfl.39.1706672396151; Tue, 30 Jan
 2024 19:39:56 -0800 (PST)
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org> <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org> <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
 <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org> <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
 <78241d63-3b9d-4c04-9ea5-11b45eac6f00@linaro.org> <20240130223856.GA2538998-robh@kernel.org>
In-Reply-To: <20240130223856.GA2538998-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 31 Jan 2024 11:39:43 +0800
Message-ID: <CAGXv+5FwaNe7oesGwZ=yR0Pg82tEzEF3B0zjoex4qw+6zsSYbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_194000_628763_C9F03C1D 
X-CRM114-Status: GOOD (  34.00  )
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

(+CC Ulf Hansson)

On Wed, Jan 31, 2024 at 6:38=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jan 30, 2024 at 05:25:38PM +0100, Krzysztof Kozlowski wrote:
> > On 30/01/2024 08:47, Chen-Yu Tsai wrote:
> > > On Tue, Jan 30, 2024 at 3:37=E2=80=AFPM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >>
> > >> On 30/01/2024 04:32, Chen-Yu Tsai wrote:
> > >>> On Mon, Jan 29, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski
> > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>>
> > >>>> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
> > >>>>
> > >>>>>>> +allOf:
> > >>>>>>> +  - $ref: bluetooth-controller.yaml#
> > >>>>>>> +
> > >>>>>>> +properties:
> > >>>>>>> +  compatible:
> > >>>>>>> +    enum:
> > >>>>>>> +      - mediatek,mt7921s-bluetooth
> > >>>>>>
> > >>>>>> Can it be also WiFi on separate bus? How many device nodes do yo=
u need
> > >>>>>> for this device?
> > >>>>>
> > >>>>> For the "S" variant, WiFi is also on SDIO. For the other two vari=
ants,
> > >>>>> "U" and "E", WiFi goes over USB and PCIe respectively. On both th=
ose
> > >>>>> variants, Bluetooth can either go over USB or UART. That is what =
I
> > >>>>> gathered from the pinouts. There are a dozen GPIO pins which don'=
t
> > >>>>> have detailed descriptions though. If you want a comprehensive
> > >>>>> binding of the whole chip and all its variants, I suggest we ask
> > >>>>> MediaTek to provide it instead. My goal with the binding is to do=
cument
> > >>>>> existing usage and allow me to upstream new device trees.
> > >>>>>
> > >>>>> For now we only need the Bluetooth node. The WiFi part is perfect=
ly
> > >>>>> detectable, and the driver doesn't seem to need the WiFi reset pi=
n.
> > >>>>> The Bluetooth driver only uses its reset pin to reset a hung cont=
roller.
> > >>>>
> > >>>> Then suffix "bluetooth" seems redundant.
> > >>>
> > >>> I think keeping the suffix makes more sense though. The chip is a t=
wo
> > >>> function piece, and this only targets one of the functions. Also, t=
he
> > >>
> > >> That's why I asked and you said there is only one interface: SDIO.
> > >
> > > There's only one interface, SDIO, but two SDIO functions. The two
> > > functions, if both were to be described in the device tree, would
> > > be two separate nodes. We just don't have any use for the WiFi one
> > > right now. Does that make sense to keep the suffix?
> >
> > Number of functions does not really matter. Number of interfaces on the
> > bus would matter. Why would you have two separate nodes for the same
> > SDIO interface? Or do you want to say there are two interfaces?

There is only one external interface. I don't know how the functions
are stitched together internally.

It could be that the separate functions have nothing in common other
than sharing a standard external SDIO interface. Each function can be
individually controlled, and operations for different functions are
directed internally to the corresponding core.

> Right, one device at 2 addresses on a bus should be a node with 2 "reg"
> entries, not 2 nodes with 1 "reg" address each.

AFAICU that's not what the MMC controller binding, which I quote below,
says. It implies that each SDIO function shall be a separate node under
the MMC controller node.


patternProperties:
  "^.*@[0-9]+$":
    type: object
    description: |
      On embedded systems the cards connected to a host may need
      additional properties. These can be specified in subnodes to the
      host controller node. The subnodes are identified by the
      standard \'reg\' property. Which information exactly can be
      specified depends on the bindings for the SDIO function driver
      for the subnode, as specified by the compatible string.

    properties:
      compatible:
        description: |
          Name of SDIO function following generic names recommended
          practice

      reg:
        items:
          - minimum: 0
            maximum: 7
            description:
              Must contain the SDIO function number of the function this
              subnode describes. A value of 0 denotes the memory SD
              function, values from 1 to 7 denote the SDIO functions.


ChenYu

