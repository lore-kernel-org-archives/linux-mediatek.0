Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF918C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwuV3Q+alcTp0k0sz09MYCJ8ftPD6InOaS26xPhsiVw=; b=S0xz4Ov8rKTOIdDtl4ADxHzCF8
	aFIJdiuEVlfaiLURcd9t26pct2hd0vJ+rpZUgnpERtzVCNGnkRuDcrpCJLNYmFcGiQsE9hBJj9Y7o
	i+gk2dwzGtL6wLyaW2/wiXx3+b01DmTni41oXD6u6QRxvf/ncBUN0YTTb1sKWRKKedV6evA+yCwUq
	Q0kc0wmH8g1rSWWJh5OkDhurXS2dpriMJtC7UnHIACssrjjg2BygJpjJH/rCql1Jm1BlPXO+jfCgT
	F2MGDmB310FjUlYj+7IQuyWEv+qLx2lqvRXemOWUSDDOJjg8rtPGsLBaZpf97dCya8RkisRikZLDh
	yRJubGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNDf-006ELu-2n;
	Thu, 04 May 2023 00:53:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puNDb-006EJ8-1P;
	Thu, 04 May 2023 00:53:12 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE49B66029DE;
	Thu,  4 May 2023 01:53:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161590;
	bh=Pf9aKXYua5q4lihd+sJeC03bnAklA25fE7ZxJ5TN248=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKd0Wre/cMxtHs+HjhiiB6yPf21bBk1C4udeK7iSLm2yVHoyspMQ+gVsd7Odb7fOo
	 QlfUH86jJ8faThvsiDFlg2e7kmQZ7S0dDx1lkECpZrJiU86XB0feoipLtNRVeeuWpE
	 5/X88U7TvQa6FC79cVAUWqnYELHu2NTmC2ai2Be610aJRiITK2b5b+vWLeC15y1ixA
	 yqBgOOdkQ1w/SrJDffBYxsfPF+Akmi2b8Ciji9UJXYrk6GNSWPTaP46VLTSfm4asHL
	 m/5r1sa3Mx07tLSY0SLgDPddX9lV07b39i6ieZOo3VSxYkyeMmorH0Bsr6NmFvFLzF
	 HrqBUUhRpEUUQ==
Date: Wed, 3 May 2023 20:53:03 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v2 4/5] arm64: dts: mediatek: mt8192: Add thermal nodes
 and thermal zones
Message-ID: <96157fae-2024-4a8d-9ceb-b0d95ee419d4@notapiano>
References: <20230425133052.199767-1-bchihi@baylibre.com>
 <20230425133052.199767-5-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425133052.199767-5-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_175311_602216_1B3E65FD 
X-CRM114-Status: GOOD (  13.38  )
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

On Tue, Apr 25, 2023 at 03:30:51PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add thermal nodes and thermal zones for the mt8192.
> The mt8192 SoC has several hotspots around the CPUs.
> Specify the targeted temperature threshold to apply the mitigation
> and define the associated cooling devices.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 454 +++++++++++++++++++++++
>  1 file changed, 454 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 87b91c8feaf96..eb2bd94e0ae86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
[..]
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Just a nit, but it would be nice to have these aligned (same for others below).

In any case,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

