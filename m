Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790C9C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyZMrH7elm+NVvtW/xm0RL48beKDHwaCJFepq23QsAY=; b=zVKuSjvK3SjZKuXdsN5Ko8mJxS
	2heQ+KscUAKB48WfmrMmRHhGPTj4FtVkJDEcE0AmM3SE2NrnTuhXYh3cAYOkkJ1E1VWKzFf2I7oZ1
	/S9mSfo8Easfn5xK5gTymoLw3n/5lM1DZNtdfGsdjthG812DiEThKRLCCqGoanphuk2zUIk4O626b
	visbGQ5P2oF+/QV7oztPmm7sZZ3yjJRfPSmoGybm4myIFMbTqxa49WhIVXj6+kOmmYqOwNED3hT8o
	3g+FCzoWCP9SvMFE+/t7kfsqKhkFGtdPkOkJco/mNfHQ97Ez4u+elALbJJKNMNlI1SxNQNtEUVgAu
	/5AdGwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUO5I-0000000Gemk-09aI;
	Thu, 18 Jul 2024 10:10:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUO4v-0000000GeiZ-0dxV;
	Thu, 18 Jul 2024 10:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721297373;
	bh=7W9NB+4beenTAyhTygX8/3CLonvIgT2Ws7zp0jH0pWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oYggl5YqOJlMmwn2fZXbxfLjSz9+mDZzx2Yu564ULzbOMeLZuLsGTkR2oOlw01KyW
	 fBWieElXAsPOf3lqOQmpFxWNMf5SR16lha+HGu5cZP0bAiM1OZpkrt1yWdgqIdQJ6o
	 s7Ckc5/xpPpKXd5Xh3Jeo8W6mSPa2ME22AWqgENFSE3s/tdG0TB9Y/B3ltHyEUsttN
	 JX/vHpHmI5peAgzgAicMmD4Gchp7uTphNywZh/iezEKGgX4CmXrcGb3js53NF/sl53
	 VOOFuCgCATbK5IbcoRAMbDohrGLqA6zkfj0gbQxZhEXI8wnMTEbLSUCxWsU1N9ZQtv
	 /IIQJ7nPXaMkw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B1F99378020A;
	Thu, 18 Jul 2024 10:09:32 +0000 (UTC)
Message-ID: <8fbe44af-8da3-4554-ac2b-5db58003449e@collabora.com>
Date: Thu, 18 Jul 2024 12:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Move
 devm_mbox_controller_register() after devm_pm_runtime_enable()
To: jason-jh.lin@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240718-mtk-cmdq-fixup-v2-1-f6bb3c052a60@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240718-mtk-cmdq-fixup-v2-1-f6bb3c052a60@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_030937_793301_5A338DD9 
X-CRM114-Status: GOOD (  23.72  )
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

Il 18/07/24 10:38, Jason-JH.Lin via B4 Relay ha scritto:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> When mtk-cmdq unbinds, a WARN_ON message with condition
> pm_runtime_get_sync() < 0 occurs.
> 
> According to the call tracei below:
>    cmdq_mbox_shutdown
>    mbox_free_channel
>    mbox_controller_unregister
>    __devm_mbox_controller_unregister
>    ...
> 
> The root cause can be deduced to be calling pm_runtime_get_sync() after
> calling pm_runtime_disable() as observed below:
> 1. CMDQ driver uses devm_mbox_controller_register() in cmdq_probe()
>     to bind the cmdq device to the mbox_controller, so
>     devm_mbox_controller_unregister() will automatically unregister
>     the device bound to the mailbox controller when the device-managed
>     resource is removed. That means devm_mbox_controller_unregister()
>     and cmdq_mbox_shoutdown() will be called after cmdq_remove().
> 2. CMDQ driver also uses devm_pm_runtime_enable() in cmdq_probe() after
>     devm_mbox_controller_register(), so that devm_pm_runtime_disable()
>     will be called after cmdq_remove(), but before
>     devm_mbox_controller_unregister().
> 
> To fix this problem, cmdq_probe() needs to move
> devm_mbox_controller_register() after devm_pm_runtime_enable() to make
> devm_pm_runtime_disable() be called after
> devm_mbox_controller_unregister().
> 
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> When mtk-cmdq unbinds, a WARN_ON message with condition
> pm_runtime_get_sync() < 0 occurs.
> 
> According to the call tracei below:
>    cmdq_mbox_shutdown
>    mbox_free_channel
>    mbox_controller_unregister
>    __devm_mbox_controller_unregister
>    ...
> 
> The root cause can be deduced to be calling pm_runtime_get_sync() after
> calling pm_runtime_disable() as observed below:
> 1. CMDQ driver uses devm_mbox_controller_register() in cmdq_probe()
>     to bind the cmdq device to the mbox_controller, so
>     devm_mbox_controller_unregister() will automatically unregister
>     the device bound to the mailbox controller when the device-managed
>     resource is removed. That means devm_mbox_controller_unregister()
>     and cmdq_mbox_shoutdown() will be called after cmdq_remove().
> 2. CMDQ driver also uses devm_pm_runtime_enable() in cmdq_probe() after
>     devm_mbox_controller_register(), so that devm_pm_runtime_disable()
>     will be called after cmdq_remove(), but before
>     devm_mbox_controller_unregister().
> 
> To fix this problem, cmdq_probe() needs to move
> devm_mbox_controller_register() after devm_pm_runtime_enable() to make
> devm_pm_runtime_disable() be called after
> devm_mbox_controller_unregister().
> 
> Change-Id: I4f0e68eac5186fe8041ea2f16c8e852d52d71cb0
> ---
> Changes in v2:
> - Change to move the calling sequence of devm_mbox_controller_register()
>    and devm_pm_runtime_enable().
> - Link to v1: https://lore.kernel.org/r/20240613150626.25280-1-jason-jh.lin@mediatek.com
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index f1dfce9e27f5..002003c3970a 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -370,6 +370,8 @@ static void cmdq_remove(struct platform_device *pdev)
>   {
>   	struct cmdq *cmdq = platform_get_drvdata(pdev);
>   
> +	devm_mbox_controller_unregister(&pdev->dev, &cmdq->mbox);

...if you moved devm_mbox_controller_register() after devm_pm_runtime_enable(),
this means that the teardown sequence will disable pm runtime after unregistering
the mbox controller, so why do you need to call devm_mbox_controller_unregister()
manually here?

Cheers,
Angelo

> +
>   	if (cmdq->pdata->sw_ddr_en)
>   		cmdq_sw_ddr_enable(cmdq, false);
>   
> @@ -689,12 +691,6 @@ static int cmdq_probe(struct platform_device *pdev)
>   		cmdq->mbox.chans[i].con_priv = (void *)&cmdq->thread[i];
>   	}
>   
> -	err = devm_mbox_controller_register(dev, &cmdq->mbox);
> -	if (err < 0) {
> -		dev_err(dev, "failed to register mailbox: %d\n", err);
> -		return err;
> -	}
> -
>   	platform_set_drvdata(pdev, cmdq);
>   
>   	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
> @@ -722,6 +718,12 @@ static int cmdq_probe(struct platform_device *pdev)
>   	pm_runtime_set_autosuspend_delay(dev, CMDQ_MBOX_AUTOSUSPEND_DELAY_MS);
>   	pm_runtime_use_autosuspend(dev);
>   
> +	err = devm_mbox_controller_register(dev, &cmdq->mbox);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register mailbox: %d\n", err);
> +		return err;
> +	}
> +
>   	return 0;
>   }
>   
> 
> ---
> base-commit: 797012914d2d031430268fe512af0ccd7d8e46ef
> change-id: 20240718-mtk-cmdq-fixup-40379650e96b
> 
> Best regards,


