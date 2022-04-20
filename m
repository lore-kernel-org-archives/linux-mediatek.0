Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C131C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX0cbS1EKg4ui5XB5GKhXxn7oF2mIwZeG4i1UNkypb8=; b=di83sKifahRadhaswspQZXCfHc
	zHBIAuo+Tvp9anW5dMYH02J7BN24H2sl5Lxu6INzlOih/0WtGn0vFfPb2IzXKn9+kIJMMSVgB3DDC
	4kxyvH0x5KbUjrXT4G0NSO7UvWY0GMWa0TCJInsKgSXtXneTTe0KYftHt/DprN11+UppCuphkQOUi
	JzkfaiSfMOkYALgnFwtzYjKKC5dkb0PBOqE855cHbF6C8EFiddeQyFCapClZYn+4pE/rrwiD1T+EM
	Wo5vrALNY2LDPU7FlANcBooYmE0RiU3sqmuFsX5ii2ClHtfw4TiKNb6f3e2ZSmDJqborP48bEnAIF
	AC9t8llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9FV-008vmF-U5; Wed, 20 Apr 2022 12:15:57 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9FJ-008vhx-61; Wed, 20 Apr 2022 12:15:46 +0000
Received: by mail-io1-xd33.google.com with SMTP id p62so1637647iod.0;
 Wed, 20 Apr 2022 05:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Ctf05BnnO/qOOsj3lddSfaG/ckbIuPH18mve0wqxytc=;
 b=MOLLrmIbPhbcuVPkAQ//MoR8UOLTM7HHPzV8X75L6wD9+Wdrs1poUTr/Dge/vUt5Sl
 g3JxL8ioJFyr49Foa1yI8VuHEwf7Urlsu6wkJI+RL36Cy1vQUwkchkt7JdPmtuXORkQ4
 x8RMivE61Gx/gtWTJnsLGiKnd8M8gPPExucRmI+KrI2/FAxVdNQwNxO7coS3ll0/wUuk
 l/DukXjH5WTNMfBpn5TM+wOkOqoURzbNEfcmeBhTOui/4WnCxqL+IniflFx4v6rqmTCa
 3fzieVNrdABSaiWvxg6hCSReLlqHZpUuo2eGZoui1RivR1kxMK3ZQJIVJsnk1Je1dv5+
 Z/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ctf05BnnO/qOOsj3lddSfaG/ckbIuPH18mve0wqxytc=;
 b=VKUUJBRr8nIz9EGbLQmQFUzhG98H0mjo8VAacx0bJ6fkAQQgSG8GqXuuk9iE6D+WTY
 WjSKvxauzW/5tCCkBPI0yCws2cvpLiC6dS9CPHf7A+DluhtCae8nRBSo1479A9LVvwrq
 iOmkmoUxbf5XG5xJCFepuIT+Ve1hHn/LgiSJkaZKkmv9dqH0D1kz8D/1BO1wh07GEX2A
 r4E+31JxvCYAAqFjOMF2QzcCsYqgbovlC7y+xLz6BkXlzr8oBCKpT2rhUzsWt+OUGP3/
 mLJG4+mksi/CzGYNn8PrQGXUIxMtvsxZdbl9pQfhkq7mWCe5GqajRTwKna0wdcOpIL38
 FU+g==
X-Gm-Message-State: AOAM532AUo62uIYubSg4rXqvrbKwHS94dQn9WnpkUiqDzUkPoEsbOCB+
 Ljx7iz+S3VvHtI3OGq7AZdY=
X-Google-Smtp-Source: ABdhPJxWfk/nAf1Dm0w32dF4UstB4QlQHnDUirwxOVjblMaKE8IgXOAi2O3VwePL6xJC0hz1fj2o7Q==
X-Received: by 2002:a05:6638:481a:b0:326:6a2c:2396 with SMTP id
 cp26-20020a056638481a00b003266a2c2396mr9535358jab.122.1650456938840; 
 Wed, 20 Apr 2022 05:15:38 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 131-20020a6b0189000000b0065393383518sm8806980iob.48.2022.04.20.05.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 05:15:38 -0700 (PDT)
Message-ID: <caec273c-b15c-6dca-cd8e-e1b48c5d5490@gmail.com>
Date: Wed, 20 Apr 2022 14:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND PATCH] soc: mediatek: cmdq: Use mailbox rx_callback
 instead of cmdq_task_cb
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1650102868-26219-1-git-send-email-chunkuang.hu@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1650102868-26219-1-git-send-email-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_051545_254821_68663D65 
X-CRM114-Status: GOOD (  20.58  )
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



On 16/04/2022 11:54, Chun-Kuang Hu wrote:
> rx_callback is a standard mailbox callback mechanism and could cover the
> function of proprietary cmdq_task_cb, so use the standard one instead of
> the proprietary one. Client has changed to use the standard callback
> machanism and sync dma buffer in client driver, so remove the proprietary
> callback in cmdq helper.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Applied, thanks

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 25 +------------------------
>   include/linux/soc/mediatek/mtk-cmdq.h  |  5 +----
>   2 files changed, 2 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 3c8e421..c1837a4 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -425,34 +425,11 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_finalize);
>   
> -static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
> -{
> -	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
> -	struct cmdq_task_cb *cb = &pkt->cb;
> -	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> -
> -	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
> -				pkt->cmd_buf_size, DMA_TO_DEVICE);
> -	if (cb->cb) {
> -		data.data = cb->data;
> -		cb->cb(data);
> -	}
> -}
> -
> -int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
> -			 void *data)
> +int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
>   {
>   	int err;
>   	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>   
> -	pkt->cb.cb = cb;
> -	pkt->cb.data = data;
> -	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
> -	pkt->async_cb.data = pkt;
> -
> -	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
> -				   pkt->cmd_buf_size, DMA_TO_DEVICE);
> -
>   	err = mbox_send_message(client->chan, pkt);
>   	if (err < 0)
>   		return err;
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index ac6b5f3..2b498f4 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -268,8 +268,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>    * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
>    *                          packet and call back at the end of done packet
>    * @pkt:	the CMDQ packet
> - * @cb:		called at the end of done packet
> - * @data:	this data will pass back to cb
>    *
>    * Return: 0 for success; else the error code is returned
>    *
> @@ -277,7 +275,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>    * at the end of done packet. Note that this is an ASYNC function. When the
>    * function returned, it may or may not be finished.
>    */
> -int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
> -			 void *data);
> +int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
>   
>   #endif	/* __MTK_CMDQ_H__ */

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
