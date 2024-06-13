Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD0C27C75
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DsZmgLwdDLOr5oNVSKF/VUwUBRN/U5aWPk9u9bAaP4=; b=YNt/JTlHhJou+WQJbVSbN/ELnv
	UD3pzlHHy7yUsCTERQMPDy1rsGw+7ADOJQpqlpEvLEe99EI4jumzp8c/TrIuZ5PoVx2KIECh+Duis
	YRPiwz/o5IPQc+ttN+KFk4DZHCsni2lk9PBkUU7ZWAdbKD5YbBxGAsMPJ7EI1koZ6UnFoNHpYo55y
	mvEy+8Kzr+K+wrwRG/SClYRLQIyOEEz49Fm47274bj/THu6h3tavyT/fdwPgNSPSu0C3y5mx6+3iK
	huOKoFSpnzA2hhkxTDIs7TSxL10AL5mG6l2nZM2p8lSLkdHmEoV2WNR9qEFcQTkBDqosu3wOkyN8v
	NhRYrpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhwo-0000000GCf3-05NL;
	Thu, 13 Jun 2024 10:44:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhwc-0000000GCVh-2quq;
	Thu, 13 Jun 2024 10:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718275474;
	bh=KETQz0HyeS4By8DZMxlCIfM4b04lhUdibaoc0Fm4HuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SFFaswTd6pHuemvGJL2EMC7gN1m4bgZ6247ZOJCTYL7SSdejhqNu9hkISJ8wOkRdY
	 3P1cqfz7RRFl6SGjl2uRL3+4inlL3w5xkBDdI7v1EmaReycafsi44LfDqEmKN8H3Y6
	 tAdJCLeK3H93AQyZsXVHDGOK+M3MxCmykkpn+zzdmL1isQF6gxx0vlmbU5Pp+0u+Gb
	 71sJyEoZIrzvkTZGMqrJ9q0D54STIqGhsqsSxNmNlITL2R84kBBxLSYuMXlZQd9Dea
	 puwhFTnIumsJuLnfDvBWbYkyLGsIcXmJg/AI+vq4zUiUYjI/oqpzgDC0w3Q85cDsO0
	 iRmkrw2BNywsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 38883378216D;
	Thu, 13 Jun 2024 10:44:34 +0000 (UTC)
Message-ID: <b6f22891-4e5f-4df0-8234-eadab9619cb2@collabora.com>
Date: Thu, 13 Jun 2024 12:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Fix the value of `dlg,jack-det-rate` mismatch
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240613-jack-rate-v1-1-62ee0259e204@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613-jack-rate-v1-1-62ee0259e204@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_034439_430480_167230AA 
X-CRM114-Status: GOOD (  13.36  )
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

Il 13/06/24 12:19, Hsin-Te Yuan ha scritto:
> According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
> the value of `dlg,jack-det-rate` property should be '32_64' instead of
> '32ms_64ms'.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Please, two separated commits, one for RockChip, one for MediaTek and
also please add the relevant Fixes tags, so that this can be backported.

arm64: dts: rockchip: rk3399-gru: .....
arm64: dts: mediatek: mt8183-kukui: ....

Thanks,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi | 2 +-
>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi                | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> index 8b57706ac814..586eee79c73c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> @@ -27,7 +27,7 @@ da7219_aad {
>   			dlg,btn-cfg = <50>;
>   			dlg,mic-det-thr = <500>;
>   			dlg,jack-ins-deb = <20>;
> -			dlg,jack-det-rate = "32ms_64ms";
> +			dlg,jack-det-rate = "32_64";
>   			dlg,jack-rem-deb = <1>;
>   
>   			dlg,a-d-btn-thr = <0xa>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index 789fd0dcc88b..3cd63d1e8f15 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -450,7 +450,7 @@ da7219_aad {
>   			dlg,btn-cfg = <50>;
>   			dlg,mic-det-thr = <500>;
>   			dlg,jack-ins-deb = <20>;
> -			dlg,jack-det-rate = "32ms_64ms";
> +			dlg,jack-det-rate = "32_64";
>   			dlg,jack-rem-deb = <1>;
>   
>   			dlg,a-d-btn-thr = <0xa>;
> 
> ---
> base-commit: cea2a26553ace13ee36b56dc09ad548b5e6907df
> change-id: 20240613-jack-rate-c478fa76ce19
> 
> Best regards,


