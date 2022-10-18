Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B790C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9NG3CBgcMhiqdPdVXVfFN0tafSKygxdY4MZpqU8ulL8=; b=ueIOPMxFLbPuurONrLhTwEXY9G
	ppGr6V6un8SKXKhGxl9v+giZcaR8QMOUm2E8qRk2iQnEPdckIuFCVLd0I1+T/Q1si2AyXiZ8A5ZEM
	Y9zlurR5uen7C3IVYsq1UoCCJDpwR4MSN1EYuNUvNgpQ+e/u7qn7PdQQ05XmrOi/f07+W0dpbp1N2
	6LKtvbvhXsxyB3UVNkOz2yMUHWi84ChTw/0mBfCdSvrfUlYO3Q2x27cqoNhpZEt+o6rzsGb1bxKCR
	3x3l84IgFcbRA+aIQ/k5FEWyx1dVV0rsXLT5jgArAajHliZcu7Yy2ryHiUkL2zYo3LytmC5Yaz4ef
	2JPOgeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfM3-002qWT-W0; Tue, 18 Oct 2022 05:41:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfLr-002qRf-MS; Tue, 18 Oct 2022 05:41:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id b2so12824973plc.7;
        Mon, 17 Oct 2022 22:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NG3CBgcMhiqdPdVXVfFN0tafSKygxdY4MZpqU8ulL8=;
        b=QLcHi1gUfZaa/q2+yUxqZL2jA8pWuPlvSDT+67V72EZmsg5g8+XkKWJ1c7xsUNwz5y
         gXtwcdEmwzHxyrMUnsfe8X1LgcGDXVsDr88y+aVVhsro9/NAtasgg2If4YYEu9Q1XTlP
         FXytHzi3CwMIXxNDEs/c15cmSgNOnS9KnPjg+jSuJsgESciv3tfgBdM10fRfoRmNehRu
         /PaYZ7u9fO6P/7iaA5MLy4xlPl8SsK9pNRiZTt8EnK8PFTdsIBLPEgYcRZvqbj1/ei9t
         CF9U8mM0F+Pz0g+0bBwcRg6XYe8ZsXv3sw2+8z3gpl6BSZant2UqtrYEB+rUD2ex71zM
         CjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NG3CBgcMhiqdPdVXVfFN0tafSKygxdY4MZpqU8ulL8=;
        b=y0lDLY14GDwHMNK2zmmeOG9qbUveb1ePAYMKAPjrhVtu5qYUhPDoUPO9LXp+rJApny
         8R7hg4ymYtrVyDh+wHlDMYNNskgTu/0LV+ewhNc6m/ikCwkycYgjbL22om/2vhInegfm
         r8WPLGjHKKdnqGlOciWIbPyYSVbqb1oeeiAOPapKGdT5v4824Azcn0KwAXaJgmphSUu9
         vYFBrb6m09AMKigfd4tVRndnlIjVsTpra4/qFA2kGL7czR36upQi1rNHyO6Vt46X7Ikz
         Buyvk2GcoFbmxytVUUpgIdf6d1zcO5czt5Vv4zzjTrFaadH0+f2K76R/uzZFUA4yT9vc
         qt5g==
X-Gm-Message-State: ACrzQf13CtmQVJTfku6hupDUuqks9rKVdhv54fBCeFkR/AMBEknHT4rk
	woETpfh+dFp7/Ru5CgSQsIk=
X-Google-Smtp-Source: AMsMyM7XHHf5Pyx6Gn8sMGSJArjz3NQyswzyQYRRuRVgwIvwKGu90zGY7HBHYd5RIvSrj/j6sjma1Q==
X-Received: by 2002:a17:90b:4ac5:b0:20a:de32:366b with SMTP id mh5-20020a17090b4ac500b0020ade32366bmr1625503pjb.197.1666071675818;
        Mon, 17 Oct 2022 22:41:15 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/10] gpiolib: more quirks to handle legacy names
Date: Mon, 17 Oct 2022 22:41:01 -0700
Message-Id: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224119_773921_790012AD 
X-CRM114-Status: GOOD (  10.51  )
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
Changes in v3:=0D
- added missed legacy compatible for UART variant of Marvell NFC controller=
=0D
- added naming quirk for MOXA ART RTC=0D
- Link to v2: https://lore.kernel.org/r/20221011-gpiolib-quirks-v2-0-73cb71=
76fd94@gmail.com=0D
=0D
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
Dmitry Torokhov (10):=0D
      gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448=
=0D
      gpiolib: of: consolidate simple renames into a single quirk=0D
      gpiolib: of: tighten selection of gpio renaming quirks=0D
      gpiolib: of: add quirk for locating reset lines with legacy bindings=
=0D
      gpiolib: of: add a quirk for reset line for Marvell NFC controller=0D
      gpiolib: of: add a quirk for reset line for Cirrus CS42L56 codec=0D
      gpiolib: of: add a quirk for legacy names in MOXA ART RTC=0D
      gpiolib: of: factor out code overriding gpio line polarity=0D
      gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet=
=0D
      gpiolib: of: add a quirk for reset line polarity for Himax LCDs=0D
=0D
 drivers/gpio/gpiolib-of.c | 349 ++++++++++++++++++++++++++++++------------=
----=0D
 1 file changed, 227 insertions(+), 122 deletions(-)=0D
---=0D
base-commit: dca0a0385a4963145593ba417e1417af88a7c18d=0D
change-id: 20221011-gpiolib-quirks-d452ed31d24e=0D
=0D
-- =0D
Dmitry=0D
=0D

