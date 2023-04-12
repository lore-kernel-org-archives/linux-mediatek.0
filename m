Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B1CC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEHj125fFUHVqVSYxI2Iu4R8mwBu9xLsNlhlcbmp5rM=; b=BthDihcIgabQF7lwJF4M+UNlCd
	RT++IHeLKGE7qFI1d6FKuc58pL5GQ83LhNU5DnWmSAG4HMtFo9075aYV24tDLVjGMTbdd2AHxRZl8
	1or+OtZy8igdYD8Fd1LHSzEhw2KnrMnvZWvZRXBCTLdEbnUOFSbKtkPQ6+jrsgv6eJ7Lp1AOjaddu
	YL/PR4d1ZvMnkLbXNO2p2G+z+gB5cvOO9l5KUFWWHamVGl79+QlGhoXYm+xRVrGAS7Jnnk4UiY0Mc
	k+tOKpZobwoGt4T/hFFZSEDZ7FZnlLePmeqaN45L6Y8et2ErAwFwJyCzkUsoKR2PuC+Xtu9FHKJI1
	NRlf1IhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZn4-003AyU-07;
	Wed, 12 Apr 2023 12:41:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZmw-003AxV-29;
	Wed, 12 Apr 2023 12:41:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j11so14397072wrd.2;
        Wed, 12 Apr 2023 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681303285; x=1683895285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEHj125fFUHVqVSYxI2Iu4R8mwBu9xLsNlhlcbmp5rM=;
        b=llEetynzd9UPHbqm2DuZ2+4h9Q3PCWFOLHFsb0vOSnJYPAfCAO1R3XNmoKZJMwhBQC
         vILAF7oLkx35oAn4QQZ8feiPlgHUZyVqzYlVPvviSyOOaIXVD6/sdEW7kIDfuIu36t1Q
         BV3+QEpyAceCpr/CqnR2DQTdlps3ia+YVy+hXsNBIjJNSOnwwno7+vnUilo8JJuidsOx
         xF+jP1kAslYKyhJ65RH2Wh4UWQ0PDszOh+n7iT3D099hxVe/Dh5QPmuLZJA9ADqi/Egk
         +t+fgzr6O2apGbnbPnFhV3cikLdph/xyWZXNgCgnQXK6rogqkwqP0NQ4UEO/PLWc0wmV
         xnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303285; x=1683895285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEHj125fFUHVqVSYxI2Iu4R8mwBu9xLsNlhlcbmp5rM=;
        b=D6zPsbKu8aiqOfuxHYbCxr+PCsSvc+EIqECoizjikHAsU4fP7Xz8EmtUwVIgAyjEEv
         uB3dhKLDfGTe8RXEn+XV/pfV9MDPLPJT0X3BtCONNVeKPoqz3kHPqjh/RiHpBfn0p7AZ
         d1xrctqRgo0vZpLOFjoVSWpeRHDBoc9VO0HX6mVJx1TTXmj7Pgvitbqk2iPW0IBwmivR
         mwbojZ1JW2YuODnl0EOa1pirVKxzogSeBNuMFGb3rFwsjiIIjqZWL9x91/uM6zsheksp
         cxhDEgmvziO4Rd5Zkkm+dZgRmbdmRNlVUz8p9n2K73QrTTipux5sw58bGP9kCxfr9bz9
         vVpg==
X-Gm-Message-State: AAQBX9cEHb51WHpPG4dUqZzJns3SLj+uMRqevULq0B01/PP8ngs/ZOgn
	e3PN0p4+rah2xKhs4epdIJ0=
X-Google-Smtp-Source: AKy350aT31kI3WrPlyJemwrlllp01mZSGvhWt0uUtaz7CCjWzacgDuOrFbxL5IdxxVlheLDNfhc0UA==
X-Received: by 2002:a05:6000:11d1:b0:2f4:e8e3:ef62 with SMTP id i17-20020a05600011d100b002f4e8e3ef62mr1002128wrx.65.1681303285246;
        Wed, 12 Apr 2023 05:41:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d514b000000b002cefcac0c62sm17220111wrt.9.2023.04.12.05.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:41:24 -0700 (PDT)
Message-ID: <7466cf12-9411-cb35-8e8b-fa50f5efe492@gmail.com>
Date: Wed, 12 Apr 2023 14:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 22/27] arm64: dts: mediatek: mt6795: Copyright header
 additions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_054126_705238_ED0D5B2D 
X-CRM114-Status: GOOD (  15.10  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> I have added more than 800 lines to this devicetree: adding myself to
> the copyright header.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 29ca9a7bf0b3..a4c950b65006 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -2,6 +2,9 @@
>   /*
>    * Copyright (c) 2015 MediaTek Inc.
>    * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * Copyright (C) 2023 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Indentation?

BTW from what I understand the copyright will be by your employer, Collabora not 
you, but I'm not an legal expert :)

>    */
>   
>   #include <dt-bindings/interrupt-controller/irq.h>

