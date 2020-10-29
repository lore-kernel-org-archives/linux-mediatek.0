Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D35BC55179
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:52:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15450206B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dH9ftRZF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+asKu+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15450206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FzS+vn/81AkggF2/7CcVbbAbTZxamwos4CjPMIzyUeo=; b=dH9ftRZF/jXhSf1GMskHsXn4o
	MjR8NN/Ie/PWJK2jC8PYRIaziCVdr4jwNcg+hCjeyzX9t1zHhR4Pz8IrV5CTPe0uQSWgu3SV7X/Y2
	nxLTCo1qqOC1hq5d5PlRHv9O4khogknLzl8OrOwmQgCEYgNYATw1deKP4/LZydbyAcJ2P3pvqmrzd
	y8qzFFxfdyOEmT5kqhHlXHm1/gx2YDmArWv46OacNy3xMD+wiP1QouVUTtQRR8Xyr9QA8VvS/s7XA
	jHjEGTWVBYF6Yiz9mLZ6dGo7QxPJCbGJUZrV5fBpDSX/PAiB13LPnOp2SPCd+ftwvEpsHFHDRhx/+
	m1uaGDOtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYAEA-0006HR-EX; Thu, 29 Oct 2020 15:52:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYAE8-0006Go-RC; Thu, 29 Oct 2020 15:52:37 +0000
Received: by mail-wr1-x442.google.com with SMTP id n15so3349156wrq.2;
 Thu, 29 Oct 2020 08:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5rqiFVQb3qlfcy/RMXrG6KMOgOP9hKGgbNSh4Mn0ao4=;
 b=C+asKu+9N2YOq2S3u6F4eJLJJqqtq56odjCV97nyjvlKnRPgmAYDEPtrq3n2EX25Fj
 T15RMMjC1gvouhGPaBm18G4dlY+Xf12qMrcR6k/ck+RmwFVWv5MSYV0kH75lv0SuKJvZ
 CgB0lzAA3WfmHp+wIfkQ5lb73wPt8b0ZvxaoFflOgfekOd7ZZ+jDWuyQr/j6XGBcGGiN
 LySimvGqX0haxEc1kdU4LsPOm5X0KFBG9i5n6txDKbJcXV1R1nPnJ4dJjGgqqwD8hUJr
 za/8ImFkISW7hONm6WdSFgzu4Oy/+75WbQzD7fExc22wr/CbLc7dQKkt58mm1pCG1gpj
 lWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5rqiFVQb3qlfcy/RMXrG6KMOgOP9hKGgbNSh4Mn0ao4=;
 b=Qf6ENNjHF50P20CgzXcBtHEYznCO/ohWV5mQ50W8jupJQ40tj7eAToH5rJuDZI/Agp
 WJcQDn3QhBvQxSsMqskymeiNXt7EzlGH6XN8Ikyh3gIVPK3bAntkGS4GEzWVNazTRMMl
 woEfnd/BisPGOuodBTdEXu0aK6dOM8Y1pqesxRnfexYSG8Q7Ir+rV6BsScXKms2bYwXh
 pM6EIOvufM9o9pjJT+ZlKNM6H2MIeYvBZaWhIjR0Rj2LbNf3HPRZzhvNIIBgvh1qRWzD
 IY1rd9iiJTYOYFioelvbWmDNQLNvr4UXIqK1iiEsYLII57e37Ye8YY7mOvdlOLTrcARL
 QIHA==
X-Gm-Message-State: AOAM533XQRQ8pVd/0ttvEDsC2PqmlNo2k+F0XbOpq6r5Bpc3z9V7RKPM
 /b1N+rKnAv+p9QmvClP7uQI=
X-Google-Smtp-Source: ABdhPJwZ4rmQGi43QL94t5ZBRH464nJAgvWHhIXxVa5hO5m8A980n7g2tcfbVRAaGyma9qlQPXQoKQ==
X-Received: by 2002:adf:f286:: with SMTP id k6mr6541511wro.34.1603986756011;
 Thu, 29 Oct 2020 08:52:36 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id g4sm415538wmh.13.2020.10.29.08.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 08:52:35 -0700 (PDT)
Subject: Re: [RESEND PATCH v3] arm64: dts: mediatek: align GPIO hog names with
 dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201002163940.7837-1-krzk@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8f3369aa-ebb2-0e4e-fc1f-109e54d63b7d@gmail.com>
Date: Thu, 29 Oct 2020 16:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002163940.7837-1-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_115236_912719_D7442703 
X-CRM114-Status: GOOD (  17.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02/10/2020 18:39, Krzysztof Kozlowski wrote:
> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Pushed to v5.10-next/dts64

Thanks!

> ---
>   .../boot/dts/mediatek/pumpkin-common.dtsi     | 26 +++++++++----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> The dt-schema changes were applied.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index 29d8cf6df46b..351a1905a074 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -63,91 +63,91 @@
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   
> -		eint20_mux_sel0 {
> +		eint20-mux-sel0-hog {
>   			gpio-hog;
>   			gpios = <0 0>;
>   			input;
>   			line-name = "eint20_mux_sel0";
>   		};
>   
> -		expcon_mux_sel1 {
> +		expcon-mux-sel1-hog {
>   			gpio-hog;
>   			gpios = <1 0>;
>   			input;
>   			line-name = "expcon_mux_sel1";
>   		};
>   
> -		mrg_di_mux_sel2 {
> +		mrg-di-mux-sel2-hog {
>   			gpio-hog;
>   			gpios = <2 0>;
>   			input;
>   			line-name = "mrg_di_mux_sel2";
>   		};
>   
> -		sd_sdio_mux_sel3 {
> +		sd-sdio-mux-sel3-hog {
>   			gpio-hog;
>   			gpios = <3 0>;
>   			input;
>   			line-name = "sd_sdio_mux_sel3";
>   		};
>   
> -		sd_sdio_mux_ctrl7 {
> +		sd-sdio-mux-ctrl7-hog {
>   			gpio-hog;
>   			gpios = <7 0>;
>   			output-low;
>   			line-name = "sd_sdio_mux_ctrl7";
>   		};
>   
> -		hw_id0 {
> +		hw-id0-hog {
>   			gpio-hog;
>   			gpios = <8 0>;
>   			input;
>   			line-name = "hw_id0";
>   		};
>   
> -		hw_id1 {
> +		hw-id1-hog {
>   			gpio-hog;
>   			gpios = <9 0>;
>   			input;
>   			line-name = "hw_id1";
>   		};
>   
> -		hw_id2 {
> +		hw-id2-hog {
>   			gpio-hog;
>   			gpios = <10 0>;
>   			input;
>   			line-name = "hw_id2";
>   		};
>   
> -		fg_int_n {
> +		fg-int-n-hog {
>   			gpio-hog;
>   			gpios = <11 0>;
>   			input;
>   			line-name = "fg_int_n";
>   		};
>   
> -		usba_pwr_en {
> +		usba-pwr-en-hog {
>   			gpio-hog;
>   			gpios = <12 0>;
>   			output-high;
>   			line-name = "usba_pwr_en";
>   		};
>   
> -		wifi_3v3_pg {
> +		wifi-3v3-pg-hog {
>   			gpio-hog;
>   			gpios = <13 0>;
>   			input;
>   			line-name = "wifi_3v3_pg";
>   		};
>   
> -		cam_rst {
> +		cam-rst-hog {
>   			gpio-hog;
>   			gpios = <14 0>;
>   			output-low;
>   			line-name = "cam_rst";
>   		};
>   
> -		cam_pwdn {
> +		cam-pwdn-hog {
>   			gpio-hog;
>   			gpios = <15 0>;
>   			output-low;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
