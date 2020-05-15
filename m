Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074FDC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 12:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60912076A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 12:46:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GhP74aEr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nl6iQHiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60912076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQk8IUIYCEkaCijeo2GZkNlSHlRO9EodgzWBFV+Rum8=; b=GhP74aErFF4M3l
	APEmPxD3oycbrCDpgI+74BlK2f0oV2t5ARimVfleuFa3XUPvIWt3GNoTyyzvW0fFZ9+EjFRc/w/GI
	mWufA12BYlCajF6NGMuDeZfdB7YDk9Q5oiez+Txm03BvrSiUiVu6aZ8z6oCORpFFJMqCy1D1EwuO2
	Cv95wDcYNa8GPdksy0S+orpY2PrFIeRn8w9XDAU5h4i88Gp/Ou/djiN+DOKKkV8INX8b8AC0KOjb5
	Yvcstz47E4wiyqm6Lnj9+q30VdtTrPTn0rYii9Qr1Mg9rBqfDS4xbzoB4OthBFhNdDfg2MHJT2ZQC
	DfyhGnH14AoSz5d4mLJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZZjS-00062s-1m; Fri, 15 May 2020 12:46:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZZjM-00061p-5a
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 12:46:28 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6561920759;
 Fri, 15 May 2020 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589546783;
 bh=9jx5m24WW0URtbkMH+R+pcNb9OGENvkqB1NS3ledxkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nl6iQHiSYFoDPKQZkIM+5cHf1KC5BPJlhv7X9JFpMTws4kZE6whbUD7CD+6jAa9ND
 0n7mfJl5e6EpSyW0WRHq95RDDK8zL0XEMvJTgXJVqAeRGF7M9mCTmxM+zyry+LTcCQ
 J63Ov8ptGQoSVxbuw+oft+43Qs6xH6AR75CIxym8=
Date: Fri, 15 May 2020 14:46:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH 1/3] serdev: ttyport: add devt for tty port
Message-ID: <20200515124621.GB1888557@kroah.com>
References: <20200506072314.112409-1-tientzu@chromium.org>
 <20200506072314.112409-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506072314.112409-2-tientzu@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_054627_675062_C44617E5 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, changqi.hu@mediatek.com, linux-kernel@vger.kernel.org,
 long.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 06, 2020 at 03:23:12PM +0800, Claire Chang wrote:
> serial_match_port() uses devt to match devices. However, when serdev
> registers a tty port, devt has never been set. This makes
> device_find_child() always return NULL.
> 
> Assign devt in serdev_tty_port_register() to fix this.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/tty/serdev/serdev-ttyport.c | 2 ++
>  1 file changed, 2 insertions(+)

So is existing code broken because of this?  Or does no one ever call
device_find_child() on this?  Who needs/uses this?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
