Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE84DC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDyK5ZmjN502fKG9aJq0pOopXAyTHkk+WjLgxahMmfI=; b=kKx7Ec7zjstp34nUAqn7bxedRP
	WF9q572+yqdJJ6zfWgZTK8VY75TisTD6IAXGeN7a6t6j3OdR4iIuBfO63TNW8l3BeN8UHGs2I54LS
	xq2yVvatGwCjRmfHuCjzSvdA/Y1k9t1M/KRGYCMNJ3qFCkRQDdV/1rgDUvia37jmbGvseJpKbMcca
	LRDGRuDQ3LMqKIQrplDjwYdojxkEm2bn/N/QlB2rawZiMeszuRf4mKfJyEdXwPjfrIoRPtun+FIAZ
	obcFBlyT6hNPbUbITT/EhfNymQFqb9wFS0j0mF0G182xObuSoDsKw2kLxWYZKEFh61YDknJBXdu75
	b8rbX9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVrL-000P6V-0E;
	Wed, 29 Mar 2023 13:29:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVrG-000P3z-19;
	Wed, 29 Mar 2023 13:28:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F060D6602173;
	Wed, 29 Mar 2023 14:28:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096537;
	bh=lyWc6jk5A6LTClzKu3aC2HCSa7dxYL0fLj00W7EFUR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HB69ZEuxdQOeT4MLk7YlrlyC90N97511yNR8oYhJWmEkGG0Whua3y/fZImqb9MgVV
	 XVJAuFmhoD5W+tOBiLbpHBhejkWojvUHWKMxIb06IYiu0JA/ZFFTEQR3INsStnMSKW
	 WB3urzECgWKHJpmKFWxMNyaulGn+QctmYRkzA/Nz+dCWMWpI95p5/eqHKro176nRuo
	 kPVAobrvcS4yXx2jYn3VI4nkbbP9vpl5wCGnbDvM2On9vP0CN2G50AbfQByj51N5Tz
	 2LbdrISvomx5RB2uWLuxKyngX8kJZv8gerhvmA7oPTZ/jtRQg0k+LniBF/Gio1cyi/
	 XpeecUQdgsLTA==
Message-ID: <44516e8a-0cd6-ef67-71af-9f2e2510e0d6@collabora.com>
Date: Wed, 29 Mar 2023 15:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 15/17] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
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
 <20230203-evk-board-support-v3-15-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-15-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062858_520242_4173E35E 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
> In order to have cpufreq support, this patch adds proc-supply and sram-supply
> for each CPU.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



