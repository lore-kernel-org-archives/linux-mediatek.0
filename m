Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FB5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 20:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKo5x56fWEtHMHUJX8UIjgCshUFHEZto8Kui+GBxvYQ=; b=I12yyN91QpakqyWfu+lTcLqJTw
	b8k/roscogVOgz9dd/Lrs4kZs8W3nvPC6x/GzGrHSo5V8A1+7nmMIlVS71wW6At3WwaDQCBJ2aLo/
	XaZIvCiHITnKJfEBxsS9dP9ygWjkhYm0GoR19EfuUfm+U3//XAiNvNjSzaY1bZOanMNz7S0y9F/jR
	4cQTojfw8Zf1MACg7z3IkaubgmfxGTXqgchfvzaV5i4DtsbLHFMOeADzAM8g3iz+IdyEfHZSV3bPF
	fvaWn6tuT9JL8Zf4jOY968q3fDSgr4P4PZtzyMWNphBv6qHt7B5Tj/TTAf3w9qOFuW2DiSmXzfT17
	YRBrBaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SF8-00Gupc-29; Thu, 22 Dec 2022 20:32:42 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SEt-00Gujy-LX; Thu, 22 Dec 2022 20:32:28 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-142b72a728fso3788850fac.9;
        Thu, 22 Dec 2022 12:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKo5x56fWEtHMHUJX8UIjgCshUFHEZto8Kui+GBxvYQ=;
        b=rP53k1AujS6k+wZPjmKbD7pXuw6k/sYFkWscsASnZWRw2kC5zLRPofJ7XfbRXbeIuY
         qABUKlWnGZGLV7mOIpPii+AYChNkhOBq6c8cmflcqYgEwYNtJANkJYg5g1pZBbCI3hCA
         IZe0zo6uEw9d6SiGNOkV2j8qw82vcXWGSa60+VYWedGnJKMLViTOZShXmFNVpulRslTR
         zRL3+UqgzE7MACxJrm900vQ46+2PBXlXaJ4FTyG917+UKELpIKFIsAUqvb4zBLCxXor0
         RN1sHTB6fLcFhqSk6dY/vKlHDRUtB3eGreD4gO4cyX0YYz64nRsCknc3LkxlybLQhroK
         WO4A==
X-Gm-Message-State: AFqh2kqNnXvlDtlRRvAoWjnt0XX5g2JP8uLRcKEMse47T+zt1YxnWJs8
	6cXxSnjp6ppjLroG4+bNdA==
X-Google-Smtp-Source: AMrXdXsAQG+TQ1J9PaH2VrGeouezowxbWsEDBr58x+MvvBVdVq1BeKeiqTbSzSgb9jKcEk9x4SRB1Q==
X-Received: by 2002:a05:6870:4d16:b0:144:a626:218b with SMTP id pn22-20020a0568704d1600b00144a626218bmr2904414oab.56.1671741145508;
        Thu, 22 Dec 2022 12:32:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fp15-20020a056870658f00b0013ae39d0575sm695769oab.15.2022.12.22.12.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 12:32:25 -0800 (PST)
Received: (nullmailer pid 2072929 invoked by uid 1000);
	Thu, 22 Dec 2022 20:32:24 -0000
Date: Thu, 22 Dec 2022 14:32:24 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jose.exposito89@gmail.com, edward-jw.yang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, chun-jie.chen@mediatek.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com, linux-kernel@vger.kernel.org, johnson.wang@mediatek.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, kernel@collabora.com
Subject: Re: [PATCH v1 2/6] dt-bindings: clock: mediatek,mt8186-fhctl:
 Support MT6795, MT8173/92/95
Message-ID: <167174113268.2072682.12279599468554479055.robh@kernel.org>
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
 <20221222155147.158837-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222155147.158837-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_123227_732284_C2A7E86F 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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


On Thu, 22 Dec 2022 16:51:43 +0100, AngeloGioacchino Del Regno wrote:
> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
> compatibles for them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml   | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

