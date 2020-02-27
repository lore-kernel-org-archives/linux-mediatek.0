Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18E6C4BA3B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 10:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F5724691
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 10:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XgPNEdc2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hd69dLLI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F5724691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DCfrg8cUamtkcc5ArWMAtfUmzIzmwmwa2dxBbn4c64=; b=XgPNEdc2k9irqP
	fBCF5OEb2Spdm39Ew8RW/ZuDDRBtvsrRV1LmCziM1iUnSwf1MpEGMB34TeVwOZ4RMii8YIEqfBLy1
	vN2OM7i4Qa+X9qUyChtIaTsXJsUAa/d01yxoYZqQdJU3r6j//3nnC/kdUDTxLu5czhsvDD8XB6zwI
	0WGKDwaFarMUAa/AG71yb4MChccvSHwfXzrm8Wn+K1V+Fc1D0BCoURT7jinw2SmJLQRgLdcIr5KDO
	MTo5zM6off+nvGQgervpehjZ/OSlpiwwk5ngXxYpcVttXnvMRmmyKZDhdSf6njMJqG36lx8vpci1V
	TzbsDji1flCudL23JP2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7GPE-0004Uv-0p; Thu, 27 Feb 2020 10:28:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7GPA-0004UM-Ib; Thu, 27 Feb 2020 10:28:35 +0000
X-UUID: 2e029f293bd74d5f9b408351b56bf309-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LEaZatPGQmSTfFljV7UsLw7F1kUhEvQfFkNEr7oUNNE=; 
 b=hd69dLLIulXRKM4L8dzuOAO0bc1n/LqO4Bhzsq3RRc2lahOAQhpDH9w3rmsK11b6U8vR8PeQ4wr0qnSGQ/IKcO4CalqELPXGuEcAtu+YW1+8LXEs5WpjAm+mseCw5vP84MA+PGvooxwUv6wwQdiFalQUrJa3E2qi5KTTfwa+EYI=;
X-UUID: 2e029f293bd74d5f9b408351b56bf309-20200227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1969439318; Thu, 27 Feb 2020 02:28:29 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 02:28:26 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 18:28:25 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 18:28:13 +0800
Message-ID: <1582799305.12083.12.camel@mtkswgap22>
Subject: Re: [PATCH v4] usb: gadget: f_fs: try to fix AIO issue under ARM 64
 bit TAGGED mode
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Thu, 27 Feb 2020 18:28:25 +0800
In-Reply-To: <20200227095521.GA3281767@arrakis.emea.arm.com>
References: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
 <1582718512-28923-1-git-send-email-macpaul.lin@mediatek.com>
 <20200227095521.GA3281767@arrakis.emea.arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_022832_625422_A9A97484 
X-CRM114-Status: GOOD (  27.91  )
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
 CC Hwang <cc.hwang@mediatek.com>, Peter Chen <peter.chen@nxp.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Jerry Zhang <zhangjerry@google.com>, andreyknvl@google.com,
 linux-usb@vger.kernel.org, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, John Stultz <john.stultz@linaro.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Vincent Pelletier <plr.vincent@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-27 at 09:55 +0000, Catalin Marinas wrote:
> On Wed, Feb 26, 2020 at 08:01:52PM +0800, Macpaul Lin wrote:
> > This issue was found when adbd trying to open functionfs with AIO mode.
> > Usually, we need to set "setprop sys.usb.ffs.aio_compat 0" to enable
> > adbd with AIO mode on Android.
> > 
> > When adbd is opening functionfs, it will try to read 24 bytes at the
> > first read I/O control. If this reading has been failed, adbd will
> > try to send FUNCTIONFS_CLEAR_HALT to functionfs. When adbd is in AIO
> > mode, functionfs will be acted with asyncronized I/O path. After the
> > successful read transfer has been completed by gadget hardware, the
> > following series of functions will be called.
> >   ffs_epfile_async_io_complete() -> ffs_user_copy_worker() ->
> >     copy_to_iter() -> _copy_to_iter() -> copyout() ->
> >     iterate_and_advance() -> iterate_iovec()
> > 
> > Adding debug trace to these functions, it has been found that in
> > copyout(), access_ok() will check if the user space address is valid
> > to write. However if CONFIG_ARM64_TAGGED_ADDR_ABI is enabled, adbd
> > always passes user space address start with "0x3C" to gadget's AIO
> > blocks. This tagged address will cause access_ok() check always fail.
> > Which causes later calculation in iterate_iovec() turn zero.
> > Copyout() won't copy data to user space since the length to be copied
> > "v.iov_len" will be zero. Finally leads ffs_copy_to_iter() always return
> > -EFAULT, causes adbd cannot open functionfs and send
> > FUNCTIONFS_CLEAR_HALT.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > Cc: Peter Chen <peter.chen@nxp.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Miles Chen <miles.chen@mediatek.com>
> > ---
> > Changes for v4:
> >   - Abandon solution v3 by adding "TIF_TAGGED_ADDR" flag to gadget driver.
> >     According to Catalin's suggestion, change the solution by untagging 
> >     user space address passed by AIO in gadget driver.
> 
> Well, this was suggested in case you have a strong reason not to do the
> untagging in adbd. As I said, tagged pointers in user space were
> supported long before we introduced CONFIG_ARM64_TAGGED_ADDR_ABI. How
> did adb cope with such tagged pointers before? It was not supposed to
> pass them to the kernel.

Thank for your explanation. Since adbd was developed by Google and we
can only suggest (like, file an issue) to them. Here provides a
temporary solution for other developer to solve there needs in a short
period. Yes, I understood not supposed to pass those tagged pointers to
kernel and will also explain this to Google adbd owners.

> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index ce1d023..192935f 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -715,7 +715,20 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
> >  
> >  static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
> >  {
> > -	ssize_t ret = copy_to_iter(data, data_len, iter);
> > +	ssize_t ret;
> > +
> > +#if defined(CONFIG_ARM64)
> > +	/*
> > +	 * Replace tagged address passed by user space application before
> > +	 * copying.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
> > +		(iter->type == ITER_IOVEC)) {
> > +		*(unsigned long *)&iter->iov->iov_base =
> > +			(unsigned long)untagged_addr(iter->iov->iov_base);
> > +	}
> > +#endif
> > +	ret = copy_to_iter(data, data_len, iter);
> 
> Here you should probably drop all the #ifdefs and IS_ENABLED checks
> since untagged_addr() is defined globally as a no-op (and overridden by
> arm64 and sparc).
> 
> Please don't send another patch until we understand (a) whether this is
> a user-space problem to fix or (b) if we fix it in the kernel, is this
> the only/right place? If we settle for the in-kernel untagging, do we
> explicitly untag the addresses in such kernel threads or we default to
> TIF_TAGGED_ADDR for all kernel threads, in case they ever call use_mm()
> (or we could even hook something in use_mm() to set this TIF flag
> temporarily).
> 
> Looking for feedback from the Android folk and a better analysis of the
> possible solution.
> 

If we have any further update about this user space issue, I'll update
the solution to this thread for other developers who need to solve this
issue.

Thanks!
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
