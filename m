Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E67ED6ACCA
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2024 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pJ4f5/AA0Na3QRUimWC4sZ6Mc3cd4bD928BKUzVBg8=; b=cUIdvRAEqlUJB8nPg76OIEA3a7
	EOzxnz1NSkJMN2UyPqPv9h2tqNzB5mq70qZqlp9s1bMvDQ68V7pzUIxO0QOLeC43thsvjazF5xQT2
	FOPeHX1c7zEL01ga9UE3f8TWgJ+PQ78hKdkP6f5ec7MdKzJXjhWAmsB6x5kDQpsUEbnD6uJDPnWwa
	94Z2f4C1br9zxgzLMmpUDU5hmegF1Khe41THdFvVOKE6qtivvd4gJKqc0e9ao7GbTapiDXwj5tPgq
	0/m6FM0ypXhU8hF4GrNb8Zz7KTu6D4b7pq6dtFoHuAIcuHwEUvwvcRP4Fj0HWWcOQSX9Qyx/eHUXi
	1YW9i6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHpD-0000000DCrN-0mkv;
	Wed, 27 Nov 2024 13:11:23 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHpA-0000000DCqV-3UBE
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 13:11:22 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e3882273bdfso7128377276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Nov 2024 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732713079; x=1733317879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pJ4f5/AA0Na3QRUimWC4sZ6Mc3cd4bD928BKUzVBg8=;
        b=Z+6zxDnk3P0XIjUBuh7ChTz9+5bV8ETw8hwg6mmQlFqcc9ogrlvV9Dk4p84VLdfXUx
         hUSJgbG2VkQOysQQelEemPU/YB2LTKhzNebUL6EajD6Fe7FJ/w3k0uXsWPVWn4uWsxvY
         SmjiGWhILizPXpGEgvlSyYrsT53EVZDhtvo3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713079; x=1733317879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pJ4f5/AA0Na3QRUimWC4sZ6Mc3cd4bD928BKUzVBg8=;
        b=wAFerykIQ5NjxM84tXDxLBUfcXuVtVQg30eVBFYrIQGFwypHPznPNg4t4kdIysdm4O
         GeL9rJkfMfUZ3QKIia+OL6x5gvsU0AYiaFDdOd1GZhHpxl+Xqy9vX/ZgaaroyNWcasSP
         vb6t7Qsrg7N4NoA//dA/JLuM1GHBHqPKwKMUXsQxDCKXBDFFDZUY4o+tQ1vQuzf/Nw/e
         LOv3wcb968QD0WBcEJ/wDaKwG8118wAbsDXY/fJf955YlSGLTxZW2RkwH24GgtympcF0
         GX/GUlkjimDnMOyXRtC3H2BUoZYaMwFBMi1ankN9UnL0/qWSKCDU0FJDk5qjAwIHeBK9
         XD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsdkD9uMIxi3AbcZ4MIYGJX/Q5mX70ySzBt7dVU4f9k8O0a40sy91OLPHefnIBGAUW8hUSqoaEzdfx0vxSXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy11CIuC49B6UepRvsgATzuP+08SBNb1ZQprlQsc3lrEwV2QruR
	hpLR9qFEKlSMsivAoBWAIj0sDA3pQWG3M5GEPSjtNjtAgudLhklJUvxod0ge55q3ugMat7/xvAR
	DMy1DfihboAELweC7F5URr+KmxAaWrQqSOQkY
X-Gm-Gg: ASbGncvgboU04sbhOuKreOdD4uYW5CvpksiazGHasUDhD2qr6dNI27p2EXb7Y9X29wE
	6Uyva13IcR+RYtMfOUBw3BlJYs1MXcdV6
X-Google-Smtp-Source: AGHT+IGHme/L5ioql1/e+CfRbka6xoxAYc90GtctpaIvtM30KbIeIU6v/mBHT7nNurKZ5GDi7Le2AMYnuUIp2KUuv5k=
X-Received: by 2002:a05:6902:cc5:b0:e2b:d3da:46c8 with SMTP id
 3f1490d57ef6-e395b93642dmr2466586276.37.1732713078836; Wed, 27 Nov 2024
 05:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20241126103632.419469-1-wmacek@chromium.org> <20241126103632.419469-3-wmacek@chromium.org>
 <473283aa-fc84-4b3f-93bc-653c9d83c837@collabora.com>
In-Reply-To: <473283aa-fc84-4b3f-93bc-653c9d83c837@collabora.com>
From: Wojciech Macek <wmacek@chromium.org>
Date: Wed, 27 Nov 2024 14:11:06 +0100
Message-ID: <CAJrw_jmqfPaOsoT1pneoFuUg9ws1CsDgy3YdqWPE5SoK7Lrv+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8186: Add Starmie device
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_051120_869082_C4C96B3E 
X-CRM114-Status: GOOD (  19.16  )
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

On Tue, Nov 26, 2024 at 12:35=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/11/24 11:36, Wojciech Macek ha scritto:
> > Add support for Starmie Chromebooks.
> >
> > Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> > ---
> > Changelog v3-v2:
> >   - Cleaned up DTS
> >     - Re-using dsi_out node
> >     - Removed unnecessary delete-nodes
> >     - Moved touchpads to per-board dts
> >     - Modified 3.3/6V power regulator node
> > Changelog v2-v1:
> >   - No changes
> >   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
> >   .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
> >   .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
> >   .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 +++++++++++++++++=
+
> >   4 files changed, 529 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmi=
e-sku0.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmi=
e-sku1.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmi=
e.dtsi
> >
>
> ..snip..
> > +/*
> > + * Battery on Starmie is using a different address than default.
> > + */
> > +&battery {
>
> I didn't ask you to do it this way, and that was for a good reason.
>
> Besides, you haven't run dtbs_check before sending this.
> Give it a go and you'll see why.
>
> Regards,
> Angelo

I'll update patches tomorrow once I get my Starmie back.
Meanwhile, to limit unnecessary turnarounds, I think I'd like to leave
the /delete-node/ for battery. In case status=3Ddisabled is used we
still would end up with the "battery" alias pointing to the old node.
That might be very misleading if someone ever tries to access battery
node using &battery link. Something like below.

 /*
  * Battery on Starmie is using a different address than default.
  * Remove old node to avoid "battery" alias pointing to disabled
  * node.
  */
/delete-node/ &battery;
&i2c_tunnel {
        battery: sbs-battery@f {
                compatible =3D "sbs,sbs-battery";
                reg =3D <0xf>;
                sbs,i2c-retry-count =3D <2>;
                sbs,poll-retry-count =3D <1>;
        };
};

Please let me know if you're OK with that.

Thanks,
Wojtek

>
> > +     reg =3D <0xf>;
> > +};
>

