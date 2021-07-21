Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30438C07E9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBB561353
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECBB561353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrPsRKWWYp+Xrz139jAOrIBfn0hbZj+dIUPy9Ql4zJs=; b=vU69iK15Wd+54e
	txu6gDAe8qHLXzcpaXP/PTPk0pIS9+XqumPETIiGVnmkS1xw4S1yJfGplco18CdTGAmAE2nv6U3Ji
	oIRyaKozlpmN3LC5jDTFsmCCoSSyaTumyUissnAsKfA+pVgVpgj+JzVoURbGt+P4QwtGqOtQ4kWPl
	NlIHIjMFOZBd0j54bBL04STYvfUXQfTxIe8d9w1Gj/Xem9KnjGjJoWBBCRAhjXZgcb6dA8GBEvzZM
	P9ApwGyudJhx90lZVXXqJVPLxHi0x8FxkuGsLB+9SEzWIkozMZ4thUUKS81fxY/vdIM/6g3Ndn9sF
	pI/d+qE3cf7u2gWRmWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69l5-00FIHj-Mr; Wed, 21 Jul 2021 10:47:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69jt-00FHj7-IC; Wed, 21 Jul 2021 10:46:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 851FC60238;
 Wed, 21 Jul 2021 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626864369;
 bh=lekz1x8Vr+mtj6/j1CLlcAW/8TwIhmgKM8+wU/jnTd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I3WtQXqEESn30zVXhTZ7Rf7axCV+VRasQnprlkR/u7LSKrlVylGYfkUewLhoVp/fD
 IJedpcadAQ0QHFTl0SxxRdlu3rgGAekSV4pzAQKudjBQLW1i2XbfTFGXtpKAp6cjKL
 fgNulM80bhGQechPnYIiFF3/dCAs0n+WaEjdVWuE=
Date: Wed, 21 Jul 2021 12:46:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: timur@kernel.org, linux@armlinux.org.uk, alcooperx@gmail.com,
 tklauser@distanz.ch, sean.wang@kernel.org,
 srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 yuchen.huang@mediatek.com, huihui.wang@mediatek.com,
 eddie.huang@mediatek.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] uart: mediatek: fix memory corruption issue
Message-ID: <YPf67gw2KJCk/Ucs@kroah.com>
References: <20210710090103.2643-1-zhiyong.tao@mediatek.com>
 <20210710090103.2643-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210710090103.2643-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_034609_669626_E0120CCF 
X-CRM114-Status: GOOD (  22.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 10, 2021 at 05:01:03PM +0800, Zhiyong Tao wrote:
> This patch is used to fix memory corruption issue when rx power off.
> 1. add spin lock in mtk8250_dma_rx_complete function in APDMA mode.

What does a lock protect from?  Please be explicit and detailed.

> 2. add processing mechanism which count value is 0

What does this do?  And why is it needed?

> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

What commit does this fix?  Does this need to go to stable kernel trees?
If so, how far back?

> ---
>  drivers/tty/serial/8250/8250_mtk.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index f7d3023f860f..09f7d2166315 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -91,12 +91,15 @@ static void mtk8250_dma_rx_complete(void *param)
>  	struct mtk8250_data *data = up->port.private_data;
>  	struct tty_port *tty_port = &up->port.state->port;
>  	struct dma_tx_state state;
> -	int copied, total, cnt;
> +	unsigned int copied, total, cnt;
>  	unsigned char *ptr;
> +	unsigned long flags;
>  
>  	if (data->rx_status == DMA_RX_SHUTDOWN)
>  		return;
>  
> +	spin_lock_irqsave(&up->port.lock, flags);
> +
>  	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
>  	total = dma->rx_size - state.residue;
>  	cnt = total;
> @@ -104,9 +107,11 @@ static void mtk8250_dma_rx_complete(void *param)
>  	if ((data->rx_pos + cnt) > dma->rx_size)
>  		cnt = dma->rx_size - data->rx_pos;
>  
> -	ptr = (unsigned char *)(data->rx_pos + dma->rx_buf);
> -	copied = tty_insert_flip_string(tty_port, ptr, cnt);
> -	data->rx_pos += cnt;
> +	if (cnt != 0) {

Why does cnt matter here?  If cnt is 0, the code above should not do
anything at all, right?

Or if it does, should we change tty_insert_flip_string() to always check
for cnt != 0 before it does the first loop?  Hm, it looks like it will
abort if cnt is 0, so what is this change really doing?  Why do you need
it?  What is it "fixing"?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
