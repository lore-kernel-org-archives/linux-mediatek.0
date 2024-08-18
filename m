Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083C3C5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uf9ybAkd2LS8fUBYd8Lu828Q3AdDP0nqtGsXfOMW14=; b=TeskyVE6Zti0jaikhbnD3TJhVT
	PtuXIsR9KP8VLuvk9IZiFH//5wBr/HKhoKNTqyKPlSKOrlKc7z5IK/STJosw+aNLiU+3t53xYh9f2
	+5JR+i3w0WIukY1UpvCECJnwdhHaxj8PcQEOzVZKpSOKD4hwxixZfuCXYLyPqhEnouvvpVS9H2cOb
	Q42YHy4gTAcX4Z0C/gtlqD+vqdEh1e2UVVti0qePAhSkUDIX2vdTMWtBC82gD9uh0LB5C/pdeyODH
	YGOibwpYM92MbKk/1AScsFCfR0fPrZRS23Tdd9ONGTAVlOQFWwmbHmrbuCOCC8/VgXE3v6AIuFeuV
	nrtgnDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiPz-0000000GnT1-1Int;
	Sun, 18 Aug 2024 16:06:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiPu-0000000GnRf-05io;
	Sun, 18 Aug 2024 16:06:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so27267875e9.2;
        Sun, 18 Aug 2024 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723997164; x=1724601964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9uf9ybAkd2LS8fUBYd8Lu828Q3AdDP0nqtGsXfOMW14=;
        b=CzSXEftbI3si2kOWudbaa2NRo5TetJKsbgcQVCUYoiqqetO5u0XglLjOqwlCS251k5
         Mzap78dZVR1U/CGyZ1qXqlRQiOknAAwek+VC2qS1d0L0Us39p/bj9GuLRGIbTyzSJgYX
         Q1hLcSzj8lJ2xQxE14cq2KcU7oTCwKvBIAUfbRxUnJ6UDy8QAdjGzBxu71OQkPCTXi2R
         8mxm6YD69UzgA4OMTQbotWJHWedPWSUHGtMRRNNOzkSYleLgmVBU0kVpZR/kFCsNkbEX
         lYyLcZYxMXGWEA41S5y7529xJ82FL3ZN4bcOUSda+sHKsyQjZdls1RDY+fsm67/FTF50
         3//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723997164; x=1724601964;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uf9ybAkd2LS8fUBYd8Lu828Q3AdDP0nqtGsXfOMW14=;
        b=HZBFpt3sCekkL7Q+qfMgOp++R74pJp2XUlL/jiBnN8EZbwjknkIGtpfyvxftXEkI69
         Y4UrYdvCjBKZnwFK+pOk46HqGBIiqJIEpCIWU68rqWsCQHXoQf0j1Sxg7NtQWwG9m4GE
         cckw8mmvaxlkx1QcJ9qf58gX6kYcw7X9/WSZfotGMlz74mV646DRGJQZOg5i464RRKP3
         ClBeCj9gQj1lSrsziv01WYgkHKKCaiDG67Nb0TNGPN0F70oy26XPXQUHi4RGkh0GyTpo
         1qUohcrFPpkWmIhTYNq7B1td2IzDiGfjpsZQBE5/uaItuq86REpUX2yR90jzTvRoBbkP
         6rag==
X-Forwarded-Encrypted: i=1; AJvYcCXqodNaxCHgYJZe6nKUe3FBV2f1q1YI/yPryGpOpIkXoS28IUn8bN1GCg0psoUp/P3eS2W6alJUZifiMl2FjH4PpSyXWhzC3i5A8F7D3RzH3yEIBvigzYJI2FFphY+nOvm0kxKlWYwIzJ7zbNgSZ7+5Qm1EWQRGkmM=
X-Gm-Message-State: AOJu0Yxwz1PnOs5DiyHbtiYaM3bBLDa5sEYxtpNU9zp4KBhZj7A8T8RK
	Cq9SSW3JKCZD2aZbiwJ67/xtz1bM6SM01Yrp3TpYhIyf8IADc9VO
X-Google-Smtp-Source: AGHT+IGgPlNsfcN1LNMf0WwO+CHJcYD87ZYBeRC5EFBOgLJ+FKLc4rIeKV5tr9T9gyTFiIB+WuPWOg==
X-Received: by 2002:a05:600c:3c9e:b0:428:1e8c:ff75 with SMTP id 5b1f17b1804b1-429ed7e2306mr53474745e9.35.1723997163447;
        Sun, 18 Aug 2024 09:06:03 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-47-255-50.retail.telecomitalia.it. [79.47.255.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ac074sm8334097f8f.106.2024.08.18.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 09:06:01 -0700 (PDT)
Message-ID: <66c21be9.5d0a0220.2350c8.75dd@mx.google.com>
X-Google-Original-Message-ID: <ZsIWToQY5P-vaXzP@Ansuel-XPS.>
Date: Sun, 18 Aug 2024 17:42:06 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_090606_085542_5F586DA1 
X-CRM114-Status: GOOD (  23.14  )
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

On Sun, Aug 18, 2024 at 06:02:28PM +0200, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 02:48:05PM +0200, Benjamin Larsson wrote:
> > On 17/08/2024 23:39, Andrew Lunn wrote:
> > > How messy are the GPIO and PWM registers? Are there N blocks of
> > > independent GPIO registers? and M blocks of independent PWM registers?
> > > By that, does one block of GPIO registers contain all you need for one
> > > GPIO controller? One block of PWM registers give you all you need for
> > > one PWM controller? Or are the registers for one GPIO controller
> > > scattered all over the place?
> > > 
> > > Could you point at a public datasheet?
> > > 
> > >        Andrew
> > > 
> > Hi, per my understanding there is no public datasheet/register reference
> > manual.
> > 
> > But here is the division of regions of the registers in the gpio block and
> > how it is currently divided between the drivers (according to my current
> > understanding).
> > 
> > 1FBF0200, gpio/pinctrl
> > 1FBF0204, gpio/pinctrl
> > 1FBF0208, gpio/pinctrl
> > 1FBF020C, gpio/pinctrl
> > 1FBF0210, gpio/pinctrl
> > 1FBF0214, gpio/pinctrl
> 
> A typical SoC has multiple instances of a GPIO controller. Each GPIO
> controller typically has 4 or 5 registers: In, Out, Direction,
> Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
> contiguous, you could have one DT node per controller, rather than one
> node for all GPIO controllers.
> 
> If the hardware designer has really messed up and fully interleaved
> GPIO and PWM, it might be better to have an MFD. The MFD node has a
> single reg covering the entire range. The MFD would then map the whole
> range, and provide accessors to the child devices. Hard code the
> knowledge of what registers are where. Given how badly the hardware is
> designed, it is unlikely it will get reused in the future, so there is
> no point putting lots of stuff into DT. Hard code it.
>

Problem is that the MFD will also affect other stuff like watchdog...
thermal sensor/monitor, clocks... They really messed and put in that
range all kind of stuff so we would end up in a very big mapped range
and lots of child for the MFD.

-- 
	Ansuel

