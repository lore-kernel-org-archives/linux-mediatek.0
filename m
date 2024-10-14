Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37B4D1813D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whUXQdW4V3uK6J62gXNCBonZX2tUFZt/oJonszpTWPo=; b=Uk9LMR/mq/cfkOXnk/WSqVnXDG
	IsC+06aQSwlT0f68wbNjN1oZW3DSw4tRKmKCKLfKk31cM1+RFpwpKVpe4qEr6yKhkvsLm75pn/4fW
	B+xQRqH5qJdoORgic6j+87jkJ2kR4+QL4MOKqOLFpOk0CM9igGecei6WZjnKQYPImP/cMU4bXga4n
	bPNOsztM3+Dmylp7+nJsxRiyH3WRj1uM21311xw77kYrWRITWZdvWEjipAyqBsOX85rt+Ukigk1J1
	e2KZ7Z5qoY4k4msyeTkNaZ0P+mD3I3Vr6elKuKPmSn0cTA/0ncTpVnrJ9U9Z5IdGXYnvZiPZPMVpb
	ouXOUo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0QI8-00000006EnB-1mT8;
	Mon, 14 Oct 2024 18:59:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0QGi-00000006EhI-38VF;
	Mon, 14 Oct 2024 18:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBF605C5BA8;
	Mon, 14 Oct 2024 18:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9287C4CECE;
	Mon, 14 Oct 2024 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728932291;
	bh=0cNdfxlaAERI2ZFlY9O5b6oEJR0zLiQVvjIssZNT7uA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l3yLn9ZWGzwmeKqHx5fGWbnkT/m9/UciHrCSJZVYcU53aUoevp/gleaS/f9tEbAuS
	 9obNFAtScyRsaWjGPym1pRdg9wlBY8pNmcD+//s+U3D5a5AaU83Cblx7Ah8No78Txp
	 xJ9S2l0HhN7zbfI5Q1UADxk9daxJYM5SIv7wDqDg9oTRrSNtvB7lGj+cfujcjAbvGC
	 1V/bmYhvYw29W27lV8bkT6fBtoaKEUm7lTlYAsIM6vMSJyl9HpNMc74Yl3Lvz+WM1T
	 T6svYEJBkJQeXzorEBuCjtjc46M14Ip54DoyUH9e1x177RDHeBpDy6Y09ytey/HW7q
	 YRHplFP2s8H6w==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5389917ef34so5083197e87.2;
        Mon, 14 Oct 2024 11:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVm09DBdatJmUWnY0vHaxOOjJUG7cV1JSrMQjOn4E+SdAQv5MZ0mwnTTei96h9wA+CT+tlrQp4xRuzKmtRZ4k=@lists.infradead.org, AJvYcCVeLkWzGUS/KAxquGlWIIlEe/by5LZA4p8LYpw9A4dO4SUnIr8e3xrhgwvILJn9FXUKl0s/Do5aR+DW0An1Yclj@lists.infradead.org
X-Gm-Message-State: AOJu0YxPtcL5tBaPTfa9Vv83GdZ33Zgk616O3fHndEdO2UVTSqeyM1ZE
	W+YFE+FOJGow9O2PBAH/YDtvGMaaE9kzqND2kh1Q9eTAEqJHxgnzBTaC+Ju9u7DXiwnd7OjssQK
	hNzZNcHOKC/PV2Tu9riTQ06+t5A==
X-Google-Smtp-Source: AGHT+IGB7JJYiM5L2evoekVIoH09vgK4CE4aQy4IbaJ7FdMyUJ22wtpfWp4Rpcz4KtN6+j3CywO20ZHiH68G5gGpwl4=
X-Received: by 2002:a05:6512:23a9:b0:539:9594:b226 with SMTP id
 2adb3069b0e04-539e5620d75mr3724058e87.34.1728932290183; Mon, 14 Oct 2024
 11:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com> <20241011165640.GA2475122-robh@kernel.org>
 <e410cdb6-84a7-482b-9234-3f61077b8151@gmail.com>
In-Reply-To: <e410cdb6-84a7-482b-9234-3f61077b8151@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 13:57:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKdHsf0A38XJ+rwsu2FyLfMmFyL+BHKnTGg0=0A7CfUmQ@mail.gmail.com>
Message-ID: <CAL_JsqKdHsf0A38XJ+rwsu2FyLfMmFyL+BHKnTGg0=0A7CfUmQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_115812_899768_BCB28AE4 
X-CRM114-Status: GOOD (  19.97  )
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

On Sat, Oct 12, 2024 at 3:09=E2=80=AFAM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
>
> On 11/10/2024 7:56 pm, Rob Herring wrote:
> > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> >> From: Yassine Oudjana <y.oudjana@protonmail.com>
> >>
> >> mediatek,pinctrl-mt6795.yaml has different node name patterns which ma=
tch
> >> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml w=
hich
> >> has a description of the pinmux property, as well as some additional
> >> descriptions for some pin configuration properties. Pull those changes
> >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match =
in
> >> preparation to combine the MT6795 document into it.
> >>
> >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >> ---
> >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++---=
--
> >>   1 file changed, 28 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779=
-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-p=
inctrl.yaml
> >> index 3bbc00df5548d..352a88d7b135e 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> @@ -111,12 +111,12 @@ allOf:
> >>           - "#interrupt-cells"
> >>
> >>   patternProperties:
> >> -  '-[0-9]*$':
> >> +  '-pins$':
> >
> > Worst case, this could be an ABI break. Best case, it's churn for
> > mt6779. Is it worth unifying?
>
> It's better than keeping different patterns, isn't it? We wouldn't have
> ended up here if they were made as one in the beginning as it was ought
> to be considering how similar the hardware is. It's easier to change now
> since nothing is using it yet.

I can only assume there are users unless you tell me otherwise (in the
commit msg).

Rob

