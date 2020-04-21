Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6789C54FC9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 11:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824C7206B9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 11:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iP73VBWI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+1WGBmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 824C7206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNYVEq+4KKYPJZVt8CXYn1fs6/HF0WM4YKnqVVukj9U=; b=iP73VBWImRLZyM
	XKcJNF8HUOrQGqipwlBAGY5o9LH9ObuyN10LzP7/PtldWeC2GFyHniMMeCQvRQ2aZObRpalbNRzyq
	31IDChqs0QLUwBIO0mybekGww4icLA9uvknEJ4g0sz4RtwSdevjA0GpZ2vUM5XTev6+NP1Pzp1dE8
	qzuNZEh2kY2soHWKTOnVOdPMWFTYTfYyAu0qrHxKvuUNgsSnLzYdcru/CngFi443lCdN4MNUmbvrO
	5VO3QvMNi9vlCHFWQ7LWI3/IsZgYoCHsYedNE+494jBS6w4KfKpCK0MqxRnybH5yIQX1LiUfW7DEI
	CX2Yjxy6RXXGM3NCaTEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQqij-0001Zw-Du; Tue, 21 Apr 2020 11:05:41 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQqig-0001Wy-6y
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 11:05:39 +0000
Received: by mail-pg1-x544.google.com with SMTP id q18so3070621pgm.11
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2020 04:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvF21qmP3gF9P7JZJ1ONcszxypmYyGE19tvUhWUTsVs=;
 b=h+1WGBmhpgBtdaANZUwwMqTOtqCaHeP8LEw5UWv2vHgLHr/sm2q1g/zutfJc3XCFY5
 2a426+CkciRwHnsNtSmp2IC36uhc193CxU8uvnyojGagWNbqLGXkCrqZycjGRJass4yv
 v08www/I7ltHOkci3lA0Ub2nYKge1VZpCKO3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvF21qmP3gF9P7JZJ1ONcszxypmYyGE19tvUhWUTsVs=;
 b=qAhk5s3LjLDbEdSo9piMgIlHgYuUgcfvES/7WOYtmG/f0GircKwrpcgdx8ftQPn1Dl
 lRrfSKUcVOh/q0G13P6NkQMmF48qqvYdgZcr0S06RV60RITxh8R4V1GVRMoXVePM7aWr
 xnG5USHNyydJ1qVihZZLUzt3fWtEx2qwytPks5e+ggM4aiu/oEHps7sfjUcnE4z0FkHy
 hfDpxGp2Et2aMJUPcwRZTgtUBKQJy40mBJDPfVzrokXYk6LP96GABOaKF8nTV1d0pwoK
 BseCxZtMArFn3L7NtkHl2y49aTQCP6Yqbpc2R6o9xX+GQpkViIoIRTxfZG4D+Orn/9NL
 dh3g==
X-Gm-Message-State: AGi0PuZBGSN6FUdbG203r2Y/F2F7oliVmfkbj/FuygFsG78m8GE7BEAJ
 egWyka6xjA1Xuj0R7JyfBIrEIg==
X-Google-Smtp-Source: APiQypL4PFUwg5GwPRrSlb0y3fSgyECAShAITRonjEWPiB9jvTC9CBnU3LdyUl5Ks5ZaHOn5MmV5AA==
X-Received: by 2002:a63:1d52:: with SMTP id d18mr20242532pgm.443.1587467136316; 
 Tue, 21 Apr 2020 04:05:36 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id j10sm2217695pfa.57.2020.04.21.04.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 04:05:35 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
Date: Tue, 21 Apr 2020 21:05:18 +1000
Message-Id: <20200421110520.197930-1-evanbenn@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_040538_283065_7BBFB12A 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 xingyu.chen@amlogic.com, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Evan Benn <evanbenn@chromium.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, jwerner@chromium.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is currently supported in firmware deployed on oak, hana and elm mt8173
chromebook devices. The kernel driver is written to be a generic SMC
watchdog driver.

Arm Trusted Firmware upstreaming review:
    https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405

Patch to add oak, hana, elm device tree:
    https://lore.kernel.org/linux-arm-kernel/20200110073730.213789-1-hsinyi@chromium.org/
I would like to add the device tree support after the above patch is
accepted.

Changes in v4:
- Add arm,smc-id property
- Get smc-id from of property
- Return a1 instead of a0 in timeleft

Changes in v3:
- Change name back to arm
- Add optional get_timeleft op
- change name to arm_smc_wdt

Changes in v2:
- Change name arm > mt8173
- use watchdog_stop_on_reboot
- use watchdog_stop_on_unregister
- use devm_watchdog_register_device
- remove smcwd_shutdown, smcwd_remove
- change error codes

Evan Benn (1):
  dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog

Julius Werner (1):
  watchdog: Add new arm_smc_wdt watchdog driver

 .../bindings/watchdog/arm-smc-wdt.yaml        |  36 ++++
 MAINTAINERS                                   |   7 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/watchdog/Kconfig                      |  13 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/arm_smc_wdt.c                | 194 ++++++++++++++++++
 6 files changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 create mode 100644 drivers/watchdog/arm_smc_wdt.c

-- 
2.26.1.301.g55bc3eb7cb9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
