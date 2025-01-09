Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B3EE77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcUXFptebfMrvGhDxe7112Zqb3/zYWm85RNBPbS8bvY=; b=0j080cx1KTP06C9L7BIoHmCjLA
	1gmNiB5KFU5LpMoHC6+dOnEQFMV2q44XxwatrLIus08OkiILw4iK9tSmt3GU8LK0EA1ilYUmhvMBk
	gkBFwONe4S6yzB3d2k6ZmvIRPmmXH1Lsr+E94zVrIl+PKJyZ8zxzrnmMfZbjIPVHu78QB7t3n0vLn
	Jxw4HFGeh8dz/CE9/pgxRMSrqBH5+X40EZjwBTC9DLa78PKQqkYrIhWsZQbr2wIxvlbszvKMFqHrU
	QrFYfovdRlmKIqjmWVgA7EROYkizuK9Nip5rGJgTJ1L6FHmvuZ4QtaWoFvrodPB+WIrOp+D5xHePr
	t2owBcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVulU-0000000CXRg-1KwP;
	Thu, 09 Jan 2025 15:48:08 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuk8-0000000CX0c-2SY0;
	Thu, 09 Jan 2025 15:46:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5D091BF206;
	Thu,  9 Jan 2025 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736437599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcUXFptebfMrvGhDxe7112Zqb3/zYWm85RNBPbS8bvY=;
	b=jYyL7GkIne9oYb8FfybPUDkwzY0fOSPguU5OcA0GaTE7DAglUSKrm2ReCMMqXhdhwrsVAy
	KvktXwI+fOv6k6wxomXnn42zUPVNEgewwfXgQZlUbCAQ49Lbh88w3BQzvl8INX8Z51zEni
	v7+njmfFUctYEwS4KY3e3nFSeUAO6JcJu/4csGT0dmGZtwW82+iVg5XOrxnPrIruCp1xGS
	MZ58xCxKFtfkq3sWLgmrkIL1O0sBwGgdltStFiw7fIG1WSKGnT7Z3c3LS+bPnaIL3Hb0ym
	Zy1U+tdEEzP8SGCd1/d3/AxOChMUB2QjtBAJwmGIL/HSOZvaLa9HAP62R6ykEA==
Date: Thu, 9 Jan 2025 16:46:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: mt6359: fix year issue
Message-ID: <202501091546387cff95fd@mail.local>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
 <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_074645_038667_F3353AFD 
X-CRM114-Status: GOOD (  19.93  )
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

On 09/01/2025 16:29:52+0100, Alexandre Mergnat wrote:
> Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
> introduced a regression.
> 
> ~# hwclock -r --verbose
> hwclock from util-linux 2.37.4
> System Time: 1262312013.143552
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Assuming hardware clock is kept in UTC time.
> Waiting for clock tick...
> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> ...synchronization failed
> 
> Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.
> 

NAK, you'd have to investigate a bit more, I want to get rid of the
RTC_MIN_YEAR_OFFSET insanity.

> Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 55e75712edd4..9930b6bdb6ca 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  			goto exit;
>  	} while (sec < tm->tm_sec);
>  
> +	/* HW register use 7 bits to store year data, minus
> +	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
> +	 * RTC_MIN_YEAR_OFFSET back after read year from register
> +	 */
> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
> +
>  	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
>  	tm->tm_mon--;
>  	tm->tm_wday--;
> @@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	int ret;
>  	u16 data[RTC_OFFSET_COUNT];
>  
> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon++;
>  	tm->tm_wday++;
>  
> @@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
>  	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
>  
> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon--;
>  
>  	return 0;
> @@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	int ret;
>  	u16 data[RTC_OFFSET_COUNT];
>  
> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon++;
>  
>  	mutex_lock(&rtc->lock);
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

