Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF17CA9ECF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 09:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E63FF20862
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 09:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SzFxyj77";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEu30SGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E63FF20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFY1OCd1l2ArRrsqC1AQl9cAwLYZC8voZqEtW5whORw=; b=SzFxyj77R9hmOb
	fGLbuwcL4AaWeecPJwicGtYHtHv2ZauKikzxa3dxl8+2uB0lIJQKJfoSeqC79VrN9iuOiHkgtX9QV
	wBVTrmKzlGalKZQy815MRVg8YJMty8KwuL7BdahSWEqrI3V9Na0FWQzZFFsax6GfkuJEveS37eU6c
	mpa/tU3C4236WYJyTgF+wOOQiaEzlyQcR6/Vuaaou9KmFhVT/7z7t8FncQm6nIBQqp4hFwJzkiyZx
	FRd573vlYGIYvVXHahFQxniaH8a0tUH8zuvzosYkOLAD7DNOULyJ2P7MfOjS714zb9Y9eWoxodwjV
	bVe0gIFXGL2chCJQLsDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQSpI-0007Ol-6E; Fri, 01 Nov 2019 09:02:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQSp7-0007Af-GO; Fri, 01 Nov 2019 09:02:27 +0000
Received: from localhost (unknown [84.241.195.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC5402080F;
 Fri,  1 Nov 2019 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572598944;
 bh=03ykDqOkaZ+vfMFgBSEbYV3PoG8YuXm3FEcL5G+ws2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eEu30SGt42zSHoc5LlbGoOeueGeW6yn0Qevu53KZYtf2dIR9IyWJRdto8azhTnLLm
 6gO3bZr94b44n6IGTAVS/RmtJTvo9eAogiTW5naegoh007djmcOALGxUqyTSZuQ7GU
 jNrB4ZY3g8V4ej2K+GtEc1otaCuzw3cf+nx6Z35A=
Date: Fri, 1 Nov 2019 10:02:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [RFC PATCH] usb: common: change usb_debug_root as static variable
Message-ID: <20191101090221.GC2671695@kroah.com>
References: <1572575349-5596-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572575349-5596-1-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_020225_566747_6D023C25 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 01, 2019 at 10:29:09AM +0800, Chunfeng Yun wrote:
> Try to avoid using extern global variable, and provide two
> functions for the usage cases

That is 3 different things all in one patch, not generally considered a
good thing at all.

Also, who is going to use these new functions?  Why are they needed?

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> NOTE:
>     Prepared but not send out patches for drivers using usb_debug_root,
> because I'm not sure whether this patch is needed, and many drivers
> will be modified.
> ---
>  drivers/usb/common/common.c | 16 ++++++++++++++--
>  include/linux/usb.h         |  5 ++++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 1433260d99b4..639ee6d243a2 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -293,8 +293,20 @@ struct device *usb_of_get_companion_dev(struct device *dev)
>  EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
>  #endif
>  
> -struct dentry *usb_debug_root;
> -EXPORT_SYMBOL_GPL(usb_debug_root);
> +static struct dentry *usb_debug_root;

Doesn't this break things as-is?  You can't do that in a single patch
either :(

> +
> +struct dentry *usb_debugfs_create_dir(const char *name)
> +{
> +	return debugfs_create_dir(name, usb_debug_root);
> +}
> +EXPORT_SYMBOL_GPL(usb_debugfs_create_dir);
> +
> +struct dentry *usb_debugfs_create_file(const char *name, umode_t mode,
> +			void *data, const struct file_operations *fops)
> +{
> +	return debugfs_create_file(name, mode, usb_debug_root, data, fops);

I doubt many people want to create a file in the usb "root" debugfs
directory, right?  They _should_ be just creating a new subdirectory in
there instead.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
