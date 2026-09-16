Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF3CC88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 04:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=; b=yLZ1ijVTIyx1mf
	KRtWYKulb+lS5jaNbIvoj2NHX8cXOEARGa0Q6D2l3ek2SLDARY/YnkizA+/We1A3E/jpQz2sOlaob
	Lj0Txlzla7zZSv2AX5Yl0ipTCZnTWSLFO3zrrUyPQtU1mwhq/t8CelbWYnuGbM05BuP3HnzxEg/4S
	rc/k2MzpfKgElIHlJtryr3/Ls0ba8UBw+ikKV8lacainek8owyo3T2MGvJdbOYbCilrJwuQeWdqSi
	NXwYxVdjMv3as3rB0ZJ2Cvs4JV6SDsfhjezMu30ap5hPQSzhrn66pzdep3V/O+xrb33U1JdwyT/D1
	o/TI7HqQQJqbjrWMIbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3W-00000008I0N-1Wq4;
	Wed, 16 Sep 2026 04:15:34 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3T-00000008HyF-06kg
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 04:15:32 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-7f9cc0e524aso1743486a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532129; x=1790136929; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=fvGisQT+Rrt15Kyv93vgvdOWdeYxxO/n2l4f0mekJx/dzUrGfwRUN6qiEwEQetrEaf
         6Nlh3y36PHeofK3Jjg73l+AMYyKcB0MeNscxSamncKFstX+I0JwRY+TLywHm3BMihmRt
         B60h7CT10gotUKGgWIxFK8N01YCzWrzl5ExzFQrUfwfwjwDyiynIg3yyaFX9/P7oyOd1
         9k9MxWMlb0kWP0tjjkFVOecj/rQXaRGim+pHjAtZbgljKbwOUw4tbHn/f+XIouN4HjCw
         XqCOEB/k5NFUDpfqG3vEGO8VXRmJOxz5Zb+0JwerquMtD08P+Eooxv4/B38+Z7C11q5R
         ofHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532129; x=1790136929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=SrMB0FNFP1IdadrEdOcLet9DoOkmnWkBGp4TsSSkUxtg3CJ1n+hmiqmZyOWjUlPuAW
         VZoPoZ8AFMAsbR8r5uoYgcFp/IgwLNTk/XtRsdiNV3/0qCvb0q+ZqVGAEH5PsATFwKcc
         nB7DH2WeE0FE8izdVg1HkRfGo6eFMEg1PfKyKwHgR/+xo0QVSZaVgEUZ3YtbisJLS6D5
         nzosAkLELJNs7cWGBfxVuzpaH8Yh7R5f2uUrr7bqdgEgHLrDLHAeBS7T6h95XP7CYHdL
         mekDvaPr1pm/JK0dktlyKehnV5dhzV4luC1qHDQ11n5eYuvz/ip6Pa8GOnfUN4dn3IC5
         m4YA==
X-Forwarded-Encrypted: i=1; AKwUvBxZWYpNxqKfbodrOP2bq7DBtQ48/7D1DapTEmocuSEj5xLydd69mpY/g0AmZaAzFTG6AqnFsfzNP4kzSvlKDQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nhFYkSpDRXQZ52r+y2xrtWpDE2doqK70HTKw3lR4waF/CoVkGG
	ev619l3pKtA7ooSyRFTrP8IGoMvoqHYq+bCDbtFUFR4BlTonNkjC97YW
X-Gm-Gg: AYBFou1ES2wsV8Ibzy7F/nwlDteLMVfQoRHyzR6ilvGvxdCcdOiASEy3Vy4FcvvU8fu
	JbOpeBABtEYaGZkIHUbEuKf0V0jc9lNt6mbgrf+CY5GUN496+UpEmJho6nv96I+/z/SLqgypwQQ
	htMlMKxSEhje0Z6LPyGa+rbxeKTK8vrmxX5+ScgcSR+Nulld6wiz+ZYTGzirabOWiorV8plgGO4
	fiy1w7jXp3/c/7zGQXDBvt0TRy+zmkTuYEIeIllP7ioXbA3ZFDXSTUxkHtD5KJ/z63KRqCPvcEB
	C+NDJtNB1Y2uaCQHS8YoUm11aiU4+jVihLcPquIWZrRVfUb58KvOIh63CKbgY9zgnhrXElO7PmP
	rxc39CZ43gWuv3Wld9wtNsJxD5kX9HuLQSacG2AcWSTlUDYyp5QhUO5650tmGmPH79zXQjWOTKi
	ft6U85WetMtm9hquYTkcLHRRfZj2JHKzDw3lHb0/JH2PrUObk4d/KAwafPGk2eKEc3L5BCftzjN
	LTnCw==
X-Received: by 2002:a05:6830:6af7:b0:7f4:eb7e:c8f7 with SMTP id 46e09a7af769-80b2c18158cmr1482766a34.5.1789532129476;
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Date: Tue, 15 Sep 2026 23:15:25 -0500
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQ6CMAyA4VchPdtkqw7FVzEe5ijYA5O0zBAJ7
 +7C8bv8/wbGKmxwbzZQ/orJJ1f4UwPpHfPIKH01kKPWdf6C+tLCaIV/WGZblOMkecRpac/dFWN
 ZY58wsCe6OQopOKipWXmQ9dg8nvv+B56DRSV2AAAA
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=3814;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1ZhvOrKcGislD+WC+8Q4vWu5z8pTpCo7Q/Gsjhr1d1M=;
 b=hy8S44J3Kt9/i++nBCcDmWUBualfD1ZRDUrk1YbiwxToPcudFRBPrKHFN4YfXcOFs/wkiAGTH
 L6vgwManOMMAClIr8hluO7RIvzaIEMuHuNUzkqJgQwQVkFxih5p6Zjj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_211531_452396_377C8209 
X-CRM114-Status: GOOD (  17.72  )
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

The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
reach. On boards built around it that ADC is the only path to the battery:
the SoC's AUXADC is wired to board thermistors, and the charger ICs these
boards use have no ADC at all, so without it there is no pack voltage and
no state of charge.

Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
the header naming the channels, patch 2 the driver, patch 3 the MFD cell
that instantiates it. The cell comes last so that no commit in between
registers a child no driver can claim.

The mt6397 is not given mediatek,mt6359-auxadc as a fallback because the
two are not register compatible; patch 1 has the detail.

Only the two channels a board needs for its pack are described, so patch 1
ships a header naming them: a channel ID is an index into the driver's array
and not the PMIC's channel number, as in mt6323-auxadc. The register
sequences are the ones the vendor kernel's pmic_auxadc.c programs.

One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
4/9 [1]. Whichever of the two lands second needs a respin. Mine would
become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
first.
Cc'd Luca.

[1] https://lore.kernel.org/all/20260902193351.185771-5-l.scorcia@gmail.com/

Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
channels are exercised: the battery channel by a fuel gauge, which reads 817
counts, 3830 mV with the pack at rest, and the thermistor channel by an
ntc-thermistor consuming it.

I have two things in the driver different from the vendor (Amazon
Fire OS based on a 3.18 kernel). Verified with over 150 interleaved reads
per setting:

 - Leaving the ISENSE input enabled between reads, as the vendor does,
   makes no difference to the value, so the driver switches it off again
   and leaves both ADC input enables clear when idle.

 - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
   samples and costs no measurable time, so it is left at one. Software
   averaging helps, but only by about a quarter: 0.92 LSB standard
   deviation for one conversion against 0.67 for sixteen, where independent
   samples would have given 0.23. Conversions in a burst are correlated.

The reading was checked against the charger, which regulates the pack to
a programmed voltage in constant-voltage mode. Over twelve such voltages
from 3904 to 4080 mV, and charge currents from 111 to 778 mA, the driver's
reading is a mean of 0.9 mV from the regulated value, well inside
the charger's regulation tolerance. That also settles reading the chip's
trimmed result register rather than the raw one - the raw register is
20.7 mV low at every one of the twelve points.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (3):
      dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397 PMIC AUXADC
      iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
      mfd: mt6397-core: Add mt6397 AUXADC support

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6397-auxadc.c                    | 340 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6397-auxadc.h   |   9 +
 7 files changed, 372 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


