Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1778FC43381
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 09:15:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A67E864F18
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 09:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A67E864F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q/Ecoc++pIMdskA773Xb4XwQ8Xtw9tARPYkEQfRlE/s=; b=WKp3U91bFsCnRAf6PYIhoAs/S
	Wyyy47X7+ZY57U4ATMpC8HpY+ofaixFAFUvnZfjPRsRpp2kF4xsqPhtg0U0vjX3nafTkiW5pN82pu
	d7NfE0DetQ2VdTmAdDyywujj0iRpZ9P+ASH2YjuRqjYFW3EgIdfZ9mz2gtF2Hd0/5+YobS3UOOnza
	sOpC4gv5LoGTlAwzos8fWQ0ItmFaEkH2AO6J2awh/HlxCD+Am1rU41cH+3Dz/zTlyoFyy7TXMBcTE
	iuxVYtgJ38YlJUHJx+EdwfrymFBCcwBh40znoXpXeihjFE6dl9RXiCEWWr9xW06PlLtQUrhYxS9iY
	xgDnJXbnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMok6-004s4g-Bv; Thu, 18 Mar 2021 09:14:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMok0-004s24-Pz
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 09:14:54 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t9so4660550wrn.11
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WwfwygZ0uyO/8qnwByDJeqKuIzR1LpilYHqI7Bczxo8=;
 b=uUyOQOXeDjrR28SpCD0JA/vq1e3Sml4lVpehemL4k+jNHeSJBExwZLl5xy6cDaoE88
 gKg1vR0b7fxBR5sY6uNxRGxI9OAKBnuS2/zLKqH8bSg4PjuXAOruyYW4XE5TgeJ9QDEz
 P7e7cL9HioJlbXpjNbu7vHym3l4pm1C1O5psBsH/sBtb4EWGx/UrpRs5LZ8wX0zaJQOj
 pWiGWit+PPUinxd+C5Nd0xU2hO3BWY6ix0fTNYJAAViEgew0TlNRLcU5T5GBqqzOi+SP
 dh/2Wgf3/0UlS/m6UK3T0QhbS2SsvTNanQOWyxITmsRTae1HPjXYJBA3eboDRHdbkr9U
 GhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WwfwygZ0uyO/8qnwByDJeqKuIzR1LpilYHqI7Bczxo8=;
 b=JRigOLukMHgeScm16km7hyvSnNfroEqwkF8c6ndi3TgUz8QbtR+YuFkX3HqwvaJSi9
 jCyayCZlcBAVLCUuYa1HY537h7SndWxxj7e4renswcFvagGOnH+lmf+qc+18io4Kv1yR
 TvdG9CMRl8dzP4hq2P/hF+Ahoh2/MQ7uTYSWdHZeJ9sYwg4JAlB8oUU9ClbLNiY4Vj1M
 ZjvWyctKY2Qrr3WDdHWOebQ4IKC/txGW2tEmEwLIpw9aRnX1JtDIWCjgeBm21jHiUM0v
 iMMtJfb3clNVJDUboU9sFtE8Iy0pjgeT0w0ssbPmZPnsQ1kMCVp4HJdujxsWXG5PZFby
 3gBw==
X-Gm-Message-State: AOAM532ptSIP1aViyiZpFxse20oBclhtZvdfxddw67ulfsGkVRW+zJ+E
 JTtDD2fzvBotF46Qz9gEVKxCdA==
X-Google-Smtp-Source: ABdhPJwdLMlTIT5VmEKupwPrWeSSoNTJaF3z3AqcVnE8J0jPyMEHT5LG1zTyMrqXoRjGF7sP52krLA==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr8515651wrt.120.1616058891911; 
 Thu, 18 Mar 2021 02:14:51 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id l4sm2002873wrt.60.2021.03.18.02.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:14:51 -0700 (PDT)
To: Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Arvin Wang
 <arvin.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <1614656863-8530-1-git-send-email-henryc.chen@mediatek.com>
 <1614656863-8530-9-git-send-email-henryc.chen@mediatek.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V9 08/12] interconnect: mediatek: Add interconnect
 provider driver
Message-ID: <cc1d4ea2-22f6-e962-07bc-815ce73b2cb9@linaro.org>
Date: Thu, 18 Mar 2021 11:14:50 +0200
MIME-Version: 1.0
In-Reply-To: <1614656863-8530-9-git-send-email-henryc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_091452_984753_4601DF54 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/2/21 05:47, Henry Chen wrote:
> Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
> using the interconnect framework.
> 
>              ICC provider         ICC Nodes
>                               ----          ----
>              ---------       |CPU |   |--- |VPU |
>     -----   |         |-----  ----    |     ----
>    |DRAM |--|DRAM     |       ----    |     ----
>    |     |--|scheduler|----- |GPU |   |--- |DISP|
>    |     |--|(EMI)    |       ----    |     ----
>    |     |--|         |       -----   |     ----
>     -----   |         |----- |MMSYS|--|--- |VDEC|
>              ---------        -----   |     ----
>                /|\                    |     ----
>                 |change DRAM freq     |--- |VENC|
>              ----------               |     ----
>             |  DVFSR   |              |
>             |          |              |     ----
>              ----------               |--- |IMG |
>                                       |     ----
>                                       |     ----
>                                       |--- |CAM |
>                                             ----
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/interconnect/Kconfig            |   1 +
>  drivers/interconnect/Makefile           |   1 +
>  drivers/interconnect/mediatek/Kconfig   |  13 ++
>  drivers/interconnect/mediatek/Makefile  |   3 +
>  drivers/interconnect/mediatek/mtk-emi.c | 331 ++++++++++++++++++++++++++++++++
>  5 files changed, 349 insertions(+)
>  create mode 100644 drivers/interconnect/mediatek/Kconfig
>  create mode 100644 drivers/interconnect/mediatek/Makefile
>  create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
[..]
> +++ b/drivers/interconnect/mediatek/mtk-emi.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk_dvfsrc.h>

The patch looks good to me, but as there is a build dependency I'll wait
until the dvfsrc patches are reviewed/picked by Matthias.

Thanks,
Georgi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
