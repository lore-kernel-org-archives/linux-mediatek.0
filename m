Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83348CA9ED5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 02:41:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5412E21882
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 02:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OnccxjhD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5412E21882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgRTEg20eMa2q7MV71sq5cAeHKGbye1VRITExWza7UE=; b=OnccxjhDo1KSx6
	F88pddJvVKOTdLEgZ5HhJ97bD6owxiCb359n0uNS1RbfcwwZdSj0kkvjzxqfWU/Uy32z6OKiEMZym
	R11PUL3xAIDnxXB4iOzlhND0wRHkSzaqQaNZIUNJDFOsFACvsvEymbAOxZzwebOsIL0WvbqaHik/l
	yK8lfEj94/9jo/oP2oiMkiWqUVFwhOBFeoSPpsobZIEy63EISqnzHtoe6ouudIWPzUJ9nMIl35jdB
	W6r/nFKAUoPJR8pa8j6FDZZes/mRiFTHR/ah2/tNh/ML4PlKbae3cAZvy1aZTCjJjGH4tMB3HsNHZ
	J7TZ/aSufXri2xpv5QgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRomr-0001Ud-SQ; Tue, 05 Nov 2019 02:41:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRomk-0001MZ-BI; Tue, 05 Nov 2019 02:41:35 +0000
X-UUID: f7ec5a75eaa7424baedb5fc46dd5a539-20191104
X-UUID: f7ec5a75eaa7424baedb5fc46dd5a539-20191104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1611493704; Mon, 04 Nov 2019 18:41:16 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 18:31:22 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 5 Nov 2019 10:31:16 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 5 Nov 2019 10:31:16 +0800
Message-ID: <1572921077.18464.55.camel@mhfsdcap03>
Subject: Re: [RFC PATCH] usb: common: change usb_debug_root as static variable
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 5 Nov 2019 10:31:17 +0800
In-Reply-To: <20191101090221.GC2671695@kroah.com>
References: <1572575349-5596-1-git-send-email-chunfeng.yun@mediatek.com>
 <20191101090221.GC2671695@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2BCAD82B0D71AB466DCD90ED35262FF773AEF73C748AB309528833C8BCB79ED62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_184134_390330_A49C8A46 
X-CRM114-Status: GOOD (  19.79  )
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

On Fri, 2019-11-01 at 10:02 +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 01, 2019 at 10:29:09AM +0800, Chunfeng Yun wrote:
> > Try to avoid using extern global variable, and provide two
> > functions for the usage cases
> 
> That is 3 different things all in one patch, not generally considered a
> good thing at all.

> 
> Also, who is going to use these new functions?  Why are they needed?
After remove global variable usb_debug_root, the drivers using
usb_debug_root to create directory or files will use these new APIs
instead.

> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > NOTE:
> >     Prepared but not send out patches for drivers using usb_debug_root,
> > because I'm not sure whether this patch is needed, and many drivers
> > will be modified.
> > ---
> >  drivers/usb/common/common.c | 16 ++++++++++++++--
> >  include/linux/usb.h         |  5 ++++-
> >  2 files changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > index 1433260d99b4..639ee6d243a2 100644
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -293,8 +293,20 @@ struct device *usb_of_get_companion_dev(struct device *dev)
> >  EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
> >  #endif
> >  
> > -struct dentry *usb_debug_root;
> > -EXPORT_SYMBOL_GPL(usb_debug_root);
> > +static struct dentry *usb_debug_root;
> 
> Doesn't this break things as-is? 
Yes, it will, I didn't send out other patches for the drivers using
usb_debug_root.

>  You can't do that in a single patch
> either :(
When I make usb_debug_root as static variable, two APIs need be added
due to other driver use it to create directory or file.

> 
> > +
> > +struct dentry *usb_debugfs_create_dir(const char *name)
> > +{
> > +	return debugfs_create_dir(name, usb_debug_root);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_debugfs_create_dir);
> > +
> > +struct dentry *usb_debugfs_create_file(const char *name, umode_t mode,
> > +			void *data, const struct file_operations *fops)
> > +{
> > +	return debugfs_create_file(name, mode, usb_debug_root, data, fops);
> 
> I doubt many people want to create a file in the usb "root" debugfs
> directory, right?  They _should_ be just creating a new subdirectory in
> there instead.
Currently only three .c files creates a file under usb 'root' debugfs
directory.

> 
> thanks,
> 
> greg k-h



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
