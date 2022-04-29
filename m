Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD34C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ybLneqtJZo/8nBxJaxCB9ZuoVhz1teHxK+pbV7QRt0=; b=H6jzLJAiS9xLgm
	AQwpatb094/L+9AHnS4qWZJj75OwRswxh/J1kuZ4ensCDsy8V0DaBkOf+YcGXoKaXHmVg/+oJ1RTe
	Kxn0hCZvZe9+75iDkUrutCBfow9AgKjrx+9yIvVyDRhhyIY5sXJs22dU6Pqr6lz3KDcex22DXfzNo
	mvzV69t60PA38uwDemJwZPDTlcrRtUDnF5M5tI2F7qJXLQPgkaGcbj4tJgdw1VdiRY40cAoT84irm
	g04IKXkTd9FQEdxs9jS+fHyjZXlqtcJmrj9e7FvVL4UIScsqaj4Zk49b0w/0S7G+JbIg3w3NskzYj
	RucjxXMaKDJE2xZ8HMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQCo-00BHc2-Hx; Fri, 29 Apr 2022 12:58:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQCc-00BHXM-35; Fri, 29 Apr 2022 12:58:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 l16-20020a05600c1d1000b00394011013e8so3618923wms.1; 
 Fri, 29 Apr 2022 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mk6QBfK1Qs6MGWhspJvjaQsz3Ch5Q47MYj9GDufUOYc=;
 b=S6dY++xHXjw2/8EguPozN/Se9x38PJjiTyNnwzxquzIhz8Gx4h+yC6lRF612vYZFLr
 zG7z+pjIVhBO7fSgqdELefDFac+3CmRF9BERPLi4EWO0iw91I2Qs1X6hQJueuDbjN0n0
 w+C8uHRbawUwsRspgmWu76ZNc/OmVJOZeXiUL4UjHVllXgh7PPkJgj4mTKDsq47muT9G
 rZTuyYdJau3Qub8fTbS5UE4EkcxIDdFIIiFWRsQ4uvDURf7adooquFGvFWOti5++vBmK
 H+0zcl4ZQmJoAANULUX0PXB+Mb4xOne4VYjzq54AMfXjZiw/3Huut7zFFwCgkvEKZZ0V
 24fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mk6QBfK1Qs6MGWhspJvjaQsz3Ch5Q47MYj9GDufUOYc=;
 b=hJXa3lB0FHSSBrTrvFIOLke/1skCw4AVDDX3l6UcZygDRCEtphv3y7sIdFw/RdoX7l
 n/MQ3Vl/ruok/NTpF+32j42Ukp2O01HtCxgOYMg52k3SwVfrvhKovM2m8EQjRci5A+Vx
 ucwUDSrs4Rrp0aqEqEYU8GniuAvLAiPna9f4g3xkcsDKy/YahYtlKKsEEuFf4ZaEMzbX
 QxMhOuyaxtlF16fn7HhpA08dasmANG/TkbLOKyOwtvFL4WFMsjWDKFXT2+2t23GJ41yF
 R3EtahDVPPAsXDqrcxcvgTKmPSyls18vhxi5HCwD5K8ffSH0M06qDXSr5HsRA3PM3gwN
 J15A==
X-Gm-Message-State: AOAM530bbJtfgvS2+LnjcSutAKfh79fD/IplV6adsIsWKsNO/R2yPGFU
 VZjZXo7kVDdk786urx52rMweels26mIlwA==
X-Google-Smtp-Source: ABdhPJzSZc8J/7hX7g28rcH3m7+CBMc8qNeyNM1KSrCrZaeBaZnnR3MnMgNB8ZruHSLCdWRQueVl6g==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr3110658wmh.59.1651237106322; 
 Fri, 29 Apr 2022 05:58:26 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 c9-20020adfa309000000b0020ad4eae9b6sm2445896wrb.100.2022.04.29.05.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 05:58:25 -0700 (PDT)
Message-ID: <a9300186-07f8-30c4-b5d8-e88f6f0ee629@gmail.com>
Date: Fri, 29 Apr 2022 14:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mt7622: specify the L2 cache topology
Content-Language: en-US
To: Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: ryder.lee@mediatek.com, daniel@makrotopia.org
References: <20220428225755.785153-1-rsalvaterra@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220428225755.785153-1-rsalvaterra@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_055830_182855_1D715F6A 
X-CRM114-Status: GOOD (  15.87  )
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



On 29/04/2022 00:57, Rui Salvaterra wrote:
> On an MT7622 system, the kernel complains of not being able to detect the cache
> hierarchy of CPU 0. Specify the shared L2 cache node in the device tree, in
> order to fix this.
> 
> Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 6f8cb3ad1e84..3d6eaf6dd078 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -80,6 +80,7 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			clock-frequency = <1300000000>;
>   			cci-control-port = <&cci_control2>;
> +			next-level-cache = <&L2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -94,6 +95,12 @@ cpu1: cpu@1 {
>   			enable-method = "psci";
>   			clock-frequency = <1300000000>;
>   			cci-control-port = <&cci_control2>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		L2: l2-cache {
> +			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
