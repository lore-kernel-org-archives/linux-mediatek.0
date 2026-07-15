Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8468C44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=; b=2P44czPFcNwCgF97yfRlIhJeXJ
	Cb5o4CA4KRlORxNvSNWO3/zTIoyxYIKXTKoTsebNyROBvP1L8dEncb7pjlKcfvZsOV8F3zedaDXdA
	334uxgIAQFP8Gqqw52bc4UPKXWyL3g2URlm7nZKemCMM1r5HE7Ki49h1daqwR876hWvr6AzGWqjdo
	c0+hR+iDZrzZzsJeXJr5heP0qZ7mPlhJ8CAVAuXfOb239vNs9DEKgaQs9OKAPY2MRpzU1+GJbWk80
	zSaza+du45JYC/RuGMseD3OEDBo20VY2NgxESe8NwJoL5u7jD/hDJ3LzFj3P01NEBlcdPeO45aO5k
	NVnFkTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzsk-0000000EyXC-3le8;
	Wed, 15 Jul 2026 13:42:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzsi-0000000EyVe-1gXV
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 13:42:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso5168529f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122955; x=1784727755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=;
        b=Qal01h+fgCXpMHWkUzFr6LzWA3d9TBUByDyBdFtjlC8mVVTBF2NduOAZ79+7QyT2yo
         Kalmr/2OCLlCc0ssWmHEx9fyiV6Gz08LzaVTXVK5xCw3CSWOn0LRgLRVzGqDiFSbM2Ox
         qYiRuMA7SUA3VBvu5RQAl4gZ6kD8dWcHwe/tG7/nl8qp/6f/GRh+Pkrz9/iqJPvqueUq
         FU9SuakRXvcvFDHhdcWQoXM8T0EJsqzAqkJbLHZnGceEj25+R+DbBfEcWaWKF0K43t57
         ogB4uZ/K5kb0O035hjxGyka9PunLBaPCfd2awufIsw/wqbCdOE70+v6CvstYE7F++gFL
         N/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122955; x=1784727755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=;
        b=fH3eEpsVJodN0yhfneoTnErOytTILunD9rXaCYPepM4V7uCq/WrevW76rGEMffRPQI
         6inzUcKQY/Cbzy/CFC7guW0yVh3qIrrxKeM24gFY7aSWGQocGvOeSRUh+Y44zFdHBP34
         QiV445eKHD+gB+RcoO4Cj2ZupVEbjJNBzOv1mcIoIV9jVXtVt9uQSI4xhX0S6xXl3VW0
         xJEHuKVGzMC2lHfL8g0V5VQqiex/Fvvpp3y2/9Eg1yDmUHf8AYLRn6DRwkC7QYBLWbQG
         J0OdSAXAJBuLMaXs147KOUymNAgXGilNcExi+nl7kLz6JllD9wbguHK/uPZHW6EbFNmh
         v4pQ==
X-Gm-Message-State: AOJu0YxJ5xKKp+vujYubU9bRcBpo5SsXQH6tykXq+MnY/NqNaaiwk+e3
	qShQlk+CAHHukTasYbIdB0ezHiSUqQgZsYEPa0qZOPLhwFcLNUSx1IVR
X-Gm-Gg: AfdE7ckLvrSJD7s6njesYsfaX4f/Dv9zLnq/oLQ6UK7xQrviJBjRULmTNHF9xrOAEW8
	toYLuOETh79nhGz/SIHZXA+GxtfG/wFPqAHqHbVFO3NemwRwvfLY360F70gPB+4ex0fm1Yrok28
	sy03KiYTtECtYEEBgX8CLjd0znl8hX4HPSbQYci7RypGseMuDpuCmHo89j2VPg/cBsMPxFZQa7b
	g83wLJMsExBMW1wWaCrlBHtR02UyTYsEkYyijMBvheq7eGAttOu9tz8dHfh4F7lDMIK99qLzj5c
	lLqQF730rJHdzFbYA5TxUxpRuHKmk+Tc7Lgbi9FTN0VmDPwAZdsqXSKYRTpWklTfst0rwnfMvrR
	ispf6eR+aSmAt81neXWlCY2DW7HpI7e9pr1Aph2gwrc1c1PaVHYjXcviwgN2I339Rliye+G45+8
	/UPh3y5wUd
X-Received: by 2002:a5d:588d:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f4fcd5726mr3441593f8f.14.1784122954301;
        Wed, 15 Jul 2026 06:42:34 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm14509548f8f.21.2026.07.15.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:42:33 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:42:32 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: tungsten-smarc: Remove unnecessary
 cells
Message-ID: <aleOSIBFeJ1bcx9Y@owl5>
References: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_064236_463875_C2F70477 
X-CRM114-Status: GOOD (  17.58  )
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

On Thu, Jul 09, 2026 at 11:20:21AM +0200, AngeloGioacchino Del Regno wrote:
> Remove unnecessary address and size cells from both the disp_dsi0
> and the xhci2's ethernet usb device subnode to fix a dtbs_check
> warning for avoid_unnecessary_addr_size.
> 
> Fixes: 9fda4a8a479f ("arm64: dts: mediatek: add device tree for Tungsten 510 board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Gary Bisson <bisson.gary@gmail.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> index 9f5a0ec563e8..8256279c5629 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> @@ -265,8 +265,6 @@ &disp_pwm0 {
>  };
>  
>  &disp_dsi0 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  	status = "okay";
>  
>  	ports {
> @@ -1049,8 +1047,6 @@ &xhci2 {
>  	ethernet@1 {
>  		compatible = "usb424,7850";
>  		reg = <1>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>  
>  		mdio {
>  			#address-cells = <1>;
> -- 
> 2.54.0

Out of curiosity, how did you get those warnings? I ran my check dtbs
command on v7.2-rc3 and couldn't see anything related:
$ make CHECK_DTBS=y mediatek/mt8370-tungsten-smarc.dtb
  DTC [C] arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#

Thanks,
Gary

