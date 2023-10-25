Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645A7C07545
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AU4NsX3aqIRrHJNOsCUNCEFXkSM3To+xX/RUEvIJ3tk=; b=ynM3xi77dKPXBF
	4V+layOrI0kvfKgcmVDl6oTxvCXfVnRFpFGKfUqBF/LTWa8NXwNo2p0eEXd2nIngH+69zxLJFtdPm
	9yZ9EAesn/z3KzjhKLe6ZWGRDZF/lWUvcweQo9c5d6mzICHc7DwvG5ry6vtAqjjYWR9Yat9RvLrZX
	lwT90QklkZQWSCKn5z95vT8uNamPynV7CuVtkjiuUKbL53Br5O60rnOtrY0iR1Lu+/tdt5Q9UE2pT
	bJGoPRbRk2VSibJyMBNXp01DXT39+Ft+ykKQdZIKiXtf0Mtw9FLLxmy8sbni65x2fQxdiKwtb1Hkp
	embnXfjrf3lqMBrCcqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvd0J-00CJ3i-1H;
	Wed, 25 Oct 2023 12:28:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvd0F-00CJ0r-2D;
	Wed, 25 Oct 2023 12:28:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96B5B660731F;
	Wed, 25 Oct 2023 13:28:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698236922;
	bh=XVUNCwXvwwO8iAGXwgWiNkikQdtq3Qfu7s3r4hSQ49Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VvaXFBCXSZopdm9zEMBPwk52IGi4WqgdVNuy/su89jrUPEmGfR3Oh2C+7rodLTPs8
	 MsF+R+8rndzXh7Dwkmx4UoffY9LX9WYImV1DCu4O2I238ybFyQmHsTCnJGatMusYbT
	 7VcI//prbtGebFGqWqNCwPBHw2BCcEglfjRgxFarDMdoaTth2X6hboQhferuPcYshq
	 56XPcLdv+MLLr8x4ZtmzjbYwdwhedhEQ9SCGVXTZ0tJBEa13eO52w4TZ/J5sEJ9D7F
	 INdKjtHNV9aNoJhlN0RIeMd3oi/fI/446tUbAV/ytB/IE40yf3xBjrp9zcJ3XLlmiF
	 07Pdti5Kv8WHw==
Message-ID: <42c8fbc2-49db-4cca-aabe-520e4eee597a@collabora.com>
Date: Wed, 25 Oct 2023 14:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: mt7986: change cooling trips
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230820153135.42588-1-linux@fw-web.de>
 <20230820153135.42588-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230820153135.42588-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_052851_888612_A0A95971 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/08/23 17:31, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Critical and hot trips for emergency system shutdown and limiting
> system load.
> 
> Change passive trip to active to make sure fan is activated on the
> lowest trip.
> 
> Fixes: 1f5be05132f3 ("arm64: dts: mt7986: add thermal-zones")
> Suggested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 207510abda89..36d8945400df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -614,22 +614,34 @@ cpu_thermal: cpu-thermal {
>   			thermal-sensors = <&thermal 0>;
>   
>   			trips {
> +				cpu_trip_crit: crit {
> +					temperature = <125000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +
> +				cpu_trip_hot: hot {
> +					temperature = <120000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
>   				cpu_trip_active_high: active-high {
>   					temperature = <115000>;
>   					hysteresis = <2000>;
>   					type = "active";
>   				};
>   
> -				cpu_trip_active_low: active-low {
> +				cpu_trip_active_med: active-med {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
>   					type = "active";
>   				};
>   
> -				cpu_trip_passive: passive {

Rule of thumb is that each commit has to build on its own: this will break build
because of mt7986a-bananapi-bpi-r3.dts referencing the now unexistant
cpu_trip_passive phandle.

Solving that is simple.
Merge commit [2/3] and [3/3] in a single commit.

Obviously, retain both fixes tags :-)

Cheers,
Angelo


