Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3787C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7512261221
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7512261221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmtgLsYZ06Qt8RYNWnIlKHXL8iYaIkBTtKYwUtHNnPQ=; b=Go5C3qeBZ0DCIz
	qLXggUi1mZ2EkwFy6hjdhR4afwc7aPiieygAyOdaCDlNV1/2iDGADX+Cxc6aANy2BWye1tH13WpcR
	Das1iiyVkUxKtiafnHsLdyszIElhUtGrz5i40InzmMO8yYPPpWx+clpnP+zN68JFhQQ2RE3egSI5m
	/dsU0/5BAh6hnshhBR89uFKM4jT7QnTsIGfMgxKQymGz/hSq3eXo1+DpDREIrxyqoKkfcjv3NWS0m
	aqJtyVW+mMETkdEWX5rgxYfha5SYq+lcPLLJm2s6NHXDzGsGJDlW5n+HnQaQPpzcTyJV+Rg7e76Cc
	Eg/WBUTCeIsQMfRiYQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnOoU-005rSM-OV; Wed, 17 Nov 2021 17:33:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOoF-005rO1-Er; Wed, 17 Nov 2021 17:33:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2718776wme.3; 
 Wed, 17 Nov 2021 09:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IljrZVfmkKHCxYMQbSMY/43208uZSuA4ajkMssOxNXQ=;
 b=UkX9HvcjswTCpEGvE9k2l62gZ9bzRtTGZnJ+UvXI/wXyMFPZYVz36qYAjECtfU2hHO
 h+nXjrXpvJ9nMIQWwkomKiFnAW5JUnzts/f09XRfzqCGfzPImZWPuJtAEvPLYOKbzReJ
 Tmsq0881b+2g3bYZF/45cTHRomS1zLKddwYP61ZJw5Cyg+s5itiexEkgO2U+k2qLx7+D
 Eoy/U0709VyJjvYcI5U4HYNpjhPJHwqXnPeO35SwFyeSKbswMxHiEMVLqNVWxRWNnlr6
 HySzjGHuo+jWsZT6Ja8qG9ATuZ4n4R8e2KqnTvsm9rJErjmzyXoSpcveecInY/4NVNWl
 YsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IljrZVfmkKHCxYMQbSMY/43208uZSuA4ajkMssOxNXQ=;
 b=EshgdmYrPNvHXsh9tpqrU3LTQwWST0vNQ9GZCR5Oi7qfKP5mjTJ0HJkAPFkNRkK3ST
 TSmYM8wAnYn9V9a1FPC7Npsb17iQ4qC/5Oq0NFHYqdI++0Y7dkYseHq88f+5WwVrpfOF
 qMmaZc1b1nOr1EPNAUNSRty6w34UVIn9/WHiSZsA3DarAl3Fhu2BAMOAyjCJwexTvdHg
 UXYOzgkizWRvsMU8mmW1wGmahBh5H28om+qJMpGg1gjXvVwSVnmIswaPL7bULZY/whj5
 pcy8Hc7lAIn9gibXyP53BoiY61DBl0WvMS6CCwQyTbdzdOmiOD11WPFGPLvcNpBIx2o2
 mh3Q==
X-Gm-Message-State: AOAM531dVHpKN2ihrrdAXlUjgkrEDDffH0SSuuN8U/DYwxENoaAAmNaa
 /MXA3F0DMikcL5/EDNpQDmU=
X-Google-Smtp-Source: ABdhPJwYSeSfo4vw2gAZcvsGMBvnN2B4NTBwCxzZ7Q//nD5+9c0AjD9FINSwBsfYdYXqAK9BJssh/g==
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr1657801wmj.14.1637170402185; 
 Wed, 17 Nov 2021 09:33:22 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id l11sm474771wrp.61.2021.11.17.09.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:33:21 -0800 (PST)
Message-ID: <03de9880-1f1a-b07b-6ec3-279945e08cea@gmail.com>
Date: Wed, 17 Nov 2021 18:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] arm64: dts: mt8183: add dpi node to mt8183
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211110192417.4177741-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110192417.4177741-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_093323_542646_23514676 
X-CRM114-Status: GOOD (  14.86  )
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



On 10/11/2021 20:24, Fabien Parent wrote:
> From: Pi-Hsun Shih <pihsun@chromium.org>
> 
> Add dpi node to mt8183.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index ba4584faca5a..7c283c0b68b5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1443,6 +1443,17 @@ dsi0: dsi@14014000 {
>   			phy-names = "dphy";
>   		};
>   
> +		dpi0: dpi@14015000 {
> +			compatible = "mediatek,mt8183-dpi";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DPI_IF>,
> +				 <&mmsys CLK_MM_DPI_MM>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";


We are missing the output port node, don't we?

Regards,
Matthias

> +		};
> +
>   		mutex: mutex@14016000 {
>   			compatible = "mediatek,mt8183-disp-mutex";
>   			reg = <0 0x14016000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
