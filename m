Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF520C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 13:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8CF60F9C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 13:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F8CF60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2gFck2sqQO1l7h63GOhq8BixGBEmtgtGiFTl3O0O2g=; b=PbCgZOnY8i6plk
	mkuXBQ8X+UjWj1M1P0eIn9yzSuf6wx5mRsTKzlJxi8cHCUJbOTjP+nBFpNpEaTTxeMX3pEERu2K1r
	u8aacixpf9Ny3rcVLtXpX0WONnS8/qW93RziMzPkE9Ze0CkIEkj+p/Eg8jPBGMuc4wKEG+rwq4c1q
	/O8Nt0tuGoTaoCMsRXqLdaNMeCJ0IllBGFooLljENghBqkoXq80ESyFtCRYUtg3rXrEzJWqtFpVUs
	a0lyb9+W8l0VIbYGrJKihsd3KQ4ayg6bNaGxfMs4kEvjsPFmcgI7g/gyzcR4U92B00kGzGvdM0pEr
	ezRc4mmwbDug4ub2y9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpk3-002rfq-3R; Fri, 08 Oct 2021 13:16:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpk0-002ref-H0; Fri, 08 Oct 2021 13:16:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id r10so29793598wra.12;
 Fri, 08 Oct 2021 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gr1byabWHn1PUa1m+Lt+dKzXId3ni3LSSa9lwDSa3gk=;
 b=TJwvim7w+eQFFfurbsl40FGMPwvnfLNLF3mqkVbNUxpugKorDKYZpgJ6ppC/PTEfU/
 zOILl/qFEGzOdn6zfkCqtCzngeViZPdhvYzMHbM3IFZjQGHrra/zDS/6TMIKgTnVc55t
 FcMxubz12x29/ajr4yg/4IapyvyKUFNo3xqRhsRdQeIVc4OPAXyzrkZY81y6rOdHomht
 hqzwPEcVHx/WmerpaSHDHB18z/kd2XNccqlNpJydYkZY9xgv9A3ahUCBrPFCZeng3Ptm
 jP6ttiHbfEf7muJb0bTHpjXuPa4qjwlq/IFgZ8831A1pXDw+R+PUitOMme4fSBTH9oWk
 WxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gr1byabWHn1PUa1m+Lt+dKzXId3ni3LSSa9lwDSa3gk=;
 b=KBCn7OHwpKB9Urvre5BLRfHss+e1WY+M58pet0A+Ot4cZcSUmUpbAkEdUgGtn3yv4e
 EydkmoHqspvPElGyzq3DVpv1ERfNkKm3QehaNgFSH+3QMj6igSMI9Myn7ZBhzJOUiYEb
 McTyVs45NCKNHWoxfS845LI95BF+eiLu1ojSG17qH11/nq0lYCFrYKaMsedHK6Z5LFMf
 kTetqIXENb4wZGWaD7RbcyqEo6MjJ2wP6Oc1I5tRo4zCZsIFdm/4xCFXtrRVR8v7HM02
 5mM3knSbHAsVRpj/ceQ1No7z60Sb/c1AQe+QodgN0z5ehQO4NLszy8c2JW3mBAnA3z19
 Ospg==
X-Gm-Message-State: AOAM530yhzEOZD7IAkW0kO6DctXp37Xtb5Qsurx8ZKZGRK5/KboJx6VL
 nX61l/xsFWVqwAFqHCrHUOc=
X-Google-Smtp-Source: ABdhPJwchweLQBjxy6TkxOtLDsNz1AODqVJ3fWsbZRISUfWyoArhAgv4Go21sBR80xsRmqCQwndA7w==
X-Received: by 2002:a5d:6245:: with SMTP id m5mr4099639wrv.148.1633699006563; 
 Fri, 08 Oct 2021 06:16:46 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id g2sm2642909wrb.20.2021.10.08.06.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:16:45 -0700 (PDT)
Message-ID: <266143bd-6135-adf6-8a80-537f9d6ea3ff@gmail.com>
Date: Fri, 8 Oct 2021 15:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v4 0/7] Add support to the mmsys driver to be a reset
 controller
Content-Language: en-US
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org,
 Crystal Guo <crystal.guo@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_061648_606453_34A50E67 
X-CRM114-Status: GOOD (  27.27  )
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



On 30/09/2021 10:31, Enric Balletbo i Serra wrote:
> Dear all,
> 
> The following patchset is a reimplementation of the patch sent by Jitao
> Shi [1] some time ago. As suggested by Chun-Kuang Hu, this time the
> reset is done using the reset API, where the mmsys driver is the reset
> controller and the mtk_dsi driver is the reset consumer.
> 
> Note that the first patch is kind of unrelated change, it's just a
> cleanup but is needed if you want to apply all the following patches
> cleanly.
> 
> This patchset is important in order to have the DSI panel working on some
> kukui MT8183 Chromebooks (i.e Lenovo IdeaPad Duet). Without it, you just
> get a black screen.
> 

Patch 1-5 pushed to v5.15-next/dts64
Patch 6-7 pushed to v5.15-next/soc

Thanks!
Matthias

> Best regards,
>    Enric
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20210420132614.150242-4-jitao.shi@mediatek.com/
> 
> 
> Changes in v4:
> - Remove unnused variable as pointed by Hsin-Yi
> 
> Changes in v3:
> - Based on top of the patch that converts mmsys to schema
> - Fix typo in the commit description
> 
> Changes in v2:
> - Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
> - Added a new patch to describe the dsi reset optional property.
> 
> Enric Balletbo i Serra (7):
>    arm64: dts: mediatek: Move reset controller constants into common
>      location
>    dt-bindings: mediatek: Add #reset-cells to mmsys system controller
>    dt-bindings: display: mediatek: add dsi reset optional property
>    arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
>    arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0
>    soc: mediatek: mmsys: Add reset controller support
>    drm/mediatek: mtk_dsi: Reset the dsi0 hardware
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |  4 ++
>   .../display/mediatek/mediatek,dsi.txt         |  6 ++
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  2 +
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 +-
>   drivers/gpu/drm/mediatek/mtk_dsi.c            |  5 +-
>   drivers/soc/mediatek/mtk-mmsys.c              | 68 +++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.h              |  2 +
>   drivers/watchdog/mtk_wdt.c                    |  6 +-
>   .../mt2712-resets.h                           |  0
>   include/dt-bindings/reset/mt8173-resets.h     |  2 +
>   .../mt8183-resets.h                           |  3 +
>   .../mt8192-resets.h                           |  0
>   12 files changed, 97 insertions(+), 6 deletions(-)
>   rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
>   rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
>   rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
