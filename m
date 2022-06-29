Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRE6uwHw6tHPrdiUH0ZSBv/kDW8FNRmSdw+rQgpe32U=; b=Dbq+lxDPv9lECmOWR4tyXxPwSb
	ZygOJ4qQVZ+iLMOr/ZgAXENBU4yxpknXv55hLbCJOqWw/PXp4/6yok8cOuTVnrl17dfy4DQwbOZlT
	mBJOD7YTgvevJsd8xNBk/W/TlSKoR5xKgMXMYnxNUqIWJwU04v5EjZBoZN42QjsGfPUS9HkHzBkKc
	GqShZKBX99XQR6hLkr6hw4G78oqbUO0kIcOX25ut4K8iGbM9BWiSHC+mrCflbBZ4jNrARexe8rFDO
	DZ8J5y8K1jw3+kWBlzk7uwcQWe75Jyp8Z7YIERRSBiV0hPRMLIqPptS7w4iSlqk3lF4Ijn4ctVjfC
	iBRrdroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Syo-00AMio-Lj; Wed, 29 Jun 2022 08:23:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sye-00AMgR-Ag; Wed, 29 Jun 2022 08:23:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7567966018F6;
	Wed, 29 Jun 2022 09:23:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656490988;
	bh=0t6j94JZZK8bF91PrvfOUNSp6yuyLd27b/J9iVMqEwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+M88IanBOnVCTuoqrdwn3cJ/u3N++3aODbXoX27zZi74s7P8Nis420l+UrLEX9tp
	 n0LT1X0S8tG0DTwsL+4TARRktUPQWry2XFJ4ySHmxKNqmdWJKQg1EHRTyEkExv0KtV
	 1kInSvhWwERZt+s2p88Yc9AvSEWwohajIv+7Y57Ec0uFJzWH4IWL0wZpqhcd0GHUXA
	 uNV6nTWW9a7cfIfKEjn7eX3ieoplqUZZNTklloeJKh6NtJQg82PVXg0e66omx62+Fg
	 hH4B13tieKuRR4nVs9uYMbHZRPV7LhhhXWbJLI1kViPa0Ph2/hPNUDS5annaBdiLP2
	 D8sA/CXHAZamA==
Message-ID: <618f0794-429c-705d-ab4c-84aace6aaaaa@collabora.com>
Date: Wed, 29 Jun 2022 10:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] regulator: mt6370: Use 'fwnode_gpiod_get_index' to
 fix gpio parsing
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, chiaen_wu@richtek.com,
 alice_chen@richtek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ChiYuan Huang <cy_huang@richtek.com>
References: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_012312_542617_B232771A 
X-CRM114-Status: GOOD (  17.71  )
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

Il 29/06/22 03:41, cy_huang ha scritto:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> From the common binding, 'enable-gpio' or 'enable-gpios' are all well
> for external 'enable' gpio.
> 
> 'gpiod_get_from_of_node' only parse the 'enable' property, it need to
> add the gpio suffix. It's more convenient to use fwnode_gpiod_get_index.
> Although fwnode parsing is not preferred, but 'of_parse_cb' already can
> guarantee the callback will only be used by regulator of_node parsing.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>   drivers/regulator/mt6370-regulator.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
> index bc356b4..949b2c7 100644
> --- a/drivers/regulator/mt6370-regulator.c
> +++ b/drivers/regulator/mt6370-regulator.c
> @@ -153,7 +153,8 @@ static int mt6370_of_parse_cb(struct device_node *np,
>   	struct gpio_desc *enable_gpio;
>   	int ret;
>   
> -	enable_gpio = gpiod_get_from_of_node(np, "enable", 0, GPIOD_OUT_HIGH |
> +	enable_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,

Since this driver is never calling gpiod_put(), you can even fix that in one shot.

Just use devm_fwnode_gpiod_get() here, as it's guaranteed that priv->dev is
initialized at this time.

Cheers,
Angelo



