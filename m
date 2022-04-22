Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FD0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrM6rDyTuzi21Omr5hILGCYB/mmUwsTtxM6IoAB/F7o=; b=20QWW1AKHUrZpp
	w0nXjBtZL93S8Q8SOT8LTAlU9dg23lFkXG1CstoPd6gVT/uLgq+7ISVRcMtetjX/E9sdFihfSEGjz
	0CP24GoMAkwLmLDUpQEQs/g9qbT0C8yk3cRSiQ4vEXH51XFLoSd0jgGKmjsGHw+pRMJNzWKHZoBoK
	SFIU6iMB3K9blH8M3mGIVGamhrQKJaYWV4t1SAeRs5sOfFLOR8FTad4zV5cquWplSo3nTUirEk30d
	6/1n6QsL/c9JFFYy3tsh2almeEyGfNdFYvsK2gA80ehIU9O4EbJttmVLXwyFonzJ4eR0aRVjWzgI2
	bUDmh8qIyAOHHi25vZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvEX-0018NH-VF; Fri, 22 Apr 2022 15:30:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvDu-0018AY-Je; Fri, 22 Apr 2022 15:29:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id c10so11593353wrb.1;
 Fri, 22 Apr 2022 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7CJFggtV+qbVm+vx1mWXtLgoNJlaTKSAglgOgNLxrFw=;
 b=nNk2fwG8qYWFD/V8Qs3GK9eyHJuu7PFXywZgc5i6Vrm9h5unYx2W2kULcaI+h+5o5n
 MkOChHCJCOrN93vLOCk5UvewvWRmG8fX+cp6R9hjXIT0R1lr/J71yPc5YzTHNuumzhC3
 1lEnKEosS/Hb4YOEfUHPMJk3vxKZRgIQLW3ZvFxblcfc4heA4r2HVH+rgQ/3aCykJ07U
 zcl+lZGxd4OYsJ8+g6biyuuZ73lrjEqvFSCMsFXay3dd//UHFhjbQcLwoFMVjdYb1nJw
 nxE+DYY9Yxn56JYjjMX/54ewDuwKwkjZ47igmoPbrBh+Iy29/1wNnICNLhRFVGWJzN9j
 qMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7CJFggtV+qbVm+vx1mWXtLgoNJlaTKSAglgOgNLxrFw=;
 b=ok9r9PyEZlNlNIZgBrt2SPjWIupoPjDj4eFyFuQrWQ1CKKFGUxyNhmrQttiup7zIj8
 QKd6+mKnH4dqlEsGflpSCsb16w0v1hQ3Ori8rmLwzvNJOff1xZ2jTGXZbGNP8x6ni0Sr
 NVuGyitVNILxhbEl4tRrY+GH62/70Q5X7C3B10BeuTQa+HaODSXvCPA2TMG/ME+/hpe/
 aaNxLAZfSba/Amvg7zFkRxnSV//5ZI7QKoNeirPnF/QrnMCP10ZhB/OLuuTWxYr5CxfW
 6ko8KghjR/L0dZ+T6gA1G8+APTO45VzD0S3rzPgkEZ7H6OXxHvgHkapPCg1lCS8WGc0c
 n9MQ==
X-Gm-Message-State: AOAM532ejIOWzkLeZ/WaPtb6OPXVKacD8OtAmKhzw9UpIVKS1K1Pq370
 uqNdmXgKZiMywtH1KFYi5B28RIDCsBY4MA==
X-Google-Smtp-Source: ABdhPJzB6yGh8Mk4HIz4bYLXtwzWGwyWB6T2XW8pPrpVOQ+A9SRHhiBmTfRmJN7ThoZMIQcqGqyIDQ==
X-Received: by 2002:a5d:4ec6:0:b0:207:a120:b2c5 with SMTP id
 s6-20020a5d4ec6000000b00207a120b2c5mr4275161wrv.481.1650641366716; 
 Fri, 22 Apr 2022 08:29:26 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6d88000000b0020a98986534sm2093115wrs.43.2022.04.22.08.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:29:26 -0700 (PDT)
Message-ID: <9499ded6-22c3-17b3-e1f7-e982d063f1f1@gmail.com>
Date: Fri, 22 Apr 2022 17:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173: Add gce-client-reg handle
 to disp-mutex
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220228110329.245366-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220228110329.245366-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_082930_733143_72A2D576 
X-CRM114-Status: GOOD (  13.01  )
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



On 28/02/2022 12:03, AngeloGioacchino Del Regno wrote:
> Add a gce client reg handle to the disp mutex to enable MT8173
> platforms to use MediaTek's CMDQ for extra performance.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 291db4fcbb25..9eaea1156e25 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1278,6 +1278,7 @@ mutex: mutex@14020000 {
>   			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>   			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>   			clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
>   			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>                                                 <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>   		};

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
