Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F156FC25B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hna0WN7JjlKVki9CKW7L0dNcuFoKFDF6IdzoULKxqX4=; b=HmOgrXLgyrrbzCvHV/ev29VS7+
	Ptrbi4fJ4vjreRKqI6Lufb3UPEK+I10TY/dy24jKontkliBuU2t0VrTKgyeWQjtYF+iNswGyJFvYI
	pRy6Dn+aDhTT6o+p2YoUrMyy/sOd5w8EWiPq4z1OO+0W9JWi0GsDeo2O43/cxZq/ae2lhiAIHmuRR
	VLSgdJsCXtLWQGrTio4w/TBsb+r2S8M3Mp19HjPD9ybc0gYnszbaUCBobHoF+zo1ddWKyreQbCVzR
	MnxalSYYEVFv96bZBK0xJocemk1uqbcguxMc3HCVkl9TLRCvmsqxF/gppXgOQMzwGPEes4G9UAnTh
	u/oKGMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbj9-0000000FT4L-0FnZ;
	Mon, 27 May 2024 14:53:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbj5-0000000FT2G-3CP6
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 14:53:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a62ef52e837so134127566b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716821604; x=1717426404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hna0WN7JjlKVki9CKW7L0dNcuFoKFDF6IdzoULKxqX4=;
        b=rqnc1vHcpzVLW2dCKJTSZ6XOskgA9PEm/fpz51xF6WEAS3QpO1N7n/mIaQzBHWdJI9
         cWPGbgb9ygRXt3Au5my4LxXjwx3Ea0MLCHDh1tmr2vgcPYhAavKrmZ1zsUFxrWBSO8wn
         M2BTlW2ZlsHFWaMmyjvvJj96aYVtQy/OSnu8VdSRo1HNpCtr7tor60g2gAhlOYMa6+lR
         PEhLzaEKNZguSd16pSjSkEruoT6IWLnd4camzIcvKyg07tk4bvehSyf5TAxf8GYvNNn+
         xxf2YIiWvdz4b/IN81UpvIdoUHzvuuKOnjc546bFF6XEPj3mkaDZVMpl+CWxthuMo+W1
         eiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821604; x=1717426404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hna0WN7JjlKVki9CKW7L0dNcuFoKFDF6IdzoULKxqX4=;
        b=cRxJJlfCgUDm6UWzhpTg4od+RVpp38xnG0XRLnER5jGBc7CL7vT22IUb9YddSvpK1p
         L4TLe80ygBPBU7fY1XsC9uOJtiWu8W4wQfSqahhV64tLNy0tTZx64A2P7pd2BZOM8cV1
         7brqoR+xz0F506swEEQocyD2nHiZm5HD2oVbe3rwWNoOc1axz5C0DXy/pzjFlN0YrG6+
         gUHuUNh5M6bPZ/4KljdVLBaR/XCV6ea3xEMY4diZBVNxLgZ2vfHeA1sd2sA1TleK9wz2
         XX+c+smHnKCGvvoEtKEDUVQPbcNWHjfVpQPQqR5i4x81PeJIjRx2oGgcixw9MgBvzgmP
         79nw==
X-Forwarded-Encrypted: i=1; AJvYcCUiDCQunHhOHwA6SMfPizSyD+bO5wfvryK+Tf2PHe6Arur0PEgwaBdtv6zKbaq3fQYsRJiAHZXeEvZ51Abv3EmvVbE09yYyIkRVbGu0OJj+DJDl
X-Gm-Message-State: AOJu0YzBcUc2m3Wm0yR9YvNWXNlhHaSFlPPipJqZoVvrlp1cQ950M5Qw
	uCVANmozfRa5Uc/1ttI+kFwHFtXAW1FEdJsLfbK1Sf3kg2aMooMtgVW+3qNCJT4=
X-Google-Smtp-Source: AGHT+IF0cBRnqOxCG5tbMSyKBE410khljOPfZUZyo5RRnH39akZSBsPRH0RsV2L6AMGFjz3XyzjUsQ==
X-Received: by 2002:a17:906:a0a:b0:a5a:4683:e961 with SMTP id a640c23a62f3a-a6264f0eeaemr626181766b.52.1716821603593;
        Mon, 27 May 2024 07:53:23 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c97a029sm502902966b.93.2024.05.27.07.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 07:53:22 -0700 (PDT)
Message-ID: <f553b3f2-d895-446a-a741-7a151ebeb3ed@baylibre.com>
Date: Mon, 27 May 2024 16:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8188: Add support for Mali
 GPU on Panfrost
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, mandyjh.liu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
 <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_075327_931103_990BA3DC 
X-CRM114-Status: GOOD (  10.60  )
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

On 5/27/24 11:39, AngeloGioacchino Del Regno wrote:
> Add the necessary OPP table for the GPU and also add a GPU node
> to enable support for the Valhall-JM G57 MC3 found on this SoC,
> using the Panfrost driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

[...]

>   
> +		gpu: gpu@13000000 {
> +			compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
> +			reg = <0 0x13000000 0 0x4000>;
> +
> +			clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
> +					<&spm MT8188_POWER_DOMAIN_MFG3>,
> +					<&spm MT8188_POWER_DOMAIN_MFG4>;
> +			power-domain-names = "core0", "core1", "core2";

Hi Angelo,

I think you should add something like that here:
#cooling-cells = <2>;
(the warning is raised when I run 'make dtbs_check')

Julien


