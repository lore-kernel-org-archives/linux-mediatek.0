Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D8DC2BA18
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 05:29:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7739E206F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 05:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IGm/caGC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xi5KMTsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7739E206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+MRT+MqdGi8enV50ofE6HctCaYA8+kVPTcydBse4sI=; b=IGm/caGC1PeTFh
	/7TPCyrlwWkDJSiB6ABUe9zv+jHV8zKsMkvB14dgmzOCL03/6JU9bF7jAjBpjlvcbNJ8gwGCbHAXx
	B7riTQDCXPLGKznlCD8kJBy5aCjc6BWsA01xqlc/VO2f7A3FuV2INYeCdlQXVMub1QwD+CTsXMPjb
	CAaBae9MUNYBS8pjxmbrLgJcQIWoTgHzV4ydYehUT6OzmhdksHy774BEkEOxHLLRmaA9qZb1zI+0d
	uOrl92WO6JUUzvMybxYaErdK2P+CrZhJKyKuXjW9LF6UwA81aOJi8mC1M1bp2NsC7ewjLWz+2z1Mw
	06haiG6IaiBSd3RPv25w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKEtT-000489-Ot; Fri, 03 Apr 2020 05:29:27 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKEtM-00040f-BT
 for linux-mediatek@lists.infradead.org; Fri, 03 Apr 2020 05:29:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id a13so2957057pfa.2
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 22:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWUVEWHfILYD4mLoLxiKPBxfXnp3kNrR0NuQf2K0ahQ=;
 b=Xi5KMTsZkOO7QTHFIZYuRuEr2Z/+6lNWa58ajHP5SQHleic4V+fa3OVt47Iv2/Ytlo
 AXpJAyiP3yJ3dlaDdpHDhDZFU6cTeYM5BpcgJRXE6fBovCc7bjdG4NRusRfkdLgkky0y
 VuKqJHgsxIvuagj4lAOrlp9zMnQUOMncAdPIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWUVEWHfILYD4mLoLxiKPBxfXnp3kNrR0NuQf2K0ahQ=;
 b=WUnXlLcElC45lo7BUXHNzN11lGgNplgT7ZWjF9jYJiXP01i92xJhtskS9nqYMUppA0
 hzRdLXG0wMsDIVLr64HVYwlUm3lbBIcL11Qxb19S3FVx9iGua5p0kr4EYveSP9VVYRRr
 SfsKcEKulb8ZB7iKNetCzmko8v0vdKZ18c4zDPF4Z/Mk+qqsTYEvKdbsJBk8p0ESM9yx
 O98I1YYxab6tMT7gRerw134btEpLFVIuqaA7YEtFfBla2fS3b0C+Jdqll+wtOD2JRtRU
 ulZK9dOOnLVRWgufr7UKeNfOKNdvCydBwywQ5tKTVH9tDMeoRpVqRwGHkzEYPacTpuNF
 7uGw==
X-Gm-Message-State: AGi0PubTvhGEQx/1abHLp544cafVJY+HvZHAOpDCbDWt+IVypFDgSMTO
 FpQWl6z1NgSbDt7OdooYo4PxzQ==
X-Google-Smtp-Source: APiQypJwFGVlMhKNjzHxxikpLJzTjv9S0yp8wd3gigfUtQE9RxnY+jxENnaohkQ5QkAddaxMxtczTg==
X-Received: by 2002:aa7:961c:: with SMTP id q28mr7020119pfg.177.1585891755586; 
 Thu, 02 Apr 2020 22:29:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id c21sm4451578pgn.84.2020.04.02.22.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 22:29:15 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
Date: Fri,  3 Apr 2020 16:28:58 +1100
Message-Id: <20200403052900.258855-1-evanbenn@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_222920_423975_BAB847D4 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 xingyu.chen@amlogic.com, Rob Herring <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Evan Benn <evanbenn@chromium.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
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
  watchdog: Add new arm_smd_wdt watchdog driver

 .../bindings/watchdog/arm-smc-wdt.yaml        |  30 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/watchdog/Kconfig                      |  13 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/arm_smc_wdt.c                | 181 ++++++++++++++++++
 6 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 create mode 100644 drivers/watchdog/arm_smc_wdt.c

-- 
2.26.0.292.g33ef6b2f38-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
