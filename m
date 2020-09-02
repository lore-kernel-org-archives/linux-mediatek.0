Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4A4C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:29:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCFC207D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMpipBHs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T+if4hZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FCFC207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mrvqQIqKoY0IIJyEkOSMcIaO4ixpDKmK7aqbG1KTMN0=; b=BMpipBHsws2y53hi/B+iZVQ1c
	0y770EI3v+Eixu3HKzDZvbcUdV8PgDT1Y0Lwew4Be9m4ANJVQFobSV8d8AhbKVKDLttif614oOcq2
	HKl1nUIyQ1OY8eAzYh1YfrkFpgtG5awMux03NolPmKAL8AWttNlQ49aYTM5N4zuL87UrImX95SMyF
	dbW8Nl8RiaOVBof3CbX+9jQuo9QSSzHTLz3926Yg7EwQI1tYy4u3SNLT+c+bovsYreOZ1n19C0qV2
	3gBXxdN00ikbM/kitktjmV2tjA7AkmklPt0T2TCh4zVEnPBGrdB6SF4qYM7d6XhaEkVjjIq9IGmkj
	peLVfyU/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDcCK-0003PB-Mx; Wed, 02 Sep 2020 23:29:48 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDcCG-0003OO-I4; Wed, 02 Sep 2020 23:29:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 082NTg7N023002;
 Wed, 2 Sep 2020 18:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599089382;
 bh=5ismlKMcchJg6W6QoumUCgvbzAC8BXk4SjpAViJ4qts=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=T+if4hZPcBLlHYJ6RddogpPBKvM+LOIs76Kcmmi5a7euud7ZIX0A3u6rSz+Q0MYxS
 YM/ns7UgKhc+OZkWjq/7VBP9DQWEV3HfnHpCfXbL6+pCLX8c5R4IcFRKpfGNdXiDVm
 9f5vBGDdAgy/4z7sSoVAQ7yzdxWYcHk29EUV/kTo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 082NTgES068502
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Sep 2020 18:29:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 2 Sep
 2020 18:29:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 2 Sep 2020 18:29:42 -0500
Received: from [10.250.34.112] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 082NTfUQ128253;
 Wed, 2 Sep 2020 18:29:41 -0500
Subject: Re: [v4,4/4] arm64: dts: mt8192: add infracfg_rst node
To: Crystal Guo <crystal.guo@mediatek.com>, <p.zabel@pengutronix.de>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-5-crystal.guo@mediatek.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <211bd78f-3b70-1e65-eea9-75cc73a3dfdd@ti.com>
Date: Wed, 2 Sep 2020 18:29:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817030324.5690-5-crystal.guo@mediatek.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_192944_698060_A40EC799 
X-CRM114-Status: GOOD (  17.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 stanley.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Crystal,

On 8/16/20 10:03 PM, Crystal Guo wrote:
> add infracfg_rst node which is for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

I understand you are posting these together for complete reference, but driver
subsystem maintainers typically don't pick dts patches. In anycase, can you
clarify if your registers are self-clearing registers?

regards
Suman

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 931e1ca17220..a0cb9904706b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>  #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/ti-syscon.h>
>  
>  / {
>  	compatible = "mediatek,mt8192";
> @@ -219,9 +220,17 @@
>  		};
>  
>  		infracfg: infracfg@10001000 {
> -			compatible = "mediatek,mt8192-infracfg", "syscon";
> +			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
>  			reg = <0 0x10001000 0 0x1000>;
>  			#clock-cells = <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible = "mediatek,infra-reset", "ti,syscon-reset";
> +				#reset-cells = <1>;
> +				ti,reset-bits = <
> +					0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: pcie */
> +				>;
> +			};
>  		};
>  
>  		pericfg: pericfg@10003000 {
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
