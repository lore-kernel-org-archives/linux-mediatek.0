Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3623CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXTJFIlm7chB3mg/lTNlxjah3CKtLnj3YpSNTESuIpg=; b=dBio/UV6e9bXTf1AUS3SGleMxn
	puuTFuTgWot5r3pYvVElR2Ej3csrrmiu1eVEYsi56Rg910i+K4N3rszWpR6KcyBxv1Gp+dZb0fT9h
	s4uXo9WxRehuppkl5O66E2fmJLj2hJSxRknyldIu/jyCceuAtXPNWMP/DMgdmKFRjBLzMYv5+pmd0
	CQiBx1vCSmiNz3pnIzLMLjMObOf5kKLOs5XWXDW2tA1g0LYgMfZPUjJFMcD+RljabNbsMj0ZGT+7Y
	hilUoxWsuxs4dY/qj2r8+1TXAMVEti9vmYktexIXE3wR19qCs8WkWh2jLrK/XIkOvB/ko5b6lo9lI
	vTfV/nrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rc8-00AhEJ-8i; Mon, 10 Jan 2022 10:09:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rbw-00AhAN-Ei; Mon, 10 Jan 2022 10:09:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A8B501F43744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641809347;
 bh=9r/SDK6nozUu5OWdjoYPAUhp3hjBUTHjNcy/d6M0jgc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WcHo25d+Tywel71wR0c+GwyX5XpRG3rJEHviTasqUvqh+sDhc4FFxKMvnt4pGKimK
 yvGVBlFqmW05dJ3aO3QJDNQmXTC5a31mMtQ9qDT20emZnvV/xq1W9ljkN93kJhOTiJ
 ioi/SP1A92tc46RyIyCXLvX03qRD3qp4Jy4tChtYHnk5tk+Mp5PrHE4Hbu7J77oMa5
 72ipZ9sWmccyF8JBcGy5ORq+zYYDkuIliHES6/ZXF3dezsULqlmullRP7xlahWog4+
 kL6PT4n3P2vpCm1QxacbyNPtEemg26ixY0UIIeMDDAkmYqYhZk5b2/PbfwWeCTI7kC
 LUZx1lJA5Yj+w==
Subject: Re: [PATCH v1 2/2] pinctrl: add pinctrl driver on mt8186
To: Guodong Liu <guodong.liu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110073111.31306-1-guodong.liu@mediatek.com>
 <20220110073111.31306-2-guodong.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c7d7fbe3-1fe2-8765-5577-b4b06cebe9b6@collabora.com>
Date: Mon, 10 Jan 2022 11:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110073111.31306-2-guodong.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_020908_663207_F28B7A1A 
X-CRM114-Status: GOOD (  17.87  )
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

Il 10/01/22 08:31, Guodong Liu ha scritto:
> This commit includes pinctrl driver for mt8186.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |    6 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1313 ++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186 +++++++++++++++++
>   4 files changed, 3506 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8186.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 66db4ac5d169..2cb5963cef4c 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -147,6 +147,12 @@ config PINCTRL_MT8183
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_PARIS
>   
> +config PINCTRL_MT8186
> +	bool "Mediatek MT8186 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST

Like the other MTK pinctrl drivers, please add:
	default ARM64 && ARCH_MEDIATEK


With that fixed,

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	select PINCTRL_MTK_PARIS
> +
>   config PINCTRL_MT8192
>   	bool "Mediatek MT8192 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 1e3931d924e7..29018d6ad0de 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_PINCTRL_MT7986)	+= pinctrl-mt7986.o
>   obj-$(CONFIG_PINCTRL_MT8167)	+= pinctrl-mt8167.o
>   obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
>   obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
> +obj-$(CONFIG_PINCTRL_MT8186)	+= pinctrl-mt8186.o
>   obj-$(CONFIG_PINCTRL_MT8192)	+= pinctrl-mt8192.o
>   obj-$(CONFIG_PINCTRL_MT8195)    += pinctrl-mt8195.o
>   obj-$(CONFIG_PINCTRL_MT8365)	+= pinctrl-mt8365.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
> new file mode 100644
> index 000000000000..1e550b15b9d4
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
> @@ -0,0 +1,1313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
