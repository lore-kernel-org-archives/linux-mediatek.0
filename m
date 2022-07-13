Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfy8X4P200io8YEKqQ/oduzvRrx/BXZ1vuGoO9ifQXI=; b=DADCaG83n3xlvf3G9GDS3QDOM3
	Jk+z/dqCXSaaXc96wTF6zqdwNgD7da15xq1Em41mPY5Xrox8GViqhG8cGUV018mlpj6p0the2jIw8
	HWMHJMnGwPYzVu9+7U+JxqOuyrrHMBqBk9bjEGe5Q1lPtIpTTSawQA2TkwhM7zu2iwHgEkixXSaYq
	ZppRY9sR2CHJbLZxoTsCcoyj8PsP8weUrblINC0STCJR8SZMpaRVYnORvX/C5QidG1yFxE5XDkSiG
	Q0i2McoxjK1ImDYccfHTa9eWDVhbjwHAY8rtO8WEOLG5dgoHi1hvQ6e99r8QIxUDBpTzArAaOgTsv
	P++DYi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBW0m-000aux-Iv; Wed, 13 Jul 2022 06:38:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVza-000a8w-K5; Wed, 13 Jul 2022 06:37:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A11CB81D15;
	Wed, 13 Jul 2022 06:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F180BC34114;
	Wed, 13 Jul 2022 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657694216;
	bh=CMSUMXXc0AsUsrZXjzn8tfNp/uCoq+3nHhn43pNXTGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTbE6ou8P+9zj6YYBv9iwaxMHtMGeVaBVrSHr9RQ8rZntNrZuVrw5hA8hT/p6wa7i
	 H9ENdl+UOuWkotdda8l1x5N29KuAYVw1hkd5Nax5wbE2unYPcMhfSUowiJTRtp5YWI
	 GhSEIuMjc3vJJSvXN4qyof96Fd+PxZjUYWt3Do/o=
Date: Wed, 13 Jul 2022 08:36:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v16 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <Ys5oBTeIcLjf7gnX@kroah.com>
References: <20220712090534.2783494-1-xji@analogixsemi.com>
 <0bd85140-f006-8b29-0a43-500733f1654c@roeck-us.net>
 <Ys16lEvhVSSSRMP7@kroah.com>
 <20220713062845.GB2788915@anxtwsw-Precision-3640-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713062845.GB2788915@anxtwsw-Precision-3640-Tower>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_233702_835850_0B2588A8 
X-CRM114-Status: GOOD (  23.22  )
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

On Wed, Jul 13, 2022 at 02:28:45PM +0800, Xin Ji wrote:
> On Tue, Jul 12, 2022 at 03:43:48PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 12, 2022 at 06:31:22AM -0700, Guenter Roeck wrote:
> > > On 7/12/22 02:05, Xin Ji wrote:
> > > > USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> > > > and a port controller (TCPC) - may require that the driver for the PD
> > > > controller accesses directly also the on-chip port controller in some cases.
> > > > 
> > > > Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> > > > 
> > > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > 
> > > > ---
> > > > V9 -> V10: Rebase on the latest code
> > > > V8 -> V9 : Add more commit message
> > > > V7 -> V8 : Fix Guanter's comment, remove unnecessary explain
> > > 
> > > We are now at v16. The change log has not been updated since v10,
> > > making it all but worthless.
> > 
> > It's also already in my tree for a while, so I have no idea what this is
> > being generated against :(
> Hi all, I'm little confused, do I need update change log from v11 to
> v16? There is no changes since v10.

I'm confused, why are you sending a patch over that is already in my
tree and in linux-next?  You got an email saying it was merged, see
commit 7963d4d71011 ("usb: typec: tcpci: move tcpci.h to
include/linux/usb/").

thanks,

greg k-h

