Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D52C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 21:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EED623426
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 21:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EED623426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NIM8eCBefmym251VK9UeYMZOiHq2MFs1NbHRqKqZnEk=; b=eADxXkipEJn1/7fLZjB9AWLqV
	x4K453iGU2zc86NIVVh/n+jcvpELq//xUcMQXOaEeNYmhGJQmAzM2ni363cCKIV7lfecWy+eoUxtf
	+OzuZ8AAv9sFM50X0LPvY5Hs0t7l/0FwRADYv61wB/40/3cKtdZjf6YpogLTDm3Yi8xUeAzoc15wo
	la9O0K6xlzyyBFbhls3XFBeDmUn+d5RVAtcrcWo6eCX7h/jRb4eX3CUTWSSzAdQCMNkckoqSLfJ8t
	waQhX8Fsbhi3zybkv7ZPhaK4TT61Nhhj2CjHf4T2A3ZwVwSPXDOn7pFylrWgZeKpo7S9slWjdpFdg
	QqVsoifeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpegV-0006tm-Al; Wed, 16 Dec 2020 21:50:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpegQ-0006sS-Bk; Wed, 16 Dec 2020 21:50:07 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 145A21C0007;
 Wed, 16 Dec 2020 21:49:59 +0000 (UTC)
Date: Wed, 16 Dec 2020 22:49:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v4 2/9] rtc: mt6397: refine RTC_TC_MTH
Message-ID: <20201216214959.GT2814589@piout.net>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608104827-7937-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_165006_578323_B787EEE6 
X-CRM114-Status: GOOD (  16.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 srv_heupstream@mediatek.com, Ran Bi <ran.bi@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/12/2020 15:47:00+0800, Hsin-Hsiung Wang wrote:
> This patch adds RTC_TC_MTH_MASK to support new chips.
> 
> Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-mt6397.c       | 2 +-
>  include/linux/mfd/mt6397/rtc.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 1894aded4c85..ea6da7476a5e 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -75,7 +75,7 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
>  	tm->tm_min = data[RTC_OFFSET_MIN];
>  	tm->tm_hour = data[RTC_OFFSET_HOUR];
>  	tm->tm_mday = data[RTC_OFFSET_DOM];
> -	tm->tm_mon = data[RTC_OFFSET_MTH];
> +	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
>  	tm->tm_year = data[RTC_OFFSET_YEAR];
>  
>  	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
> diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> index c3748b53bf7d..068ae1c0f0e8 100644
> --- a/include/linux/mfd/mt6397/rtc.h
> +++ b/include/linux/mfd/mt6397/rtc.h
> @@ -36,6 +36,7 @@
>  #define RTC_AL_MASK_DOW                BIT(4)
>  
>  #define RTC_TC_SEC             0x000a
> +#define RTC_TC_MTH_MASK        0x000f
>  /* Min, Hour, Dom... register offset to RTC_TC_SEC */
>  #define RTC_OFFSET_SEC         0
>  #define RTC_OFFSET_MIN         1
> -- 
> 2.18.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
