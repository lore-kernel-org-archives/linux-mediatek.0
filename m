Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E50FCD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqrIFFIBuT9fXuo9sjt1fU701rtujCx6+oPYTycRxhw=; b=oKc0OVTogAMDmoKljnymhxcx4f
	ouf2Yns/9WwQjXsvM6QeEHCnLJxK8L7jgWvFlONqy5uGWQ3uLjnRDIdlKR832vNenwGfR8l+kFvJs
	jWzTds9hdpMMJ0KOpz7Ca0xsM9X6C4WimYUIhAOpUhh7kHk6VO5jpPY7A+Gq6kQGdf6yvJSJADx2o
	Du3/MXSUIrsPMLqfNiXO0xvTn1GfRrdKS3gNU8dIre6fxZCo19sZakY+YS/r3QykdCaxPdTRA4aVF
	FfbRe05Zi+yAGyOZ3IvKtPgeyWIuF7Zv/0wjexLmbZJ5kHolifCNYZRAWiwiYmUTe2tMQuM8qHL5u
	XcfQc/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9PW-0000000EvKO-3Q4W;
	Mon, 02 Sep 2024 15:56:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9PR-0000000EvIQ-2LHy;
	Mon, 02 Sep 2024 15:56:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c263118780so708303a12.2;
        Mon, 02 Sep 2024 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292563; x=1725897363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uqrIFFIBuT9fXuo9sjt1fU701rtujCx6+oPYTycRxhw=;
        b=eCVHqgcMFJOEiO3GtRl7iDMO+hD0gDwMdRV+iZiFFGArcn4U+rxhmeNHYytuIM2Afm
         cqOWSqwDqKICQcbMXzKaryh3ekUKxiAc2npMLqMGwGkAtJze43qdx7c8E+r6nsfB4SYC
         XGjwPir0lASyntm5Bm6JyyGe5HOY2vqQ0zp9fgNaFwKw9lhnkAN84qILITySWhiIiGPK
         cBtX3qXmhSP7ACjNn6C3tr72v/lUY5mTVnVN//33EdGRCaJq8COLmr4idMdZ7HhvyHgT
         rS/xPcqGvi+juNtBhRh3guUsR63KPz0ScHULD7z5U8MQoWPbtgoJtx7eXf1BHCIQ+6FN
         TufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292563; x=1725897363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqrIFFIBuT9fXuo9sjt1fU701rtujCx6+oPYTycRxhw=;
        b=TNC0V5SHSj//gX1AtMPaFKsC+Qsgq3Es6VFGgqkmwDRiZRmQnsGmeUIS5KCxCMZ+hd
         xrqnAJIshMDTe9+7IF4qKJmi0IMdLhb25DV0ajXHWU1mLXjAFiPqkyijTkkrLBvOZEbJ
         BcQ+7uLzuizk0q2VcyGMJf3e8c0ROUutoaLxFHnkM7kANnOXMhiz8yDRp9u586xmW1Pm
         4vTfa71fmB8Y+7PlasdCXckbxR7XOa5kbfqOsaHhPAjaKVrVSZj/UZdphgvBo8zF7v16
         PGiT19juB8gurIL1bOcPJS1aWVT3aMCv+xJ8kLaziqUFQdEFRdR37bIqMXAgbLgF8wvQ
         7Yxw==
X-Forwarded-Encrypted: i=1; AJvYcCVcuOcZXD4lSGgXno+K0NCv3k/EbzzJ3b5TzKiqZ0UuQT0ZViIxiQQoLJv/bZkXTZO4bOb2dqiz9dcMD6F5Sr4o@lists.infradead.org, AJvYcCXud5ixO78Y5fF7hyOh9MV4n5SZGY+bhdwTpHnmIbAXheLBbnmp5aq1pDQMUcrwXNC51yCGL+n2vLd/RzhxMIs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTUtjuXSo98fMJaM36OnrcDf90OmMewqX/Bj6CpTuq0umx0X/E
	Ziaqb+r2bhyRaeU5oVZovqVSN8WiBhlN8AbCkbTRnfMcM+qK9/Vg
X-Google-Smtp-Source: AGHT+IGJpF9fNgWm0ITi3ee/hUoYJvUXoCSyQ2oj82pSrGszpg1RCTmEuV72xcab9PyRcmGIhRFZ5Q==
X-Received: by 2002:a05:6402:354a:b0:5c2:6314:11c4 with SMTP id 4fb4d7f45d1cf-5c263141257mr1776017a12.2.1725292562888;
        Mon, 02 Sep 2024 08:56:02 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7c3a8sm5403524a12.49.2024.09.02.08.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:56:01 -0700 (PDT)
Message-ID: <200d30d0-783f-4ca9-8bad-60499b65a33d@gmail.com>
Date: Mon, 2 Sep 2024 17:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: mediatek: mt8186: Add svs node
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
 <20240830084544.2898512-4-rohiagar@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240830084544.2898512-4-rohiagar@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_085605_635933_366CE4A6 
X-CRM114-Status: GOOD (  12.51  )
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
> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 85b77ec033c1..3bd023cdcac0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1372,6 +1372,18 @@ lvts: thermal-sensor@1100b000 {
>   			#thermal-sensor-cells = <1>;
>   		};
>   
> +		svs: svs@1100bc00 {
> +			compatible = "mediatek,mt8186-svs";
> +			reg = <0 0x1100bc00 0 0x400>;
> +			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			clock-names = "main";
> +			nvmem-cells = <&svs_calibration>, <&lvts_efuse_data1>;
> +			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
> +			resets = <&infracfg_ao MT8186_INFRA_PTP_CTRL_RST>;
> +			reset-names = "svs_rst";
> +		};
> +
>   		pwm0: pwm@1100e000 {
>   			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
>   			reg = <0 0x1100e000 0 0x1000>;
> @@ -1695,6 +1707,10 @@ lvts_efuse_data2: lvts2-calib@2f8 {
>   				reg = <0x2f8 0x14>;
>   			};
>   
> +			svs_calibration: calib@550 {
> +				reg = <0x550 0x50>;
> +			};
> +
>   			gpu_speedbin: gpu-speedbin@59c {
>   				reg = <0x59c 0x4>;
>   				bits = <0 3>;

