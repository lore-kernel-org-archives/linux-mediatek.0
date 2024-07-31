Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB541C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dt3QBpCYDwWxKzryI2Rr0sP8/xlBTn3aGP+v3WstzY=; b=ZApGYhdLRwncrVOZnnxP2ynACv
	vgGF6wiVAHBEjl06rRVX+cRH6tV4yYAZMQYniRCMguk8OROzdeZfWvVhTLsBLy8md5sRs/Nsw7ekI
	/ps3d+V5psmpOSazdyNWg82I2DPOH8pSwbw+Lxz9e8jHglupZu5k1VqzSc0lBUJEx+xEYErQb5/ZJ
	EyFdjtLdP3GRrOaFkGY6Pyv9EzyWB5ybkh/SKt806Bm+cYqTfcbzDpexppQDkjbI5ld9S6fq+/nmm
	kW4W3ScXTqptVFzneKKaEgzv8608WyAOWOCr2q5WUB4YY+OtjkwZ2zgdouJ2RaN2YjXlqPlE7fO4O
	+bSLBBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4an-00000000IgB-2EGd;
	Wed, 31 Jul 2024 08:21:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4aH-00000000IVL-13mD;
	Wed, 31 Jul 2024 08:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722414080;
	bh=XvOseKdPDeiZOL5iY3NTqf4lGmanWm38s3cef+z6OV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eQuyrOJMNX6MC7AYBXZyXiXDz3KkG4/EpJBC31guT23ZMqJo233kjA03RXD29lQ7w
	 HhzYHHlGhB/Epd7iR/sjmDZj8E4gCj+ASP+QVdu27pja1C15i/COtg0Brlz8u+na/s
	 PJyPiajPdgt7Y+oRDodb/Ysu+gxugSKkNxn/hECWHnNqqVA8qjZ99bYIdT3gm5hO2y
	 jrPwxasS+mH+eGfw6QeIQAozJp+9t7CjA6RRXfd+cSRmpE5TwomMVc+j4aOyupRzcu
	 r3gbtDTBZVWgbdanzx0zM2flmRcJEFeG/q1JgF8JnP+AWYhouuZvIjFEoQ1fkO+dTB
	 P4rZ7IHsPh2eg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 87CCC378000B;
	Wed, 31 Jul 2024 08:21:19 +0000 (UTC)
Message-ID: <8c4e777d-4698-446d-a29a-5df7e49e88d3@collabora.com>
Date: Wed, 31 Jul 2024 10:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise
 series boards
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
 <20240731-jacuzzi_dt-v2-1-4995335daa30@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240731-jacuzzi_dt-v2-1-4995335daa30@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_012121_453298_F9232174 
X-CRM114-Status: GOOD (  15.90  )
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

Il 31/07/24 08:26, Hsin-Te Yuan ha scritto:
> Cerise is known as ASUS Chromebook CZ1.
> Stern is known as ASUS Chromebook Flip CZ1.
> 
> They are almost identical. The only difference is that Cerise is a
> clamshell device without touchscreen and Stern is a convertible device.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile              |  4 +++
>   .../mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts  | 26 +++++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts   | 26 +++++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi  | 21 ++++++++++++++++
>   .../mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts   | 29 ++++++++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-jacuzzi-stern.dts    | 29 ++++++++++++++++++++++
>   6 files changed, 135 insertions(+)
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
> new file mode 100644
> index 000000000000..087a0ef33e13
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-jacuzzi.dtsi"
> +
> +&cpu_thermal {
> +	sustainable-power = <4500>; /* milliwatts */
> +};
> +
> +&mmc1_pins_uhs {
> +	pins-clk {
> +		drive-strength = <MTK_DRIVE_6mA>;

Sorry for not noticing that in v1, I have one more nit: please do not use
the MTK_DRIVE_(x)mA definitions.

This is just `drive-strength = <6>`.

Thanks,
Angelo



