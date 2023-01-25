Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69681C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlIUJxcSdCXYA3OeLTMx+yjKn/rWMjqFuTKoW+FqBqQ=; b=cTdf1R2NO/jvdD4HsAnGNUceN+
	8EZtqMgLg0CwhLpTnaCf7u9xC4F7pWzxEpgeAlko58U8s43YFrMHrUtjI/iDy5g1Zp3J0tICj287x
	431X0tUgq8sj9njnfi3+O6TozNQDYxd7MOLpB6fmhBXsYiX21K8kF4znLZSQh3vJrVyrjhRMHmkK0
	5D4fXOd+WPtblRPiPWXv0QRmXmzymlRG12lVmINdiKhXergJQnR+QhaNXQBfAUTCZpekZtqeUQOEZ
	YiF7SsWfCMLW8mpfYrEhduA+sGrr9fQuSW47MrYIXKe9UlFRG4LjjmwR8wf81YdQqRhBrbLDBSUBM
	LGGxngCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgiy-007XCv-JA; Wed, 25 Jan 2023 14:26:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgio-007XAf-Tq; Wed, 25 Jan 2023 14:25:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1346524wma.1;
        Wed, 25 Jan 2023 06:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlIUJxcSdCXYA3OeLTMx+yjKn/rWMjqFuTKoW+FqBqQ=;
        b=ESzuU4Xe/NCTHQj01jK85maPoZaB0fjlWtTTOzzBYWqjXCW1UlPVfIeWfVZ69iUywz
         XDwlochFxYGMmulrlSIJmEJKnyzRQWq2/K7rOX7yFq0SbPXpJd4ziQDak9I4S9UQ1HVw
         IV12wN+ODbqdzDuepL/BbZJW/E/+XF6mV9VseyEb7EV6SD7TybiDHpezYCJS1QcQ7HIV
         KpitgM/ULJx3FH9SlGaAFw8DeSusleSe/iWfoFtg1DV3D7HUQwHv4dazXdwLWC4dQMMP
         oA+4IKuoLFkhP0E0ophBN0cQriw8drJug0/m/AWmIja6O6wnNcylAht+Y21UdXCzFSWd
         29KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlIUJxcSdCXYA3OeLTMx+yjKn/rWMjqFuTKoW+FqBqQ=;
        b=0P1WOQI3huZQ6MMiiuJF9t2FxyzWV78zcwI8oalRjM8/KMyYozlfMt3vYUQfmoPvzv
         SzOrYfkuj8hBM3biWnTQtjLusf/grBUKRZ0waDtyk+QNBdPWQBtSYWURB3OFnaSYMyPH
         uh7jHwfaUrmtulnGOtY4Y0CT0Udrx1Re2zxurUAxvMkV0fNhfPWjIsId2vTbsH62ZhOL
         pG/fNVKutIYRw2wcC1y9jc6TDHP+MO+ROM8gJ6JAFrcwQsCx5ILMG9oPgNdxKEPkwihZ
         +3Zk6ZJCjsD/OiAYVzIV3yzdBVpYpDTlcHQMs3jufXRnpTW6MoeiN8PXDdbh4/rXfPqN
         6zYg==
X-Gm-Message-State: AFqh2koejjrwGexPaF+k/zkKiQ1OeS/Ww6dG3T4IFm7qPtELSV2LD0xP
	01mSIc804ioWfDy5PejALaM=
X-Google-Smtp-Source: AMrXdXtJkYCfBZ98bJpRNPlgWcGmh8+LeAgVJB+l0cf5KmxTT+BJsZJRK7/wmRdZG8sq/rwhaW2/tw==
X-Received: by 2002:a05:600c:5021:b0:3d9:9755:d659 with SMTP id n33-20020a05600c502100b003d99755d659mr32006876wmr.22.1674656749638;
        Wed, 25 Jan 2023 06:25:49 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r4-20020a5d4e44000000b0027cb20605e3sm4574996wrt.105.2023.01.25.06.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:25:49 -0800 (PST)
Message-ID: <104bb37e-55c3-8dd0-f501-0e8a142511e6@gmail.com>
Date: Wed, 25 Jan 2023 15:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v11 3/6] arm64/dts/mt8195: Add efuse node to mt8195
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-4-bchihi@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230124131717.128660-4-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062554_988839_F987102F 
X-CRM114-Status: GOOD (  15.15  )
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



On 24/01/2023 14:17, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add efuse node.
> This will be required by the thermal driver to get the calibration data.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I fixed the subject prefix to:
arm64: dts: mt8195: ...
to be in line with other commits.
Please take that into account for future patches you send.

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 5d31536f4c48..09df105f4606 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
>   			dp_calibration: dp-data@1ac {
>   				reg = <0x1ac 0x10>;
>   			};
> +			lvts_efuse_data1: lvts1-calib@1bc {
> +				reg = <0x1bc 0x14>;
> +			};
> +			lvts_efuse_data2: lvts2-calib@1d0 {
> +				reg = <0x1d0 0x38>;
> +			};
>   		};
>   
>   		u3phy2: t-phy@11c40000 {

