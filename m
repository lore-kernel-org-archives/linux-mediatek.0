Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED83C8302D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jun 2025 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVgaB3k9Sbz8/PUf8gTuXUEgwfS3TrY+vZ/LVCHdKio=; b=MpI9QyTPolJRk62IdflDJ09rwf
	djiC+YMfOZRJwcb4y1xPIvtFfRl50EeH3kWlGesqt6oTF44qXa4HtLHY2pRXWsz+KzxL05n8+0k92
	2Q4pq2ki0Jw6iNz9UcqpI7lGWcp2yeC6e0xYYVSxvhuVqiZvQeF29/tXWjiHoK93MKZX6RY2AOrKt
	Otpe6dj1nvGAA7cJ1X1Dwz/KRkvtp9vWlf3aoH0RhSZPh2eJBplzQ0EO0UzCrlGUTCymGTSaZbDUb
	an4JkQUgihKBFAZ/XsNCVPQVA+Lxiw04NEEPJUDKzUGDgpMRmvUb7+YvM/Ik60czNg54nQsR3dlLc
	KrjZlvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9zZ-00000001d5Q-3BJP;
	Mon, 30 Jun 2025 08:35:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9yS-00000001cvy-13ZK
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Jun 2025 08:34:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553bcf41440so4187500e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jun 2025 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751272486; x=1751877286; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVgaB3k9Sbz8/PUf8gTuXUEgwfS3TrY+vZ/LVCHdKio=;
        b=D6QhVbfrDIjci5nfD7Hy9d7rikfSFEgsq64bAC9TjHvNfSUa2DUcpOzXMDDiUtOSLk
         +svyRHzu+1N7RBbgsvZMmDJW5ADh47lCqmZJE4G01M8U9EZFkj1bNIcaOabtJb2E+UQL
         j8Fkmg2bWBUgZHhmCkILQ4wERziBYoFod/2JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272486; x=1751877286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVgaB3k9Sbz8/PUf8gTuXUEgwfS3TrY+vZ/LVCHdKio=;
        b=rMcPM1AU8OmdC+tZoU2c8SNjgEnpdeYajBm/lS1f8r/XJ4X9AihVeZVMu79yCZOu30
         KEFCnaNi45adytSbV+OrRWMNbHPJn11/fEfEpG8BcxqJIOJu5+7dUMsfdjJGCI0hpoUK
         NZ65bKednnzFuGOXNxSRCzCRq7IW4vcdCX6ug0zJ9vD0SGnVDqYKehc5NEm+uHBjvkIn
         SDcjnWn/jzx/C+lQ8oRTR8/56EwHhZfUz7h0sLEPMx93aR1Wfq0VqMNel0rLK4fCRdxt
         JXZpq0hdLIy0hEhDUGmWPCjpHHeHt/4E5P6b+sfi6sei6TvvxF64qjWmJ9TKktEAek4S
         UEtA==
X-Forwarded-Encrypted: i=1; AJvYcCXbrbFfMS0LMt94tUAF9IAMpcyI5EJNU406zF3DjBaHtCDqAUmDq40fqyyH31SzrbVoHqU+ioioyrt9Ox7u+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTT1J62UGtVv5wjPVLvTVMXwT1s1OHacZ+bBvb4N6W88TWM58O
	6ourUsnMpDnjrwkyC3o+82aN577tUiRb5EBBBEbuqRkZL12ogns2iRxVFjrtO5AZ55w8u6TksDY
	JJixhIpG8ZPAUhkrLeUrR2plQaINcEnTlYTmGClc3
X-Gm-Gg: ASbGnctEYsJbBqtC5hnIbC1xIVbjN9JiagdtEqrNAFV34c587hFNKAQtwoO5jACvBIk
	LVm9Juw1m07O0EuCUOmaZmQkdSI016jShK0BTK/M4g639cTQ9JH9+4XtFwYnqOPOY4lYnLVRZVU
	veUfFBd8vHTBW+yJjwDwYQB2xVrxHni5WO4oRXJmkQEVRWISXG2+y1gGSYU/WQ2L5xymxYRq0=
X-Google-Smtp-Source: AGHT+IHlFcd7ds08VjRkhAd4B5pJTIKQJ0FaK20eZC09ottQSiiIyrXWfmbyhysoyNz0SfAaoXhAnX9I8zWuiDZ9khk=
X-Received: by 2002:a05:6512:b12:b0:554:f79d:ce59 with SMTP id
 2adb3069b0e04-5550b9ee228mr3819454e87.27.1751272486439; Mon, 30 Jun 2025
 01:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
 <20250627-neon-hidden-sheep-ed8dae@krzk-bin> <CAGXv+5GLJ7cfAQW_kbTqqe_QO+RfU7KL57n77qenpDiRS5BybA@mail.gmail.com>
 <c5dffc8c-2abe-4fd3-a062-6d1adb417d27@collabora.com>
In-Reply-To: <c5dffc8c-2abe-4fd3-a062-6d1adb417d27@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Jun 2025 16:34:35 +0800
X-Gm-Features: Ac12FXy9Bg8iczKYCRzfVVALHWEDTg9agbPGYTVqjyGmcI5uPshlMdfvswpTnDg
Message-ID: <CAGXv+5EwLDue4y6fVuyNd-z1mytqXJJhQuohhe3htT-XiNcGHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_013448_419770_9BB8267F 
X-CRM114-Status: GOOD (  40.57  )
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

Hi,

On Mon, Jun 30, 2025 at 3:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/06/25 05:25, Chen-Yu Tsai ha scritto:
> > On Fri, Jun 27, 2025 at 4:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno w=
rote:
> >>> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> >>> usually found in board designs using the MT6991 Dimensity 9400 and
> >>> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> >>> MT6373 PMICs.
> >>>
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >>> ---
> >>>   .../regulator/mediatek,mt6363-regulator.yaml  | 123 +++++++++++++++=
+++
> >>>   1 file changed, 123 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/regulator/medi=
atek,mt6363-regulator.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6=
363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,m=
t6363-regulator.yaml
> >>> new file mode 100644
> >>> index 000000000000..f866c89c56f7
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-reg=
ulator.yaml
> >>> @@ -0,0 +1,123 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulat=
or.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek MT6363 PMIC Regulators
> >>> +
> >>> +maintainers:
> >>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.=
com>
> >>> +
> >>> +description:
> >>> +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) reg=
ulators
> >>> +  and can optionally provide overcurrent warnings with one ocp inter=
rupt
> >>> +  for each voltage regulator.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: mediatek,mt6363-regulator
> >>> +
> >>> +  interrupts:
> >>> +    description: Overcurrent warning interrupts
> >>
> >> Are you sure interrupts are physically not connected?
>
> Yes, I'm sure, they are not.
>
> >
> > Side note:
> >
> > I wonder if we really need to describe _all_ the interrupts here.
> >
> > Looking at the PMIC as a whole, the interrupt tree is something like
> >
> > SoC <- SPMI inband IRQ - PMIC top level IRQ block <- sub-function IRQ b=
locks:
> >
> >      - BUCK (buck regulator over current)
> >      - LDO (LDO regulator over current)
> >      - PSC (key press / system low voltage)
> >      - MISC (protected registers accessed / SPMI stuff)
> >
> > And some other blocks that may apply to other MediaTek PMICs:
> >
> >      - HK (some threshold triggered interrupt)
> >      - BM (battery management related)
> >
> > The thing I'm trying to get to is that all these interrupt vectors are
> > internal to the whole PMIC. Do we really need to spell them out in the
> > device tree? The top level compatible should already imply how all the
> > internals are wired up.
> >
>
> Chen-Yu:
>
> Yes, we do: not all boards need overcurrent protection on all of the rail=
s, but
> especially, in the past I have seen (multiple times) board designs (not M=
ediaTek,
> but that doesn't mean anything) that will trigger the overcurrent protect=
ion due
> to a high inrush upon rail enablement - in these cases, the ocp would hav=
e to be
> either ignored completely or reset and read after a while.
>
> Not only that: since not all rails are actually used, due to EMI (and oth=
er issues
> which usually mean suboptimally built boards) some of those may randomly =
trigger
> OCP, and that's another case in which that should be ignored.
>
> So... yes, we want to define the overcurrent interrupts in the devicetree=
.

I understand the use case, but I think that's kind of giving the interrupts
property a second meaning.

Instead, if you look at the common regulator bindings, there is a
"regulator-over-current-protection" which signals that over current
protection should be enabled for a given regulator. Perhaps you could
use that? I think this common property also implies that over current
protection has to be explicitly enabled.

> >
> > ChenYu
> >
> >>> +    minItems: 1
> >>> +    maxItems: 36
> >>> +
> >>> +  interrupt-names:
> >>> +    description:
> >>> +      Names for the overcurrent interrupts are the same as the name
> >>> +      of a regulator (hence the same as each regulator's node name).
> >>> +      For example, the interrupt name for regulator vs2 will be "vs2=
".
> >>
> >> You need to define the items or pattern if this is really flexible in
> >> the hardware (not drivers).
>
> krzk:
>
> It's flexible in the hardware... but how do I define a pattern here?
> I avoided to define the items because you can miss some; I mean....
>
> You may have, on one board:
> "vs1", "vsram", "someother", "another"
>
> on another: "vsram", "another"
>
> ...and another: "vs1", "another"
>
> (etc etc)
>
> Is there any way to allow missing items in between?
> Because then there's 36 possible items, so there are more than 100 possib=
le
> combinations (keeping the order, but missing something in between..!).

I recently saw in the net/snps,dwmac.yaml binding the following:

  clock-names:
    minItems: 1
    maxItems: 10
    additionalItems: true
    contains:
      enum:
        - stmmaceth
        - pclk
        - ptp_ref

I suppose you could adapt this pattern, list all the possibilities, and
set additionalItems to false. I don't think it can pick out duplicates
though.


ChenYu

> Cheers,
> Angelo
>
>
>

