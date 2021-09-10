Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7587C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 01:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39B760E54
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 01:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A39B760E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5l7udt4kHHOjrqPmtluwQJSfimfhajs6uu5wzzK0jk=; b=0sm/u5wczKmRQ8Seoi5vPR5QaJ
	fY7oK1VElClz9iWr+2TA+8dhTGiYvoJ9tC9Iwyh/85SK/Al+aow3ItRNylzDn6VMVgy0OkcMCeE2s
	fyPWgcaP6FP6wIuKj+4oD0TDSYn7k27v/s+0fHaKFPCWoGaGfNik2FQB9Gy7KXJwSPmzEVSmkhiuF
	jneI58lcj+Uq5dOuzahN3lHtNNN9t9IIrJ4hb/34iL7qZ7QXp1m6RaCRlULaXJYycLJPzzIoJQ/bS
	2CIQAkr9ljGe/Mxn+A+qigDuIfzcKDr91R49u7D3aZIi4KjJTPe7/QOUKKChj3o818Bo3py10VPYg
	mYk2DOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOVYZ-00BXbN-QR; Fri, 10 Sep 2021 01:42:19 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOVYL-00BXZP-9T; Fri, 10 Sep 2021 01:42:05 +0000
Subject: Re: [PATCH] ASoC: mediatek: add required config dependency
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 geert@linux-m68k.org, wenst@chromium.org, bicycle.tsai@mediatek.com,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com
References: <20210909065533.2114-1-trevor.wu@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <46bf2061-7a00-c6f0-d2e9-5605b13f1c3f@infradead.org>
Date: Thu, 9 Sep 2021 18:42:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909065533.2114-1-trevor.wu@mediatek.com>
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

On 9/8/21 11:55 PM, Trevor Wu wrote:
> Because SND_SOC_MT8195 depends on COMPILE_TEST, it's possible to build
> MT8195 driver in many different config combinations.
> Add all dependent config for SND_SOC_MT8195 in case some errors happen
> when COMPILE_TEST is enabled.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
>   sound/soc/mediatek/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a2f4667d50b..81ad2dcee9eb 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config SND_SOC_MEDIATEK
>   	tristate
> +	select REGMAP_MMIO
>   
>   config SND_SOC_MT2701
>   	tristate "ASoC support for Mediatek MT2701 chip"
> @@ -188,7 +189,9 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>   config SND_SOC_MT8195
>   	tristate "ASoC support for Mediatek MT8195 chip"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on COMMON_CLK
>   	select SND_SOC_MEDIATEK
> +	select MFD_SYSCON if SND_SOC_MT6359
>   	help
>   	  This adds ASoC platform driver support for Mediatek MT8195 chip
>   	  that can be used with other codecs.
> 


-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
