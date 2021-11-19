Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E08C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 10:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE5C61AE2
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 10:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DE5C61AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJt7ihRiw9Zl7QDsV5Y557V6cjUMhRmxrV44igT+1YQ=; b=UGV9QtCYAKDzlm
	VJjJlHDw/ElCwgaHmOEqab04Jmft+uJn+jim9jK88gyMxtTEC6geXIxCySSpLWu49zWxGOKC0lgig
	7gJyS1W70P6+xc67BalM0kwrNXCJ+943rry3cWaYm34u41m7jd7zhfne9PfYcc4QJYVjvPBLwgrS1
	TitaKhSc7gwU9s7R19Hmcj18jyD9oflrli0axl9hr7S2Ze+C01S+XqEiIbnAxCsoV0GHbsSrBCQAs
	tvUlAt2W8p+TgkmF4eOoJkmfvGQDXc9Tc6LHXe9CPYmDNp4K+KXlsptJIawy78yS/YAheyTJy7jd3
	ZQi6KAkXs4E99yFiaOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo1Ep-00A8sq-68; Fri, 19 Nov 2021 10:35:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo1Ec-00A8rR-8n; Fri, 19 Nov 2021 10:35:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so7128355wmd.1; 
 Fri, 19 Nov 2021 02:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4K1D4DrJON9XEGXO4DJYRPRWAPvMfd+3qa5AuLyQzSg=;
 b=U0/3OwJVjRpy0Bytju6lhiz7QW7kaIET1ObODqDPjajxPRr66/d60fmWnTJFEAZQF0
 PgQ4VpvECIy3O+931vZV3g5NUnnqCISih3klv5IzHA8y0CAbC1+hlITYvLD8hPdu9W0W
 zzMWfXQtoaZW1cJ6uN3a5/YQJZ+r6i+Q898xdoOjMpREnqhNz5O788MIdWMRRoLrq3o9
 nuK2vxq1R0mybeWOdBrOPRc0pcN361q8XlaqzrT04tqmtNbDX5Y165ma8Ab7N/PdNDAk
 5B2bOHtwJVZYRbajSMHkWEul8MDKemY6xwM62L/ZMJG6/Vcq9J0rKFwSwVkhotQ5avMK
 3iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4K1D4DrJON9XEGXO4DJYRPRWAPvMfd+3qa5AuLyQzSg=;
 b=xBMj0LWNtrm213aNfH8gecfnGx6rVBb9Xvot1PDw+uwI2Iam6MduZrVdgUEOLtGUUO
 +tiHCZmMk/lpVUl6POd67DXPHUgjkSWcDfKTgRJMjR17fZJMLlXhS+ZUTZkofPEo9C+B
 /E9rE0LNv5KoW2jIwCLchQXg4+xjs1c/VvqX0iGdbe91BjG8ZixvFpk4keNGmKdzOVlS
 FkVy/4rbfDDgfnLONGJXXVsMrEmreuKln7i/E9r6q2D3O13mOvnHUan3PonPIDb6XsZL
 715LexG+CFEMeCGuYzqoc0G00dPDscWznoB+kqUp2MD8FkQu0oimarSInoMY/vxljoRV
 mCEA==
X-Gm-Message-State: AOAM531zisViQsoRA2eQzPPkW+MUJCHJzRZETP+c4VunNVWkH7qzgQl+
 nV4w4oRZA7Wn6aND7eIMZu8=
X-Google-Smtp-Source: ABdhPJzWWYFH9JS52iFHdZJ9xlqlQCpCY1hzofwkw862hENzMEfpGecC4lXM26OsahpOKBHAUeKHLw==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr5472780wml.135.1637318108493; 
 Fri, 19 Nov 2021 02:35:08 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id l18sm2551048wrt.81.2021.11.19.02.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:35:08 -0800 (PST)
Message-ID: <e17a2927-3b81-6db8-6d8f-7147d673e977@gmail.com>
Date: Fri, 19 Nov 2021 11:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8173-elm: Move pwm pinctrl to
 pwm0 node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20211102144224.457446-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211102144224.457446-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_023510_350103_DBA085DA 
X-CRM114-Status: GOOD (  14.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02/11/2021 15:42, AngeloGioacchino Del Regno wrote:
> The PWM pinctrl belongs to the PWM0 node, as it's strictly pwm related.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

both patches applied to v5.16-next/dts64

thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index e666ebb28980..f292ca459a9a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -27,8 +27,6 @@ backlight: backlight {
>   		power-supply = <&bl_fixed_reg>;
>   		enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
>   
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&disp_pwm0_pins>;
>   		status = "okay";
>   	};
>   
> @@ -901,6 +899,8 @@ pins1 {
>   };
>   
>   &pwm0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&disp_pwm0_pins>;
>   	status = "okay";
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
