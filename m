Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60511C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:47:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF9A207D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkanOEPG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiUD1SeS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF9A207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VGGsLzOX7Mz06NdPo53PHQdp7zG+60XJmxZrPfEwDpU=; b=lkanOEPGoQG8pGD4iGJqUbnUC
	u4+U4NNpLVzTEtB12krBkn1avQUs65P/AeW+cqtEoqefsnEIkxcaHkWB0EocL39QCR7rAvLsqyr/l
	ftiLp/4iz5djsZb0ArO79/FfWNP9nH0lwQrDWoX9qzMn1BW81RlQ3xTpEbn2ksO7oAWYvt8K5aLjH
	LDLLi5m7C4lByLJdEoL1q//Lli7mMiPL8ECxdLbcEUXsP3u+qTNdCDdtFx//2bFfx/sUKOI//nYWS
	qgDQWcU/ikvrRzwapDWpaum5s/eblTdIcQ00qzQy7+CS/rR4ZqG5RiTpqs1zN2fAT9+qpZYNuZ4mt
	vqy48QJdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttNG-0002FZ-Rl; Fri, 10 Jul 2020 13:47:34 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttND-0002EI-1v; Fri, 10 Jul 2020 13:47:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id f7so6025644wrw.1;
 Fri, 10 Jul 2020 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FbKNbXw5+ofG9RyKnBh68SnbvorNSKKjBU7WOLXWQE4=;
 b=HiUD1SeS9oNEOQGLlGjspqlx1ucgIHwcztodspOdsWF5ZLU+APPJD7sBYoCs4essF+
 iXgSyAj2XPcG3o0aOB4IvQ7R+0mCaei3Vineeb3Jnx6Iix8KSmow+PxMGaa/BzxztTPy
 4rbyx0c8P12c5p1sgmpGPzsj1/CRo+hL11l1RTydDnt82Fjj7hflsJezjbzZocMlYe7t
 3fcb3ZuCkDRaexCjlYWVuJ0pa1YLBTdk5C8/mzS3IdNLnwwyWDjp7vW8Tgv7st0tSHaa
 fSTZN5E5d3BiwyZy+8IV6CghewKF9APDlPS7mjHJCClCC3aUJIFsXvWSBEkfC3My+R1w
 FJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbKNbXw5+ofG9RyKnBh68SnbvorNSKKjBU7WOLXWQE4=;
 b=V50XLzZcu2f7wE0HXaQ63Qcpp+fCkTLHIttWJW8DcYnbhkEa11kkmXcMtS5pmb/dsi
 ukwmaEaekJPcA/belhWw/WZ0pVDfgFJHQtrA/oEnkdm43/sb2xhsPg6fOtc6szvAuaw1
 3nFHXcMJt8AafBvQGTcNTwOSlhcas1Mfe2SUulKP9vfBcQ5olMhUPWppji8GI3WxdRom
 SpY+5Z7/MvYP1Vlu41gOMqPXp9sAxsA0fD1Hj6a7TJGv6cVWgwlJ5dZIoZwXd3khAcrE
 Ab+CdWDIKoJK1PgaYRoq1guENRn+T55BlZ3SA8yLmwRl1oVrAN9x+qFV8SONSeYYd9Bp
 58zA==
X-Gm-Message-State: AOAM530gP/ZrTtZc6ez7dsfjupRvHz4M5VlJ3dpW8Y1xOgd523bPnW7v
 LMazWu/0B5SEIvVwTu/uAQA=
X-Google-Smtp-Source: ABdhPJz30P3Ja6nlaCcxoVO3T84UFVmzRkAQoQzS2oPJFdsgjFqTddAfgdfaqHdktNmYIqTpnDGbFQ==
X-Received: by 2002:adf:e6c1:: with SMTP id y1mr42243181wrm.116.1594388850081; 
 Fri, 10 Jul 2020 06:47:30 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id y6sm4572954wrr.74.2020.07.10.06.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 06:47:29 -0700 (PDT)
Subject: Re: [PATCH v7 7/7] arm64: dts: add dts nodes for MT6779
To: Hanks Chen <hanks.chen@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-9-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2eee3a1f-464a-359e-e7d3-0d331c8898ed@gmail.com>
Date: Fri, 10 Jul 2020 15:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593694630-26604-9-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_094732_098675_FD2436EF 
X-CRM114-Status: GOOD (  14.63  )
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



On 02/07/2020 14:57, Hanks Chen wrote:
> this adds initial MT6779 dts settings for board support,
> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |   31 +++
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    |  271 +++++++++++++++++++++++++++
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> 
[...]
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;

I suppose that should be:

clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;


Regards,
Matthias

> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		audio: clock-controller@11210000 {
> +			compatible = "mediatek,mt6779-audio", "syscon";
> +			reg = <0 0x11210000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: clock-controller@13fbf000 {
> +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt6779-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: clock-controller@15020000 {
> +			compatible = "mediatek,mt6779-imgsys", "syscon";
> +			reg = <0 0x15020000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: clock-controller@16000000 {
> +			compatible = "mediatek,mt6779-vdecsys", "syscon";
> +			reg = <0 0x16000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: clock-controller@17000000 {
> +			compatible = "mediatek,mt6779-vencsys", "syscon";
> +			reg = <0 0x17000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: clock-controller@1a000000 {
> +			compatible = "mediatek,mt6779-camsys", "syscon";
> +			reg = <0 0x1a000000 0 0x10000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: clock-controller@1b000000 {
> +			compatible = "mediatek,mt6779-ipesys", "syscon";
> +			reg = <0 0x1b000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +	};
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
