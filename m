Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE15CC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 06:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFh97dSRDNqfznFeNWXlDnnw+ZiewGRvUxlIWQr15og=; b=XE0gbAu+ktwFdfmxlZM4d73F1t
	GWCBScnHsgZnjx7aLcW1lP9sMho0HB0N8mx0H2i2eqFKPbb38FXVLkptNhgQIEs3oKZfpCvZTOneL
	fXnZq19i8i03v6KRgo+ZZ543qJ8xozlV6xuHqbtiKsLcJLaa2SKVVJBp/YlLThz3dwl+qL7vZWQsr
	ENvIMor/7vTkjP+Mx2HZ4MfxJzaZOJlwp0cq5dOH9XGsKQRQWVumpW3lEjzyGTU2MT4D7DBTlhZhP
	vXszBwueX1HvMUre+D4fTlc8VahTXqSnXEmwGYiITtP4/Tv/jxgDY/WSnc/jqUgvigNE0F706XktF
	HrL9AY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXzu-0079q8-30;
	Tue, 02 Jan 2024 06:11:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXzr-0079pL-1U
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 06:11:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d4a2526a7eso10329335ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jan 2024 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704175885; x=1704780685; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NFh97dSRDNqfznFeNWXlDnnw+ZiewGRvUxlIWQr15og=;
        b=HcupyFmVe5zcPCv3tItdtJSQjbxK6pn8eR5GLcy8bYb1ASXQLrWgq7QhuiYISdn667
         k5yi18GdecgEkO/6ie1xSoRplagm5pOgwMLgkPhWDh6nc9ZBNN/Q2aZjy8vSj3pXu0cN
         cYvHTd0hNpZaPZmUvB9Hl6stcFa5NSbkjdzhfw6/Zi4QTjl9gdevb3nXh5NET3lT56nR
         ZY5cj46+v9Lfkw1660z7U8kWQkv3GS3igix/SRyUqy6ycE+2JYjXDmSEZkejeaiqjVYc
         NYSgz/pNWtjFLZUSKFY8Hdw5FJ41y2NydY1SxsZ5nzLjcgvLvjXsdP/w6mpI32075kKq
         lPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704175885; x=1704780685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFh97dSRDNqfznFeNWXlDnnw+ZiewGRvUxlIWQr15og=;
        b=Cp76d6O8z1LZYTOz7ncq38BWsfXT9jB2GtkpVy+XT8Tr3JefOnTJF3rqeywySELmcE
         M704z4Be7Hv9kgExpNWRt0n6CzNm+ZZ5mko+SQFy21BxZIDWZhU2p0ubPDXtvf18Sf/Z
         X6bKIzPGdsv7jlGj4diG29y7eoow2wAF3COyT5FRAsVqJsOHpv/TPAyd5KwlqsK/m1/N
         Lyf4sFZCLEmcqqIzekCLRkbG4RpnXha40aSA+wyVs/IlK489jPJVStQimTBMp7RUxeHZ
         mpdkynDTxsuxrWYIGc2ApaJxM/+efJbyAvXCQMscLBjczhYK47OLvrztULi+aPqBKOcE
         MAuA==
X-Gm-Message-State: AOJu0Yxw3cAolzRxrb5DUlnN/wqcwoOd2LBP8FWUDBCSq8+XPg04/qAe
	Ge31ag2Eh+eShnSRYf+9duDb1VvOiTEXZg==
X-Google-Smtp-Source: AGHT+IGMG9kgP1ay8/XmAdvbQ3f25qeBNjP26A9CY6DqKapdjgwQVVolkoGyVz+bDEsj9mPV2GA8Cw==
X-Received: by 2002:a17:903:120a:b0:1d4:9ac9:eab4 with SMTP id l10-20020a170903120a00b001d49ac9eab4mr2420060plh.95.1704175885729;
        Mon, 01 Jan 2024 22:11:25 -0800 (PST)
Received: from localhost ([122.172.86.168])
        by smtp.gmail.com with ESMTPSA id b22-20020a170902d89600b001d4b46d8c10sm3389640plz.66.2024.01.01.22.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 22:11:25 -0800 (PST)
Date: Tue, 2 Jan 2024 11:41:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: cherry: Add CPU supply
 dependency to cpufreq-hw
Message-ID: <20240102061123.frvwltggqqh6m7pm@vireshk-i7>
References: <20231229212853.277334-1-nfraprado@collabora.com>
 <20231229212853.277334-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231229212853.277334-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_221127_500310_10970F72 
X-CRM114-Status: GOOD (  18.74  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29-12-23, 18:28, Nícolas F. R. A. Prado wrote:
> When the mediatek-cpufreq-hw driver enables the hardware (by
> writing to REG_FREQ_ENABLE), if the regulator supplying the voltage to
> the big CPUs hasn't probed yet, the platform hangs shortly after and
> "rcu: INFO: rcu_preempt detected stalls on CPUs/tasks" are printed in
> the log.
> 
> To prevent this from happening, describe the big CPUs regulator in the
> performance-controller DT node, so that devlink ensures the regulator
> has been probed and configured before the frequency scaling hardware is
> probed and enabled.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index dd5b89b73190..505da60eee90 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -502,6 +502,10 @@ &pcie1 {
>  	pinctrl-0 = <&pcie1_pins_default>;
>  };
>  
> +&performance {
> +	big-cpus-supply = <&mt6315_6_vbuck1>;
> +};
> +
>  &pio {
>  	mediatek,rsel-resistance-in-si-unit;
>  	pinctrl-names = "default";

I think the regulator needs to be mentioned in the CPU's node and not
here ?

-- 
viresh

