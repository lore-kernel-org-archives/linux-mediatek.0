Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDB8CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cP2dHj6d2ZZxQr7eLgquWgY/MJjFzFp7m1ULBgCRrE=; b=32F1IPPd2a3CrPsYKEn0jEXYn1
	RrY5wBrGdsNt9eUu0OPfdbXmzwLSxUEeSJ7zTwjlRmibLMRwCyhkJtsqDE9otqOVYi1fU631KjTEp
	hZieNUg5MCk0VTeYOAHcemNNh9E7udBy3Nf/flJ99V08pS3oJ8crRKu9snI9i0Aezrin14+Nrmmli
	EvXKtuB8noyPIFT+m3obUAc+RMLY01pxKjJmSQmbIPuZUTuKfWQnMauElSHlPd4jgAeXr9X4htkQH
	gfSn2pwp38sLsseNkvd1p8tg3CyJ9YxAroFj617RDGwJLCX7Zyn+nkZg8uw1am6j/9LPV9gNSuP/v
	KnamzezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9Nn-0000000Ev0K-3JnN;
	Mon, 02 Sep 2024 15:54:23 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9Nk-0000000Euzi-269D;
	Mon, 02 Sep 2024 15:54:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a86910caf9cso936035766b.1;
        Mon, 02 Sep 2024 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292458; x=1725897258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4cP2dHj6d2ZZxQr7eLgquWgY/MJjFzFp7m1ULBgCRrE=;
        b=BSSY52yBu+UnQ9pDaJwtbsPY5sqZNHfBPwpGa7BN6UBbSQuJVCjOUit3ztAHbMqlFH
         MG7AoINzWOWTgLn75vT1FfpRXO08EWgfdVMwCM045T6d3C/BfIr5kP6D9w5nu9N2c9DW
         WMJ03Mqn9/lcDM0drdoD+bVyss4L913Z4Wr+cJ6lxZGd7d5FfMb9v093rLKi/UFn1fCu
         PAkT0FX4JdDJxNjcHhEMRCd5vsBnHmX3TDnUdBZcIYXhOB3p0q8MGazMZBi4KS76G3RA
         FlFmi3yE61Je/sUe73WoU9fOIZ5ZRcPYShFHPxJTAIf16IdEWw+/03WyD9gB1D9KPAs0
         +6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292458; x=1725897258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cP2dHj6d2ZZxQr7eLgquWgY/MJjFzFp7m1ULBgCRrE=;
        b=Pu+LuC09u3yhBfYToiL3PM2mQ0GB5q4S4f4FNNlXvR1Qu/bD7NDVAOKiFzI5WwJcfR
         lNrQtGigKKDoCooH0+8wVoZYV3pSCzAIb65I2h2mLE3btpNUAzCrDXOHij2RVjE9sdxM
         83dVSOmaTsxh3LTuBWiunA4Xfd6c0eWe8IBejGm1oZRmaFJsu74ReLZxsQQIdkjzGmj8
         6dt0td/Y4UOsL6TudvUBxs1GB5f7QvxY513LF/r4WQ2zhJVbsIPCg+XllAKA5J8MefL5
         Qlay53QNveyrSAfpd3XgJxg8IZ43NKkFBaEwuxkQzSWqd51vt7w+ytD3Im6jGPNNba/p
         ZFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNXC/bFmGIbYTG4EO3le9wWkYU/BXnG8oy4qgrZU8L3328hg06Rp7OwSNZivqfviNlIDNabvvgDJr3gFejPCWy@lists.infradead.org, AJvYcCWOuewoRMRm/CwgbOLjssXxtWZQ4SrmSAwe0TEKN6DKTwintZoYv1fQrZPDFv9jny6pe6HB7YmWnUltNrC07VI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQnS84OOILM5Siw7/E2sYOyrFGUwblROn+4SlppC0Ht6Ux+I53
	ZDW2ENkbhsekl6c/eHeoyOmkr7pvFbJJ2RMU7S/rNbbBBOyIHAQ3
X-Google-Smtp-Source: AGHT+IFjeDTiTBRfvpDJVE9X0cTiZpwVlLd9lMbUR3Mi8Y4e8APmznCpbyZDjhrj6mS8oiSJ7snFvQ==
X-Received: by 2002:a17:907:805:b0:a77:d9b5:ad4b with SMTP id a640c23a62f3a-a89823c9ecbmr1476806166b.9.1725292457920;
        Mon, 02 Sep 2024 08:54:17 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6d88sm576946266b.151.2024.09.02.08.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:54:16 -0700 (PDT)
Message-ID: <9649e485-1f46-4dff-9dac-9bd13740e558@gmail.com>
Date: Mon, 2 Sep 2024 17:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: mediatek: mt8186: Add power domain for
 DPI
To: Rohit Agarwal <rohiagar@chromium.org>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240830084544.2898512-1-rohiagar@chromium.org>
 <20240830084544.2898512-3-rohiagar@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240830084544.2898512-3-rohiagar@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_085420_575624_AAE9E10F 
X-CRM114-Status: GOOD (  11.95  )
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



On 30/08/2024 10:45, Rohit Agarwal wrote:
> Add power domain phandle to the DPI controller in mediatek
> mt8186 SoC.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index caec83f5eece..85b77ec033c1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1843,6 +1843,7 @@ dpi: dpi@1400a000 {
>   			assigned-clocks = <&topckgen CLK_TOP_DPI>;
>   			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
>   			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>   			status = "disabled";
>   
>   			port {

