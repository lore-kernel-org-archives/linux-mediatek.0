Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5124DC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynmnoXJta2jjyBtO+S/15HLHMogDcqdZmqyBGJheEnM=; b=kiQmhmcj4PS+i6XXilY+bC4gXD
	+2N/lh9kwedUT4/P47RH2edZ4+Q1PjNU187RRmKa9r1vDrkbP+OYuyn016lD11A9mBKhGeMAD+/tF
	WFqyxpoRZNRIAZzxPWgkx0qtEnlt4pWLIdRtEnAwqDc0V9vVGs6E+KnFQC9LpVM/kkiC06br44wD1
	MQnga6pv3NIFrLpIQaqTIAJ4oNAOmykt2iiLQEy08Oa9gyq7fDb05jZv7O7SLtBQS8dPgblYmqWdB
	E8IZtN+kiFbwkoTA6GZqnEFKNQfX6oJxP7eAeQqo09WcVBPzmaqMznoHgQFkuOxUEIe4dhVF+Ry7W
	OH3NGJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeQw-00000009rxp-3QFm;
	Tue, 16 Jul 2024 09:25:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeQT-00000009rnH-2Ydy;
	Tue, 16 Jul 2024 09:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721121885;
	bh=lU7qlL1uamfPHcDf1WFGzX289bQX/TvkrTQF2JrqPsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sH4IwQLVeBbX1amWG+qExoVEP7aknwjCFa/EcaMT8nRzmosJQvV/qf2GQnqK2zeMb
	 usxrsErHV6CzphYQJNPnkvyma8+NFgjkoLIVJwzFEs903ebzYcm0uySVNrPLx4MBUs
	 cWGb53yMrW6pZp+THuXGzxhFyMD4QdKGlmSYyXcPaG7JD5vMbModCXlN39YvRgHBb6
	 6RfHjYbBhlo/NUYuNSfJ2CNgdvceXq5+iHm2ARNWlkMm0x5QPeq8JfV4VtdfvlPfbU
	 XnTVqhX95hF/DPq10m6bVzs39bpyDKIdXq4zKt9g5Pgd9uPq73vHrnXWecl+KCXz66
	 lBvvElPtUvRdg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3C6A83780C13;
	Tue, 16 Jul 2024 09:24:45 +0000 (UTC)
Message-ID: <3dd2dcc9-5fbb-4384-985f-a61e26cc8a5f@collabora.com>
Date: Tue, 16 Jul 2024 11:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_022449_994748_BE01A111 
X-CRM114-Status: GOOD (  28.63  )
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

Il 15/07/24 18:09, Nícolas F. R. A. Prado ha scritto:
> Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
> subdevice") introduced support for detecting keyboard backlight
> fuctionality through communication with the ChromeOS EC. This means that
> the DT node is no longer used. Remove the unneeded node.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Different CrosEC FW versions could potentially not support discovering
> the keyboard backlight functionality, but I've tested both a recent
> 
>    tomato_v2.0.23149-099cd3e539 tomato_15699.72.0 2024-01-03
> 
> and an old
> 
>    tomato_v2.0.10686-234e646fd8 tomato_14268.0.0 2021-10-07
> 
> version on mt8195-cherry-tomato and on both relying only on the
> discoverability works. I've tested on both tomato-r2 and tomato-r3. I
> have not tested on dojo, however, as I don't have access to it.
> 

Dojo will work anyway because those machines do share the same base FW... but
anyway, I'm not sure that this is the right thing to do.

The commit that you mentioned says that it is meant to make that "work on machines
without specific ACPI or OF support for the keyboard backlight", but not that the
intention is to stop using either ACPI nor DT nodes for that.

The DT kselftest is relatively young, and I suspect that anyway this is not the
only affected device, so the justification is only barely valid.

Don't misunderstand me, I'm not saying that I'm not okay with this, but I'd like to
have more opinions about this.

If we choose to go this way, ideally we should remove this from all of the upstream
Chromebook devicetrees (not only MediaTek, clearly!) so that would require a bit
more effort to test here and there.

Any opinion from anyone?

Cheers,
Angelo

> My motivation to remove the node is because the DT kselftest expects DT
> nodes that can match to a driver to be probed, and with the "breaking"
> commit, the DT node goes unprobed which results in a failure:
> 
>    not ok 225 /soc/spi@1100a000/ec@0/keyboard-backlight
> 
> I can also solve this in a different way, by adding this driver to the
> ignore list of the test. But this solution seemed better as the DT
> isn't meant to describe devices that can be discovered at run time
> anyway.
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index fe5400e17b0f..20dfa18c9dda 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1228,10 +1228,6 @@ cros_ec: ec@0 {
>   		spi-max-frequency = <3000000>;
>   		wakeup-source;
>   
> -		keyboard-backlight {
> -			compatible = "google,cros-kbd-led-backlight";
> -		};
> -
>   		i2c_tunnel: i2c-tunnel {
>   			compatible = "google,cros-ec-i2c-tunnel";
>   			google,remote-bus = <0>;
> 
> ---
> base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
> change-id: 20240715-cros-backlight-dt-probe-7754a832ad60
> 
> Best regards,

