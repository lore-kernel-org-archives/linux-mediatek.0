Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E423C43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 06:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9DE206E9
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 06:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CASM9mNV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DtAiTGcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9DE206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4VtXhSKuRwW5x/nNfsRIq+tjvLFLVgz9rLw5kQeIsI=; b=CASM9mNVKHZjrM
	+k75JsBUATJEEziVOL6hPkE+OQjXCMwrCFqz9jiaIlbPDPoQYoP9cfrEc0iKrHtUuMMXWnvKdITD2
	Hwl/kg1Cfv0X00u4GMtDxPPkZVpPxRg/IbCxMouPWWHkSow2XacKCcYGqJWqIDIfjd2PP8wy64B85
	bHkIGJXT52GjQODS6oby70pRxfIRvS4+0nAPddD2SGjvNoLxerSK4BtAABOVI9f+J568hWu1bplhA
	RatBRpB2hlSlXpQTqww25cTiVGbb70rQZlVl8DfjdoxYckyJx68cimtOckVV3uKo+R39zBjdm0bJN
	W+6yRmMQAZflSAh9unQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKFdb-0003K4-6Z; Fri, 03 Apr 2020 06:17:07 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKFdY-0003JY-TD
 for linux-mediatek@lists.infradead.org; Fri, 03 Apr 2020 06:17:06 +0000
Received: by mail-pj1-x1042.google.com with SMTP id nu11so2515087pjb.1
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3yS2lItqVOfGsXBFcK1Q03oHDR0TygtC5pNqATurHQ=;
 b=DtAiTGcqQSpV/avwmNRjvHO1qDLd3tZsNHf3k+C+AgpkKHnLK0/VqwekGEJ4JQQ0uq
 wXTt47KxFzE5AetYqr4lZNkUqqQvCxPwyDnzOdlwb2XRAY3sI63HyI8fCcfwegKRCIJx
 Wr/jdxxl1E+403E/ErpRJFCWlSoK8AeJ20XUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3yS2lItqVOfGsXBFcK1Q03oHDR0TygtC5pNqATurHQ=;
 b=Vr0GJztbouoZTFK11rSIAEKfrLyVuCmG66JbTmGEc7mgTJFbRjo6QKXrJHJwLMRwGp
 rENkJWEnYYqRU1HG0qPFvUc2YG/Hm7Z8JY/5Itr8SIr4qGDLY1WD69faEhZW5Np6Zo/g
 n/yZ5yGRttcAhyp6mPAw1lzAYOy9q2UFrQxbJvvcj3x/SxhvnXtgyGoMCYJ0xhisJL8s
 gGTXl4gOihvwDbnO9l3qqznkLvdv09HjBi2eup57WtB5qDAi9U3/K84ec3CljL0192JZ
 R/AYhKHzHKaf2liCI/+LIfD70TnlwYOXWhaEOH0av1kOVSWmJxKijHS6FAo9NQKJ9r0G
 riMg==
X-Gm-Message-State: AGi0PuY4eRx15DdUt0/dav8tMbthPZS1ljfhOtF+4eIFKesxmIMRZS9s
 zGoliP+G9YjXaLb2+hVBGFuE3L4pz1Q=
X-Google-Smtp-Source: APiQypIfdvNECIvPqpS9j1Je0/VhoIp1fwuOxvcOdFCpTdrAuJom39k4dRyIAdcEib9WicDh48gCcQ==
X-Received: by 2002:a17:902:5a44:: with SMTP id
 f4mr6388995plm.306.1585894623979; 
 Thu, 02 Apr 2020 23:17:03 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181])
 by smtp.gmail.com with ESMTPSA id a71sm5173715pfa.162.2020.04.02.23.17.03
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 23:17:03 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id k18so2317578pll.6
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 23:17:03 -0700 (PDT)
X-Received: by 2002:a1f:1846:: with SMTP id 67mr5194780vky.32.1585894163062;
 Thu, 02 Apr 2020 23:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
In-Reply-To: <20200403052900.258855-1-evanbenn@chromium.org>
From: Evan Benn <evanbenn@chromium.org>
Date: Fri, 3 Apr 2020 17:08:52 +1100
X-Gmail-Original-Message-ID: <CAKz_xw1w=uKEV_p94cT8uL-4WN9mRkQE47N=4QdE+_NOFQ-2kg@mail.gmail.com>
Message-ID: <CAKz_xw1w=uKEV_p94cT8uL-4WN9mRkQE47N=4QdE+_NOFQ-2kg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To: LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_231704_955167_92F3FA7A 
X-CRM114-Status: GOOD (  19.19  )
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
 Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Apologies I forgot to add this note to my cover letter.

Xingyu do you mind seeing if you can modify your ATF firmware to match
this driver?
We can add a compatible or make other changes to suit you.

Thanks


On Fri, Apr 3, 2020 at 4:29 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> This is currently supported in firmware deployed on oak, hana and elm mt8173
> chromebook devices. The kernel driver is written to be a generic SMC
> watchdog driver.
>
> Arm Trusted Firmware upstreaming review:
>     https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405
>
> Patch to add oak, hana, elm device tree:
>     https://lore.kernel.org/linux-arm-kernel/20200110073730.213789-1-hsinyi@chromium.org/
> I would like to add the device tree support after the above patch is
> accepted.
>
> Changes in v3:
> - Change name back to arm
> - Add optional get_timeleft op
> - change name to arm_smc_wdt
>
> Changes in v2:
> - Change name arm > mt8173
> - use watchdog_stop_on_reboot
> - use watchdog_stop_on_unregister
> - use devm_watchdog_register_device
> - remove smcwd_shutdown, smcwd_remove
> - change error codes
>
> Evan Benn (1):
>   dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
>
> Julius Werner (1):
>   watchdog: Add new arm_smd_wdt watchdog driver
>
>  .../bindings/watchdog/arm-smc-wdt.yaml        |  30 +++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/watchdog/Kconfig                      |  13 ++
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/arm_smc_wdt.c                | 181 ++++++++++++++++++
>  6 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
>  create mode 100644 drivers/watchdog/arm_smc_wdt.c
>
> --
> 2.26.0.292.g33ef6b2f38-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
