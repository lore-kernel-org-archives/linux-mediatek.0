Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE95C433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 18:15:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C23520658
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 18:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jd+5NzFL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu3vQTCv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C23520658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VVSlqrBCZJMRYrI78K8jCRPjyRU9YL/qLVuN9ctB7+4=; b=Jd+5NzFLx4MHP5hpr+rwPbOb+
	FwDhDsrYVzX71GXUE+unJ6tfKnM2mh28s9snIaWrHam7+tkK0jzQvegOb2TdkDhdJx4mIxULpTmNb
	EZNo0XunIF9vWf7qwKzNxqShr5ISRO+iWYRSEjswE01NLuIRnIL4fPKkW9nAOmrxc5KmByECKxHAv
	Ht1+QXx+PAYNqO3D/glSlA4fyUvjD4jgaGoRt5KJmbKa5hq423JFkap9yT8ieN+Pawo9tOJha6t9+
	Tqzop9adgI5aYhphRK+sm9kVrADhf8PerhtmE7fjHT1u9UlpGz/q6PaHVXKy8G7Wma9LCI/3kaaSu
	2rQ/QzZ8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvPSM-0003gG-Hz; Tue, 14 Jul 2020 18:15:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvPSJ-0003fY-Vt; Tue, 14 Jul 2020 18:15:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id f18so23794402wrs.0;
 Tue, 14 Jul 2020 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dSp7R1vKTnKdzsxqMgBtcDq/n3QLykSpSbeQuD3hfjc=;
 b=iu3vQTCv0leQpsnybURB1+EIrvo+36TwXadSzcO7dbgQS5eJ/HVVXkryMCf3CZDa5V
 M6zpTobveJkRbL2cnQ5//mKpcsLOjCk4I+owDrHcoVA49TcOal1FA/DFGqFR1VDp1elb
 bZVfx7pgjMG5+9iixXvfyLDEkMNVPiZWHe+Eaw/3VaZB5NZWIOjnLNOZ4GR1+C3dUvmu
 Cb+A9lbdIgT3TfNeeBpuID/O3oB+o44zv4HDE5EawQeEuLdZFzTdU3ID6szd/Xdb7hrj
 r5TFHCPGGXl+0M4uYFlb5AydKP7l/ZHhuop0xk46VMyAG+dYBAk6gSRkJ8TaIqLv59BS
 G//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSp7R1vKTnKdzsxqMgBtcDq/n3QLykSpSbeQuD3hfjc=;
 b=W2Q30OAMRirq7zEq/wyh45y3ACBtwU//uelhxPPu7cUQGf8hMBMbfklOEPX9GgNuZ6
 Bhdw50aljDtVaPCyQwEAkIyxajdaOJ0go6JLUS4mHSW+OVWkPhT+3JSVw9ulSS2fIsvj
 YwSltPDknmz6R8g8HjrZPbHY78ZwABOx+4TWmUgRBDJOF8/lGCS+1ekCKXkZddtjBP50
 /HUQ8nW1xtQ6pQhCC3WjHS8EzWLGZW4IfmjzK7EBmuqVR9a33WKKDvVxjPufNiQnTt9Z
 zM1R3inV9aB5e3V3Y30L0JnNpVIqEAR3wKUY4txFwQbKh65B17ISVdPXqn/k0ys1wq61
 rkCw==
X-Gm-Message-State: AOAM532d+IF4SepBtuxFPByiCSqsBV5j75fksWmP5KOLrtYYbwgva7rb
 /RCKXSi4kozM5RXozv/Txmc=
X-Google-Smtp-Source: ABdhPJyyGdhWu0u0CbQOeLDCSz6P+/Yov6DrHDS6EiOJPgFRClfh0pllHT3IxqJnRE4/8NrmgSZ6fA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr7062800wrm.31.1594750501837; 
 Tue, 14 Jul 2020 11:15:01 -0700 (PDT)
Received: from ziggy.stardust ([84.236.220.84])
 by smtp.gmail.com with ESMTPSA id k20sm5572396wmi.27.2020.07.14.11.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 11:15:00 -0700 (PDT)
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
To: Hanks Chen <hanks.chen@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
Date: Tue, 14 Jul 2020 20:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_141504_057097_8A072F2F 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/07/2020 11:20, Hanks Chen wrote:
> this adds initial MT6779 dts settings for board support,
> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> 
[...]
> +
> +		uart0: serial@11002000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11002000 0 0x400>;
> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11003000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11003000 0 0x400>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};

Devicetree describes the HW we have. As far as I know, we have 4 UARTs on 
MT6779. So we should list them all here.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
