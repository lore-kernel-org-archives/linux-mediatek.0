Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9ngVPkdz2/+Cjr18SStiIcREXvtgPSYLHUyjhn8yXk=; b=VARFX6k7701jVi
	4VVyo/hjVD86ojUyMmC51qHueCOgi9RopsVp2BrlS3eBxsUqK5pxE7nz0EmJTvuQk7uFJq3B9/4xi
	jGFHna8gkqpBRQRi/TI2a9ZuFMG2yAbHj723H+Zhd+kTezdqr5vi4q2m/Q1GU3QLA1dQYUmcb35pr
	jMQAYL+F7lXHPyK3yDhW3QV0WpuGd1yKH/lPpQrmsyDFO9cA9lli8GQbJ1dQuJavYeNeK0cwaUdMh
	eC2bP2mN9RmXl/4eSE/ROX+YuspDQz6/RLjx5lLgAtZ4DNu210pTmue7zyQsusTV7sDsEA80VLqKg
	Vie8CMIp375kDowCtNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4eU-00Er7J-M4; Fri, 18 Feb 2022 14:54:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4eG-00Er1E-9D; Fri, 18 Feb 2022 14:54:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BDAD81F46B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645196052;
 bh=waAoYQrd/zon1ObYSebR32rz8jo/+xh5mii/0mQIta0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=J+5IrzL1aUstLqU1jHWBQ5y184NmlTZ1BA8PdukNZ1FcXWUD9gFtXQDbbh9hfmF7u
 XxavwG7XoNIZ/APJ3iwjJt2CEguvvFNPMJ3sLk3pv+0qQAPXSmMvULlrQXg3SO4gbo
 3Z/4jfHGHpKS8E1Fprko/SPC3zn8RurvHt5ukJ4JRaSQstIYUbnPtnk1caRtn/Z6j3
 mGRmknFUMigs7RnN/+87mHydSLVl3zdzY9lMnJ3ZbVNv9ze63b9spIfQWUoqKZIKYn
 dDJA5v4hjnLwnnBTW87vYzingVYERkjLoNe8JLafl1IJCK7JkVQZiXiUUQblhX00/T
 +J+n0x5OarDQg==
Message-ID: <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
Date: Fri, 18 Feb 2022 15:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v2 01/17] ASoC: mediatek: mt6366: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 aaronyu@google.com, zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-2-jiaxin.yu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220217134205.15400-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065416_547874_411DA93E 
X-CRM114-Status: GOOD (  15.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> Mt6366 is a new version of mt6358, and they are same about audio part.
> So we can reuse the driver of mt6358.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,
I'm sorry but this commit makes very little sense.

If you want to advertise MT6366 support, please write a note and/or
a new compatible string inside of the mt6358 driver (and dt-bindings),
then, please drop this commit.


> ---
>   sound/soc/codecs/Kconfig  | 8 ++++++++
>   sound/soc/codecs/Makefile | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 8fa24783ce01..6631094678f5 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
>   	imply SND_SOC_MT6351
>   	imply SND_SOC_MT6358
>   	imply SND_SOC_MT6359
> +	imply SND_SOC_MT6366
>   	imply SND_SOC_MT6660
>   	imply SND_SOC_NAU8315
>   	imply SND_SOC_NAU8540
> @@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
>   	  for ASoC codec soc-jack detection mechanism.
>   	  Select N if you don't have jack on board.
>   
> +config SND_SOC_MT6366
> +	tristate "MediaTek MT6366 Codec"
> +	depends on MTK_PMIC_WRAP
> +	help
> +	  Enable support for the platform which uses MT6366 as
> +	  external codec device.
> +
>   config SND_SOC_MT6660
>   	tristate "Mediatek MT6660 Speaker Amplifier"
>   	depends on I2C
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 42d00aa4ee46..1279684feaf0 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -465,6 +465,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
>   obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
>   obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
>   obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6358.o
>   obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
>   obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
>   obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
