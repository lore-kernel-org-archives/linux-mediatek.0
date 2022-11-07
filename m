Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD15C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLG7MMNLsMFFQSL7YR7tvlXIJ9pc/WoZs4iXy04PJEY=; b=EB//iFEsPuKkIdSn01yQ7ip2P7
	IyQ9isJx4ZpJNkA2Z/2wAKNUB/hDmovE/2wIvcgBWhDgSkSfY2h5Gy1KoEw9fD3qgyX4Ob4etHl0e
	aTIZl/UUtrZ2YP56EG80OwD+xfxQQRHWZw0YbTiKxN16axbK/jFevdknEu4wO6Hk5aCDUuGe6Q2Dd
	4FPvYx3CBcJ1uv+EPZvfohfRjFvy7gIP+L567KNQACuq/ePF8cjEKGwDUrVKa83OFTufXy1Ug90kc
	qPoR9iXAbdwcSOBqPWG3tUuikBjjDQEQPFpxBDcvNki7rKavYYWF5OfeYehmltjN6yW6k5cCTK/Sc
	QkWymwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ory6W-00D6Ln-V8; Mon, 07 Nov 2022 09:07:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ory5r-00D61c-Mx; Mon, 07 Nov 2022 09:07:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9AF786602253;
	Mon,  7 Nov 2022 09:06:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667812014;
	bh=LII2H+Y0rK9SUnBNSYFRD9K7i5ZCtRMMy7uIrtE0TUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PUJmhsIqx5ppfwm/FnTucgZCGPenhimrZ76lVA9gAFeOYQ5GFqNrxQVIRQaEQoRHP
	 9Gw3CzJErSqcLH5nD/PF+lHE0owVpX0hTsyMPrXxlvK0BZ2NASiKGuyx4IzpTJd55X
	 arfVJ43WIQFa7QwK9gHG93kk7+CZQx2+zuR1YtEl7ae03TgE5VhUM8mOkBliJufBbJ
	 0hj7f8PXq27VIooNONnMEGSebVhNThWeKTfg4gRnggSPFQkexuK+5d/B3FY563nY2Q
	 Vo/EYkePlVh5CL9Sl/dbDhTDp+xIPsnriS9UxHXDUTcYn66szeE8QcyJaEq+NgdsWh
	 iWJ4z+JUtYQxw==
Message-ID: <63325548-63c6-8405-6481-3b019e7dd656@collabora.com>
Date: Mon, 7 Nov 2022 10:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module
 device table
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Miaoqian Lin
 <linmq006@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221104212409.603970-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221104212409.603970-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_010700_036433_E097D952 
X-CRM114-Status: GOOD (  17.92  )
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

Il 04/11/22 22:24, Nícolas F. R. A. Prado ha scritto:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Hello Nícolas,
I agree but.... can you please do the same for 8192, 8195, 8186?

Getting them all in one series would make absolute sense... :-)

in the meanwhile, for this one:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
>   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> index 9f22d3939818..0e572fe28c58 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> @@ -842,6 +842,7 @@ static const struct of_device_id mt8183_da7219_max98357_dt_match[] = {
>   	},
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, mt8183_da7219_max98357_dt_match);
>   #endif
>   
>   static struct platform_driver mt8183_da7219_max98357_driver = {



