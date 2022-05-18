Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44268C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73+643y5oYauloytmzS7Q9hEqAVgCS5Ji6z7Fp6IKSg=; b=3vrqzWwimLbrRX
	lVyDdrxYDnZpO0I1+oKLoWlVpZK7yyQIjXzY4RPhcCax0OoPU6fJWYY8uC0kF/EINK9w2esaLdEgQ
	Wl8kPW+tzJfhiZAC6rMh72mzjganAVH7Wzc1N7WXZapKeeRTkUOV/IAhKUzD0gb84sDotwNvzROkh
	JxRSpShQG1v2HWdYiWxSWR3IPJudLdQR9RSGtYF6JTtLIXqFLl1545qlWL1qVtTawjelVbDWyXc1L
	D0/4PsHtJ3oNdYkUAUzKL6O0+4f61TAFCi0rswCrm5JLutQIgkl4XEgyNAvfQ5DysfMPT7uYAxxUo
	rb0Ij4WlmhMdq5xVwEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrIMy-001jvS-6T; Wed, 18 May 2022 12:01:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIMn-001jty-9d; Wed, 18 May 2022 12:01:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 593BF1F44F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652875283;
 bh=eWMO+9i9voS89Q+F8+40P0pUsammpGTwWoyawgM0xNg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lhm/J/hXfAJ9BJFEvYcRwETBoCLYtJjqJQQ0KCGtbdsJBYbfPgAYbZjaq8Cktb2GQ
 jnnvBMRi1Fp5XaQ2ARbA3DD3le7L828QOMEJVDVoyrihhnf3NecPbVjmBhdIfXSwql
 xlrpC5xyXxPJaYxbqz6mrtWM0QPP/VKPqKdlpvmF2aF4rgAA0/w4E0Tb3TBlaavlV6
 b/IMu1+Fp88Ur8Z3WPojwmmsa1Sv4FPuY0E0DTUVifvIHLCXJLW04LoD2492ptn0xp
 lUjkeb67qxETH++3Y3SNfRaTNO+0MSwXP/bF2VPqbwUUuRB31FyZCtYBkXOvolkJCf
 4gz0tsNkszGug==
Message-ID: <7781eaaf-ad09-7283-dbb8-69d0fb3f1d14@collabora.com>
Date: Wed, 18 May 2022 14:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] usb: xhci-mtk: fix fs isoc's transfer error
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, stable@vger.kernel.org
References: <20220512064931.31670-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220512064931.31670-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_050125_515739_A9E541CD 
X-CRM114-Status: GOOD (  15.57  )
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

Il 12/05/22 08:49, Chunfeng Yun ha scritto:
> Due to the scheduler allocates the optimal bandwidth for FS ISOC endpoints,
> this may be not enough actually and causes data transfer error, so come up
> with an estimate that is no less than the worst case bandwidth used for
> any one mframe, but may be an over-estimate.
> 
> Fixes: 451d3912586a ("usb: xhci-mtk: update fs bus bandwidth by bw_budget_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Hello Chunfeng,
I agree this is "a fix"... but is it the best fix?

Shooting the bandwidth very high will have power consumption consequences, are
those measurable?
And if they are, what is the expected power consumption increase in percentage
(and/or microamperes)? Also, out of the expected increase, have you got any
measurement for that?

Assuming that the measurement is done for one SoC, it's possible to make some
assumption about a different part.

Regards,
Angelo

> ---
>   drivers/usb/host/xhci-mtk-sch.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index f3139ce7b0a9..953d2cd1d4cc 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
