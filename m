Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8318C63798
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 16:07:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A80E208D5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 16:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mphSmyU2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV/bPxNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A80E208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ddNyRUHOhVO1HNqrlUn3pLuuc5dmWUdIwSnGKL8wGyc=; b=mphSmyU24HFG6hAqXUlSK7YXF
	tZEh38YLHpgN9+JUR9IOBH17+gfaVziCUBjQ1Bf2sf6v2ehFbvyZTOcc7+AXlqa3l3VtQ6bcnJBCR
	xipWPyls0Eb6QrIqE3EBLU21JOcVSaBJ2FmfBnAgeubPr6IvNzT2uEuX3mbv56sj9s9+TQ4hN0dC5
	Ih8K+vQwiEQ9DbNr/JgKgggji7dnXFZUja+sa7D8NRDSVyryRY7BUT4pr5p+N1CmCn8RX2MnKbypL
	4yH448x+wuHso0NB6RnwUcJCNAALC6MlQggL1yEKboqhMMzT0U4321wLUxg11L9VR8tNfKI5oHitj
	dtnQVy8Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kigHQ-0004pq-7d; Fri, 27 Nov 2020 16:07:28 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kigHM-0004pG-M9; Fri, 27 Nov 2020 16:07:25 +0000
Received: by mail-wr1-x443.google.com with SMTP id g14so6067337wrm.13;
 Fri, 27 Nov 2020 08:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VtmKlc5l/pNObTu4OTm+GaZxDRv60yZmGnsF1o+ezX8=;
 b=QV/bPxNQUyGThdVnks5FOF5dzJv1fUblWtU8smU0v+wvenV+D6DXnj62sXGiVR+dcc
 D/bCLm3Ihx5alkaavz8ZfaVfqGdDwtsjTPMvvjp6uyndmOw08LKJIUFzObbwlypEEHCa
 Q0pUxyv9mGpPGUI+LLOKrp7SpMDHACHqhFM4BgcXnJRKiE0bXjnkMrv/eeYrCQ7Wf68k
 9jKoTSm8CcUOysgHPn//NDrjAyb3Af08LgIBkNKmyGrsLfOQugKDOE16Hh2G6bTWOHoB
 9xLTWBXfpvRSk3dQ7shQIX7HrHyoTyxpN0QUxZOc4ftl6L0eCrR1rzELUxhMZWMo5q2S
 JxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VtmKlc5l/pNObTu4OTm+GaZxDRv60yZmGnsF1o+ezX8=;
 b=B6fWQjl8OFntlTqKq7Gp6qmR9fysuayouBgjPn7EH01zgzwuTaAaB6lBcPeMYLlcVf
 qJIXxxRAkw3RqbVdFnXqLIsgTHnNHwCglV6Bhmrx0XSugkKyyH5QWiLjpiqEw0ohlqZx
 kDTTNEYHV6etmT0b2O/vyv2TnY0mJbganMt3rAILhqdq3ESpTLXGt9VFirjs70Bxuloo
 jkuh/PrNLv/hdWSxopAi0V1xhmlvDKZ95g7ynmcub6RkdG6o/2Uc0TRXZgI7XEX/XwOe
 zul0eg38UAKNSZ5/k0yTsz6Sx2+MJBVk7qXfG0SYRzATwSRhf2/pLRtMLZD5RVJMtdE7
 YzrA==
X-Gm-Message-State: AOAM533zUdHAN26fwYIZPvweKbbgNOi2AvwtUI+5Hwxsj7fujlMqoRh5
 OtlB4PmmNgEB0iLj4MFXkoo=
X-Google-Smtp-Source: ABdhPJxmWVMnpP6RPhy8WzzK/a37799ZB7hvkB+DXcskQvASOZl8TlksZVEFOkbaTlU1kY5P+CsaXw==
X-Received: by 2002:adf:f888:: with SMTP id u8mr11266010wrp.381.1606493243410; 
 Fri, 27 Nov 2020 08:07:23 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c6sm17825734wrh.74.2020.11.27.08.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 08:07:22 -0800 (PST)
Subject: Re: [RFC 1/3] dts64: mt7622: enable all pwm for bananapi r64
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20201016204019.2606-1-linux@fw-web.de>
 <20201016204019.2606-2-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4568d457-50d6-924f-c2ad-d6e508a543e4@gmail.com>
Date: Fri, 27 Nov 2020 17:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201016204019.2606-2-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_110724_832101_421D6EAD 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/10/2020 22:40, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> mt7622 only supports 6 pwm-channels so drop pwm7
> 
> third pwm (pwm2) is inverted and connected to fan-socket
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Patch 1 and 2 now pushed to v5.10-next/dts64

Thanks!

> ---
>   .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts     | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index 1cc4dcb0008c..ad5b1592182d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -414,10 +414,15 @@ mux {
>   		};
>   	};
>   
> -	pwm7_pins: pwm1-2-pins {
> +	pwm_pins: pwm-pins {
>   		mux {
>   			function = "pwm";
> -			groups = "pwm_ch7_2";
> +			groups = "pwm_ch1_0", /* mt7622_pwm_ch1_0_pins[] = { 51, }; */
> +				 "pwm_ch2_0", /* mt7622_pwm_ch2_0_pins[] = { 52, }; */
> +				 "pwm_ch3_2", /* mt7622_pwm_ch3_2_pins[] = { 97, }; */
> +				 "pwm_ch4_1", /* mt7622_pwm_ch4_1_pins[] = { 67, }; */
> +				 "pwm_ch5_0", /* mt7622_pwm_ch5_0_pins[] = { 68, }; */
> +				 "pwm_ch6_0"; /* mt7622_pwm_ch6_0_pins[] = { 69, }; */
>   		};
>   	};
>   
> @@ -537,7 +542,7 @@ mux {
>   
>   &pwm {
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&pwm7_pins>;
> +	pinctrl-0 = <&pwm_pins>;
>   	status = "okay";
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
