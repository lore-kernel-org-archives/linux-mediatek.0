Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D354FE8FDDB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUDEd28wqTKiwb0bSoZIZbE0lhMh9645W9pmxaL9NtE=; b=TABUbYdBp6f4J07cT03ab5gtyg
	c3O+lREhV3MXLLOJc9HBgV9OHXM53wKnn08LFtuTiF0wc5gR/57iv/OUDdooLTqB6QZQ5Dxo3FZ3D
	KqeyxTr5jc+GzHdJYP1my5kn+AA7iHjqABfxzGwZ2Kes0EiRJ8H+QQFXsv8S+eyTKxa7Rc0lMZk2z
	J/jG8lC5f7GOE0gwTWh7qPgE7Lyd5LRqGOVlcXYBeaE1YpBlRXjOpVOspjqF4y5jUnmDGbmCxeCwP
	yTDdCICSEjqw7d/z0pp9ihPXO/qel5QN3SrEiJhoH0MFcGdnvNUgXzlDSZDe3tu19mHR2hR+XUspR
	ItQuXCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qny3L-00H2Sh-1r;
	Wed, 04 Oct 2023 09:20:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qny3H-00H2Qe-1q;
	Wed, 04 Oct 2023 09:20:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1755E6607079;
	Wed,  4 Oct 2023 10:20:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696411216;
	bh=13nUw+iTCisxqevQVzt8K18HbU2kBO3wGBxDcnPry/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bVh67iMUgd7Pl5N1xE6+ybUv7aLG/1ROTMi/H9cpzUDcIivP3JCodJobk7o5y1Dq3
	 dwOaro1gSAQ3jLxntGBq7XQAZmsjwa/LND+aOHjKaMbMDXZdQDDZmOKGVXm+bZcsvh
	 FDebe/DdKA7t1Z8MNW41QOeLDQU3nrAL1M1PNIxDnUA2gqLaPhpFkr750RvnXlAf8q
	 ziFllgFz+x7hI2oIxCiOmzIKbhger3svawkY0j7tVpv8WwhpV8nV+1Qux0PWinD7HQ
	 1gHe5xcBrVYucSTO75wD7g/xV3ll7AGkfQsfzvQXgbBm8uBQzcoYC+h0WLwR7nyIYL
	 Tds3gsrwzrxpw==
Message-ID: <baa122da-4ae3-9023-3529-3ad38204b989@collabora.com>
Date: Wed, 4 Oct 2023 11:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] mailbox: remove runtime GCE clk control
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>
References: <20231004085430.19538-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231004085430.19538-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_022019_955344_DD4A7A0B 
X-CRM114-Status: GOOD (  24.99  )
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

Il 04/10/23 10:54, Jason-JH.Lin ha scritto:
> 1. GCE is a frequently used module, so runtime controlling
> GCE clock won't save too much power and its original design
> doesn't expect it to be enabled and disabled too frequently.
> 
> 2. Runtime controlling GCE clock will cause display HW register
> configured in worng stream done event issue below:
>    GCE should config HW in every vblanking duration.
>    The stream done event is the start signal of vblanking.
> 
>    If stream done event is sent between GCE clk_disable
>    and clk_enable. After GCE clk_enable the stream done event
>    may not appear immediately and have about 3us delay.
> 
>    Normal case:
>    clk_disable -> get EventA -> clk_enable -> clear EventA
>    -> wait EventB -> get EventB -> config HW
> 
>    Abnormal case:
>    clk_disable -> get EventA -> clk_enable -> EventA delay appear
>    -> clear EventA fail -> wait EventB but get EventA -> config HW
> 
> So just remove the runtime GCE clock contorl.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Instead of entirely removing the logic that controls the clocks and always
refuse to save power, what about using autosuspend?

If the two cases that you're describing are happening always in a range of
time, we could *yes* remove the "manual" bulk disable/enable calls, but then
we could use runtime_suspend/runtime_resume callbacks for that.

Hint: pm_runtime_set_autosuspend_delay(dev, 1000);

Regards,
Angelo

> ---
> v1 -> v2:
> 1. Rebase on Linux 6.6-rc4
> 2. Adjust commit message.
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4d62b07c1411..a3c2d318beb7 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -140,7 +140,6 @@ static void cmdq_init(struct cmdq *cmdq)
>   	int i;
>   	u32 gctl_regval = 0;
>   
> -	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
>   	if (cmdq->pdata->control_by_sw)
>   		gctl_regval = GCE_CTRL_BY_SW;
>   	if (cmdq->pdata->sw_ddr_en)
> @@ -152,7 +151,6 @@ static void cmdq_init(struct cmdq *cmdq)
>   	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
>   	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
>   		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> -	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>   }
>   
>   static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
> @@ -283,10 +281,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>   			break;
>   	}
>   
> -	if (list_empty(&thread->task_busy_list)) {
> +	if (list_empty(&thread->task_busy_list))
>   		cmdq_thread_disable(cmdq, thread);
> -		clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
> -	}
>   }
>   
>   static irqreturn_t cmdq_irq_handler(int irq, void *dev)
> @@ -333,7 +329,7 @@ static int cmdq_suspend(struct device *dev)
>   	if (cmdq->pdata->sw_ddr_en)
>   		cmdq_sw_ddr_enable(cmdq, false);
>   
> -	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
> +	clk_bulk_disable_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
>   
>   	return 0;
>   }
> @@ -342,7 +338,7 @@ static int cmdq_resume(struct device *dev)
>   {
>   	struct cmdq *cmdq = dev_get_drvdata(dev);
>   
> -	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
> +	WARN_ON(clk_bulk_prepare_enable(cmdq->pdata->gce_num, cmdq->clocks));
>   	cmdq->suspended = false;
>   
>   	if (cmdq->pdata->sw_ddr_en)
> @@ -358,7 +354,7 @@ static int cmdq_remove(struct platform_device *pdev)
>   	if (cmdq->pdata->sw_ddr_en)
>   		cmdq_sw_ddr_enable(cmdq, false);
>   
> -	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
> +	clk_bulk_disable_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
>   	return 0;
>   }
>   
> @@ -384,8 +380,6 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   	task->pkt = pkt;
>   
>   	if (list_empty(&thread->task_busy_list)) {
> -		WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
> -
>   		/*
>   		 * The thread reset will clear thread related register to 0,
>   		 * including pc, end, priority, irq, suspend and enable. Thus
> @@ -457,7 +451,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>   	}
>   
>   	cmdq_thread_disable(cmdq, thread);
> -	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>   
>   done:
>   	/*
> @@ -497,7 +490,6 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
>   
>   	cmdq_thread_resume(thread);
>   	cmdq_thread_disable(cmdq, thread);
> -	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>   
>   out:
>   	spin_unlock_irqrestore(&thread->chan->lock, flags);
> @@ -631,7 +623,7 @@ static int cmdq_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, cmdq);
>   
> -	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
> +	WARN_ON(clk_bulk_prepare_enable(cmdq->pdata->gce_num, cmdq->clocks));
>   
>   	cmdq_init(cmdq);
>   




