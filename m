Return-Path: <SRS0=6IrV=4L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB705C35666
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Feb 2020 13:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF79120675
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Feb 2020 13:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXeeYBCO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cyjb4Jh2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF79120675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZZbUzWL2q6MJgWEjDJJahEMvVbiCBmf0ZLG4NAM8Fw=; b=JXeeYBCOCVKJb/
	+gfW99yKj9YqzvXsf+Hx6wuAxB0m30Ib2aTyyBSvdenij5lei3PIkiJ2rkeQewXTjAkTSaQz3zIc3
	8Aw0w7o2txjNuC/xhdJCUj/Mdzk/MfwyzRpaAr0Bhz5VMNtcpXo9Ocy67PkRpUppaONEaBkbBJRsU
	L6eyx3jXSB3a8CMgC43aIMTituTQHdSZptCWtp7PAem1V6Aj1YgZ7CQ7wLJGj7mGQdE/qbP3BCARa
	3QbDN5zvji5hKgsYMPoEBMhkmrRokVgUdns9o4aLdtvYJj2KFE5wMSS5PPTvdDuv+NzJwd9wLQKgB
	uKrlLpy4GC+I3g2uk0jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5r7F-0006gf-AW; Sun, 23 Feb 2020 13:16:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5r6M-0005gL-Tc; Sun, 23 Feb 2020 13:15:21 +0000
X-UUID: 2ebd4369d3ae473390d23de979aea5aa-20200223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HUcMinlJztCOhwy6UvhkEzNXlyN6matYqtCW9mEf2tg=; 
 b=cyjb4Jh2uiN5gqUWXcDwNSbbBVQ3VHvCM2Bac0nMvB+TU+UEj1X0VX443+da8woBc78lZX2D00EuYgtDBxqrxzXVnpF/zvaNrtN7oOulBxQJJ5XSmN6RM2SeAzYcvbTPeIwqoYFR2vF7IIKMvWuCsA2LkzSg713ZlOzSXTT6XpQ=;
X-UUID: 2ebd4369d3ae473390d23de979aea5aa-20200223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 568044871; Sun, 23 Feb 2020 05:15:16 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Feb 2020 05:15:13 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Feb 2020 21:11:02 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 23 Feb 2020 21:14:50 +0800
Message-ID: <1582463706.19053.32.camel@mtkswgap22>
Subject: Re: [PATCH] lib: iov_iter.c: fix a possible calculation error on
 remaining bytes
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Sun, 23 Feb 2020 21:15:06 +0800
In-Reply-To: <20200218124142.GJ23230@ZenIV.linux.org.uk>
References: <1582011672-17189-1-git-send-email-macpaul.lin@mediatek.com>
 <20200218124142.GJ23230@ZenIV.linux.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D743D5FFED43F9BC952FE27FF4BE8AE9BAFC6F359885D5FD278658A4DF9A560E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_051519_000657_00CF5B30 
X-CRM114-Status: GOOD (  23.12  )
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

On Tue, 2020-02-18 at 12:41 +0000, Al Viro wrote:
> On Tue, Feb 18, 2020 at 03:41:12PM +0800, Macpaul Lin wrote:
> > This issue was found when adbd trying to open functionfs with AIO mode.
> > Usually, we need to set "setprop sys.usb.ffs.aio_compat 0" to enable
> > adbd with AIO mode on Android.
> > 
> > When adbd is opening functionfs, it will try to read 24 bytes at the
> > fisrt read I/O control. If this reading has been failed, adbd will
> > try to send FUNCTIONFS_CLEAR_HALT to functionfs. When adbd is in AIO
> > mode, functionfs will be acted with asyncronized I/O path. After the
> > successful read transfer has been completed by gadget hardware, the
> > following series of functions will be called.
> >   ffs_epfile_async_io_complete() -> ffs_user_copy_worker() ->
> >     copy_to_iter() -> _copy_to_iter() -> copyout() ->
> >     iterate_and_advance() -> iterate_iovec()
> > 
> > Adding debug trace to these functions, it has been found that in
> > iterate_iovec(), the calculation result of n will be turned into zero.
> >    n = wanted - n; /* 0 == n = 24 - 24; */
> > Which causes copyout() won't copy data to userspace since the length
> > to be copied "v.iov_len" will be zero, which isn't correct. This also
> > leads ffs_copy_to_iter() always return -EFAULT. Finally adbd cannot
> > open functionfs and send FUNCTIONFS_CLEAR_HALT.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >  lib/iov_iter.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> > index fb29c02c6a3c..f9334144e259 100644
> > --- a/lib/iov_iter.c
> > +++ b/lib/iov_iter.c
> > @@ -36,7 +36,8 @@
> >  		skip = __v.iov_len;			\
> >  		n -= __v.iov_len;			\
> >  	}						\
> > -	n = wanted - n;					\
> > +	if (n != wanted)				\
> > +		n = wanted - n;				\
> >  }
> 
> 	First of all, nothing in that line can possibly *cause*
> copyout() to do anything - it's after the calls of step.  What's
> more, this changes behaviour only when wanted would've been equal to
> n, doesn't it?  Which translates into "no decrements of n have
> happened at all", i.e. "nothing has been copied".  IOW, it's
> a consequence of no copyout, not the cause of such.  You can
> make copy_to_iter() lie and pretend if has copied everything
> when it has copied nothing, but that won't change the underlying
> bug.
> 
> 	So I'm afraid your debugging is not finished - you
> still need to find out what causes the copyout failures and/or
> BS iov_iter padded by caller.

Thanks for your explanation. After these days, I've found this issue
only happened on arm 64-bit system, while arm 32-bit system works well.
After more debugging, it looks like arm 64 tagged ABI related issue.
I've update a new patch here: 
    usb: gadget: f_fs: try to fix AIO issue under ARM 64 bit TAGGED mode
    https://lkml.org/lkml/2020/2/23/16.

Thanks.
Macpaul Lin.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
