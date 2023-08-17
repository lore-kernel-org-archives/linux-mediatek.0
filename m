Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1E8C30624
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dLjl/f0oqc6iisdMk//W6ivYdiSooQ3OIVW7599Y8g=; b=f5Yi2HS3VrR3vaB5bQTtGeq+D6
	FtBVabJvbcIaOzkQiwHnuFrhcAnz/ZnM+WC6IXDlEDsJWHpuAGuWP10MObbw200qNtjLEs0yYawTF
	gpKCO3V5LvqQe6PfSZHupagS3f330K9euI2Xfdy4FYBYOXHQRroS8Ddak7ZugWgGvs0/XADKDP9dT
	F/2WoyuPrkGkYAjfBGfCy79f1W0FYATatLmyRdHB+Y5RGyTRcvfOLlp0wCmYbGAw5SH8BaRwsu9dc
	MoBQt3Pq2jhvbmkMyNN3j56hzqwd3E5eFy4beu7Q+lUJmVO0VUpK0GOci1PlvVgfsmp8icCOXyFVu
	MEoEyjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWeGF-006aF9-0o;
	Thu, 17 Aug 2023 14:46:07 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qWeGB-006aDF-1f;
	Thu, 17 Aug 2023 14:46:03 +0000
Message-ID: <779de02d-0fde-37dc-529b-3fe87b62455b@infradead.org>
Date: Thu, 17 Aug 2023 07:46:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 4/6] ASoC: mediatek: mt7986: add machine driver with
 wm8960
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230817101338.18782-1-maso.huang@mediatek.com>
 <20230817101338.18782-5-maso.huang@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230817101338.18782-5-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 8/17/23 03:13, Maso Huang wrote:
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 558827755a8d..8d1bc8814486 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -64,6 +64,16 @@ config SND_SOC_MT7986
>  	  Select Y if you have such device.
>  	  If unsure select "N".
>  
> +config SND_SOC_MT7986_WM8960
> +	tristate "ASoc Audio driver for MT7986 with WM8960 codec"

s/ASoc/ASoC/

> +	depends on SND_SOC_MT7986 && I2C
> +	select SND_SOC_WM8960
> +	help
> +	  This adds support for ASoC machine driver for MediaTek MT7986
> +	  boards with the WM8960 codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".

-- 
~Randy

