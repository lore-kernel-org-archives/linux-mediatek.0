Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553CBC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:40:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CF16198F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2CF16198F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cX3z5yXVEKUcKbL889Wu+mX6gkw2JO+gJK/sak3GrTw=; b=dO3mvV1c5L3koFpP16dPaL3zf
	LnnQhpNBVf1wnX9nLr2L8UMdXvsLNVK/CpFePxfYun7ZQ1gphIBPqFLhHz3TcPxxCr76VXTiZkPhd
	rgvXEqwEXwr5mjhE23gE5A4H82ckOvVRfLRNMlHIrfHFhYYeKqlTaBsCioZi3bNHWKds9Vn2ZTvTB
	uPl/NbPGEnBqdZGov3lb6+k41YcJY48OPQmFLRgW4PvEMUkPJuUt2Mkm76qTeV6UjQip2RRlRvXUg
	ckJFReP03uCj9aTmj1mYZZSguEiCDph1Z0hiPUs/tsJ3NGad83x6XRgSalRPYW16YSAnbJvoKLhZz
	VUT86V7PA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9v7-0033cZ-KH; Tue, 30 Mar 2021 08:40:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9v1-0033ao-QP; Tue, 30 Mar 2021 08:40:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id o16so15438249wrn.0;
 Tue, 30 Mar 2021 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KYFd8n1ROMP/PhNJKCkoXzuKMYVkHaAgxZobxYlBuxg=;
 b=HnYqDSBD571OkJq1AiWFRplK0UjsoINPaNxJpJYh2J8TRi458ayh2fssRYpp9lNwId
 5CN2CpkUyErY1kFHq8IIz/TMBLoknBZuJdKI3BFjn9gboLvt43GduHTe/qk1Pvgtqicr
 mcRpRN9RGv1f7GIb7xFYPpo+PYUYIoCtJy8bC5UgADUooE73MP3KjiDxRIs24MUb0nbP
 aY2wJHx/To2HF/sVeMTlwCLtcF6+P8GU0Kyh+Fxdt69nhDYkgLnRbLtflBax0W0rn/kW
 4eo1e8vYCaT83iAghW+CF5Yhbx8NHkxEfi3OIWo3h4sBBNMM7FT5MIa9sojIqpDUIXVQ
 N2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KYFd8n1ROMP/PhNJKCkoXzuKMYVkHaAgxZobxYlBuxg=;
 b=dYuTt/wjUNBLCstCJXMiVZcAnKe9jzkGsokCHtdTpQ15GaHLohHABxZtNzVwZ1OW5P
 pWk0nMo0OZQ+cr540HKWAXzcWLoTGSaNDNbFCYivh/rdgay1nYW2Icdc928+J386bfc0
 mXtF3dtl40iHfUPOlVg+t37J6naJGT/k3rwVqKGkG/Mn+RF/vloZUH/h+SGah6nkwpG8
 E1EG8IiyRY0TMDTl3AeICON9KFJ06MijCExPS++T40REfCCZAq9EtgRcukWpd6rYmvmU
 9XbPllvfT/dYdROGNCWEpBUeZyDeV2siLl67IevuCgPxJ1WjfzSgU5bEet3HSYQx820w
 gsGg==
X-Gm-Message-State: AOAM532A/WGyAs7subCV7+vGXCGQHTGy+paSPY7PrfMC7FEw294VVi11
 cMGP4X1/it3Uw993kRgoTVY=
X-Google-Smtp-Source: ABdhPJyj2XcA7fdSNLk3kTIn/Xyjsh1wmkHsRwu51iJjR0oVgv3IzGhb4J6aBkD0o2pgDPxxbawBXg==
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr32590659wrm.32.1617093608360; 
 Tue, 30 Mar 2021 01:40:08 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v7sm2374395wme.47.2021.03.30.01.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:40:07 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] arm64: dts: mt8192: add eFuse support for MT8192
 SoC
To: Yz.Wu@mediatek.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>
Cc: Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
References: <1612151986-19820-1-git-send-email-Yz.Wu@mediatek.com>
 <1612151986-19820-3-git-send-email-Yz.Wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6dd478f3-d29e-0583-00fd-dc85d5a3a4ff@gmail.com>
Date: Tue, 30 Mar 2021 10:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1612151986-19820-3-git-send-email-Yz.Wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_094012_080598_BE421B02 
X-CRM114-Status: GOOD (  19.47  )
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



On 01/02/2021 04:59, Yz.Wu@mediatek.com wrote:
> From: Ryan Wu <Yz.Wu@mediatek.com>
> 
> Add eFuse node to read Mediatek eFuse
> 
> Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
> ---
> This patch dependents on "arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"[1]
> 
> mt8192.dtsi file is needed for this patch.
> Please also accept this patch together with [1].
> 
> [1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/019378.html
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 69d45c7..4a0d941 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -422,6 +422,11 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,mt8192-efuse",
> +				     "mediatek,efuse";

We are missing
#address-cells = <1>;
#size-cells = <1>;

Regards,
Matthias

> +		};
> +
>  		i2c3: i2c3@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
