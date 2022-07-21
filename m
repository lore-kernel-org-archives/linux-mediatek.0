Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17228C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dGL++LPAmS2eym62mLHBoZzYDfysbltWj55S2SeBfY=; b=WHfPscqo2lL6mHY7dM1d/YmJwJ
	zfNLURxT8jP0BVn9qzdTSYxy4C1C/2PkQx5lj/IzukoQunkqgoeFyE12imprVS0CdmSPmYAsF4NT6
	E5XwZYTB0+H1erLuLRj4vkvlYOSPppESUyhlB4BX9/Ni/3l/U/JVuM+csvYhyhQ6ewsBP42JpYCuC
	hnJFZZp5BI+Ll/t0+gHrkJRQk8cL3JX9Xp7xdghxkIek1scp/upx0en7X8QLA6jJ3eXxAh6NFuuKe
	FMrNuLcNLHY/XcBTQMeITpkGdjJYldXOHlOPKnsUr4Tl92pPJl4dkoWY5tySztAiGrgnqXjYifRh6
	1lEK+IRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEUUc-005uJi-0x; Thu, 21 Jul 2022 11:37:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEUUQ-005tuD-IL
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 11:37:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id m17so1558424wrw.7
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3dGL++LPAmS2eym62mLHBoZzYDfysbltWj55S2SeBfY=;
        b=OHDVersEmMfP4wtrsESwOSLR0aXXXw6yByDlyUpqK4xliNb3B7DOAzxYpfWP2/eeOd
         FwQhuWP/+lA8XforgHtSjTZswnB5XirsvXBoHyLx/KQDRYyM0PwywNGlhp7U5gPIbdtT
         Ew5EFum/cqwspvE8JKTDPDmYYPeS7kMdkG2b5MaB1zyrdW6Y8Pu4iK6hMS5NaGEPaG7c
         q3DqmtqYJbb1NHptUKaKSkzlUfjaNYcLayRBwgGPUhPsZhN9VPegQWrfe1zmsBT7FT9f
         bVwJ5nheZYjKGhAnvcLyZXAdreOVxU08zCrQ32KargN2WtmgUzm3lPn0oepQ4+cNyCqX
         uybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3dGL++LPAmS2eym62mLHBoZzYDfysbltWj55S2SeBfY=;
        b=ML7R2oiYrJV4KuBB2Bt+F96DUJgxTkCdgm4GrjNPMOmQIYI85vyo/bBCnCpK9/Aydv
         4x+hGV2UGUDujSx3/4vP88v+DIJBXG4JTrZdIWXy1jFPtgCTPajyvjJT0AxR1AVb6nuH
         mC/2BMIu4EY2MVImxpEJyPdshacYbioDLP4mTFysbNJm1sP7YNqRct2TejbGxAL4kJRX
         6Jnp2hC2R+mOvnFKyLWoEfoggyfpIazgP91CJ8vM2dQGfe3a6VWQQRxQcKHr7A4+nHP1
         Hh+diKLUdNqkTYKJXBndCmt71/mfvhYoQCbvJ/ueRZ/We5s88LAQauqgGdfS1z798zFy
         JX5g==
X-Gm-Message-State: AJIora81vP+fOZ0Wnp+H33jXeO/rs+6LYeVdUikRfjJKzJbuUcfEQblz
	1qzWBZM0PGeCNLPKN7AS1Qg/wQ==
X-Google-Smtp-Source: AGRyM1viD12dLSWjZcRDX0xi2VY77xaUB6/V11P01gxqkWTXqVJej7u3/DmQVUgKdZEduGu4KbPfHw==
X-Received: by 2002:a5d:45c5:0:b0:21e:5755:d443 with SMTP id b5-20020a5d45c5000000b0021e5755d443mr1440971wrs.45.1658403414416;
        Thu, 21 Jul 2022 04:36:54 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003a2c7bf0497sm1685064wmo.16.2022.07.21.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 04:36:53 -0700 (PDT)
Date: Thu, 21 Jul 2022 12:36:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
	Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Message-ID: <Ytk6U4fncRJOaAq3@google.com>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-7-tinghan.shen@mediatek.com>
 <YtgDu70Lpl/uPOkf@google.com>
 <68a30bbd-5f9d-17d2-59fa-7b0da06ee877@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a30bbd-5f9d-17d2-59fa-7b0da06ee877@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_043710_628509_67CDFE79 
X-CRM114-Status: GOOD (  14.53  )
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

On Wed, 20 Jul 2022, Krzysztof Kozlowski wrote:

> On 20/07/2022 15:31, Lee Jones wrote:
> > On Wed, 20 Jul 2022, Tinghan Shen wrote:
> > 
> >> The System Control Processor System (SCPSYS) has several power
> >> management related tasks in the system. Add the bindings for it.
> >>
> >> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > 
> > Why have you ignored my review comments from v2?
> 
> If you refer whether the binding is needed at all, then the answer is
> yes, because this is not simple syscons but a device with children,
> which we want to parse/match.

This part is fine.

> Anyway Tinghan should respond to you about way how he proceeds...

This would be nice, yes.

I was referring to the submit line, which nearly made me miss it, again.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

