Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4A6CD4F4A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 22:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=; b=uid+VfLbvqZ43p/rn9KTCQ0yni
	uuA7PUAcm/tRP2ZT72Qssy6h9gsvAHr80ueawG+thwou0htS89V2imaMgwSmK8AiHYsRfEhnnDnaF
	Klj/Y8H6hizHHdYAd9LCRwxfcMHEUIu1NiLOA0QBHCxk03W4NhqRcWxvT3Xh0KLWnMItNzI9PN/a6
	eqM44HEX0DpaliyUoBBjPFgTqvFqxfmXeguaQcvUB5sAhExM1Q5pH4DOYmJZZuxU9rBHOWi/ECxHr
	irRKSgoMYDdolcihsqwofYJGEqnvxdTkYvGlSYP1+tx18BfWkaHwQG5/iOfsAzrCs3cXHodedUuVh
	H8TLevIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slywU-00000006Izq-46vD;
	Wed, 04 Sep 2024 22:57:38 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slywR-00000006Iz8-42eK
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 22:57:37 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7a8130906faso11025985a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725490654; x=1726095454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=;
        b=S9JXF0QNMXpEdLpIxLMS8Exd2ijeki/HpYWmwTnrAnrnMXXGQ2X5iCjXCrI+Vl9ijH
         SGilwQMAb06kvS0Vd4/N/yLs1e5cTd/u2O/y+hV5mCTg/iv9/fPFomuXiArhHjb6cmY8
         qIZKo9BX24nUr0NB/inpVqo31ZvmevNhdcDmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490654; x=1726095454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=;
        b=GCQKQi+JotZpZq+imCjUH0dEXtSB51naUZVtgga6GpifYMw6u6v4N8eRMl7d+zHnso
         t4XFoQxFG2c+Y+JitWyeIStKZgFpAZPieDYETAQDvYBX2xtNOTStpytxwjdk9XGOfxYc
         hoMfg4L94NnnvflS6zetn62yUBX9zDY8kzoSVsFT06FdCeaaCh32hParNVyyW8FutNy9
         KUol1Id7qjcAi+zXCG4Fn5setMoG6VjUL6J95N6gs1CHxsm0etirWALn5Ptzcn81B/Dj
         MyHj/zZAMWPTFBmUXyxw2tcS3CTBVUQUqLui1YLZGpNBqVEs9n2Lw1LsMxWDvxQr+RJ/
         hs0g==
X-Forwarded-Encrypted: i=1; AJvYcCVckLz8up4n8J1tlXpzgUnPQPsd8eUcY5Ny9DxQ2cS/7xlLhh58m0o3CLPQNp3UikyJ7M0xDVVHyU9DudYYgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYS3tPaMFijAKAnyigAAhTME0jnSMG5NfqcwldRANgoVTQcK17
	WVDgz7zIQX8oR7D/XIcctNSJDU3UF0GByNVKvwWJ+lP1f02AXAz8P4a2H3GvptXFBe4ERhzx6YI
	=
X-Google-Smtp-Source: AGHT+IF+FnWLAzcDjMM4JmVSM6/SkdrJVwKh7l4GSzPkH8Tjh/V5LvB8zwpR9YABo13TPmtHSC/8rA==
X-Received: by 2002:a05:620a:4090:b0:7a7:f18a:e46f with SMTP id af79cd13be357-7a8ac3ba8camr2033240185a.43.1725490654388;
        Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efed3dasm26382385a.95.2024.09.04.15.57.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-457d46ea04dso970821cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3E9P5KBOQblMzTwYVhxJ71tC4ni2QAuBs6UP86xBLSwfMPxKtTROKp/DZGfWl5YwuRX6H/uSV0fJyPb/OLA==@lists.infradead.org
X-Received: by 2002:a05:6214:3da0:b0:6b7:b277:dd12 with SMTP id
 6a1803df08f44-6c3558475afmr184722756d6.49.1725490653502; Wed, 04 Sep 2024
 15:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
In-Reply-To: <20240904090016.2841572-10-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 15:57:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
Message-ID: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_155736_047593_2ABE8653 
X-CRM114-Status: GOOD (  33.33  )
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

On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> This adds regulator management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
>
> Without specific knowledge of each component's resource names or
> power sequencing requirements, the prober can only enable the
> regulator supplies all at once, and toggle the GPIOs all at once.
> Luckily, reset pins tend to be active low, while enable pins tend to
> be active high, so setting the raw status of all GPIO pins to high
> should work. The wait time before and after resources are enabled
> are collected from existing drivers and device trees.
>
> The prober collects resources from all possible components and enables
> them together, instead of enabling resources and probing each component
> one by one. The latter approach does not provide any boot time benefits
> over simply enabling each component and letting each driver probe
> sequentially.
>
> The prober will also deduplicate the resources, since on a component
> swap out or co-layout design, the resources are always the same.
> While duplicate regulator supplies won't cause much issue, shared
> GPIOs don't work reliably, especially with other drivers. For the
> same reason, the prober will release the GPIOs before the successfully
> probed component is actually enabled.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Split of_regulator_bulk_get_all() return value check and explain
>   "ret =3D=3D 0" case
> - Switched to of_get_next_child_with_prefix_scoped() where applicable
> - Used krealloc_array() instead of directly calculating size
> - copy whole regulator array in one memcpy() call
> - Drop "0" from struct zeroing initializer
> - Split out regulator helper from i2c_of_probe_enable_res() to keep
>   code cleaner when combined with the next patch
> - Added options for customizing power sequencing delay
> - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
> - Add i2c_of_probe_free_regulator() helper
>
> Changes since v4:
> - Split out GPIO handling to separate patch
> - Rewrote using of_regulator_bulk_get_all()
> - Replaced "regulators" with "regulator supplies" in debug messages
>
> Changes since v3:
> - New patch
>
> This change is kept as a separate patch for now since the changes are
> quite numerous.
> ---
>  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++--
>  include/linux/i2c.h              |  10 +-
>  2 files changed, 155 insertions(+), 9 deletions(-)

I never jumped back into looking at this since you started sending new
versions last month (sorry), but I finally did...

At a high level, I have to say I'm not really a fan of the "reach into
all of the devices, jam their regulators on, force their GPIOs high,
and hope for the best" approach. It just feels like it's going to
break at the first bit of slightly different hardware and cause power
sequence violations left and right. If nothing else, regulators often
need delays between when one regulator is enabled and the next. There
may also be complex relationships between regulators and GPIOs, GPIOs,
GPIOs that need to be low, or even GPIO "toggle sequences" (power on
rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
rail 2).

IMO the only way to make this reliable is to have this stuff be much
less automatic and much more driven by the board.

I think that, in general, before the board prober checks i2c address
then the prober should be in charge of setting up pinctrl and turning
on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
may be specified by different children, the prober will just have to
pick one child to find those resources. It should have enough
board-specific knowledge to make this choice. Then the prober should
turn them on via a board-specific power-on sequence that's known to
work for all the children. Then it should start probing.

I think there can still be plenty of common helper functions that the
board-specific prober can leverage, but overall I'd expect the actual
power-on and power-off code to be board-specific.

If many boards have in common that we need to turn on exactly one
regulator + one GPIO, or just one regulator, or whatever then having a
helper function that handles these cases is fine. ...but it should be
one of many choices that a board proper could use and not the only
one.

-Doug

