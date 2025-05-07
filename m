Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D66FC3ABBF
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD/ZPB49P6LlMknoqD/OaERqdZ8Y09oESPfqDGk4nRo=; b=AfXHhlflkgmc31C3xy4DSv8h5A
	9LsGI8+M+mw72y8ZMtfyULeTDDeoE5a+SJJKfoQVtDObsvm5yoLfSs8679bQp48TI/lTLxu20lCJl
	ajhYUrBaQSOGTeKaJVuREjN4QN2/tiuUQH7V/LlOqOpaZncxXuTuGQrX8WXA79bBir2nYjYTOZZWj
	Y4l+oWmw97AwbwJc/OjHQms8dXQAnEZRUBnx8lrHCmrTl7XCeNH7rZxl48H9WREw/VZGAOOdcYKlR
	ijLcWsxzdGonO1hpuh9TawVcaSxFsYmLztjwg+jblrYnkTw1+/u1udjQbzhIvUPMyYi2Egv/xG1PO
	J+HOcomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXe-0000000GJzk-0KBY;
	Wed, 07 May 2025 17:26:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChpu-0000000GBhF-3rs7;
	Wed, 07 May 2025 16:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746636091;
	bh=iu4DqH0BiPBmHQ3Yxxgy5dmtT9CVDW/JTaBvXtsoyVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqmJ7wZCGoPV75a1CSt5fFVV8hrvOqfCXQ0JPVfKoPTPhbHeRx4CnRdrVacfFgkw6
	 ZyBkuUrakoPGIFob+t4tXeZF0bqBAR0RcoqSw6Lxl4LeFkHhIcZePw8nJUW037Q0l9
	 +XYqQGkw0UHbU5S80EWBf/miDl1sTjzjwfLTVt4PuE6NyAXbWIIfrYjhUtxERDpUEI
	 +wNcJ8nnwgIUgcGoWK52d/XXRG8e6n05o3z+UvAgOA8x93+GfjpOERpguPMLhmvj37
	 dD+3TVjgDSNCoEVQHqicrGFRCMBWH7i3EqXSMya3BBb6oIRG5Q2O+HSnD5lpo19NZ4
	 flhNyI2SI20kA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEA5417E04C0;
	Wed,  7 May 2025 18:41:29 +0200 (CEST)
Date: Wed, 7 May 2025 12:41:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
Message-ID: <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
References: <20250505052106.1811802-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505052106.1811802-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_094135_124610_862B230D 
X-CRM114-Status: GOOD (  19.94  )
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

On Mon, May 05, 2025 at 07:20:52AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver support was added without selecting the codec, which leads to
> a link failure:
> 
> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'

Hm, I cannot seem to reproduce this. I just tried to build on today's next with
CONFIG_SND_SOC_MT6359_ACCDET disabled and have tried
CONFIG_SND_SOC_MT8188_MT6359 both =m and =y, but in both cases it compiles fine.

I wonder if somehow your tree was missing "ASoC: mediatek: mt6359: Add stub for
mt6359_accdet_enable_jack_detect" [1], or if it's due to a difference in
compiler versions used...

(I'm using gcc-linaro-12.3.1-2023.06-x86_64_aarch64-linux-gnu)

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20250306-mt8188-accdet-v3-3-7828e835ff4b@collabora.com/

> 
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 3033e2d3fe16..e148d4d94160 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -229,6 +229,7 @@ config SND_SOC_MT8188_MT6359
>  	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
>  	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
>  	depends on I2C
> +	select SND_SOC_MT6359_ACCDET
>  	select SND_SOC_MT6359
>  	select SND_SOC_HDMI_CODEC
>  	select SND_SOC_DMIC
> -- 
> 2.39.5
> 

