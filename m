Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F714C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LU58/FgjDPCb4/HIjKdV8bVA1BTPcHJFbY4JeAoNkso=; b=He1YMWmva69S16YyE0GmAHfDMt
	BOFvnKkvTzMWct5hHdDhTAVTX/H6ctTvTJgGSMX/YbeiRTcUoseq+CULHJaK6K8AKJuPZ0t3wUG+2
	jAfJcu860pQ9XG+iwdAd1NhGVKle1RTKId3RwZTvqSaYoKDG6WdI/rM61OciNMaXDgiIsahbhFiKW
	9qmylttYGp7b028BSB32Bpl4mwAJvH9q+nHLbEjL6xKJUPqwWyYWC5rEHVjK4++YIpTTa0riBChpg
	E2sSLDOJvC6r16Llz/grGlMWbwcUwKNAabM4XsO0K6kwKRiD5wElRx7Lrdey/5h5fTzdEWqus6+i6
	MmlXZOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbF-0060M9-Ed; Tue, 11 Oct 2022 22:19:45 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbD-0060L5-2U; Tue, 11 Oct 2022 22:19:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y1so7647108pfr.3;
        Tue, 11 Oct 2022 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LU58/FgjDPCb4/HIjKdV8bVA1BTPcHJFbY4JeAoNkso=;
        b=Dda1Fo3vZibxh0267Q/K8n/G26/3vL5nhVEgDWa9oYWXyuyC4vlceQEYklqjoiFI4m
         gslkJAQ7VUfiP6NWf9UdkGkWRRYyRU7Nn+Id5vDYUsqCGLm0SPQxfU1EV+iIPUyq2mWp
         wpsKsVXsWeV9Fg7fGNPWKn2HU/71UeeHZfP3K5CcPvMWx+ccJy2pCEfgszE9AnjWaJAG
         6Ag1CSNBmbwAJK04xIhZlgh6wP6oPLOunmRxgiKCunebfNahGFzRi7iG5VmtPrBRCDER
         MQHZF6v8IpvLGcQdEbNPhM6hIYjSRqq1h4JXSURjSJKnSDh5RHGiD/CqtT9IPFTB8F4D
         h+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU58/FgjDPCb4/HIjKdV8bVA1BTPcHJFbY4JeAoNkso=;
        b=oFxkiq54c0fqvAy0P6Pmdg3cSkoJPFdrrp6lCcTeX96RGgCdxSusZ/36T3nozfz80+
         u39brCy+B0nTLF1L/bTBoU42JWpqIwJB+gA7kWC5ET/IziI7hvOo2cEZircDZ1wkO4UD
         ZrkMaPU9B+gMkV/379FUqt7trQLofK10XlM49SP4nPst646b7xQp6cW6fQseLVDgkeFU
         ShDqVgvqpJY6a74Hp8s86l6UJga3+jO/vmepFoxcRaIwRUgkQ3/l9PB8KV61gLa40+BW
         DgQcVxOmNCI1ZF9uOIk/FmJPG6QXCZC/H3j+Y5K1F9sthybxQK3rqNk4o/3hGXWNHooB
         FuQw==
X-Gm-Message-State: ACrzQf0ZHJ9VIo7VNpeC6Qaz8bqcrFVLGoBRG9ca1a7FvcaMc+/fb0Af
	4tWKxEXtYd60VyUhBuDgK5M=
X-Google-Smtp-Source: AMsMyM60TYBBYpvAQZQVq5swUJ8AxjHR56drU7Zo5/27UWyvFpAAvSntAJdq/H+P2tFIcHRfyOgvxA==
X-Received: by 2002:a63:814a:0:b0:460:9253:bf8e with SMTP id t71-20020a63814a000000b004609253bf8emr15238664pgd.469.1665526779242;
        Tue, 11 Oct 2022 15:19:39 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 0/7] gpiolib: more quirks to handle legacy names
Date: Tue, 11 Oct 2022 15:19:28 -0700
Message-Id: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151943_132832_D7FF3828 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

In preparation to converting several drivers to gpiod API, and to keep=0D
existing DTS working, this series adds additional quirks to locate=0D
gpio lines with legacy names.=0D
=0D
Additionally the quirk handling has been reworked (once again) to pull=0D
all simple renames (ones that do not involve change of indices or other=0D
complex manipulations) into a single quirk with a table containing=0D
transformations. This should make adding new quirks easier.=0D
When using legacy names gpiolib will emit a message to nudge users to=0D
update DTSes (when possible).=0D
=0D
Note that the last patch requires the following change from the OF tree:=0D
=0D
        88269151be67 ("of: base: make of_device_compatible_match() accept c=
onst device node")=0D
=0D
The change is also available in mainline - it has been merged in 6.1=0D
merge window.=0D
=0D
Thanks.=0D
=0D
To: Linus Walleij <linus.walleij@linaro.org>=0D
To: Bartosz Golaszewski <brgl@bgdev.pl>=0D
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>=0D
Cc: Daniel Thompson <daniel.thompson@linaro.org>=0D
Cc: linux-gpio@vger.kernel.org=0D
Cc: linux-kernel@vger.kernel.org=0D
Cc: linux-arm-kernel@lists.infradead.org=0D
Cc: linux-mediatek@lists.infradead.org=0D
=0D
---=0D
Dmitry Torokhov (7):=0D
      gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448=
=0D
      gpiolib: of: consolidate simple renames into a single quirk=0D
      gpiolib: of: add quirk for locating reset lines with legacy bindings=
=0D
      gpiolib: of: add a quirk for reset line for Marvell NFC controller=0D
      gpiolib: of: add a quirk for reset line for Cirrus CS42L56 codec=0D
      gpiolib: of: factor out code overriding gpio line polarity=0D
      gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet=
=0D
=0D
 drivers/gpio/gpiolib-of.c | 294 +++++++++++++++++++++++++++---------------=
----=0D
 1 file changed, 171 insertions(+), 123 deletions(-)=0D
---=0D
base-commit: cd9fd78f5c11b5e165d9317ef11e613f4aef4dd1=0D
change-id: 20221011-gpiolib-quirks-d452ed31d24e=0D
=0D
Best regards,=0D
Dmitry=0D
=0D

