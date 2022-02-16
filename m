Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B05BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkiRI0mjemytDg92d6joXx+6j2IwEIbqIAYWizm/Yaw=; b=Myl/+zml/pN3L+
	lGX/flUxMA9DkDClH/GXJiWtuL2xKo6N3XCuzpIRoc4PDXwWx4X8XhoDd/cMLDqg/pymauaWHKj1M
	XJksAGIVzjR3ITtsUaGo06YAu+6nPoqI5xJlfqFbkxRL5aHRfJbxokiDLdLvffIqGz/af0bJRbtU8
	+Y7QWt0HH4znP+DajU8JG3WhCMkWudF7KOoBgu+mAqpBisfHuX8g8eJzyHcK/omrQA9fx/gYYXK/4
	Ign5F9yV5mxmNjVz12ppIA0Xz2UDGZd9LUbXtyGABVFazBniSWhCwOA7z8OgyXFiGSCxSdIYgvKAL
	rlmAQ7OfzWQ0zROVE3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKMpE-007bQo-Au; Wed, 16 Feb 2022 16:06:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKMp1-007bPO-K7; Wed, 16 Feb 2022 16:06:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A46EF1F450A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645027586;
 bh=aefrMXzupsLGu5Ex9arbBV1OgQCjmS+CBwjP8HtAD84=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cqo4f+MCDMkcgOCnLgpDF2cDT0hDDpHza/7IDHJhLT5XOWGpgB/i9ooaOOmglHiE0
 WaErsHsIw1PiM+OynCDAdzSo2fYKAvgRhAS+sb6RUiaoGMrtKktkH6mWP1Tr56h4qG
 GdzKJPC8yN7m49uYqOCrJAlNkXWcZVIPe6zPk/SYqv5qyK0OxaDfPmeTwINA8c+cZV
 221lkdkjEwWk2dMlc/XpBKJulMep5vaFWrVu0HlvpCY2Ag3bu/s9XQtcxi3mQGtU9K
 4dwcRMqLI2pLQNXphjzNhsOUfG77I/4QiHZukTz3u5qJv59xvdEiS5GBYYxkrPuIIE
 YwjpvwvjGFLuQ==
Message-ID: <b531eeca-40e8-d759-5579-59567eb5af84@collabora.com>
Date: Wed, 16 Feb 2022 17:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Content-Language: en-US
To: bjorn.andersson@linaro.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_080627_834296_D482A47C 
X-CRM114-Status: GOOD (  19.31  )
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

Il 14/01/22 15:47, AngeloGioacchino Del Regno ha scritto:
> During execution of the worker that's used to register rpmsg devices
> we are safely locking the channels mutex but, when creating a new
> endpoint for such devices, we are registering a IPI on the SCP, which
> then makes the SCP to trigger an interrupt, lock its own mutex and in
> turn register more subdevices.
> This creates a circular locking dependency situation, as the mtk_rpmsg
> channels_lock will then depend on the SCP IPI lock.
> 
> [   18.014514]  Possible unsafe locking scenario:
> [   18.014515]        CPU0                    CPU1
> [   18.014517]        ----                    ----
> [   18.045467]   lock(&mtk_subdev->channels_lock);
> [   18.045474]                                lock(&scp->ipi_desc[i].lock);
> [   18.228399]                                lock(&mtk_subdev->channels_lock);
> [   18.228405]   lock(&scp->ipi_desc[i].lock);
> [   18.264405]
> 
> To solve this, simply unlock the channels_lock mutex before calling
> mtk_rpmsg_register_device() and relock it right after, as safety is
> still ensured by the locking mechanism that happens right after
> through SCP.
> Notably, mtk_rpmsg_register_device() does not even require locking.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Friendly ping for an important fix... :)

> ---
>   drivers/rpmsg/mtk_rpmsg.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 5b4404b8be4c..d1213c33da20 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
>   		if (info->registered)
>   			continue;
>   
> +		mutex_unlock(&subdev->channels_lock);
>   		ret = mtk_rpmsg_register_device(subdev, &info->info);
> +		mutex_lock(&subdev->channels_lock);
>   		if (ret) {
>   			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
>   			continue;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
