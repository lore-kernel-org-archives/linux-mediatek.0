Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD032C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOYzLn0FmHhCymQPR+KcH773k8tHs+tTQCSsmbRToqY=; b=ISW2BVaKCz6e9aGAZkEVdsKX3i
	tdldpR6S31qbhYCiBT9tnIL1y44/xtoHiTQDKKy+C1I+7RN/elR87wFuy65NBXI93jUa96JAm55eR
	Ja/0m9NsmqmNEA7FtwNGeqDtWEIgVETJbJ0LXy0Kw0iC6an21ccsfRCfqchM2/+G5rsjl+eVHCrYZ
	URbMlvaE9Wiy6NbrBmxQ1GdedHtoKQeVNKVKlkDwCXBfZww72lDTnHJYSRtXD17Fih/IpdigeBIFu
	QnzLR1+UKhi8awfV7qfCitNPDuY1+PX7lQseCBrEF6k0Qm24i8b9jtavBbn7pEMss2aRkoIYWgUvy
	++1M1Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWcy-00217Y-30;
	Mon, 15 May 2023 11:44:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWcv-00216L-0z;
	Mon, 15 May 2023 11:44:30 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E0C8D66031D7;
	Mon, 15 May 2023 12:44:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684151067;
	bh=rDyvSJh2ELejvMz6JJ1HfRpjB8o4ib0qqoQwRrpvqj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WTYBOhcjSLYsGnY9G9lV204YnWZ8jpu0eh800cs4me6vSP5bLI5SHZt+66bdNDhOa
	 /affCIm0aFqN1v5KeAUt9br+lVC0fHsVVK4AS1KZOJ1wsEdjS3xVlBa+cyPQF1Fus4
	 atY6l+7mqaa0blZL/RCDQWN971SUaym5vYyITXCIbxU/QdwfoFeGNEIcrJSv0mJGKG
	 hUL18PnvqnezQRcOxHJhjJCuUf8W+r3uEhZoyJdgeSemWqtU4uGn77S7jHEWUQbk0+
	 4cbyOB9fP3OawQyvm3KKDRxz7ynNvmkqeN27ouDTE90RU5VxOKy4fquXFdu9qf58YZ
	 I50NfCyBgRTDg==
Message-ID: <ff7292f0-9055-1787-2543-e219fe30dddf@collabora.com>
Date: Mon, 15 May 2023 13:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 06/11] arm64: dts: mediatek: set vmc regulator as
 always on
Content-Language: en-US
To: amergnat@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
 <20230203-evk-board-support-v7-6-98cbdfac656e@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v7-6-98cbdfac656e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_044429_470381_4F6CC77B 
X-CRM114-Status: GOOD (  18.91  )
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

Il 11/05/23 18:29, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> On downstream, we observe that the MSDC IP (used by the emmc, the micro
> SD card and the WiFi) isn't working properly if the VMC regulator is
> shutdown.
> 
> Make sure it is always on.

I don't understand the power tree of this board: if your VQMMC is VIO18 and
*not* VMC, why is that required?

The real question is if we're facing one more supply as requirement for newer
MediaTek SoCs and whether it would be a better idea to add that to the actual
driver (and/or as a power domain supply!!!) to both better represent the power
tree and to eventually allow deep power saving states.

Regards,
Angelo

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 752007d0598e..5d69b39c8746 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -137,6 +137,11 @@ &mt6357_pmic {
>   	#interrupt-cells = <2>;
>   };
>   
> +/* Needed by MSDC IP */
> +&mt6357_vmc_reg {
> +	regulator-always-on;
> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> 



