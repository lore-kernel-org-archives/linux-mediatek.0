Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0423CD5BD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xgiU7UHk0fyH8OtVpuJExgRt0VbjZpUEjJ/frbR0FA=; b=0GQPvoXtSFtbn3ULf8GAL0AquN
	QOTPRCs/mQAaUCK/S05wn3OwTQ+NFtXusHtSqb9QINeEx/cKuGZelD7Z/fYBmd3UX27U6QexETojC
	wAy0lh97yANYqi/C1+QW6ZddU/WqYOJj6W3olDwhEHOIuXPkiwTGKB4vA4MuLu4v+4xuQ1MEXfhrA
	JX0MBz7kAEzFZkwY4nFIah0MOe6ZEEPqY2BkpfPXaPhcmG/LF0YA9ibbUqKposVdtL3ei9IxxE1rl
	Whf6V6caRXCulwH69niQLDN/XLp7RNa3o5vySRcGH9ARh7UkVu2dPRmbeY53w3Knfe7k9Hl5zcUjw
	VyswepIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoOW-00000001ZHo-3MGN;
	Tue, 26 May 2026 09:48:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoOW-00000001ZHK-0G6g
	for linux-mediatek@lists.infradead.org;
	Tue, 26 May 2026 09:48:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4529F600B0
	for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 09:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10A81F00ACF
	for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788895;
	bh=6xgiU7UHk0fyH8OtVpuJExgRt0VbjZpUEjJ/frbR0FA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NVZlTsys9BWdtHzTDLDn5rfEhTbtLxyyJGzF9yhWAnDRt41GZGQkchM1KVUs4BE+V
	 1ZfotqeJQVRfUIDBM6RJ2k1gVu2eBPsu9O+FeP6SXfWF/fNjDthrrS7mHTkNCjm0tu
	 z8lXLoRuCz3oM81VIG4KNypW0wZMBD+C0W5bBLTTQrUkpCxFSnVeLs5s6QmfusqyrK
	 2DZ+l73jxUWSahhHCjeNnze7jpJ4/4lfxQqN/demRkAnfOOJj/aQiLbtdK7j/e7uRU
	 bs0KQ9vbAJ0Tk2r4RTaxzHBYygw2z2HFkI95yphzgxLV8SHOsGkb3Hm9fXVZm2Odf1
	 r7Hx6MJKvNEGw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-392445f11c5so105831721fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 02:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+gI+r2JjbIVP/OgSuywpfmfcaOioJubyl3wDRr5q61cA/dsQbsc9k0VcFnoQY4btAbs3jtdThRBPD7kJyMZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPx3BgN6K7SLJ27leddM+S0AcdVoLfpy3SHCijXf43VG0XJDjf
	ljejNM8HTiSLykh+TzC+Rxa1iSX4p8wefWQNg6q85vwMT/Re1pzNo5aTQoTkj4PJ7HHwJkJFkfd
	6wsEijLWgYIkJ3kQke7YWKsGKn3lwcMiHXy41LVbkhg==
X-Received: by 2002:a05:651c:20cd:20b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-395ca1c8679mr43054031fa.7.1779788893678; Tue, 26 May 2026
 02:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
In-Reply-To: <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 11:48:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
X-Gm-Features: AVHnY4JnWCndh1h2w4rgycQThCJN5e2R-74Cpg5S6rpAEGBFVHeaeEFDCnabd1Q
Message-ID: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> > >
> > > I expect some discussion on this patch, because a) it adds some
> > > OF-specific code into an otherwise generic (core) driver, and
> > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up power=
ing
> > > on the port twice, which negates the port reset part.
> > >
> >
> > I understand that you do this because the port device has no OF node
> > assigned. If we wanted to call pwrseq_get() for the port device, is
> > there really no other way to associate it with the correct pwrseq
> > provider?
>
> I suppose we could tie the "port@X" node to the usb port device, but
> AFAIK no other subsystem does this so we would be introducing a new
> pattern.
>
> In the M.2 pwrseq driver, we would have to match by port node instead
> of its parent device node. We may end up with different behavior for
> the USB target vs the other targets.
>

I imagine, we can check the bus type of the parent device to know if
this is USB?

> Also, the "port@X" nodes only exist for the OF graph connections to
> connectors and/or muxes (this series doesn't deal with the latter).
> For directly connected devices, there is a "device@X" child node
> directly under the USB hub node. That node is what gets tied to the
> the USB device.
>

Is this a problem? I don't think I understand what you're saying here.

Bart

