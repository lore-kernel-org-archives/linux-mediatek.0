Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A45C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=avPRhaqVHvgZmZ8GBsQ+20zIBPkvVr2QT+2++f0G4/A=; b=xG8Jm8t2idMV4oscJaPjhncfU3
	iWFK7gtV2Ysur/iJjLZaDylbtAi/KxMx66gO85svDzkUrggysISkCiWY675GJSi2iLENPpZ9vR1kZ
	T/sllTUDuOBGErTIZc/cXC5H1X4O5MoqzNgWRwDYXJ6zCaqPi/iqvHII2AwbNADBUxxr4wFifkK/M
	DT0skhT+zIYMhbI9Q8R3yEqERaSDf7a6rAs+BlmfUPd09S6HVYFaLgkfKm7XrWUNfJn7j55DXKTOb
	kDd6EDq22bWRCkEtqH4aXZP8pTsS+F3PfPEH8GIPcELixg7tHGlXmQc9tckflhv5yfnSdkQaQpF86
	pA6V15WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtP-00FX0I-G7; Fri, 14 Oct 2022 17:54:43 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtM-00FWzL-56; Fri, 14 Oct 2022 17:54:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id l1so5396127pld.13;
        Fri, 14 Oct 2022 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avPRhaqVHvgZmZ8GBsQ+20zIBPkvVr2QT+2++f0G4/A=;
        b=kZhR7KCRXJWnF12BPar5TJ6Jp7jOQu5oh+cHmvhzLyF05zeCaifFNhGK2RV9jJxsw7
         VimZgYTfdukHBQwvv7OanK1IwigLv/d+xhi0TP3zAwnVA6N9Pky4WjZPRXan0Z3MsufV
         QghtZKG+k2mOjGl0Vg0S/t1x77BZevIUhmuxGLeSWD54IdegSklXCjVAKnkT2Oo/lxWy
         2oWrH07lFCfFz6RCEuX6Jkpdeh2zLOt+eRMKV+TxgFflN6h9xcTnhT+iZgpDyxPmGITV
         pgq28asdkYqtuLzYBAHXMMVsZ9e6VVSZGlgtf3K/gA4Or5CvN8E9zKThvuSlj1BcZEgG
         QOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avPRhaqVHvgZmZ8GBsQ+20zIBPkvVr2QT+2++f0G4/A=;
        b=DUmOB2j2ImnjPexOZznKpVHb+Gkd22zFfwO/MF/w2crOKlRPnOcXFfCRHVdnfPGzdx
         U/u71i3TwjWkgP2Y+6oFD1sQ50zXcjSd5TK/VSDUN9+hgwTTOCBafPqTlIuOZXkKs4gw
         xQbnoZiq/qy0hBmyZ2EDKDFRoYJTZDrZO1OINYX+LhRv+t7ThH/7Gobum+T62Lutkxgu
         IfTXuWU5jUA+Uu6Qj+/tMZmdjc2b9ooDAJ1vt86so2KgwIVb35mBnEh1ZHDRtalugUyb
         hmHr/Vx3l1lq+c65nfIdg7SQdNGbPwRlsfLTP7Y1uQONVAPNHPdDliYDtOr+g0h4XxDb
         486w==
X-Gm-Message-State: ACrzQf0L1T/6awVp9THHGlQw+nIvY233jfxMPjsjE96RGK/qt0GfwCIH
	X3Vv9umwgSiOL7nI2y4/jcc=
X-Google-Smtp-Source: AMsMyM5Hzc4Cp+r46/Ag2/jYccuv+/04FsvP087ujnP8b9BZmiBEMZsSts2Cbd5GXI0ayAon/amZ9w==
X-Received: by 2002:a17:90b:3c8f:b0:20d:959b:26f4 with SMTP id pv15-20020a17090b3c8f00b0020d959b26f4mr7161668pjb.104.1665770077786;
        Fri, 14 Oct 2022 10:54:37 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/9] gpiolib: more quirks to handle legacy names
Date: Fri, 14 Oct 2022 10:54:24 -0700
Message-Id: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105440_252870_47DC48C6 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>=0D
Cc: Daniel Thompson <daniel.thompson@linaro.org>=0D
Cc: linux-gpio@vger.kernel.org=0D
Cc: linux-kernel@vger.kernel.org=0D
Cc: linux-arm-kernel@lists.infradead.org=0D
Cc: linux-mediatek@lists.infradead.org=0D
=0D
---=0D
Changes in v2:=0D
- fixed 'fsl,imx8mq-fec' & 'fsl,imx8qm-fec' compatibles issue noticed=0D
  by Alexander Stein=0D
- implemented Daniel Thompson's suggestion on tightening configs=0D
  selecting renaming quirks and added a comment to discourage adding=0D
  rename quirks without checks for specific compatible(s) =0D
- added a polarity quirk for Himax LCDs=0D
- collected reviewed-by tags=0D
- Link to v1: https://lore.kernel.org/r/20221011-gpiolib-quirks-v1-0-e01d9d=
3e7b29@gmail.com=0D
=0D
---=0D
Dmitry Torokhov (9):=0D
      gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448=
=0D
      gpiolib: of: consolidate simple renames into a single quirk=0D
      gpiolib: of: tighten selection of gpio renaming quirks=0D
      gpiolib: of: add quirk for locating reset lines with legacy bindings=
=0D
      gpiolib: of: add a quirk for reset line for Marvell NFC controller=0D
      gpiolib: of: add a quirk for reset line for Cirrus CS42L56 codec=0D
      gpiolib: of: factor out code overriding gpio line polarity=0D
      gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet=
=0D
      gpiolib: of: add a quirk for reset line polarity for Himax LCDs=0D
=0D
 drivers/gpio/gpiolib-of.c | 344 ++++++++++++++++++++++++++++++------------=
----=0D
 1 file changed, 222 insertions(+), 122 deletions(-)=0D
---=0D
base-commit: cd9fd78f5c11b5e165d9317ef11e613f4aef4dd1=0D
change-id: 20221011-gpiolib-quirks-d452ed31d24e=0D
=0D
Best regards,=0D
Dmitry=0D
=0D

