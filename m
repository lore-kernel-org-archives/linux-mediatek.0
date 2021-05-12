Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2305AC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:34:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CB061107
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CB061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1nLlpQYkMI+nZMBCv/+naZIxRXConFr5j8htUHqtJ2U=; b=aP5B1wLZ2m6hjjW/6ZUSBX2e1
	2lLUDeDKJAV9SdCFWMMtsM/jg3HsWv4RwNeLKQGktK/YuqJxGwPX+Xovy4dGqUA0QjNgnj+ZsyQ3R
	/cSr0lPx0Jc1f3oflr1/3DqKdjJ2a0m6i4/3U2I1piiSjaOVsrxMm0QiO2W4attix4bj7H1T3Nz/g
	nZFthlgoerLXkOUuUiQ1sWYPRUK9Bj5nJf/rCRhsAseYRreWDPGqx9A5YU049f0tPKpuj6wZKgSD8
	8edbBS2dScPxf4fclJ8K0kPqw9ltpvNi31PooukNwd+eoRpq8aj3cxfshT/yWDXzXKn92erPo3Vn8
	FI/hLtzKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgro4-003LQT-Jj; Wed, 12 May 2021 16:33:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgro1-003LQ0-IW; Wed, 12 May 2021 16:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=WKFBLhMyTkS7BKOikVrkP4FV7nAoabO4CG7z4br68DE=; b=DYitHtDcTmL4pFgWHD6IlXSoTO
 3QhnUF8EsyzMfJ8cwSVVVO0ciYbpE52x9QMsnG2z0fPqXwga+HdmTOwC4bMQwigAJlf+qpm3fZ4Dp
 rC091ULn4eQtJ2FjhwDWs3y+5PHDECh6h51Lo/7F+0nzoZjIe72bi1APKGN7kVcxIToILyJbDGU93
 bP4QNqNuQuZIlDBg14ADUXFLOE6KXLAyM2hCwyn+zoqaY/6AUG4fqCF6lV2dA8Z/OSJFYA7r+NYGl
 r2KeC5U37o8E6G3vO+zOYFDNrgjMW/w+M+mpNc2SNrWV2imSu3BwDwBwVNLcYkq2lMFzgKHuKVihH
 MgoUC3eg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrnz-00AbDf-1w; Wed, 12 May 2021 16:33:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id a4so24282251wrr.2;
 Wed, 12 May 2021 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WKFBLhMyTkS7BKOikVrkP4FV7nAoabO4CG7z4br68DE=;
 b=a+aNAviufzUkCgligaluZ5C/T3prJd7/DnIW10TdVFgYsepOPcPBYdS6DZa6kGcKDU
 9opBe9mB1gus8F0tcunOE8LsKHwDO3KXAjYPY2sCNaK3/Jb+/2H2J4/HZnABK0qEX+zl
 eIG3LLHjIJsoihkLzGwanc5eTna08dI+Ecdr67+7L5brlX6JEOHAgZ/mFTs7fLFHlGfs
 TTAkNtO4/s5lg4t6dFeaO5/9pzKF5UhWaHQDBauQPyh5H06xAJ3yeDfd9cm2iRSWDGM4
 8hFFzBElkkiOcPlDIac4Ma8R+sImyWV7rDdExpS3IojdoAX+dIaAkEeFMHlgPJq/fJY3
 WRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WKFBLhMyTkS7BKOikVrkP4FV7nAoabO4CG7z4br68DE=;
 b=FRTLZab9+ucJb+I/D/BX7c/4d09yJ5jOhQorFiL3pOp1N/8xRF88JLC1odwzzYk6JC
 1f11wnUvOWYMo9yXkXAmlG1CIVbZZMnahEPOKdBZsMfPv2M0LUC/+pGUetxlxVdrZIJp
 WRwNelEh25jJK7Pc9MSlD1LGOnFk02mmEy+spp3MvY2CbxcycQ8DTFCXv9r8mXdy4PkI
 p642wad1a9a9V9GeaGw2Jd181PBMCo/SwZyvh46U7Nie1AJ4kS6l1bN4owTpA6Y9dE4N
 hQs/5KwS719k5SwhqXxG8ZTrS4NLXV9N77kj6S/c/SmunpMaIOlFbdkA3x1DIJ+1gJWH
 ZUpQ==
X-Gm-Message-State: AOAM530q4gHqt8HMROM9mIMeNgb2khi3JQnLgoWtrhh/bZlhC4SIG1Md
 MyPIHEdy8HKnRyw8tJqhtAhhyeWp2aYHog==
X-Google-Smtp-Source: ABdhPJyokWdNDAfgloClWaWik3W3sa7b0KN2iLv2Mnjl86s3mNiHt+RjWCfKBpdWy5qTA3eOD97hmg==
X-Received: by 2002:a05:6000:1549:: with SMTP id
 9mr46381060wry.367.1620837229554; 
 Wed, 12 May 2021 09:33:49 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id k16sm155693wmi.44.2021.05.12.09.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:33:49 -0700 (PDT)
Subject: Re: [PATCH v3 00/10] Add several jacuzzi boards
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210421090601.730744-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b241e27c-b68a-1d2a-cbae-4f8b41cf02b1@gmail.com>
Date: Wed, 12 May 2021 18:33:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_093351_128012_C8AC407D 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/04/2021 11:05, Hsin-Yi Wang wrote:
> Add several jacuzzi follower devices: kappa, willo, burnet, kenzo, and
> fennel.
> 
> Change log:
> v2 -> v3:
>  - remove unused property in i2c2 in willow and burnet.
>  - add fennel.
> 
> Hsin-Yi Wang (10):
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kappa
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-willow
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-burnet
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kenzo
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-fennel
>   arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
>   arm64: dts: mt8183: Add kukui-jacuzzi-willow board
>   arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
>   arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
>   arm64: dts: mt8183: Add kukui-jacuzzi-fennel board
> 

Whole series applied to v5.13-next/dts64

Thanks!

>  .../devicetree/bindings/arm/mediatek.yaml     | 29 +++++++++++-
>  arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++
>  .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 30 +++++++++++++
>  .../mt8183-kukui-jacuzzi-fennel-sku1.dts      | 44 +++++++++++++++++++
>  .../mt8183-kukui-jacuzzi-fennel-sku6.dts      | 32 ++++++++++++++
>  .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 27 ++++++++++++
>  .../mt8183-kukui-jacuzzi-fennel14.dts         | 16 +++++++
>  .../mediatek/mt8183-kukui-jacuzzi-kappa.dts   | 16 +++++++
>  .../mediatek/mt8183-kukui-jacuzzi-kenzo.dts   | 12 +++++
>  .../mt8183-kukui-jacuzzi-willow-sku0.dts      | 13 ++++++
>  .../mt8183-kukui-jacuzzi-willow-sku1.dts      | 12 +++++
>  .../mediatek/mt8183-kukui-jacuzzi-willow.dtsi | 26 +++++++++++
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  8 ++++
>  13 files changed, 271 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
