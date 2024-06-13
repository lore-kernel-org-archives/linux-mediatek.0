Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B51DC27C75
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC6beVtGtR8wRGwWKIlFnAQYpXP7FaQO+geplOk++VQ=; b=ID6zuPDkxLC5mhcmOPgBS0v1xj
	x+2Ga5WegizzTox2TAlPbniWqL3St9RRjEZzYBcUZ/TOX9rMzHcg0BFPE5g6F8Kudl8UhlSMXkd3n
	sH/eCDb9xBD0ji1tIXFH6eB6/Sx+0CJz1OEBIGWW4ouSeNHezW5Bet0/sFjixu/bclWViRz9EVwsH
	k950FV+bGNZ1T5HzRyOe183hp+ez8wVQ1HCLJJJVOrtiJP88nDNPSLknaEO5abXCRnoEoxuqzsjul
	3UPIxt/z9QxCXeeRu77bl1UvBECDLVUs9GDuQMi3XgPyG7NpvZ0G6rwHxQcC4L1PwHEr1MYOLg0DN
	AlmOOAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhiz-0000000G9S0-08wV;
	Thu, 13 Jun 2024 10:30:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhiu-0000000G9Qy-4BYr;
	Thu, 13 Jun 2024 10:30:30 +0000
Received: from i53875be5.versanet.de ([83.135.91.229] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sHhim-0000ZZ-PL; Thu, 13 Jun 2024 12:30:20 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: Re: [PATCH] arm64: dts: Fix the value of `dlg,jack-det-rate` mismatch
Date: Thu, 13 Jun 2024 12:30:19 +0200
Message-ID: <13119127.ZYm5mLc6kN@diego>
In-Reply-To: <20240613-jack-rate-v1-1-62ee0259e204@chromium.org>
References: <20240613-jack-rate-v1-1-62ee0259e204@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_033029_084597_6D1600F9 
X-CRM114-Status: GOOD (  19.75  )
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

Hi,

Am Donnerstag, 13. Juni 2024, 12:19:58 CEST schrieb Hsin-Te Yuan:
> According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
> the value of `dlg,jack-det-rate` property should be '32_64' instead of
> '32ms_64ms'.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi                | 2 +-

sub architectures (Mediatek, Rockchip) are mostly handled by different
people. So it's good to split patches along those lines in the future.

For this change in particular I'm not that concerned in that regard and
am also fine with the Rockchip part going through the Mediatek tree.

I've checked the binding and for the rk3399-gru change:
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Thanks
Heiko

>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> index 8b57706ac814..586eee79c73c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> @@ -27,7 +27,7 @@ da7219_aad {
>  			dlg,btn-cfg = <50>;
>  			dlg,mic-det-thr = <500>;
>  			dlg,jack-ins-deb = <20>;
> -			dlg,jack-det-rate = "32ms_64ms";
> +			dlg,jack-det-rate = "32_64";
>  			dlg,jack-rem-deb = <1>;
>  
>  			dlg,a-d-btn-thr = <0xa>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index 789fd0dcc88b..3cd63d1e8f15 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -450,7 +450,7 @@ da7219_aad {
>  			dlg,btn-cfg = <50>;
>  			dlg,mic-det-thr = <500>;
>  			dlg,jack-ins-deb = <20>;
> -			dlg,jack-det-rate = "32ms_64ms";
> +			dlg,jack-det-rate = "32_64";
>  			dlg,jack-rem-deb = <1>;
>  
>  			dlg,a-d-btn-thr = <0xa>;
> 
> ---
> base-commit: cea2a26553ace13ee36b56dc09ad548b5e6907df
> change-id: 20240613-jack-rate-c478fa76ce19
> 
> Best regards,
> 





