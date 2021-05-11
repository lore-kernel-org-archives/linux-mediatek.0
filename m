Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D272AC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 16:56:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58043616ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 16:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58043616ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HRwWRsBAxckHh28yEM0HkpxnOFqlm011IkUNR0i0PBM=; b=SoVjvlXfpektwejGL7NRULXCH
	FBXEMqtY9R2zmImy8pF2iUUSV6ASdJbnLD+8QGKUuJl76SAaKQAjiz12BhjiPMMY2a2FOMQLePnco
	hPysXJtIdXoh0xrgB042hejBHJAurPXZZJo/uBRzT6L3bAAfRmpzvxgNgw1KasubtDJE5G8HKt9/r
	kYYZK+F8VZqsnFkzEsdxtNHgJzsTPoC91PoYCERqOxzA5umPZVRr5vKdC0zGS5QOfLecjqCGNvWmR
	nLExE/nn2+1t843exgdUytSv8NDvfzGUZXgO3q+10jMU7SWrGhXgwKhPxEUZfYi3g8ZGC0UbngYKx
	ldu56jSRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVfa-000ptF-Kg; Tue, 11 May 2021 16:55:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVW4-000npL-BP
 for linux-mediatek@desiato.infradead.org; Tue, 11 May 2021 16:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SJ3MbO1yvX0ZTNillbrfw38Ym88fvu4TdFvFicMqacY=; b=CKTvzloMMIYCD0LBDfttwKDaG4
 Vm9vpM4qvGtU7OQr7/9Klq3qBOcs7TSdMNJ14He8jtKec20UtiOvpJGH0P9jdTk4JqKi45lIjXGWK
 HOO5Rmv42obUxO5JWE+MD42py79OsUHOjckhXgOEPuU0kqBiepsHlVLO9I5AoRvPjijok7E3rMwcl
 XCxBUtlbhEJPS49R4AQtrZVk0D36JBIZXMwDzHy7JFcm8nCIK5LPMqKSnGzAFvMsCiS2zMdPp1C70
 k8mq6gSBFIXQJR58fT6YWf68KEOEB36qA7N1a0SWAkNpK24vdq8k4Ob119swafkzgX/tb8i4ZFB1P
 43/tnLIg==;
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVW1-009mNH-9M
 for linux-mediatek@lists.infradead.org; Tue, 11 May 2021 16:45:50 +0000
Received: (qmail 903532 invoked by uid 1000); 11 May 2021 12:39:07 -0400
Date: Tue, 11 May 2021 12:39:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Bixuan Cui <cuibixuan@huawei.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH] usb: core: hub: fix race condition about TRSMRCY of resume
Message-ID: <20210511163907.GB901897@rowland.harvard.edu>
References: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_094549_481827_203604B8 
X-CRM114-Status: GOOD (  13.99  )
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

On Tue, May 11, 2021 at 06:15:22PM +0800, Chunfeng Yun wrote:
> This may happen if the port becomes resume status exactly
> when usb_port_resume() gets port status, it still need provide
> a TRSMCRY time before access the device.
> 
> Reported-by: Tianping Fang <tianping.fang@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

This should also say:

CC: <stable@vger.kernel.org>

> ---
>  drivers/usb/core/hub.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index b2bc4b7c4289..fc7d6cdacf16 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3642,9 +3642,6 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
>  		 * sequence.
>  		 */
>  		status = hub_port_status(hub, port1, &portstatus, &portchange);
> -
> -		/* TRSMRCY = 10 msec */
> -		msleep(10);
>  	}
>  
>   SuspendCleared:
> @@ -3659,6 +3656,9 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
>  				usb_clear_port_feature(hub->hdev, port1,
>  						USB_PORT_FEAT_C_SUSPEND);
>  		}
> +
> +		/* TRSMRCY = 10 msec */
> +		msleep(10);
>  	}
>  
>  	if (udev->persist_enabled)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
