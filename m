Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950E0C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 02:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC2061004
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 02:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AC2061004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4zKye8hkcV7SpH3teo0fvyn7+zY8xLfRE3k1T9rU7w=; b=ftBRpveqsofiZelJDIhASZR3X0
	HWJ4xnXm+TtnHjtKhCOTto7NcDN8on1JYfxcWItRrjvk33TUnEXczjytjtJ1smsB2TeA3/yUdpl19
	66fgpagFEBOHhW8Z/F3c7F2zOFU2IkIc/WB8iMaHTEXvuEcjSrs0IZnI6vuVQy/rHo6DA8E+xrCpe
	8hMlOZFDD5an0TfIb38w4QeXvmmLC6HTJ0dhH3rxvSI8LtAFY6PJ+a7K+rFZsOi5R0WPCDj3Icx2S
	2+1bpU2RJ5jdc7/6swXesxqLhWLmjN8WP+xNePNn9HpFRq9w10QxX6BWm0HpdWpP5zMT4CGXAE3mK
	9g7+HH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKtyO-0011wn-TI; Tue, 31 Aug 2021 02:58:04 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKtyC-0011vi-EV; Tue, 31 Aug 2021 02:57:52 +0000
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210831021303.5230-1-trevor.wu@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1630c5bd-7f9a-ef63-0476-74c6077adb7f@infradead.org>
Date: Mon, 30 Aug 2021 19:57:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831021303.5230-1-trevor.wu@mediatek.com>
Content-Language: en-US
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

On 8/30/21 7:13 PM, Trevor Wu wrote:
> randconfig builds show the warning below,
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>     Selected by [y]:
>     - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y]
> 
> Add a dependency to avoid it.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
>   sound/soc/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index cf567a89f421..f6bf0f9c91e3 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -197,7 +197,7 @@ config SND_SOC_MT8195
>   config SND_SOC_MT8195_MT6359_RT1019_RT5682
>   	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
>   	depends on I2C
> -	depends on SND_SOC_MT8195
> +	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
>   	select SND_SOC_MT6359
>   	select SND_SOC_RT1015P
>   	select SND_SOC_RT5682_I2C
> 


-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
