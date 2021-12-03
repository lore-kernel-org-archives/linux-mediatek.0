Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 23:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEEKmE9HGLIshJnmu/2fZc0aCqWf1+eCn7QlBdEj4aA=; b=EG8LjSKjSqdycG
	s/ldsdea/JAJJY1BFs9o6Kzj3FMPF46itL0lzyKTavTpF1QN6QaF2GFOK9Mn4WA4na2B/RWVEYHs8
	DzWHoLy2LKRbVl4lhHFbdBgqJPstUPKSPJHSa5MYWTvXkOySTFI48PE289Nfe4rh5CqbuAlBQOCJr
	b3A/SyYoEDFmyFMIZ3XWmyAxq+mqsocmsh94A7JsvQMlG4bbnoBArpTYL19q0FCt/0x9iAXjC5/Pi
	LvJujExNNRpOOjqT0GepCe+u8G5XfrHbSh7skYqq1s22Lq5kAdjVAaZTXpO5hNpZ3sC0LD3x1cLqd
	sK5QH6Ia3wndJrernUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtI4v-00H9HT-2M; Fri, 03 Dec 2021 23:34:57 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtI4V-00H97E-6R; Fri, 03 Dec 2021 23:34:32 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso5431586otj.1; 
 Fri, 03 Dec 2021 15:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=YiLKOo6UjENxJNlcLLad7PuFG7LasjEMP8sQf/vfoCY=;
 b=Sf/Oq6cDmGKYtAoPcw4iDGwUf809NnjFztdTzIF/ivxFBJGX4fAfKhUhWw/vPKSEM+
 bTKjZjPTt/6k3ndVkdrnrUdIyk8nr0o1fe9apCOVTjGVt3J3zc/Q5LDspcT2ldQTdcw4
 wtzQG/sG0cIRgW07zfDTEE5Za/mH0/zVtOQtKgWkYTT9Xrg1radmqlaeY+Vx+b0mO4uQ
 PJo0+t3XAe67UDmrRxGCdH/WJO4GnWyAqGSC0omA8juceu9K3sO5qy+fhitS5zIfUBbO
 U9gzmcuflm4+s1mp4fMVrt3VZiAGMIFsBD5I9kdS+A1avsEcDCXqNL1v1if+b/8+0uPG
 uSiA==
X-Gm-Message-State: AOAM531U4usFshlPy9OxYtaTfYt94iRo6qCjZx4ghXKa0AosnoP7MI1x
 dUOWa+TnX0fvjo8fHQcnGw==
X-Google-Smtp-Source: ABdhPJzaChXSNEtZQrVDuuBqE4OOoH38CUdgHcZapsCQUiGSTfOcqkFwFK52oIJ1fUrqoQYuBMT/Hw==
X-Received: by 2002:a9d:7a5a:: with SMTP id z26mr19045138otm.297.1638574470251; 
 Fri, 03 Dec 2021 15:34:30 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o19sm1051377oiw.22.2021.12.03.15.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:34:29 -0800 (PST)
Received: (nullmailer pid 1043013 invoked by uid 1000);
 Fri, 03 Dec 2021 23:34:15 -0000
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Tomasz Figa <tfiga@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, yi.kuo@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anthony.huang@mediatek.com, lc.kan@mediatek.com, srv_heupstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 youlin.pei@mediatek.com
In-Reply-To: <20211203064027.14993-2-yong.wu@mediatek.com>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-2-yong.wu@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: memory: mediatek: Correct the minItems
 of clk for larbs
Date: Fri, 03 Dec 2021 17:34:15 -0600
Message-Id: <1638574455.281202.1043012.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_153431_260734_1FD741E2 
X-CRM114-Status: GOOD (  13.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 03 Dec 2021 14:40:24 +0800, Yong Wu wrote:
> If a platform's larb support gals, there will be some larbs have a one
> more "gals" clock while the others still only need "apb"/"smi" clocks.
> then the minItems is 2 and the maxItems is 3.
> 
> Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1563127


larb@14016000: 'mediatek,larb-id' is a required property
	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml

larb@14017000: clock-names: ['apb', 'smi'] is too short
	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml

larb@15001000: 'mediatek,larb-id' is a required property
	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml

larb@16010000: clock-names: ['apb', 'smi'] is too short
	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml

larb@16010000: 'mediatek,larb-id' is a required property
	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml

larb@17010000: clock-names: ['apb', 'smi'] is too short
	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
