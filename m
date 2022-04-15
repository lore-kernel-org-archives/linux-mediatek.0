Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F222C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5O72Y6M0WlTstxhNU/hKJJDokYNRnsMAdkrPwv60Dc=; b=QdbejUwvV++JCh
	GoZfRNQ3+dGGxpLoOGaRgzXZuDY/XFoVRynMLweXSOt8X1MqpQtb24vh/U3lH5VNoGr0Y3vHWuuUk
	cqfBPvABoJOUwu8GuamfVEtjs3+xVm2ozYzAi6Ym8ElWubqAP+LDmw+Qt92tXk31ugHbcBFz6k4xo
	r4MpZTsEBQ12qbbxG+uIbhTuht6N18sPvKtkPTC6w9tEpPWIJYQUNMRPxbHOVXiiq2eeepo3jiOEe
	fnirv3pCrG2WVQux7b8WXizqnYSF6zgdm8b5yUn/Efd4hGr7LX/h2s5TIe1LBmCFqwwQ16M2irpLb
	EDb8Le7h9i/KgT3HQoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL07-009wSN-Rf; Fri, 15 Apr 2022 12:24:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKze-009wJ0-5u; Fri, 15 Apr 2022 12:24:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3B12D1F47DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025445;
 bh=pP5XfXInasJ+Um4d51PqpWs2On4DNzbLzPuK/Aw3uio=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YIXSNX2Zfta1TwhcTA+ti7O8vcbpINLJGlIKvLeCXzq4Px8K3Bobjzok0S34BzcBQ
 iT3eysZ27LRanm+Z7lBL0UGOTCO29IsV/vsJMlqfgOGVc4+1p4gnWAwXs1Z7y1/UM8
 DTleqEJPeHGzHNMtJRqVXoieAzNKFatVy49xcpLDLt47BmLwWYDvMCUZbQ2w4jgoIH
 9op85MPGmQrQWhLfpQ5w+BQ1QXqkNDhPSeUDPULVbVQnaZxIwzO6ZhlF0sg6ASWESw
 GQi1codrRws+qJntMm82m/lxu0y8pyVIoOIgnitckUQXmHBzMe7BtrPmlltPl5q4B2
 Mzww8j3ukUbiQ==
Message-ID: <a1ae5616-48b8-054b-aad3-a9569eed20e1@collabora.com>
Date: Fri, 15 Apr 2022 14:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 13/15] arm64: dts: mediatek: Add opp table and clock
 property for MT8183 cpufreq
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-14-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052406_413743_ED45004F 
X-CRM114-Status: GOOD (  15.14  )
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

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> - Add cpufreq opp table.
> - Add MediaTek cci opp table.
> - Add property of opp table and clock fro cpufreq.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  32 +++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 270 ++++++++++++++++++++
>   2 files changed, 302 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index f3fd3cca23e9..8953dbf84f3e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 4b08691ed39e..4ae3305d16d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -42,6 +42,244 @@
>   		rdma1 = &rdma1;
>   	};
>   
> +	cluster0_opp: cluster_opp_table0 {

Please don't use underscores in devicetree for anything that's not a phandle.

	cluster0_opp: cluster0-opp-table {

> +		compatible = "operating-points-v2";
> +		opp-shared;
> +		opp0_00 {

Apart from the underscore being invalid, across the kernel, you can find many
instances of opp tables, containing names related to the frequencies, so, for
consistency (this is not a rule!), perhaps it would be a good idea to do so.

		opp-793000000 {

> +			opp-hz = /bits/ 64 <793000000>;
> +			opp-microvolt = <650000>;
> +			required-opps = <&opp2_00>;
> +		};
> +		opp0_01 {

		opp-910000000 {

> +			opp-hz = /bits/ 64 <910000000>;
> +			opp-microvolt = <687500>;
> +			required-opps = <&opp2_01>;
> +		};
> +		opp0_02 {

..snip..

> +		opp0_15 {
> +			opp-hz = /bits/ 64 <1989000000>;
> +			opp-microvolt = <1050000>;
> +			required-opps = <&opp2_15>;

P.S.: Please fix the typo below!

> +		};	};
> +
> +

...also...

> +	cci_opp: opp_table2 {

	cci_opp: cci-opp-table {

> +		compatible = "operating-points-v2";
> +		opp-shared;
> +		opp2_00: opp-273000000 {

This one is fine instead :))

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
