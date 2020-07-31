Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49382C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 14:22:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16502208E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 14:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n+8/KwLX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16502208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QjYmvsLW5XVo42GlsyWOdf5qxo49PknI67D2xXGW7Ls=; b=n+8/KwLXSncWjz6azOWyOXmnq
	Ymt21H3ydNLO+hDKPYtq/gM212hAxpB2Wy64Q4PEvWA+EF73/C5A9mUxkXGBUTSOrbiaYqgLwUu3g
	Lox0T+CaUCNLGdHhQ73f0Y0iQGknZ16cjnkp6243WQxh2AdUBv1OC/qwOsUfzoJ1qxa4lGvIUBFiI
	gZJXtbJzic6D/xiWcBboo1sTsI3ILhgvTjKq131hRbNFrqQISEIz9jDLv+JDOUg/HX/aZeF4ICrVI
	NI+IEm49uUIvNyUkeyod/9Azo9OXjmlF6ULI5d9R3IY2ZswlXO3lFmuviZaLRCDHuPgQgv7z1mWuO
	bZFmhTViQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1VvM-000761-2o; Fri, 31 Jul 2020 14:22:16 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1VvJ-000757-Fj
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 14:22:14 +0000
Received: (qmail 37750 invoked by uid 1000); 31 Jul 2020 10:22:12 -0400
Date: Fri, 31 Jul 2020 10:22:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2] usb: mtu3: fix panic in mtu3_gadget_disconnect()
Message-ID: <20200731142212.GE36650@rowland.harvard.edu>
References: <1596177366-12029-1-git-send-email-macpaul.lin@mediatek.com>
 <1596185878-24360-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596185878-24360-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_102213_596321_AE0D60BE 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 31, 2020 at 04:57:58PM +0800, Macpaul Lin wrote:
> This patch fixes a possible issue when mtu3_gadget_stop()
> already assigned NULL to mtu->gadget_driver during mtu_gadget_disconnect().

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v2:
>   - Check mtu_gadget_driver out of spin_lock might still not work.
>     We use a temporary pointer to keep the callback function.
> 
>  drivers/usb/mtu3/mtu3_gadget.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> index 68ea4395f871..40cb6626f496 100644
> --- a/drivers/usb/mtu3/mtu3_gadget.c
> +++ b/drivers/usb/mtu3/mtu3_gadget.c
> @@ -840,10 +840,17 @@ void mtu3_gadget_suspend(struct mtu3 *mtu)
>  /* called when VBUS drops below session threshold, and in other cases */
>  void mtu3_gadget_disconnect(struct mtu3 *mtu)
>  {
> +	struct usb_gadget_driver *driver;
> +
>  	dev_dbg(mtu->dev, "gadget DISCONNECT\n");
>  	if (mtu->gadget_driver && mtu->gadget_driver->disconnect) {
> +		driver = mtu->gadget_driver;
>  		spin_unlock(&mtu->lock);
> -		mtu->gadget_driver->disconnect(&mtu->g);
> +		/*
> +		 * avoid kernel panic because mtu3_gadget_stop() assigned NULL
> +		 * to mtu->gadget_driver.
> +		 */
> +		driver->disconnect(&mtu->g);
>  		spin_lock(&mtu->lock);
>  	}

This is not the right approach; it might race with the gadget driver 
unregistering itself.

Instead, mtu3_gadget_stop() should call synchronize_irq() after 
releasing the IRQ line.  When synchronize_irq() returns, you'll know any 
IRQ handlers have finished running, so you won't receive any more 
disconnect notifications.  Then it will be safe to acquire the spinlock 
and set mtu->gadget_driver to NULL.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
