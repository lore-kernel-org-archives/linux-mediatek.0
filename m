Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEBCCD5BC2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG3jOpGiBlF9+cHWglYTrEZpGL+DYIOb/7DV5CqSlOs=; b=xU8b1Sb3FDLRqzgsiPnKze2QOC
	XI25fEdIZ2pNNGpkz6BObjKWFkTPBTuN8hnWPwUnk9SeIRns4saUzWXMwZwKv7XfQgsAw7wLduo6i
	iHmcQ+7d/c/ZsW4fQFm+BFx3u82q96kb2F13ZpKTVxi/lDX4ZDryZ95KugMA9xV1ODIxwUsnTs1G7
	9jIH+Zqi6TIoXoesHhH5s4fq0Hgo4Sus+Nv/Hmp5WVG4AFz4ma5IpAbWetxQyDyyvunFUSoS6J4IG
	VwwfzTsNiF/zuuVmxUieV2gUSTrxqepZ+KhCVjh3+nRhP0ZRdHlNu3bTkVLaiReoW6MDe4nOMRoGA
	rQRPfd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibES-000arA-28;
	Tue, 19 Sep 2023 13:57:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibEN-000aoX-2t;
	Tue, 19 Sep 2023 13:57:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7181BB81604;
	Tue, 19 Sep 2023 13:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828CEC433C7;
	Tue, 19 Sep 2023 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695131853;
	bh=JzZ5xVm/GZHS4DZtfSUGhjc20ZbGt4Lo8VFDz2HUIxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSywzAKy5EmPzI8+fCU6TCCtlQGLZbOb4hBye0ZOJsH8VQLW3Ef9YMSqIWDOe/Hwo
	 L/KYOEBybNvB6GM2wXfXdFDGn18YM6IKJP3P0WPTEMpNiP62ikXkXJd85jNVuPv6y1
	 fQHS/WrOX2gXFj8GtxFBuyeMi/HLiUXOh0794bAdRC+tD0w9R1WhUJls5s81tZhwse
	 on+DrlqqHHOEurhINMP28BbrgOC8qPtsgbNO9VljdGhaVa/s2YRpHh+RDakb23nmVd
	 0xoZiRaX/zCvq0rPEgPYUxheI7qgkehCxoPqaBajGdsxidvG/pgfSVQ12tgHkkG2rZ
	 WPrNEGwetv7DA==
Date: Tue, 19 Sep 2023 14:57:27 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: mfd: mt6397: Split out compatible
 for MediaTek MT6366 PMIC
Message-ID: <20230919135727.GS13143@google.com>
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919104357.3971512-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_065736_244524_F85D4129 
X-CRM114-Status: GOOD (  22.38  )
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

Mark,

Please notify me when you apply the other patches in this set and I'll
come back and merge this one.

On Tue, 19 Sep 2023, Chen-Yu Tsai wrote:

> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> 
> The PMICs contain a chip ID register that can be used to detect which
> exact model is preset, so it is possible to share a common base
> compatible string.
> 
> Add a separate compatible for the MT6366 PMIC, with a fallback to the
> MT6358 PMIC.
> 
> Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 294693a8906c..10540aa7afa1 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -22,8 +22,9 @@ compatible:
>  	"mediatek,mt6323" for PMIC MT6323
>  	"mediatek,mt6331" for PMIC MT6331 and MT6332
>  	"mediatek,mt6357" for PMIC MT6357
> -	"mediatek,mt6358" for PMIC MT6358 and MT6366
> +	"mediatek,mt6358" for PMIC MT6358
>  	"mediatek,mt6359" for PMIC MT6359
> +	"mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
>  	"mediatek,mt6397" for PMIC MT6397
>  
>  Optional subnodes:
> @@ -40,6 +41,7 @@ Optional subnodes:
>  		- compatible: "mediatek,mt6323-regulator"
>  	see ../regulator/mt6323-regulator.txt
>  		- compatible: "mediatek,mt6358-regulator"
> +		- compatible: "mediatek,mt6366-regulator", "mediatek-mt6358-regulator"
>  	see ../regulator/mt6358-regulator.txt
>  		- compatible: "mediatek,mt6397-regulator"
>  	see ../regulator/mt6397-regulator.txt
> -- 
> 2.42.0.459.ge4e396fd5e-goog
> 

-- 
Lee Jones [李琼斯]

