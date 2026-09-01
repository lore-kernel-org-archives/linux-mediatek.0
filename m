Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC94C624D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UllhrlLmOAfFzPyIojyQGGCMu83Ko6IwJv3zmf06mWE=; b=HTY4QtedZ+BE/eUi9SkTIlfb4P
	Dj6FitB8zOhXoxrFz1x/BuQTGkoEReIPI7sGvFVKKaHB76+BcLz595p5wK83mkOQLNoePA2Qb5r4C
	us6yTb1u2jT8qULGBH/2vd55gCyHNq9ZwBAZ8JIVJOtFs2+ijq9znWeQtlEw2OWrDGcTPX8kB/giF
	O4+dJhLjQRweltQI5e8UgoFrWmDnGWrjPSchexxVVnzJRXHPnIdUxbGpAffOfgUxGr/cjvPz/Vdv9
	CG1DhfMV/xOirLNRDX1gqAYa4bRwzQ4kvz8ocm4fMxT/DVLoFcAXAomIeVVBAE3oiUvUj31RQaBBy
	WFCJMLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SA8-0000000CoN8-2hI1;
	Tue, 01 Sep 2026 17:20:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SA7-0000000CoMu-2h4Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 17:20:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A72026025B
	for <linux-mediatek@lists.infradead.org>; Tue,  1 Sep 2026 17:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E41F1F00A3A
	for <linux-mediatek@lists.infradead.org>; Tue,  1 Sep 2026 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283242;
	bh=UllhrlLmOAfFzPyIojyQGGCMu83Ko6IwJv3zmf06mWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PA6xlTOD4sb1TE+o03p94DXGN7bS3pmjOyR/wTCkvrwe4upm85CJS/8J2JmOUCqU4
	 xo+mnCT8Shn+SnVIvf9izZS1YUaMEVL7lWTcQqOveby8vn9wveRkcZWn8e81NPjbB/
	 BBtRHLfbkT13/E1H1ObV5EVKmV9AQ7JJwlfABsmTo5cp0qCcJhQ4rc6PL3SrOusA+T
	 GV31k5TjGaOE8sYdQ2IS30a6V/aQb4pJjiIbesXY8NPd56/jHubg+lP5bBXm78BXkP
	 cPPGzR/V0b4K3604afbpK5i+1Mf/CGK4vxAd3zYiWC8nZOIP4rH1pcTaYGXwmj+6eq
	 4cBJvxyJF0zNQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b5ef26b92dso5191064e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 10:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9GA6qXUAy8vbhtgK0BLlt4Ga196wc44m6CWjiDI5z+d8ddT55tLvcekEviY803sv0/DFxUKpr8nFJtQrxCA==@lists.infradead.org
X-Gm-Message-State: AFuF++lKj5+yNAGzLBCv7DjeMvA2Sd0YbOn37GONPxr+9VpauiwjMXcU
	+NtwquvlYiXxJBEDJZckmLdUz3FhsZV7gYajxQwXW1vBOUPPCcLy1o5mPueJ4mDGOlTm21arFWi
	rSNYbiqKvLr7SgKSEAQAso+pimcFq0U4=
X-Received: by 2002:a05:6512:3416:b0:5b4:86ab:5236 with SMTP id
 2adb3069b0e04-5b6041fd0femr1465397e87.19.1788283240807; Tue, 01 Sep 2026
 10:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787931313.git.naseefkm@gmail.com>
In-Reply-To: <cover.1787931313.git.naseefkm@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 19:20:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnhyfzwGzBfBhvcC-O_h=3_PMXjjW8n7SgGJkd13Fpr0Q@mail.gmail.com>
X-Gm-Features: AcwNN1VqFbxXyBOJuD2XIsoLQW-odLvTK5ffKBS21jFx1QEHMohAQQcQssx2viI
Message-ID: <CAD++jLnhyfzwGzBfBhvcC-O_h=3_PMXjjW8n7SgGJkd13Fpr0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
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

On Fri, Aug 28, 2026 at 5:35=E2=80=AFPM Ahmed Naseef <naseefkm@gmail.com> w=
rote:

> The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPI=
O
> IP as the Airoha SoCs, so it reuses the shared driver code introduced by
> the split into per-SoC drivers. Its register layout differs from every
> existing variant though: all IOMUX mode bits live in a single CHIP SCU
> register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
> enable register, and every pin configuration register is at a different
> offset than on EN7523.
>
> It also differs in a way the shared code did not model: only GPIO0-GPIO15
> are wired to the interrupt controller, while the driver assumed all
> AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
> num_irq_pins field to the per-SoC match data to describe that, bounds the
> interrupt callbacks and handler with it, and feeds it to gpiolib through
> gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
> that can never be an interrupt source. All existing SoCs pass
> AIROHA_NUM_PINS and are unaffected.
>
> Patch 2 documents the binding, patch 3 adds the driver.
>
> The series is based on linux-pinctrl/for-next, as it depends on the
> per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> phandle that landed there.
>
> Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Patches applied.

Ahmed, Benjamin: if you think there is something to Sashikos
hopless ramblings please simply follow up with fixes.

This is one of those cases where I definitely prefer to fix things
in-tree, Sashiko is hampering development with all it's comments.

Yours,
Linus Walleij

