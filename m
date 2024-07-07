Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6AC3DA41
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4t7K6jsKFUcklm23c0fYGzuO5K87mgRZHzbC1H4aDs=; b=wbzSBHhsPh+n4PHVeU4HWErtLv
	bjrBM7jkWa8z2rJqjkdTLLIvsfbM9X4Uc7sa4zZSfEizkSSLliDkKLdRIY6HmKiifFMsh/qiDGscZ
	ko2Ssk9aPOhxbG2z0HmSCTvBB1l4fhM80gvieMlNwiSuy1DUMjzbrN+xwPn7mCTyGCK5zF8Xr21PN
	V5o29bltPpq6nnpIzr+sxVtzeKtWvvkymhnVTkUndwOi4KlHNlv7utuZqNILs8QqpS4TGOqYyJ0tJ
	klvCrMDjlNDQ04hQcp6aItCrZ5IWjekjWWNMVxMPVUi4InJToNmB0QPO6GZTAZkHQ1XOp+5A0fAXq
	bZEk/G7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQYiq-00000002GCS-0T5v;
	Sun, 07 Jul 2024 20:43:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQYib-00000002GBe-3ywk;
	Sun, 07 Jul 2024 20:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E4t7K6jsKFUcklm23c0fYGzuO5K87mgRZHzbC1H4aDs=; b=VWVD1vUflbb2QNSZqN78Xmtdhd
	rzubkzQ4PjnfOPpWGXJSP5HvLhDeYVhdLQjth+JUo9wGLeWQ6c+Hw4hdi/UVMOQCHp4KuHCIENC16
	zj055gSoVhPRfYjeVopx3jwKutJgNFzSXdd17dyCKMe0zQl6Mi782AottuN26P91aslzb2x7DLsB5
	veRAZ1i0b4rox9Q5tQDtS6glrqOsuNaN11AfAZqZStD2Faya6yf02CzltttXxDEn5MGtYji+KrEqA
	9ZMmPN55PoY8Nz3xeh+sbDvDrq45ls7B6+AqIEMxZ0DuGf0hCi3T6Wmrhdp0s9I2kVdxEbDvMkSH/
	5kNrv0/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQYiY-00000006DXW-1QRx;
	Sun, 07 Jul 2024 20:42:42 +0000
Date: Sun, 7 Jul 2024 21:42:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: ed.tsai@mediatek.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, chun-hung.wu@mediatek.com,
	casper.li@mediatek.com, linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] backing-file: covert to using fops->splice_write
Message-ID: <Zor9wiPTXCsnTVdt@casper.infradead.org>
References: <20240705081642.12032-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705081642.12032-1-ed.tsai@mediatek.com>
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

On Fri, Jul 05, 2024 at 04:16:39PM +0800, ed.tsai@mediatek.com wrote:
> +++ b/fs/backing-file.c
> @@ -280,13 +280,16 @@ ssize_t backing_file_splice_write(struct pipe_inode_info *pipe,
>  	if (WARN_ON_ONCE(!(out->f_mode & FMODE_BACKING)))
>  		return -EIO;
>  
> +	if (out->f_op->splice_write)
> +		return -EINVAL;

Umm ... shouldn't this have been !out->f_op->splice_write?

>  	ret = file_remove_privs(ctx->user_file);
>  	if (ret)
>  		return ret;
>  
>  	old_cred = override_creds(ctx->cred);
>  	file_start_write(out);
> -	ret = iter_file_splice_write(pipe, out, ppos, len, flags);
> +	ret = out->f_op->splice_write(pipe, out, ppos, len, flags);
>  	file_end_write(out);
>  	revert_creds(old_cred);
>  
> -- 
> 2.18.0
> 
> 

