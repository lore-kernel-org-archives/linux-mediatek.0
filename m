Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67639C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhPMpyCMJ6HvS//S3CCRmvmmRPsh8wUIotQ8o5eWPTs=; b=IsJgoC2yKPiP48iVZ7tmXxtoEt
	Z4vPavh+Y6gXPkzxL2fXJ3WfG9zpbke1oRh8O77KrxR6vjQsmj6rmc/t8r4wkZwvkXy2w42KPpOFX
	xbhQrQzhdyH9FjwAPDVJyoS2ZGJWmvAXqcoc3HNBzvQEPlXv9nEkRTDJRBabQnNKnBnqNZr36jjNw
	mC89dRTmwp/NC6nA6lTGGwbzwk4XrXPtuyMvTjxKceFR4GhASFAgfuQWl+flrziEZtjeSEon34QgD
	yOGDpiv6I8h5RYaJpMzdSUsNVoH1dxU1h8EBGsv7H/1UuLg0ejYS/xGCAT+O2eaMa2KAVD8vS2bfB
	i/0898MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXcl-005uOc-Vk; Thu, 19 Jan 2023 16:18:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXcT-005uEe-HF; Thu, 19 Jan 2023 16:18:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1647408wms.3;
        Thu, 19 Jan 2023 08:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhPMpyCMJ6HvS//S3CCRmvmmRPsh8wUIotQ8o5eWPTs=;
        b=jQvSiB/9uA+iE5dsg7wfyWi+LLwGEDq/f6nxvkTMShJdbRvcFi24Meli3gQyT8mno9
         1FtjziZRBWHgEjDq+mTvL22zo9h+6YWvPqsCzK+HA1EPLe2LLThLJdD/5lQ9lnK1Jush
         MTyiLJv1MBy/JnJCix1LHtCij0CrMKYarK1Miixztllbm1UDdzg9r8eT3U7I7s6P2KbH
         5XD9NRTrkhLojIt+/st6oK15m78nFKGUQ1ig+WgSqwxivBVX77HgZSQQewZ5DqUDCrQ6
         k4BRe7Q+sUZcDYFmw0YYQiJWXgILlus7GyQk1tEdVPDceRnpHDbf1UajTBQGUboBuMD0
         y7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhPMpyCMJ6HvS//S3CCRmvmmRPsh8wUIotQ8o5eWPTs=;
        b=CVPR0AMB4NXcIM6CGXv27mWnWFXGo3AQDesDskJFLNeShBUc9YWMWiQSGzs+eIi+ly
         2/u1Nw61NbtWUf5Fv4+aCqGS3aQAxTZMfmwNOCF5TZL1o89WStZQqA3OOA6WJMxeDDVt
         jcj8IZTU9jXqAOJO/1/EVROL7YPAcC50YNX/1dy8JXT+iMuDgTt+fVCDrB13xmsvabWL
         IYub8rFj6N91YSj6nkOVZrGQSpQZvc+ey9AmqwP8YaYFdPigcfrBVgnQvz7nBxd1IG0r
         HCUXaN+8+lKVnHklx9o/QTRWPkpy52SqwaPamyrv8bxIm8C5jK66vzYDvEAZuUgJ3TfF
         cBNw==
X-Gm-Message-State: AFqh2kp9BVIISLw0LQ/DN5UUUEENKfo9l6c2RpZXX/FXZ1r7FHoH+SoS
	0METVYgKxj3jvCg1JSNVaSQ=
X-Google-Smtp-Source: AMrXdXtCGQp1kAxCJDbhPvGR36ilJzrNwfl2z1ISaXawuwRYgIvh1dVNxvHTArbGulOwqCZe1wxaJQ==
X-Received: by 2002:a05:600c:3b29:b0:3da:f678:1322 with SMTP id m41-20020a05600c3b2900b003daf6781322mr11301935wms.38.1674145107419;
        Thu, 19 Jan 2023 08:18:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c379000b003db15b1fb3csm4718879wmr.13.2023.01.19.08.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:18:27 -0800 (PST)
Message-ID: <3c30c805-243b-5ca9-06a3-2807fd76e3b2@gmail.com>
Date: Thu, 19 Jan 2023 17:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/2] Add power domain support for MT8188
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_081829_915643_EF203309 
X-CRM114-Status: GOOD (  11.17  )
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

Both applied, thanks!

Matthias

On 23/12/2022 09:05, Garmin.Chang wrote:
> Base on tag: next-20221220, linux-next/master
> 
> changes since v2:
> - 	add MTK_SCPD_DOMAIN_SUPPLY cap to MFG1
> - 	add MTK_SCPD_ALWAYS_ON cap to ADSP_INFRA
> 
> Garmin.Chang (2):
>    dt-bindings: power: Add MT8188 power domains
>    soc: mediatek: pm-domains: Add support for mt8188
> 
>   .../power/mediatek,power-controller.yaml      |   2 +
>   drivers/soc/mediatek/mt8188-pm-domains.h      | 623 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
>   .../dt-bindings/power/mediatek,mt8188-power.h |  44 ++
>   include/linux/soc/mediatek/infracfg.h         | 121 ++++
>   5 files changed, 795 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8188-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h
> 

