Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3CAC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYuy1LD8bWujUTSaX1+mmd0Ol6dxdh+UWPikKfhDyxQ=; b=2cnKlt/XSgK3kfOG5LM85aY9B+
	K6FWMyEaWp/RGp9ZCG1U6O7JjpWAKh9zLxDHmqaqMrLdRdLWnuul7KYsbSDgzMtvTUC/EZ9t3ZT/X
	POGKbBhI95/4R0A1wYnobacNG72jRr3k0aXJryx5s4w0rjrveFu0vaF/aE+6JI7mVaMA8SPbKE3B+
	qn7faXTqt748Swj5hc4EYuaFwUvnscRiRTbnBHzodLRm0zwmO7ochWMyOoCWvx0x+ECSADMx+tHE5
	hrezGsVaDafcoG4QRIR1772EX5Fj52yxosl/rqWcT4xRhzrPW2TFR8qqNrmYaZJm6/GP7bm93ScYC
	xBujmWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Vo0-002Kqd-1f;
	Fri, 26 May 2023 11:40:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Vnu-002KmR-0d;
	Fri, 26 May 2023 11:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685101219; x=1716637219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lYuy1LD8bWujUTSaX1+mmd0Ol6dxdh+UWPikKfhDyxQ=;
  b=cxO2qc/2D6UcqcwgT0SVsxV1omQWEFOUfN5hMPhwiRjCEBWfHkJSu0aa
   G/VU/gIgF1+UcBxc0YrVnH6c3VQ/jG8H5bhL6t6syMGBO8hUU8lA6D0vl
   q17JXghAgQGmc3NFfmOVTP/Av/z52fhNdNPi1CFMqlVYHTAB9Fh8WJf0t
   H4R045ojD2GigyABLjBr3VODqfmsf0aS+P4Z11pBOqr0h5rjkmBKPau2A
   V30uMViRSfr/G78xgsJv9cFCfL+GN4xGY5AUEdTnSlg3KltooC2lz1esr
   JwgbUfeWGUrMDAJOm2aWdbsnSccpeHXeBlBC1/Ev36Ec1Qe7yhOhkZOwe
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="asc'?scan'208";a="215607885"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 04:40:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 04:40:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 04:40:00 -0700
Date: Fri, 26 May 2023 12:39:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
CC: Conor Dooley <conor@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
Message-ID: <20230526-acorn-unwound-34816283b187@wendy>
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
 <20230525-snuggle-twine-ed1bfc2aee51@spud>
 <c1e706f3-9d80-3dd5-eeab-c24830f9ef03@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ia81GYyjYwkAUf9K"
Content-Disposition: inline
In-Reply-To: <c1e706f3-9d80-3dd5-eeab-c24830f9ef03@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_044018_245515_BE9A56F3 
X-CRM114-Status: GOOD (  32.01  )
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

--ia81GYyjYwkAUf9K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 10:54:04AM +0200, Alexandre Mergnat wrote:
> On 25/05/2023 19:51, Conor Dooley wrote:
> > On Thu, May 25, 2023 at 04:50:27PM +0200, Alexandre Mergnat wrote:
> > > The =E2=80=9Cmcu_pm_bclk_ck_cg=E2=80=9D clock is used by co-processor=
s and should not be
> > > added to the kernel driver, otherwise the CPU just halt and the board=
 is
> > > rebooted by the wathdog.
> > >=20
> > > Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
> > > re-shuffling index and then preserve the ABI.
> >=20
> > How does this preserve the ABI exactly? Please describe exactly what you
> > mean by that.
>=20
> I mean that reduce the impact of the change compared to the v1 where I've
> changed the index of the following defines to be clean.

Oh, you can't do that at all as you probably discovered!

> > Also, what about any other users of these definitions, outside of Linux?
>=20
> The clock driver and bindings are only a couple of kernel versions old, I=
'm
> pretty sure no one is using it.

Pretty sure, or sure?

> Also, if someone use CLK_IFR_MCU_PM_BK
> define, I'm wondering how his CPU is working since Mediatek told me that
> shouldn't be used, and after some try, I confirm.

Maybe that person is actually using the index to make sure that the
clock at that index is left untouched.

> I've a question: If something is wrong in the binding, you don't fix it to
> avoid ABI change ?

I don't quite get what you mean by "wrong". These header files just
define a set of arbitrary meanings, since the clock numbers are really
just something that developers came up with rather than being lifted
=66rom a TRM. They don't prescribe behaviour for each of these clocks, or
that these clocks should actually be used - just a simple "this number
means this clock".
It sounds more like a driver or devicetree is _using_ the number
incorrectly, but that does not make the binding wrong :)

> TBH, I just try to clean the binding. I can fix the driver index issue
> (patch 2/2) without fixing the binding if you prefer. But IMHO, keep an
> unusable define isn't great...

I, at least, would prefer that.

Thanks,
Conor.

--ia81GYyjYwkAUf9K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHCaeQAKCRB4tDGHoIJi
0ljiAQDW7cAtkJiUVftFCHctuq0rAX7Y8PATQhIkWAgesm/55QEAgD3TxCEUtXrf
7eREpLfSvnpwJMHbf49qtnOj7Rw29gQ=
=PFKY
-----END PGP SIGNATURE-----

--ia81GYyjYwkAUf9K--

