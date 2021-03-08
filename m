Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B32CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 14:12:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B897651DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 14:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B897651DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pP0NvoGPcIJaWx0uPnWxoAl45NgxGcy4kc6TKR9chjA=; b=a/ViWrs5P3TrqYyyj+YIdhmFg
	1rXJ9eL2mZ/yBv9Xpwsv/bJflusYfwGgwBdkjWDzXjq7AZzugNj0P0EsAK0L+t4+DMlVMeQXI/zup
	oBMD29QYGzziBBAKUQChZyfA9ESw4oi4pSzaSjE20Hbwxp57UqH6OL+PA/Zt0mrgDqUTIpjJ7sYQB
	CKoPiiZAS3/xJ9wjlHyabA1aE/4S8b+HmEk3sdqKJKXbZLefrtvH0OjFurFbY9RXMI6oGkRIAkbaA
	7EESaVE911P3AUcEftgXZci2rKOjVnM7WOD5x+canLp8EH/XaANgXud0AIw9mHYqV0qf4lYjRyu7R
	qu/FPKxIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJGcI-0008ba-2P; Mon, 08 Mar 2021 14:12:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJGc1-0008V3-Vv; Mon, 08 Mar 2021 14:12:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECADB651DC;
 Mon,  8 Mar 2021 14:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615212716;
 bh=h+f/lalWFSiDqjzRJFvqnAO+QDGAW3ZQIyuEJL6UcBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJ/ESAuluWky78q3AUv8jD3kGjkSZ7SsOw7wEKtnfnkWJNWrSp5DFMW1DNfQXEkjy
 xX+2yTVy/YrPFzSpdTCal34mVRj25y4BtejJjACGSbm9CQCxXusj9wryC5BmxS2SGt
 a4Kow3FnDrd48qJ+lofHyu6zLAycwncLvRYpPsvg=
Date: Mon, 8 Mar 2021 14:25:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 18/18] usb: common: move function's kerneldoc next to
 its definition
Message-ID: <YEYlzuH5JMt/0Qvw@kroah.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
 <c4d2e010ae2bf67cdfa0b55e6d1deb9339d9d3dc.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4d2e010ae2bf67cdfa0b55e6d1deb9339d9d3dc.1615170625.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_141158_449231_EA57BA54 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 08, 2021 at 10:52:07AM +0800, Chunfeng Yun wrote:
> Following a general rule, add the kerneldoc for a function next
> to it's definition, but not next to its declaration in a header
> file.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch

Thanks for this change, looks great, all now queued up!

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
