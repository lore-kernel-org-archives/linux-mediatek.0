Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F79FC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 16:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 629B4217F4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 16:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TC7BXA9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 629B4217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ak+92tsFXEmbjJarytq28Amh7iyyWD/vBeyQi5aNrQg=; b=TC7BXA9RRwaF+a
	NIe0rShci5rELA+eEaJPnTEfASOGTgF7EtFn8QrMeHHLaVoS7puKOz/N4gjtzJxjpUZMlY9jxzeUQ
	xWzc1X4E0fDDO6cLm+AeLoCwyVLiDO6mXLKTst5Vk5BJtfBf8dH4DrtiiC8ugJjDz00Ndon0i7VME
	++rVt4leJZZvQcXMCUMZwXsya0FBSXYxON+IpHMyhPCKVeFQz360vD/49fCCvWqdeR6WbIpGQfD3z
	6PDR74ppHh1QKDcpqbQ3nViHbW85hoNeDviZkuC12ktHeBb2bbJmU29izkQSOb2ljze+lbxyF9B0T
	rg78Ziw5nC/D2KYsJDWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nnH-0007c1-EE; Mon, 02 Mar 2020 16:19:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nn8-0007U0-3A; Mon, 02 Mar 2020 16:19:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 771D72F;
 Mon,  2 Mar 2020 08:19:35 -0800 (PST)
Received: from C02TF0J2HF1T.cambridge.arm.com (C02TF0J2HF1T.cambridge.arm.com
 [10.1.38.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFD083F534;
 Mon,  2 Mar 2020 08:19:31 -0800 (PST)
Date: Mon, 2 Mar 2020 16:19:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4] usb: gadget: f_fs: try to fix AIO issue under ARM 64
 bit TAGGED mode
Message-ID: <20200302161929.GA48767@C02TF0J2HF1T.cambridge.arm.com>
References: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
 <1582718512-28923-1-git-send-email-macpaul.lin@mediatek.com>
 <20200228164848.GH4019108@arrakis.emea.arm.com>
 <1583032843.12083.24.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583032843.12083.24.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_081938_233488_1C6253E2 
X-CRM114-Status: GOOD (  21.12  )
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
 Jerry Zhang <zhangjerry@google.com>, andreyknvl@google.com,
 linux-usb@vger.kernel.org, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Peter Chen <peter.chen@nxp.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>, eugenis@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 01, 2020 at 11:20:43AM +0800, Macpaul Lin wrote:
> On Fri, 2020-02-28 at 16:48 +0000, Catalin Marinas wrote:
> > On Wed, Feb 26, 2020 at 08:01:52PM +0800, Macpaul Lin wrote:
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index ce1d023..192935f 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -715,7 +715,20 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
> > >  
> > >  static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
> > >  {
> > > -	ssize_t ret = copy_to_iter(data, data_len, iter);
> > > +	ssize_t ret;
> > > +
> > > +#if defined(CONFIG_ARM64)
> > > +	/*
> > > +	 * Replace tagged address passed by user space application before
> > > +	 * copying.
> > > +	 */
> > > +	if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
> > > +		(iter->type == ITER_IOVEC)) {
> > > +		*(unsigned long *)&iter->iov->iov_base =
> > > +			(unsigned long)untagged_addr(iter->iov->iov_base);
> > > +	}
> > > +#endif
> > > +	ret = copy_to_iter(data, data_len, iter);
> > >  	if (likely(ret == data_len))
> > >  		return ret;
> > 
> > I had forgotten that we discussed a similar case already a few months
> > ago (thanks to Evgenii for pointing out). Do you have this commit
> > applied to your tree: df325e05a682 ("arm64: Validate tagged addresses in
> > access_ok() called from kernel threads")?
> > 
> 
> Yes! We have that patch. I've also got Google's reply about referencing
> this patch in android kernel tree.
> https://android-review.googlesource.com/c/kernel/common/+/1186615
> 
> However, during my debugging process, I've dumped specific length (e.g.,
> 24 bytes for the first request) AIO request buffer address both in adbd
> and in __range_ok(). Then I've found __range_ok() still always return
> false on address begin with "0x3c". Since untagged_addr() already called
> in __range_ok(), to set "TIF_TAGGED_ADDR" with adbd's user space buffer
> should be the possible solution. Hence I've send the v3 patch.

ffs_copy_to_iter() is called from a workqueue (ffs_user_copy_worker()).
That's still in a kernel thread context but it doesn't have PF_KTHREAD
set, hence __range_ok() rejects the tagged address. Can you try the diff
below:

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 32fc8061aa76..2803143cad1f 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -68,7 +68,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	 * the user address before checking.
 	 */
 	if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
-	    (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
+	    (current->flags & (PF_KTHREAD | PF_WQ_WORKER) ||
+	     test_thread_flag(TIF_TAGGED_ADDR)))
 		addr = untagged_addr(addr);
 
 	__chk_user_ptr(addr);
-

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
