Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B195BC34026
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 12:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1CF2173E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 12:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPOU1Nrv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C1CF2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+O7Z8t8lYtD7pdYw22hexTNmQlCuyu+fdnu6BSMfcw=; b=PPOU1NrvMrLmr0
	BXAlAE3YsgELzOPLQmLuH+PC2a8zSV2XRiKVcn+EZRcYvpvouz/XTaBmveiZyz5x3rmdyNMkFPn0w
	1PsXNXTzGEOtVMw2OtKEkFQhYGjhfSBSlmXCxIxeqbZmAUUY5J/WtJiA+UagXbp0D39THjYtZxGu7
	BOQ/ZIFKnn4tWWIDIuTocKBTCiprbVj5T4zTxj7d9xOXtkrOwFjDfnu8AptzzcX5Aleuk1iConxcu
	LsGAn9g7EZ0WJcxvzNyBhzmomLdCnpuu+LE70bjWlBWjAWrU1LccjHiHEystGa+hMugPxQzyluu10
	bp6FB5W4apd9MfYSKlsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j42EU-0000Yc-VV; Tue, 18 Feb 2020 12:44:11 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j42EM-0000HK-OP; Tue, 18 Feb 2020 12:44:04 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1j42C6-00Efka-5Y; Tue, 18 Feb 2020 12:41:42 +0000
Date: Tue, 18 Feb 2020 12:41:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] lib: iov_iter.c: fix a possible calculation error on
 remaining bytes
Message-ID: <20200218124142.GJ23230@ZenIV.linux.org.uk>
References: <1582011672-17189-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582011672-17189-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_044402_793506_7D268C6F 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: Sasha Levin <sashal@kernel.org>, Shen Jing <jingx.shen@intel.com>,
 CC Hwang <cc.hwang@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Jerry Zhang <zhangjerry@google.com>, linux-usb@vger.kernel.org,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 John Stultz <john.stultz@linaro.org>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2020 at 03:41:12PM +0800, Macpaul Lin wrote:
> This issue was found when adbd trying to open functionfs with AIO mode.
> Usually, we need to set "setprop sys.usb.ffs.aio_compat 0" to enable
> adbd with AIO mode on Android.
> 
> When adbd is opening functionfs, it will try to read 24 bytes at the
> fisrt read I/O control. If this reading has been failed, adbd will
> try to send FUNCTIONFS_CLEAR_HALT to functionfs. When adbd is in AIO
> mode, functionfs will be acted with asyncronized I/O path. After the
> successful read transfer has been completed by gadget hardware, the
> following series of functions will be called.
>   ffs_epfile_async_io_complete() -> ffs_user_copy_worker() ->
>     copy_to_iter() -> _copy_to_iter() -> copyout() ->
>     iterate_and_advance() -> iterate_iovec()
> 
> Adding debug trace to these functions, it has been found that in
> iterate_iovec(), the calculation result of n will be turned into zero.
>    n = wanted - n; /* 0 == n = 24 - 24; */
> Which causes copyout() won't copy data to userspace since the length
> to be copied "v.iov_len" will be zero, which isn't correct. This also
> leads ffs_copy_to_iter() always return -EFAULT. Finally adbd cannot
> open functionfs and send FUNCTIONFS_CLEAR_HALT.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  lib/iov_iter.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index fb29c02c6a3c..f9334144e259 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -36,7 +36,8 @@
>  		skip = __v.iov_len;			\
>  		n -= __v.iov_len;			\
>  	}						\
> -	n = wanted - n;					\
> +	if (n != wanted)				\
> +		n = wanted - n;				\
>  }

	First of all, nothing in that line can possibly *cause*
copyout() to do anything - it's after the calls of step.  What's
more, this changes behaviour only when wanted would've been equal to
n, doesn't it?  Which translates into "no decrements of n have
happened at all", i.e. "nothing has been copied".  IOW, it's
a consequence of no copyout, not the cause of such.  You can
make copy_to_iter() lie and pretend if has copied everything
when it has copied nothing, but that won't change the underlying
bug.

	So I'm afraid your debugging is not finished - you
still need to find out what causes the copyout failures and/or
BS iov_iter padded by caller.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
