Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D29C43466
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 08:53:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BA6214F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 08:53:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w0ERlu3V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqiL+Eqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BA6214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aCXL5hLic8LO6wGNRifxJzHQwGRpH4MzxBeIGXJ1x3M=; b=w0ERlu3VDlblO1I8CyH66/oOG
	ZCj8UzIaO1gjgt51eaU+IuwV6XxsxyvcwzdY4dAN7MV+DBL6E2X8QE/ku1HsXPYLzbDyJBvDZnmsd
	QKbyWVXczn8BSE1IGY0w95kCaC68KaVKTsgVdwv5Ivig5Du7BQdDpZRdtmbhf6Ubt2UAcH/OLOV6+
	VBppyxqaNyXRSM/e6yvtJBvTrysX7qYg6vlxL7MTlpj7/ZhxAs4gzpzIKbtD+3g2A6BoW76NyPK7Q
	2GVH2PJKQdqM1k3Od8xRgx77l785HwSuPlfBWdUOaT95FINjO38Xl8gn4TCHiYDyiAMtF6n8ukf15
	/4UxR+oLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKHZJ-0002mP-NT; Mon, 21 Sep 2020 08:53:05 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKHZF-0002lW-SE
 for linux-mediatek@lists.infradead.org; Mon, 21 Sep 2020 08:53:04 +0000
Received: by mail-wm1-x343.google.com with SMTP id x23so11285090wmi.3
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2020 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S8TzIVCvzrpPRT+dmZ1UCIXHD5Lpd2XCS5GDDCZq6bA=;
 b=lqiL+EqhXAT6a43P1usTLWNIjuq36Vf3uJMduTXUaS6xBYsIC5kyGOYImV3h1620AX
 tNbZNGP+L9ftdz4uAFOgzntT11z9nJbSVlI3CqizIFMCh5A4BC5SC5MLPMTXfVc8nyzE
 n/vjrxDSfHCYaZ2ppQ6Y8W1+3NURkabzGXDlG4IbR5CEEwTZdWdeVgLF/UAeYDDEjPMZ
 XlPk2e30A5VacaWQSKuePRZgy6ueLeNsP0EuqkGB0hK3vxOhh1hQP55yZr+voMVbLOWW
 yI2oOE3oHTesuzU+3FrPZ4s0s3ivJpwmrvGk5YqfBtgpqpWRG5111V5D6FZrRoXUk3en
 AC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S8TzIVCvzrpPRT+dmZ1UCIXHD5Lpd2XCS5GDDCZq6bA=;
 b=otkYv+kQ88WfW9Ird6eIxIK+59bYmpDiP6Me4ePP5uqsM3c+TIo1xIbuk0OBPJIYuh
 Hy1GmCGVXdAtFxAzOHX+nx5SCgc1lZHGQ3tbukv4J3V7B0IaYvX/RRSc1nPnkI6j0SGB
 aHJebXgDpR4JXmajwggNswrRuumFd+g8HB5Qa/E59ZHaNkUq2YWEUqeBQoAnt6XiNubx
 PYads5bW1RyUFBwdtZtXSVTnTeCNovOQ1n7btyngX7lgHGLPpGs4mhhBsi+3ZqzmuOP+
 +SYNnAU/FBioMeuQaxIEIkUydvpwkLpHYoDFRODqOAjRQl88cUf+ze1fJc5ntTGlUG/B
 QlZw==
X-Gm-Message-State: AOAM531p4Dz3UBYrj50EAderCG7tEdi6FUSVEYDY/ubiahrm0SLoHkYI
 R5jkhqnmhRvKjR6SGkp9gqYNO47UPBocjw==
X-Google-Smtp-Source: ABdhPJxja1wH7LWilkbIBgU9FCw3fTF8cQo8sJQa8JhNB3Q6qY50Rdpv+RNy2baO36yI7U0I3pRSkQ==
X-Received: by 2002:a1c:bbd7:: with SMTP id
 l206mr30813629wmf.185.1600678379509; 
 Mon, 21 Sep 2020 01:52:59 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id i15sm19557732wrb.91.2020.09.21.01.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 01:52:58 -0700 (PDT)
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove timeout handler in helper
 function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200920234216.16884-1-chunkuang.hu@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b10a2243-0831-5f04-d37c-a3c6944064ce@gmail.com>
Date: Mon, 21 Sep 2020 10:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920234216.16884-1-chunkuang.hu@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_045302_011068_B82D986E 
X-CRM114-Status: GOOD (  25.94  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/09/2020 01:42, Chun-Kuang Hu wrote:
> For each client driver, its timeout handler need to dump hardware register
> or its state machine information, so remove timeout handler in helper
> function and let client driver implement its own timeout handler.
> 

I don't see the implementation of a client side handler. Did I miss something?
Would it make sense to instead add a callback to the handler in cmdq_mbox_create()?

Regards,
Matthias

> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  3 +-
>   drivers/soc/mediatek/mtk-cmdq-helper.c  | 41 +------------------------
>   include/linux/soc/mediatek/mtk-cmdq.h   | 11 +------
>   3 files changed, 3 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 3fc5511330b9..cabeb7fea2be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -824,8 +824,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	mtk_crtc->cmdq_client =
>   			cmdq_mbox_create(mtk_crtc->mmsys_dev,
> -					 drm_crtc_index(&mtk_crtc->base),
> -					 2000);
> +					 drm_crtc_index(&mtk_crtc->base));
>   	if (IS_ERR(mtk_crtc->cmdq_client)) {
>   		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
>   			drm_crtc_index(&mtk_crtc->base));
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index dc644cfb6419..4f311f035b59 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -65,14 +65,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
>   }
>   EXPORT_SYMBOL(cmdq_dev_get_client_reg);
>   
> -static void cmdq_client_timeout(struct timer_list *t)
> -{
> -	struct cmdq_client *client = from_timer(client, t, timer);
> -
> -	dev_err(client->client.dev, "cmdq timeout!\n");
> -}
> -
> -struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
> +struct cmdq_client *cmdq_mbox_create(struct device *dev, int index)
>   {
>   	struct cmdq_client *client;
>   
> @@ -80,12 +73,6 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
>   	if (!client)
>   		return (struct cmdq_client *)-ENOMEM;
>   
> -	client->timeout_ms = timeout;
> -	if (timeout != CMDQ_NO_TIMEOUT) {
> -		spin_lock_init(&client->lock);
> -		timer_setup(&client->timer, cmdq_client_timeout, 0);
> -	}
> -	client->pkt_cnt = 0;
>   	client->client.dev = dev;
>   	client->client.tx_block = false;
>   	client->client.knows_txdone = true;
> @@ -107,11 +94,6 @@ EXPORT_SYMBOL(cmdq_mbox_create);
>   
>   void cmdq_mbox_destroy(struct cmdq_client *client)
>   {
> -	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
> -		spin_lock(&client->lock);
> -		del_timer_sync(&client->timer);
> -		spin_unlock(&client->lock);
> -	}
>   	mbox_free_channel(client->chan);
>   	kfree(client);
>   }
> @@ -342,18 +324,6 @@ static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
>   	struct cmdq_task_cb *cb = &pkt->cb;
>   	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>   
> -	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
> -		unsigned long flags = 0;
> -
> -		spin_lock_irqsave(&client->lock, flags);
> -		if (--client->pkt_cnt == 0)
> -			del_timer(&client->timer);
> -		else
> -			mod_timer(&client->timer, jiffies +
> -				  msecs_to_jiffies(client->timeout_ms));
> -		spin_unlock_irqrestore(&client->lock, flags);
> -	}
> -
>   	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
>   				pkt->cmd_buf_size, DMA_TO_DEVICE);
>   	if (cb->cb) {
> @@ -366,7 +336,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>   			 void *data)
>   {
>   	int err;
> -	unsigned long flags = 0;
>   	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>   
>   	pkt->cb.cb = cb;
> @@ -377,14 +346,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>   	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
>   				   pkt->cmd_buf_size, DMA_TO_DEVICE);
>   
> -	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
> -		spin_lock_irqsave(&client->lock, flags);
> -		if (client->pkt_cnt++ == 0)
> -			mod_timer(&client->timer, jiffies +
> -				  msecs_to_jiffies(client->timeout_ms));
> -		spin_unlock_irqrestore(&client->lock, flags);
> -	}
> -
>   	err = mbox_send_message(client->chan, pkt);
>   	if (err < 0)
>   		return err;
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 2249ecaf77e4..175bd89f46f8 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -11,8 +11,6 @@
>   #include <linux/mailbox/mtk-cmdq-mailbox.h>
>   #include <linux/timer.h>
>   
> -#define CMDQ_NO_TIMEOUT		0xffffffffu
> -
>   struct cmdq_pkt;
>   
>   struct cmdq_client_reg {
> @@ -22,12 +20,8 @@ struct cmdq_client_reg {
>   };
>   
>   struct cmdq_client {
> -	spinlock_t lock;
> -	u32 pkt_cnt;
>   	struct mbox_client client;
>   	struct mbox_chan *chan;
> -	struct timer_list timer;
> -	u32 timeout_ms; /* in unit of microsecond */
>   };
>   
>   /**
> @@ -49,13 +43,10 @@ int cmdq_dev_get_client_reg(struct device *dev,
>    * cmdq_mbox_create() - create CMDQ mailbox client and channel
>    * @dev:	device of CMDQ mailbox client
>    * @index:	index of CMDQ mailbox channel
> - * @timeout:	timeout of a pkt execution by GCE, in unit of microsecond, set
> - *		CMDQ_NO_TIMEOUT if a timer is not used.
>    *
>    * Return: CMDQ mailbox client pointer
>    */
> -struct cmdq_client *cmdq_mbox_create(struct device *dev, int index,
> -				     u32 timeout);
> +struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
>   
>   /**
>    * cmdq_mbox_destroy() - destroy CMDQ mailbox client and channel
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
