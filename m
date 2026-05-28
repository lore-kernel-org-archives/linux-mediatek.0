Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9928DCD5BD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=; b=QJoo2wiX9inkJq0t6jsxuwbZ8V
	/vFr15Uvh3ZMCqHokYRgETRFdyzK3kKFRaXQ7/f6sN3LZ8FyL7BA2/9DUu69R2IRv5YSrp0p/9ZpF
	bmWy5O4sf0S4XEEoqzNJXn5HJNmf7CSH7MqXnsPwDDY1yA1jBPRUJa5O7M9Nqilzy8vNuY4xpQ+0+
	YbY0W/1viP4qv0QQ6K5LeIfPzZKd2ZBUn6s2REI7POYqgCXSlMpYHz+UumlaItWpYjht0QXK40I41
	1LI78qewwZ4BmFLBLQWIenTlX84/dGsDEmSDGONlDVp964jAgbS/IbB40AgFf1knHXnfFOY3NnzNq
	frUIE1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWHi-00000005Pkl-2GiB;
	Thu, 28 May 2026 08:40:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWHh-00000005PkW-2pB7
	for linux-mediatek@bombadil.infradead.org;
	Thu, 28 May 2026 08:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=; b=bixAYWru8di+F6Jm/5dml7Smpq
	Mcrupq1rGtrgCZor6ChMc9PEooXXOPW2arsXlbYRQCKTDlTUkxxUphEVij63OU+/FjUhix4Kg4+/V
	kty1urT+C4Kq7xUs5IvX3zrXADZt6T50Un+uabEj2Bnw3RizOdLzn983VPzhLo91YPlibuouU2MI+
	tbQXY+884W515oedqpQySgLHdNWIILX9OHpnzOem9ZRWt58dfaJmUaFoi73kozI1VdF2jbIAjnbOW
	/dSzPs188h5ACRZ+oc7j0eeqhNYiTMM1dJdn3EeurS5DXMm0PflAuvJZQi97cg4faaeaLDgia+mWF
	bypTnRcQ==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWHe-0000000Fra6-1Doj
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 08:40:08 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a8f9841616so10381522e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2026 01:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957604; cv=none;
        d=google.com; s=arc-20240605;
        b=h6HuWDvHcRq/VBMrb4Jy6k3H9JUtCXHLDYaHu00ETQ2rjtx1jQJ64QbFEjakwbO23d
         jdAJlpDeyXH+aFZ3CEsmSl6sSD2FkDCiJxaeeobhJFciIy4eKzonhUWKVYCtPMnsMFQa
         3Bftk/kEQW9CEER4ey990r0QxAec6wJCqbhVnmLHmNRYT7aFcwdoZy6A+g6iLPULjLrz
         m4l2xkzIaRxry4pc9sYTjo5WopJi+2dW9c7WOTd5/ljy3Q/81UNCZuTwJrrGzRE9koSP
         YkWw7VLTkijga8ylINP4KOoYnHvV9cqfF2sUQMoQz/8WmNqN1+xaNpV9S+uLEzPj0nx1
         opbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        fh=BHezcgKExe6/HwhDAh9p5LoYznEjopyi1Mnw9z10WPw=;
        b=eKbNDgTZKY/Up6E+yQt11WNvhZuVX8U3FwvG/iNaR98Tkh4lmxnIijuBSwcLsGVT5Q
         TW4brmqq3gzwECiogphBp8qdR57cFpNpgwCElODsGbMqbO4fyfW4bL+yrP3YchpDZsQV
         nX2eohbAZSyFwIswcxjf/uLnFRRqWZrk55qjUZ0Ji0IOE5+gRmJV/a/Tta1iYEJvQz5T
         pRKVGbh1Y1b5SL93pT4ecFgR5F+mUwL42bdgMh+6aN1Nhsj/TI3TUmSFU7qYKiLJwqrf
         hXzg+hi+dmEngpE3Dm8Sq1iMU0RNf+NDEtPz3ExtBOYTqNHGWmq0SQYUEp4lbdyRiCry
         39GQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779957604; x=1780562404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=eIx3J1iUcJeitFyUDrUzqgFxwmmV6OwANs612+LyQzN03eyKP215Ye1JoP1JWXfChJ
         xeMevVR8NPvxzyH2ykjv3ZFbDh8mNhIkn0Lo9ct+WwpJb7Q4n05HoZW3oqqN006VlUYC
         TyHbnnyG+hAaHRASwLqozbBtDJVfJbdWQmy+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957604; x=1780562404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=o9JvVvxVY1hGZj55xJf2B8X7xXUGM5wxwtbPyZWJz9KyfaCjRFnUINL3+csHkRcVzw
         +5RhxCdxvp7mW3ipTcgWYSVKgjKN3nXz6IgOEXMnd6aIii/EO8NekL29XDZTTWk5qM8j
         uLHLAWzZ8Lv3w1SIY/SbtoK5hqFTdHy7PC4kh06Q6YgBWf3Xi0TTGkBOgksz6iFiKkIm
         PBi1jEV7xAvEVOesjUTsIbE8rhihwhBo+8SZkIey2u6JAqAsEheVptaDEcZ2tca1vw8C
         DpIxihFzVm+lHOtAj/iUskfsdxpZ0x4Had2SQAfMamR1779tGNMgBjjygNx8tJd7TJSi
         W5LQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QuahazhQtBSsFhxKAP6gi6PLGnuKoCVu2B7M9ZZZ75fdtdGadktTjAH6xmu9ry2b6OpXoAH0Ajg/EMOJYaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4CExyri4lfCt+5Bhg8btBuyx+qrEW8eHQvICAvzOsAUbJQMwh
	5piwFMyqP3cph/rrATmsgkLYbEbyF5S1N1Guv7YNqIzSFjfp6rjyhuocJfiEPi5kUAmp5foSlM7
	5qBoqT6obAHyHpmcjfumLSZ2OOXmGJ4734GvdwHRw
X-Gm-Gg: Acq92OG8EmSUQtq0gL+LsOTHgxKpkV+UC1URfHO/MsKwTEqbuQQK+b3ORwc0A4+aHUb
	AQaFefvrHk2s83V3BqgF1JaXy8c2wZdspNPxo9p2UVCKaSWwTDWVoQjPbxJj0+Rfjs3JyB02aTG
	ETP4dktUiwTYOxZW23ml6snuIcrc5OTSQ2MhS+WYSZnUZrNgzOPCGJbTxFiF2kxTDPsLJ8evNdr
	lYMaTLa4i+niweK2JhzGYLxVMuaqWYsnfcoDvVFK8unKWBgX1pQBaq1nPG3Uef5TtEdlGlMmXKA
	unkpIokQfdb33XzSAWUZJoosM0eD
X-Received: by 2002:a05:6512:3ca9:b0:5a8:afc8:c37 with SMTP id
 2adb3069b0e04-5aa32369fccmr7817435e87.4.1779957603539; Thu, 28 May 2026
 01:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
 <2026052710-flagship-unsmooth-ce82@gregkh> <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
In-Reply-To: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 May 2026 10:39:52 +0200
X-Gm-Features: AVHnY4ImlKiDtiu3PtJAJE_NOkB4Apdo_R0OjsOkU3xKzZOWZm2qt_u0g9B3V2M
Message-ID: <CAGXv+5HKxhfZuAHTZECsVFp4S9yTN2rXW_Nps2TcoV=r9KgfEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_094006_933277_B6503636 
X-CRM114-Status: GOOD (  31.68  )
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

On Thu, May 28, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Wed, 27 May 2026 19:41:30 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> said:
> > On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
>
> ...
>
> >>
> >> However this seems to completely decouple the power sequencing from th=
e
> >> USB core. Take the USB A connector for example, it was recently added =
to
> >> the onboard USB devices driver. However the connector has a device nod=
e
> >> that is not a child node of any USB host controller or hub; it is conn=
ected
> >> through OF graph. At the same time, since it typically sits at the top
> >> level of the device tree, a platform device is directly created and th=
e
> >> driver subsequently binds to that device. This is totally different fr=
om
> >> how the hub and other directly connected onboard USB devices work. In
> >> the onboard device case, the device node is a child node of the USB hu=
b
> >> or controller, and the corresponding platform device only gets created
> >> when the USB hub driver probes, thereby sort of tying it into the USB
> >> device topology.
> >
> > Hm, did we mess this up?  If so, we can always change it if you think
> > this should be done differently.
> >
> > Hubs should be dealing with the power issues for their ports, so maybe
> > rethinking this might be wise.  I'm just loath to add hardware-specific
> > hacks to the hub common code for obvious reasons.  Anything we can do t=
o
> > pull it out to a separate driver is best so it doesn't affect the 99% o=
f
> > the users that don't have that crazy hardware :)
> >
>
> IIUC what we discussed with Chen-Yu yesterday, the only thing that needs =
to be
> done in the USB hub driver is attaching the port firmware nodes (if prese=
nt) to
> the port devices we instantiate. The rest can be handled elsewhere.
>
> Chen-Yu: correct me if I'm wrong.

The above, plus adding pwrseq_get(), pwrseq_power_on(), pwrseq_power_off()
calls to the appropriate places in the hub driver.


ChenYu

