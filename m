Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCAC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aEmObP0Pw/KgqZDXxeWoNhP+pULI6aVRCKx2gXcEIY=; b=MpUZux2IgTl4h5CAMs+5ghd1r/
	ZFwDTkLA5qaIVPy/N7htq5rGUfHwqBBokKcHplGk/0cmh6GQ7ndhcLpQoUqkfh820Qa1ebrA4hRHO
	39whd6i+OPYLAZl57h/Zx0ep3ykXzVbUYxBaQ3kZfpiCZPBHSowYYcsmwn5dMwGzzUBYFliO9pPcw
	UaqUWXlBDjFyxgYByP8fBaFlo/yvTdMroNQ8XSb1xANbuhrvQnqGsZRVPy8bn2D13js8mX0VKXFf7
	NxEPVQ3fI8RvnM3luztZGNApl8zarpNkxrvNpcdCGj6GC87Z6DTJ+pYX3g3YDCiwBnAOeQ1JTF+6v
	wdQknpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMzg-0011iE-Mq; Thu, 06 Oct 2022 09:16:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMzB-0011O0-Gw; Thu, 06 Oct 2022 09:16:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADB3566022F9;
	Thu,  6 Oct 2022 10:16:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665047768;
	bh=GDGLsYsj0D/nebPVYIooIdcVZbO93mCgP/BtLTyCxqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ISYCMpZUlkUQQHPE6fJGNrMrqTWoUe8kPaqYs/+I+MBK3dVUI0emcqqogWe1BmQUZ
	 3BWV/hDTLBd9Zf94zq8ZR1wrRAixEorbnKgojILa7Xqb/SlZx+eebxWO05l/qT0Gic
	 vjZG+dzOb0tX0JnVQuAPtNkwiDFId7UeDrvV/081dHdub00+mQgJkYSWCEK5B780C9
	 24B71rgmUrOwUwB2HzpvJVlfW+zZwi8eYYqXkOZo+T3ltRA9DvsY4rC56N+7AlG7mp
	 cYZFaqrL6fWcfb8orl6492aUztpC5VIquLhofLFUc1Q+wtEUe3OA0V8BtpgZmR3uhg
	 4HoaTcSf9RgiQ==
Message-ID: <b1140018-8787-4365-14ab-16d21716a162@collabora.com>
Date: Thu, 6 Oct 2022 11:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 01/10] arm64: dts: mediatek: mt6779: Remove syscon
 compatible from pin controller
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005174343.24240-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_021609_734204_1DB926EA 
X-CRM114-Status: GOOD (  19.86  )
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

Il 05/10/22 19:43, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Remove syscon compatible string from pin controller to follow
> DT bindings and pass checks. Adding the syscon compatible to
> the DT bindings documentation instead causes a different check
> error due to the syscon document specifying a maximum of 1 item
> in the reg property, while this has 9.

Please change this part of the description...

> Nothing is using the pin
> controller as a syscon at the moment so it should be a safe
> thing to do.

...to:

This pin controller has never been, and will never be, used as a
syscon, hence it is safe to drop this compatible.

After which, you get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 9bdf5145966c..a6fa5212da4e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -160,7 +160,7 @@ infracfg_ao: clock-controller@10001000 {
>   		};
>   
>   		pio: pinctrl@10005000 {
> -			compatible = "mediatek,mt6779-pinctrl", "syscon";
> +			compatible = "mediatek,mt6779-pinctrl";
>   			reg = <0 0x10005000 0 0x1000>,
>   			      <0 0x11c20000 0 0x1000>,
>   			      <0 0x11d10000 0 0x1000>,


