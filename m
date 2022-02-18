Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOzPisSImyyZJnm5iUS3UHBRRl90iOAYRed91IbfEZM=; b=QtDofBACbRx/Or
	c6qKPbAcJVMU415CAKbaaddPojjGK7VKpbaEGlNeNDD2OON9wtl0csK5+SqtQhFtsVfF6gj4l0HL1
	fbwbEe+AJvqHxggFErVUeqc4uDzD6xA996LVpo/2nqEEEdjEHdjsuptYljcTAdeXFRhKkgFo96oH5
	7a/oTSPHJJoN5KaVfpgi8Sy3ZKBMfJTrnm35RFr3gUa1+PPa6CyiFWuwFLWjMxJoxp+atC2J+R5y1
	OoPmnLmgxk3spEGSvqHGaS1Cux0wP4pQ8fe0R5g7guPU3VOzRgcqVu1kJsA9PBT099lfPfJuCTQtC
	snI/+Zm/pRMTSugAaxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3SL-00EdTz-HI; Fri, 18 Feb 2022 13:37:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2oE-00ELog-CQ; Fri, 18 Feb 2022 12:56:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 60A091F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188985;
 bh=+LLgEjAtE3bzxpNowg/nqrZgCIcdt+TTuXmtzhwUlSs=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=n9o0r9YXVPf9kpOwl2cybvpxePIQIac+077kozUQFNOC0OqANzSJ3NXeXvcoc3WZR
 7WwPMxtITwY3m10RwKk/Z4W/BQhN9MY+TVYl+E8EvGeSCnpuZcNueNzNfTzzmy7j4W
 jkf7mGzrFH/qozmXWGpbNjIJyDJqDaDY+1SjoZ+x3LNaMN7nEC/l8TjwKe3UY1EHbY
 LfMF1Mzf1ecqc5PAOt9qT20SjLr1JNNOLHOhDw0yVTWElZevKA4bKqZtUnYpsQo9qR
 qxdPqSMinLy1ekDiPz6FOfeinuqd4L7Jeo9mi6apAEpLyp6FXIQ7YNTAe0T7g4E01m
 SJdYHJOIhJ4Kg==
Message-ID: <e04d592f-297e-8c22-356c-7246c3c8ab1d@collabora.com>
Date: Fri, 18 Feb 2022 13:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 21/23] arm64: dts: mt8192: Add dsi node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-22-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-22-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045626_637195_8C27A801 
X-CRM114-Status: GOOD (  13.19  )
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

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add dsi ndoe for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 026f2d8141b0..1f1555fd18f5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1350,6 +1350,19 @@
>   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
>   		};
>   
> +		dsi0: dsi@14010000 {
> +			compatible = "mediatek,mt8183-dsi";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,syscon-dsi = <&mmsys 0x140>;
> +			clocks = <&mmsys CLK_MM_DSI0>,
> +				<&mmsys CLK_MM_DSI_DSI0>,
> +				<&mipi_tx0>;
> +			clock-names = "engine", "digital", "hs";
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";

...please:
			status = "disabled";

> +		};
> +
>   		ovl_2l2: ovl@14014000 {
>   			compatible = "mediatek,mt8192-disp-ovl-2l";
>   			reg = <0 0x14014000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
