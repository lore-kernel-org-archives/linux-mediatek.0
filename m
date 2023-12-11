Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20910C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQKgWZ9+y1OiXx3XNF4AFI3F1LrNHYG6kzcLKtrVoKI=; b=TrOcfcDJNPYgo7dUti7ZGTYj8+
	bWHQEeoesnLSfJJXe//DbWaczVSU6CK9vuaLiYHHcGKH1Fq61v2M+FHWfjhzVYnWfRBmDkAo16Q6J
	tG6x6jGYu7aC59zD74udvPH0eXmAE6HbaZKm97ZtV4SCPAbSvMo74H6s6JiSkbPTfocSlFW0I2Ol2
	RPnW6180vryaqCO3m2cw9xeqey5kFNvBt8bnx1L/OtdrgRFM5r+aHPJKv3fPS19p4cDAvDIWAL9uQ
	zTJ2MbFwOyVOGHgiV/wMYb096Wp4EQy7qdP3+MEV5Jih61KMUuYtt15q4uQ4fchxB4ADs6QBK9p/X
	c4a7/QFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcuU-004W0w-20;
	Mon, 11 Dec 2023 09:49:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcuL-004VzY-1R;
	Mon, 11 Dec 2023 09:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702288136;
	bh=6mxzECBrYAAv88Or/VmuYFmoaCjMKUWyx5lJyKf47Rg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZOyfTjeWI75SumpYHrJJp3tpnNbregMBpz6DYPBko3jqkrqUVZIIKilCA2wvPCDmF
	 ko75vYXWrMKcmLVqcRtnuP7fwh6mFje5roaPrHqyRZy/yEvdee3SRlJ895KZOPuvTz
	 ch3rLBmYcqzM22MP/xXNoCohbQCB+dkubsUls2EjCj8sF7/TbUh4nEUiaTMgnx0Ina
	 VA+s4nyZeZu9o17UPBsUnNjBZrBE1jOeb8RaVZdNcMEFOY1YFJsDMcPlW/gN9DxU2D
	 cdtpMKJ1GKl0vjxrH70xRVPZ83Uqp0vmZXCTcZs50uUu9S67Pu8DX2he1OekWYv3jC
	 lwcL/q7eCSHng==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4827F378140E;
	Mon, 11 Dec 2023 09:48:55 +0000 (UTC)
Message-ID: <1db19550-99c2-4094-95d9-9db1c384519f@collabora.com>
Date: Mon, 11 Dec 2023 10:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_014901_833070_F8B514CA 
X-CRM114-Status: GOOD (  15.06  )
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

Il 11/12/23 02:33, Daniel Golle ha scritto:
> If probe is defered no error should be printed. Mute it.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   sound/soc/mediatek/mt7986/mt7986-wm8960.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> index c1390b3734101..24a4b943030d7 100644
> --- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> +++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> @@ -144,7 +144,9 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
>   
>   	ret = devm_snd_soc_register_card(&pdev->dev, card);
>   	if (ret) {
> -		dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);

This is *exactly* what dev_err_probe() does! :-)

dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail: %d\n", __func__);

Regards,
Angelo



