Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DA2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XKTzy2jknaTB4QMzyr4cI7CofHNh+JKGC2Ylwooupg=; b=lrBpToGmDYhpGvVG+eREw7yuK1
	OY8FQQAGvsuU7FMVEQsRhZyv+7eTKxVHgIl0oXSgLuLSdnKi4ATJ6bn6fRD/vmUWU78rFNdCcAEaR
	D3/adXnQlfjy4hUcoytpAVEv+FAVPn2pRuXYUg4WnAoOTdqi19X7ZRciG4zVdMGcM2D/dy6Wm3iGH
	y+goRhFSnMfFZZArHiVpM21KqWBwodsUZeUMipJ2DNCprnKu1+0/T3z9tq/IavjIu8+et7NaN/KXO
	ok3AdaL3qAbpBxjQEFhW810NG8abk95TzrJS4hZR3z6kG4yqwF2eD+OILcBN4CLVw2XYnym3K7ElI
	I4F07+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpjQ-0024eW-L3; Thu, 29 Sep 2022 09:21:24 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpjN-0024dc-Mi
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 09:21:23 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T8oRFG030927;
	Thu, 29 Sep 2022 04:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2XKTzy2jknaTB4QMzyr4cI7CofHNh+JKGC2Ylwooupg=;
 b=j8I/iOYyRifLp52uLg1necVtJbUro7vKilysWM14jA9QFbSsnodDEcBwZM7OKdfycmW7
 8LLnuHGNtBNsF6eAskTD3/ZUml6jZj1ZrUaZDqjNBgpzgbTj4LxCrOigAiSOs9e9Rq1F
 Kquc3Wf6sev3h60elJuJpYe4tnYBLJIZtU3Wk/gsTmQBuLn4DFSC2xAKtpkPiYK/sTyV
 pUfHyWlukIFQAC+MxISUsxalA4P2UWgWAktAHSpHnsKprxsCpCbQH+09DOC8zAWXMH8H
 LdwoRv+xXziS7XJJdiFgYYpMsKwTtdwBHlDxA9+kgpKmbZvIfs/rJMtZQwy7u6GUH2yM Og== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jsxapp13w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 04:21:06 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Thu, 29 Sep
 2022 04:21:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via Frontend
 Transport; Thu, 29 Sep 2022 04:21:05 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E9A822D4;
	Thu, 29 Sep 2022 09:21:04 +0000 (UTC)
Date: Thu, 29 Sep 2022 09:21:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <matthias.bgg@gmail.com>,
        <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 2/4] ASoC: wm5110: Fix PM disable depth imbalance
 in wm5110_probe
Message-ID: <20220929092104.GT92394@ediswmail.ad.cirrus.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
 <20220928160116.125020-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220928160116.125020-3-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: p9vNs_9FToHZQFgOxLP5dKnuYlDoCqW6
X-Proofpoint-GUID: p9vNs_9FToHZQFgOxLP5dKnuYlDoCqW6
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_022121_902526_5BE77B0B 
X-CRM114-Status: GOOD (  21.21  )
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

On Thu, Sep 29, 2022 at 12:01:14AM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of wm5110_probe.
> 
> Fixes:5c6af635fd772 ("ASoC: wm5110: Add audio CODEC driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---

As Mark said please use maintainers and specifically if patching
the Wolfson/Cirrus CODECs please CC
patches@opensource.cirrus.com

>  sound/soc/codecs/wm5110.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
> index f3f4a10bf0f7..fc634c995834 100644
> --- a/sound/soc/codecs/wm5110.c
> +++ b/sound/soc/codecs/wm5110.c
> @@ -2457,9 +2457,6 @@ static int wm5110_probe(struct platform_device *pdev)
>  		regmap_update_bits(arizona->regmap, wm5110_digital_vu[i],
>  				   WM5110_DIG_VU, WM5110_DIG_VU);
>  
> -	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_idle(&pdev->dev);
> -
>  	ret = arizona_request_irq(arizona, ARIZONA_IRQ_DSP_IRQ1,
>  				  "ADSP2 Compressed IRQ", wm5110_adsp2_irq,
>  				  wm5110);
> @@ -2492,6 +2489,9 @@ static int wm5110_probe(struct platform_device *pdev)
>  		goto err_spk_irqs;
>  	}
>  
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_idle(&pdev->dev);
> +

I think it would be better to keep the pm_runtime enables before
the IRQ and component stuff. Both of those could start triggering
PM runtime events. We probably need to add an extra error path
here for disabling the pm_runtime.

Thanks,
Charles

