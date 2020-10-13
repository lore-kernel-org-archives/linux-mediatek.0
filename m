Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D531C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 06:01:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE343208D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 06:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G0qd5PXp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vRItQlaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE343208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iyHH8f54H16S2luUqa2eNV89kiPIfNVIcHZ31FDFrig=; b=G0qd5PXpgFORV2Dpg8Fqcj+ii
	EZb+IFP3+tJcUVqZEPe4GL0MBnpqL4hSP2qi76NAkZWNfTXsz1cNqOWMGdTidIhoQHnTRe3WL2Xnu
	CFubGuRZ6vBgR1JgT6gQHnL/RrGS1kDyaG8TZF5PsXsezcGCI34xGEGWGqD1INN4zH+v3eHV7l78t
	TxKo+aYOFTvgF8Bw7HR7Tmn3x7zyXnlpZSMEoVKUIdBypJjOLHccuFd1Oyld5r3vyn7TeLEDLzGBp
	pyS4S8/RQODU03MOXOi8QzpceLcO0gDWLE0WBa6V+QJWU75KI8LVYIh+OETmxWV9FzV1TBI74YfRp
	4ERJmuyIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSDMv-0004Ji-PD; Tue, 13 Oct 2020 06:01:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSDMs-0004Ik-IA; Tue, 13 Oct 2020 06:01:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id f21so19724804wml.3;
 Mon, 12 Oct 2020 23:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UXm+TOWOBr2aV3MJtQ1i94fOaFTW9PgytBEAE9CI8Xg=;
 b=vRItQlazGVVLD1IMqbPCE/lmjR+TjxXbb3QKrDO932MdzkyEi2deyMHQlXoxJoAYGM
 wiFbQ+YX9nIu4glSWCf2QkaoSRiwI5kj8drodgoVzspgSi4o1aiPTUEqolZKcTP2+NXd
 uxTVD3ModhFjbNQXYUxRaBCwiNZXL+gsFQYXtdQrQwhG2Wh1n3x8UOzYKjeH3/HqB1QF
 KnJoF05++3m19ngOYa9c1YAYkDJI9lzLcLSI9ahR9cpZJ0s2b0XqgKFysB7xZOlNiymF
 NeOZKv8oBN4sakC/A3hmkiZE/cPTXSXtd9r8og1mVkw9is6bY/0GOZrIFUFVHJsmKSd0
 K5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXm+TOWOBr2aV3MJtQ1i94fOaFTW9PgytBEAE9CI8Xg=;
 b=qf0CSuQRoWmI7D3rnmQKTnrehUJ//eHMeC7fDUcqbcJLpho66W4ZODZnhO3xZWVdny
 dDHEIqMEL9+etKKL/JvaHcVOG080GGVCHuOPA9KwTz4GczbReO6dEpvBkRgYsTvinKeg
 ge+jJDwpU0dFL/rvQmpXByXlUWlFIyxqgO5FLo9XPdKCfGyTV7D+IvxBZ2zQdq+09/mf
 e9wXxli8lp1eNp5XRV5OofBzfNNKr6VAF9KQe8chQn26Rj4cBr7HZ8fiCz803KO0w2fL
 dQJtHCgrJn34om8IWZYMU0AoIOP4waGjqkWSDNB0Kv6v30y3cNgPv8oXKfKO6v8+GECE
 8u+g==
X-Gm-Message-State: AOAM533ddyU+FGhXYxsrXn3MtLDNMH2phWftHhlBUI+RMnk2exhwhNwd
 d7ZVD5L+yLeS4jslNjBhWC/ytYUUFfJbrA==
X-Google-Smtp-Source: ABdhPJyRDCZng1TxC0GnuZJK3LAgJuoYiA0N8RXGvN3MjAenWERbNXs+RAhwOTfMc7sFZkEZp4WVeg==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr13802429wmh.21.1602568861653; 
 Mon, 12 Oct 2020 23:01:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id f7sm3525515wrx.64.2020.10.12.23.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 23:01:01 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: add auxadc node
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org
References: <20201012205218.3010868-1-fparent@baylibre.com>
 <20201012205218.3010868-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <81a12664-639e-20cc-8b49-6bcb53822a3f@gmail.com>
Date: Tue, 13 Oct 2020 08:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012205218.3010868-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_020102_634080_1E5F204D 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: jic23@kernel.org, robh+dt@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net,
 knaack.h@gmx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/10/2020 22:52, Fabien Parent wrote:
> Add node for the auxadc IP. The IP is compatible with the one found
> in MT8173 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index 89af661e7f63..943c426e9aaf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -470,5 +470,15 @@ usb0_port: usb-phy@11110800 {
>   				#phy-cells = <1>;
>   			};
>   		};
> +
> +		auxadc: adc@11003000 {
> +			compatible = "mediatek,mt8516-auxadc",
> +				     "mediatek,mt8173-auxadc";
> +			reg = <0 0x11003000 0 0x1000>;
> +			clocks = <&topckgen CLK_TOP_AUX_ADC>;
> +			clock-names = "main";
> +			#io-channel-cells = <1>;
> +			status = "disabled";
> +		};
>   	};
>   };
> 

Any reason you don't enable the status in the pumpkin dts?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
