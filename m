Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB24C44512
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 03:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=; b=SSn3D6UwMwCCaiRMcYVuLhi1IM
	FKqA2AKLkyp11l9KWHXcKZHjVuu7gtmI2jV9iVUhFXH6honGxDf3azc9tuv3Vj2eCkqWLeyZV296D
	gvQZMJvYHeP5SsbFzLq9zXTaQkUO2xV7WrXpIYUU/4fNAsK+yJV9lFIcat9LzCHisLuQvv+Tj9M/7
	nS5YKbp7HtNJCAzwAPT1kQBYfep1I2IsAPmnnu00hJ4KdNTu5kaNSG3UxnRo3XiPWKvwhTFw+Rhl7
	cXcHrQ1W6n1ySuJnfcF0Hfy6UNzOWPKvfW4JM4S39ofBjhOx6Diso6M2X2vnWLsLJpqVQBbkbR91z
	5TxIGmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNiY-0000000AorG-0snS;
	Wed, 22 Jul 2026 03:33:58 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNiV-0000000AoqP-0OhM
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 03:33:56 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-66771ded50aso15413997d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 20:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691233; cv=none;
        d=google.com; s=arc-20260327;
        b=hlfnSzA2dS3PHYFt1Rjf99soc1djnug/qODaWORQJXPo+hjHWDM/Il3SMyRhDKpXKI
         gdfZypYG24EzFZjKRTFAxSCcVzLY40ECK1CiSaNOsURIuf7chvSZLBdD07mLIlNrmMPG
         OjIuCl9z7drnAn3gn0uXvVEZCLi3Bn6jR9VbXhLBmPUnD2ZbUfCrYqni6xjhhHea3Sw/
         M8NEFYS/y+qFnz77XCd5VgRvxepIMTmQJzIqF4j/fV+rJb1nkeGwcSSRPXSo248/Hlmc
         /GQOcrFDvQ6QHiOgukMzSNZj+i/80bht4A7jJCkFE8wrnG1koDNc+J8Vg4K38nbAWiYH
         m7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        fh=P1PGegMGzuy9tyXK5RoxcdkGNoJGtSjFvpTaLlKVM3I=;
        b=DFtwufq5h9ZDGmAMz0XfvKfWKBjbpLGJRR9NmZJnnw3hEJjlBnkBSeNJjHJdURgqzn
         DtbLc+GDbyvts7vSXSya3z1EspsTHeh7beddIpOZtWH35TmnLHE95NE1NU+iCJw3vj+R
         VgmPz5JkAJWhwwnOrCYXmGsBNrmR7tM13yXyXYXS5rmMXDSdRsx+qAp6S+xaFUAoZH0F
         EhUykLh/zdeAQACLAYhlPU2FkyBgfUnwJCTd4WvEm7ziS2AHD86GwriCCBkKVyJ+C8uZ
         RFI58j8xEOJUfT5MsuiRgAvN2bDx1RhQoSFdGkKAsRwtztXDtbKeeygjNbZLTunKysjv
         sLSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691233; x=1785296033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        b=ImXcz4INsqG2ZCPMtbtmsQzgP/iY/pgrhTJJYGPdOyppK+6yptGIXmofbM485haHcX
         A+X9PInyyjPcWKBecRzzrg14cFdyuE5SP1eXvTluygQQrjKI+OjThXmmccMq+xWjcT7V
         GjyDSbZpBU+K9pNuadj6LI5yzFKYp8qX8WPtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691233; x=1785296033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        b=SZ5EToZ12DD8lJ5dc7raKMhqMDmlGCyUy+dYJMdBbJOzB7d5f1d/GgyKDRnO4FvrEr
         1SirX0ReYRtSpbkAhkIcLootSTQlIqGYb9tGehdeIDO3o6reQQf2dMtk7h6bocohow7P
         KY6ywPh01I5JxDVWbpiRh3bfIg7hDNpK5iIQTGzdEDFlFP8JHt3/lFX0FOJYL8tcPqRW
         AAU2LqKDrmwKTDvY/2W6eUz+CNgJmpAJNKILz32levRXKgTCrtpjeBGsgU1BhFROlQtk
         w24RmdHWzG9wkWbCeR5/N6mBTJgt/JqQUjSkrtCp2gZXms/Lw6YXh8W2cmTqyzY9M0RB
         g9sw==
X-Forwarded-Encrypted: i=1; AHgh+RqP2VqdjVg+7w6mnH50dShJXZ4N3ov4ZNG2NG8K6U4b7G3WJJxCf2CQcqQpGAI9205Rhz0HKdVoX0hwBl1qhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcjfDMZXWCbJrlYpwZRZBjYilln+stITFHzWVzpTEyh5BP+RUM
	mj/odP0ubwE0N6hvodNd6WgG8WOgoZS68p0H/FwQjyTHqg1mNFb4M5WooHaLezgLN1db8Xuoc3z
	jVO/QrpRB9fLGpariX4oC1OJH7BmiQhH+rdYiKmX/
X-Gm-Gg: AR+sD11ZGOlNh4lxBchSA6BhS5GqFqY/ilMHgOCWRFhPssKpkM6h4qBqecLkLHak0ej
	+qhlBmtMJWSGFVl+ZWTDI1RjKGWHtkUO4YT2l+stxn+UwpNjcvtBmNYMG2SDSdzqWDcoBYCQ+xq
	ZORbT4yNQ/J3J08k5ZyBmFCF4JiiL6dkcKqZvejENck5apRXvPMqH854W5xHBSG5YGmZvw1wDtn
	oOByk6L4grMy4Tx00SJhMHorNOyepr+8KeSUtsSQdDXDDEjiYXqlkA4URzG+GF25mAkepTMZ0ES
	4Tam2FkxwTOmpIY=
X-Received: by 2002:a05:690c:6e82:b0:80d:f376:5ba9 with SMTP id
 00721157ae682-81ef252e359mr66727137b3.24.1784691233300; Tue, 21 Jul 2026
 20:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-8-wenst@chromium.org>
 <al9JivV0SZCiOgK8@ashevche-desk.local>
In-Reply-To: <al9JivV0SZCiOgK8@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:33:41 +0800
X-Gm-Features: AUfX_mxYNc8IPOzIIfv3TBCyd0Fs8lnIBTuyeRs9t7NJj3-mYtf52pIbJvj-z9A
Message-ID: <CAGXv+5Es0RZiAdUj-Y3FEFHU4Km6XBOL-Gk2DbTLrF-OcD54cw@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203355_233962_4D190384 
X-CRM114-Status: GOOD (  26.00  )
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

On Tue, Jul 21, 2026 at 6:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:21PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> ...
>
> > +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
>
> >               /*
> >                * ELAN trackpad needs 2 ms for H/W init and 100 ms for F=
/W init.
> >                * Synaptics trackpad needs 100 ms.
> > -              * However, the regulator is set to "always-on", presumab=
ly to
> > -              * avoid this delay. The ELAN driver is also missing dela=
ys.
> >                */
> > -             .post_power_on_delay_ms =3D 0,
> > +             .post_power_on_delay_ms =3D 110,
>
> This and the other delay in the previous patches are all HW-related. What=
 if
> another touchpad gets connected? I mean that the delays for the certain H=
W
> should not affect other possible devices connected to the platform.

This is a complete laptop, not a development board. You can't just randomly
swap out the trackpad. The model AFAIK is no longer in production, and we
have already added all possible configurations to the device tree. And
there's no extra connector or pin header to attach additional peripherals.
If someone hacks their own device to swap out a trackpad, then handling
the additional bring-up should fall on them.

If you are referring to the delay for the other trackpad option, that is
100 ms, and is described in the device tree. See patch 8 of this series.

Any other device with different delay requirements should have its own
entry, not reuse this one. The information in the entry is tightly
coupled to the device tree anyway. I already corrected the other device
that incorrectly reused this entry [1]. We have some additional offenders
downstream, but nothing that can't be corrected in the same manner.


ChenYu

[1] https://lore.kernel.org/all/20260625060859.1020483-1-wenst@chromium.org=
/

