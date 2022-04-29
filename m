Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D05C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSd/XDDdayvMR4FeckVaXnp7x/GOPpvVVs0Kk93diks=; b=4bTcVm9O/lqpPx
	DbfdHzJyL0CT5QvzVH7QpSgNsORyrsB0dSkHDK0LlvSQ9N6G2CU+h9WGZQwXHa342/KtztWJYxLFW
	HqDyK6yI1IOUW5Pbaxl1jqGh5jaranr1Nh2RbHzMKL8g2wQYyS2fHIbCfk8wBUpnCiBaIU1V/q0OC
	svKOTfOuZoUEWzhpoyt8zy1CE8UyNChIPjQ1CQKBpIhlWUepGwYEoJQx4PSGTULWn+02zXauzVFrV
	8J0nPjBKs8vbhyiaVfB4biyDMaEZW8+oUtOAE3mUDfhVIlMRBALQi+7Ix3DC85PEoElMpooiPghvr
	vUFwwXR7PiOzT+gMAXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkPFr-00B3EX-75; Fri, 29 Apr 2022 11:57:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkPFW-00B37I-TY; Fri, 29 Apr 2022 11:57:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id q23so10491773wra.1;
 Fri, 29 Apr 2022 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zhkPJZ5t7XS30nMpTj6bbXYcVhUfzJ6aKAQ3lOWd/GY=;
 b=nGMih1E129wjT8YxcuJjbbIO6kan3qaZU3FoAzN+SXh1WnJJeUvOsIrThuW7kchSp/
 P50XSKfkRWjPwm7BX0Lt/so0I6DiTARr9NRdByEHAScgigM6aAqLbziifarR9djETsd2
 tYs5eCcPnlOuRNp1OdJ0nMXpAjPYtQ4t+Hu0Sq6hkZ+l1zp3SMdAlDN++L+RjM3bA9Mt
 qPTUih40eH+pmIVllSKcW4UHSYIHWiaRIlkjKumRV3XA5Ix+0uV+mlI7bsfjIU4Ya4Ea
 J9b4BUNHvCptkdkXmvzxQQ5TZBABXB86XRIEBkHiJ8Utye8FRgGui3zaIF23IPcZyT/M
 oY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zhkPJZ5t7XS30nMpTj6bbXYcVhUfzJ6aKAQ3lOWd/GY=;
 b=z1rlc6aFuNVrsg0IN29c7P3Z9ES/cUi1XmXi8RSB0wivXn+7iPv4kW0N0XP6ZOr6fr
 f9NuCGVYkHrYGZafal1A21E9qkPy6KqPCCgYICZUZYy1EstkHUZkB2l2zu6wmKe/1Blf
 TZUir0iwLK53rKtAPMmcFp5Vdb2f6yRFpXYqCgwInaYrvtKTzp8HLJEXowkfsv8jXybr
 xpXZUT1GOODLcBeVngL9wzzjuZp3U80N7MdEBeQUoH7+cHE5UXJtF59h4+nuyVdItNLB
 8qF0r0ngLqKxmy7VlM+21kfo80uAM9SHByz0cQ/PcrS2wo41RVbg0XcNva3pp00RdLJM
 COiw==
X-Gm-Message-State: AOAM530uyKSl8BcUySq8URMx2k4UP/zUYIo1nhdCYH+F/cHDGZZmhJQv
 E12J67BDjWjC24JvP5eBEtM=
X-Google-Smtp-Source: ABdhPJxXcg/TSEnSe3oYHf/l5nfkx/75A11A8wZ2bFw/fGOPv1y0qTM6UjmtOK5SSgG/4kvRt4DycQ==
X-Received: by 2002:a05:6000:100c:b0:20a:c68a:e9a with SMTP id
 a12-20020a056000100c00b0020ac68a0e9amr30552315wrx.314.1651233442973; 
 Fri, 29 Apr 2022 04:57:22 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b00393fbabdddfsm2518618wms.36.2022.04.29.04.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 04:57:21 -0700 (PDT)
Message-ID: <91d8eb87-adf0-da62-0c7b-dbf94442f535@gmail.com>
Date: Fri, 29 Apr 2022 13:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mt7622: specify the number of DMA requests
Content-Language: en-US
To: Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: ryder.lee@mediatek.com, daniel@makrotopia.org
References: <20220429084225.298213-1-rsalvaterra@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220429084225.298213-1-rsalvaterra@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_045727_037881_DA113929 
X-CRM114-Status: GOOD (  14.63  )
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



On 29/04/2022 10:42, Rui Salvaterra wrote:
> The MT7622 device tree never bothered to specify the number of virtual DMA
> channels for the HSDMA controller, always falling back to the default value of
> 3. Make this value explicit, in order to avoid the following dmesg notification:
> 
> mtk_hsdma 1b007000.dma-controller: Using 3 as missing dma-requests property
> 
> Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 3d6eaf6dd078..5551f004945b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -924,6 +924,7 @@ hsdma: dma-controller@1b007000 {
>   		clock-names = "hsdma";
>   		power-domains = <&scpsys MT7622_POWER_DOMAIN_ETHSYS>;
>   		#dma-cells = <1>;
> +		dma-requests = <3>;
>   	};
>   
>   	eth: ethernet@1b100000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
