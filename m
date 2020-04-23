Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DFCC55193
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 04:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40EAD2087E
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 04:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSJJUkPW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gYhBQHtg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40EAD2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z6+gjTdp4i5ZMan1Pq/A6MuuNaFlLtrabG/vP9T6k2Q=; b=QSJJUkPWKpMupe
	bDpeyIlpmsw7gOduYUSjdekIDCp/PFVo1OksDVIEqf8MTUXe93lpRaMudUPSX/e/F8UT6yfJbm673
	F3/escHNhGXRFwa2rostXwMVHvmQh+mpRoTG7zdCYDZD+5xSrYSAjK54ySAZTG4a9UXAFm5iKCtlJ
	0BYzzrxO1HolDXNx505FImJpuUeD4WDW/7Ef+AUih1qRJWWCRh3Le87xqlttOESCd9Kp2bhtbfJ8r
	UDH3uqw3OXwdxackfVIuZ0er1EmMzsmQ/5pc555oSOI4+yh8q4Q/zm7znx0PB1n21mM6qpbo09opq
	spo7nvc8Y33MEfrW1Hng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRTfa-0000NS-AB; Thu, 23 Apr 2020 04:41:02 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRTfS-0000HK-Dh
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 04:40:57 +0000
Received: by mail-pg1-x543.google.com with SMTP id h69so2263238pgc.8
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Apr 2020 21:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZS/LLxJx1Ds3cx4GyxEdNHynphtX9//TxQ2D60w281c=;
 b=gYhBQHtg6aVgFNpAsuZicqx3KgF2/EI40v9gzc+TTBaO0INthZs4oK+6OZXVHVVtPe
 tPKKq9v1HCjoEgO5iaf0wkIiVty4kBHme2dDPZddnnYYIlh5/960j2SdgVnZtDMaofDG
 eXV23e91++ocupsga5mbViaM8WsQYNSK8c1HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZS/LLxJx1Ds3cx4GyxEdNHynphtX9//TxQ2D60w281c=;
 b=sBtrjeHDQQlqlt4p+j333cEA/dWUNk3LuCXZEWRiuP3FJyusIwloX9JrK0VA14kAur
 jAyu3Ixve4pcRk6SbQgh1oEErPwtUMk/eHgjsqRgwkWKK58JvbhC0kAiYDTv0BUm48wX
 JpI3K49HTrQDkUgRkjTIdnx2Bi0Aca2faxPernO6p+qfqkqZqS7+mtZsNY/LVgg9ApeE
 DxV1bIQl3u6nERb2EaeqetGKZUwqg7dq8QguVSOWoPqdMODNcRp1Q29B5JLvuqI/KDTx
 Mw2bT+vasgDc8pQB4t85dtbAy2xHBnjHfZwU52HK8bu0TnKxzrHnKj7juzfF8PFHhsAr
 6ifQ==
X-Gm-Message-State: AGi0PuZft+TbYs/ayUkab8UvpSAcCffY1KdoUtxURH2g3vvI01aNN8vG
 +8xUxJ1ZvODGpC/TO5oHZ3ia3Q==
X-Google-Smtp-Source: APiQypLI+7/YssjfEAqA7mqNn/1Q292p/7jx+m+Js0S3rpVk2pmi9WqX7DsXMBWP/y1GcYjx6h81JA==
X-Received: by 2002:a62:d104:: with SMTP id z4mr2035568pfg.26.1587616850973;
 Wed, 22 Apr 2020 21:40:50 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id w13sm1174046pfn.192.2020.04.22.21.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 21:40:50 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
Date: Thu, 23 Apr 2020 14:40:34 +1000
Message-Id: <20200423044036.234578-1-evanbenn@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_214054_461481_E17D8B13 
X-CRM114-Status: GOOD (  11.77  )
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

Changes in v5:
- Change compatible to arm,smc-wdt
- Make timeleft return 0 on error
- Use type punning on smc_func_id to save an alloc
- Change compatible to arm,smc-wdt

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
 drivers/watchdog/arm_smc_wdt.c                | 189 ++++++++++++++++++
 6 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 create mode 100644 drivers/watchdog/arm_smc_wdt.c

-- 
2.26.2.303.gf8c07b1a785-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
