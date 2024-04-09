Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0B7C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ej64Y8Nc6K3ZAEnIrbirBr241m32e3taZF6oNkhmM0=; b=VAfvyjOeOqAS4pinDZiOhLmCW0
	ReWgT01i74tkmTAkisLpPf83+niD2m8vNdvts6ahiAZ/t3SFNoWFjfFMv+9oFPLTlctLK60OoI99K
	4TuNDw6wBz1v4mKNeqvoBX89i2XA9nflVO+UTDdPKxHOZFem1OpKBVmIC7+Juzp3TzyM2AnS7Osl8
	qjfkUI8CCCTpw4tipefpPdE4KDo3q8CCNW4fdQQxL5rBBSsT/BLFFELCQSrvPrlhDbWbF7dtVf/CO
	dJPmNuiTfmp7zl1u5te978V3d8tkT+2m8OmBZpLwYaZSxgR86o73WjYVSWVZiF32QrW1A2nNwP4xP
	h6oC5yMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCF1-00000002Mp2-3Jay;
	Tue, 09 Apr 2024 14:14:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCEy-00000002Mms-2UZB;
	Tue, 09 Apr 2024 14:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712672061;
	bh=bbFHu+W7pWwQce2qu4sFi0y/kXqqRKu/Ciran2Y9Ivo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lfWTI8h6fwpFNiuvvllOEkLLZIusfm7UhW1Iw9+IB8wvuS6tQMHGWOUySLCjwnWOw
	 cpGsOTXoghKjMZOTPM2fAKRRAqMU8Zh5Z0jwH6aZdDfHBwk6jAiOKD+Y1Ts/rcww0R
	 1FVwx6tc1SwWh4UcfTTgFy/kg0TxTebdAd7rR53S86pdrO58S+Egu+cEAIA2wod/xl
	 IRuydABjy3CNE+CL3Sh01a+S05gWfyNB5wiiT+BRzTbxpBkiOdx2tw+knuoWbW72Oc
	 BDusFRXDfrohrpdwamfLcgIhD2zzvQu9cU+8ULxOYq4nBEH3cCs6qRxrNcRhdOFEQb
	 zkL60p9zYxlDQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 293333780480;
	Tue,  9 Apr 2024 14:14:21 +0000 (UTC)
Message-ID: <cf58846c-687c-46c4-b041-c944cab78dce@collabora.com>
Date: Tue, 9 Apr 2024 16:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: mt8395-nio-12l: Fix MT6360
 regulator nodes names
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
 <20240409114211.310462-2-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240409114211.310462-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_071424_973413_99BBD5EB 
X-CRM114-Status: GOOD (  14.71  )
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

Il 09/04/24 13:42, AngeloGioacchino Del Regno ha scritto:
> The regulators' node names for mt6360-regulator are supposed to be
> uppercase. Also, drop "-regulator" from the usb-otg-vbus node name
> to make all vregs to probe correctly.
> 
> The alternative would've been to use regulator-compatible, but that's
> a deprecated property.
> Now all regulators are probing fine.
> 
> Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index e5d9b671a405..18182cf073fb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -216,7 +216,7 @@ charger {
>   			compatible = "mediatek,mt6360-chg";
>   			richtek,vinovp-microvolt = <14500000>;
>   
> -			otg_vbus_regulator: usb-otg-vbus-regulator {
> +			otg_vbus_regulator: usb-otg-vbus {

Reviewing and NACK'ing my own patch, I just noticed that everything apart the
usb-otg-vbus renaming is wrong.

The MT6360 regulator node names should not be capitalized as the bindings are
correct in this regard, and there already is one user (genio-1200-evk) apart
from NIO-12L declaring the wrong ones - so, the driver must be fixed, not the
other way around.

This patch will be cleaned up in v2.

Cheers


