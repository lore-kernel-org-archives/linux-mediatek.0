Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B0CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4b1ggZHJEStXYymd7ESNtL53ZJTFh8uPfH0cOrUSyY=; b=xmqvvQXeoU4zIbMWeWh6WAeP6e
	TmWn13dxBvAQLaXneYxqOstaL/iBp8mc0fynUyYUi5vMuxVR+siKvCu7504SCsY2vO54WWHeEhchr
	qScXbIeU+zuoaa0FPw4jd9OIoJ8HK02VDXI0danzXRKDp1ueix73Eqnu+XpfMImCXsmbpQbykcTGo
	bnqmAZFc7Vu37BbSEOaVCdCfZPinhaI66h0wVu+mUlZ32UEHyAmpVLp03O8RaHc1Ntk5xWnB6s6NP
	DuK1Svg9mhD0l22079V7biug3Bq3qjCpfJdhAJEMeROmI6h512FzfkhJ6jfzUtsLyW0LDC7IUZlmq
	XixLRrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVgq-000Jb2-1c;
	Wed, 29 Mar 2023 13:18:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVgd-000JRP-1F;
	Wed, 29 Mar 2023 13:18:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 356376603175;
	Wed, 29 Mar 2023 14:17:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680095878;
	bh=oKI8cb71HUCIIbcHHSsapFUI42p4qPDafLN/sQSGIA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZZkdkh7KJ1k8IsYdXAG4EycxkmcOJxD7pDf1ykJQPuIL4IWcJpTswmusJxfdomBO
	 B3rIkD9EmQDzkgO4llKqftlZSJOxeNPv6EVcbnuUuOjScVzV9YnNXyAvKG7ywaUnsE
	 qQwXCPm1N+q5/GeZ/ph84kgDL9qq2UWpxm+puviEr11YgFi2jBTBhISeBA3t8Txcpc
	 7Oc9JiU+FbpDpUKKPp6s/i5YDRnth/ZkJaJGC2+BB3tQqER31AN3ErW2Muif9ff+Qn
	 YY6z+SXL1fa+jGx/2vZ5ZBKeFXId8Np7R/zNxAf9y+uu4abywIxQv0CXHezJvHyzma
	 msg0O0RWrPf5Q==
Message-ID: <889be563-78d6-7148-f7d2-09ae21383ee4@collabora.com>
Date: Wed, 29 Mar 2023 15:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 05/17] arm64: dts: mediatek: add mt6357 device-tree
Content-Language: en-US
To: amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-5-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-5-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_061759_554745_682BE3B8 
X-CRM114-Status: GOOD (  17.03  )
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

Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> This new device-tree add the regulators, rtc and keys support
> for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6357.dtsi | 282 +++++++++++++++++++++++++++++++
>   1 file changed, 282 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
> new file mode 100644
> index 000000000000..3330a03c2f74
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
> @@ -0,0 +1,282 @@

..snip..

> +
> +		keys {
> +			compatible = "mediatek,mt6357-keys";
> +
> +			key-power {
> +				linux,keycodes = <KEY_POWER>;
> +				wakeup-source;
> +			};
> +
> +			key-home {
> +				linux,keycodes = <KEY_HOME>;
> +				wakeup-source;

KEY_HOME is a wakeup-source?! are you sure?!

(P.S.: I'm just checking if that was intended)

Regards,
Angelo

