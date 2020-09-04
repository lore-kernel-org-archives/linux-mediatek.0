Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592DDC28E83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 08:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA6B206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 08:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AO5g686c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA6B206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/FCj/UB2W1oL6WXLNn4McdjOtAtVDeCcjTmCpJFHU3A=; b=AO5g686cQz2WjsN2Kjyh6q/bL
	fGXL9Pyee+w5NpJ+V9ZdafLD6OpxNJr4Otakz/uP4QbfaHXlopzstRFH1ZEqqthQgSV+IGs1ERiC/
	vDXqPeMSVzCNNPM7ZgAgb9KRfjmBI/ZAOCQwdHZBZ2qoGiRI/tZro7Ff/FvvRBQ5AwkLh9e94VCmH
	ht0/DT024thLE/DzIu8HKY2lXF+f8BP5sjNPzT7FoSVib13fHde/1I14Nk5TiSdX+wXALjInUJKb7
	e1L8xA2DU/FARSA2FStAklQz/cI87o5Kq+odKhpUZRSA/WVB2ryxysH/NpIsGel/F9W4UHfRSUHjb
	9QBfkJi1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6g4-0004zB-HP; Fri, 04 Sep 2020 08:02:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6g0-0004yF-DA; Fri, 04 Sep 2020 08:02:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 149A22958A0
Subject: Re: [PATCH] arm64: dts: mt8173-elm: fix supported values for
 regulator-allowed-modes of da9211
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20200903142819.24487-1-dafna.hirschfeld@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <5d504bea-0934-91a9-c052-e463ad6c6d95@collabora.com>
Date: Fri, 4 Sep 2020 10:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903142819.24487-1-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_040228_546195_0482380F 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: dafna3@gmail.com, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dafna,

Thank you to work on this.

On 3/9/20 16:28, Dafna Hirschfeld wrote:
> According to the datasheet the allowed modes for the da9211
> regulator are sync and auto mode. This should be changed in the
> devicetree. This also fix an error message
> 'BUCKA: invalid regulator-allowed-modes element 0'
> since value 0 is invalid.
> 
> Fixes: 689b937beddeb ("arm64: dts: mediatek: add mt8173 elm and hana board")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Double checked the regulator supported modes and I can confirm that this patch
gets rid of the error message, so:

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 1fe5dac24ba1..1a51879d5c6f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/regulator/dlg,da9211-regulator.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include "mt8173.dtsi"
>  
> @@ -293,7 +294,8 @@
>  				regulator-max-microamp  = <4400000>;
>  				regulator-ramp-delay = <10000>;
>  				regulator-always-on;
> -				regulator-allowed-modes = <0 1>;
> +				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
> +							   DA9211_BUCK_MODE_AUTO>;
>  			};
>  
>  			da9211_vgpu_reg: BUCKB {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
