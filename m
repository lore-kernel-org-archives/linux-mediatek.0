Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8A0C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1KMg1Gh4zz7JnBw0046XM2DKaYNxDcHqxWVJX30Ru0=; b=seSB7aMluZa2Ft3EoYrNcZwEbo
	ylr8oYa3UsLswRjbXuOx2ltroGWmduPq6kuiqP/im4XwkXoKZaSwyVF2hibGRMivRITrVvbl99kMe
	SEqK0zZGUNX7QEI5BcBYHAz37RBcHGF0uJ04NQp2ssulCQaPnmmNFNXng3SQWRXEjNUrIt9kY30lW
	2xN5+EMWnSazll2Zku9Lv4GhEoiVhJ6dI38hEUVZLSt+EG1KKd4zBeo/hce4n59KkX1jgFrLdr27o
	s+zdjIMRm3O5GSkSmEtXHJz8A2mARgspWfQ0ee6sXb3bWgPrrz+/rlQRQDwbWO+TmUi2NLZhzA0z/
	u2DdjxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ea2-00AtiX-1h;
	Mon, 29 May 2023 15:14:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3eZz-00Athf-1g;
	Mon, 29 May 2023 15:14:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so35029045e9.2;
        Mon, 29 May 2023 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685373277; x=1687965277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1KMg1Gh4zz7JnBw0046XM2DKaYNxDcHqxWVJX30Ru0=;
        b=Nh5o4eUQPvEkj8np21rWFW592NTi/HveYWx2/MbveBUkmHmO2cKIDGvAcQa0aX+cDw
         A0jCa4ioo+hFHvLfG1glTnwtJjTMP05sj5R75i/OFbkMvv9MA+qETGFpyU/vTQUeGVR6
         p7XWeX5xCLNclglpwxjBrLCPaDfRAu4LRC0nhGk3WSdgs8qAXK3lmxTxLeyKtXJhbsx8
         O/OYr2tuOEBQr1ydBX9lP8PjSmFRJLm8lptKzAiHaE80ryLS1pzEEMf1wSDnQgGBWxBs
         6uFcbKolwHZp330okeIrE3IJIx37a3PA8osXpdI4giCngUBK/9yG+Z7cSGQpM+nMosth
         kEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685373277; x=1687965277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1KMg1Gh4zz7JnBw0046XM2DKaYNxDcHqxWVJX30Ru0=;
        b=M96qE2BF/9SlwEIb96Jol550DYDGg3uE35/jEu+eMDpQPKCFP/UkGImpD1KIJ4Jk0I
         c4/S4enRRw9RCUodDTNuOQtsuY4BK287GLRRiG6Z2hp1QbyrRoSF4zALsDDe2N+c7AwU
         2kXPMNSwGxgm6L4zW+WJm52drbs4qB6bEMVIUc7nWitODty/BNTCCH5ach95g6s8H2OL
         aYUuwCh7cozRKtZNEUbpG6ed0AkpIg9yhL0PKxPU63Z3m4Xl2aLpcusiOn2747AfY46u
         s0OYkgUxIiLywCGlSlXtwRiHfccM48jer51HGJ8Oc20gt61l+X7lBzze7rrz75FrLJ2B
         fnGA==
X-Gm-Message-State: AC+VfDz5fjQxiSuIQFs/RGgaXNUIhlyvDBceeeMaOwUVeBtl1BIUHNKP
	BETPiJObXWuy4i9Sc7lCzus=
X-Google-Smtp-Source: ACHHUZ6xoIrct99/EDij7HwB9El8wTsztw/AS5YvNdVtO4OP71ye5SlHvavzE7cclIWQG9ZWOc1kow==
X-Received: by 2002:adf:e592:0:b0:30a:dce8:f8b5 with SMTP id l18-20020adfe592000000b0030adce8f8b5mr9054514wrm.58.1685373277175;
        Mon, 29 May 2023 08:14:37 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m17-20020a056000009100b00304adbeeabbsm217867wrx.99.2023.05.29.08.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:14:36 -0700 (PDT)
Message-ID: <063c425d-c6da-3e03-0f52-2cc9288ba4cb@gmail.com>
Date: Mon, 29 May 2023 17:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: mt8195: Assign dp-intf
 aliases
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
 <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_081439_555642_1F625810 
X-CRM114-Status: GOOD (  13.53  )
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



On 24/04/2023 13:25, AngeloGioacchino Del Regno wrote:
> Assign aliases for the primary and secondary dp-intf IP to properly
> and reliably enable DisplayPort functionality.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a44aae4ab953..b03a42fe27a6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -24,6 +24,8 @@ / {
>   	#size-cells = <2>;
>   
>   	aliases {
> +		dp-intf0 = &dp_intf0;
> +		dp-intf1 = &dp_intf1;
>   		gce0 = &gce0;
>   		gce1 = &gce1;
>   		ethdr0 = &ethdr0;

