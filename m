Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB60C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gA1T1mkTnxN4dRbzlJUTkdSXzutk+n2w+xhsIWJ6kIA=; b=x8krG9MmPdgqE5s00Y6aXRpapx
	JgWsOLFjCH/S4IgMB3cV2kIDl0ZYg2HO2SNTDqjlQrUgzs+UPOy9BKIwdKrEZUYwXWV0AceUahZoW
	PVCvrpHOEyGt1Afas6qn/zNyTxoe9CTu82zi8r9ns+Ski8YrdVpfxeW8x3y5bMMbRUarKdnI2nl5b
	mzcQzJNMWBJOxe9PtpQW7umDYDJZuSqCJQN3TZAjmBcnJD8N+CTFfNQ5mR5Ics6+DUoXuTSUoKXHt
	DEeZzXfscgAMtfEF2dwaE3M0c/M0j3SlmVyO5cDiyd5rXAJqYpQlANzKHr2N4++f9z8IsDYNdUqhm
	IZTTkzmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlPm-00EETc-1d; Tue, 17 Jan 2023 12:50:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlPV-00EEMS-If; Tue, 17 Jan 2023 12:49:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D51126602D6D;
	Tue, 17 Jan 2023 12:49:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673959788;
	bh=2f4/mH0AmuS+686ZhgQepdDKGjjvbP5co+SkciQwZ54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fREZ3JJ9lELJEDVXlMRtWynjzQRr2cSZa0ufDIp6MWMx8eeAK2KZ50mD5cs0LkuDz
	 GLgFa9JaukEKBjYibCrFl91X5+Bt+mCD3BskgiPHx1ChgYmpab+8ZuDuEPrQf5sKvs
	 FdGiubXww7SzlAclSd/fFAEVujBXmFZXCAIgyFhmKJyvCYmjy6x6hhgwDs3P+tgKcO
	 /rh5LR2CAKS/iXmSm3yPgDz1meuRil3K9XCRwYkXC6fRBdp6m2wK5fU3P8wCSQZAAU
	 g42aoPD54UT8zWIXGMvbrfY0a7cGd2jU2Dn9qkXpttLXJZNpwcmDzvIsPREVndf2ip
	 AO7Is0EoLOZ7A==
Message-ID: <7a6522ef-7cf7-808f-8be4-07cf5567d18a@collabora.com>
Date: Tue, 17 Jan 2023 13:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] i2c: i2c-mt65xx: add MT8365 SoC support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
 <20221122-mt8365-i2c-support-v1-4-4aeb7c54c67b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-4-4aeb7c54c67b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_044953_795306_A838DB0C 
X-CRM114-Status: GOOD (  17.76  )
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

Il 17/01/23 09:49, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add support for I2C on MT8365 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index d80e59340d97..2c9dbb42861a 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -511,6 +511,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
>   	.max_dma_support = 36,
>   };
>   
> +static const struct mtk_i2c_compatible mt8365_compat = {

This is exactly the same as mt8168_compat... so you can avoid adding this one
and you can also avoid adding the compatible to this driver.

This means that you can get it working with a devicetree declaring

compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";

like you're already doing and without any addition to this driver at all.
So, you can drop this commit.

Regards,
Angelo



