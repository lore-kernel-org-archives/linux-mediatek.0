Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4663C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5Dsp67nQ8TYk5HjXzpQUk08IGXXMmKOmS81ZAefciM=; b=43JNbBxXgvtvuQ
	GC2h2BWZlIVJlre5wg4rhOGJ5O02udATLzDsCyHhZlnG6COP+n645eYHxnfaL/512txUuoRtJfqi3
	iW0oPicytGtj1gHvZezaWxw3hs2HE2MgbQSWjORtvI+Zv5L85M9yycxEfkVaKMiQkyBjGEKUPjpus
	CufNHlXWdWSNIrm4q/q7rJ7G0cwVNqjX2GpOCl6Z7nLu9NoL0IGOZ8ci10zjuL8pswfpY9DBtATPE
	9yReKNsp5PksX2mmfI/L6wiOUSO/ps2m166gPK8gvwTwj8eVZHwXPt/+AtbPjERGf+gOLnEnshttt
	DiJUK5IdQMYMSNVieyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsjL-000UU2-GZ; Fri, 22 Apr 2022 12:49:47 +0000
Received: from mx3.wp.pl ([212.77.101.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsj9-000UT8-IV
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 12:49:37 +0000
Received: (wp-smtpd smtp.wp.pl 9660 invoked from network);
 22 Apr 2022 14:49:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1650631768; bh=FzlZWuqpqT4dYFKX9UTFhTlZBNM1KD7eyT6+7FMZ7dE=;
 h=From:To:Cc:Subject;
 b=LX5BduKUebu3hJxINq1D1+qf6qLFbjcnrYFczjeHyWDF21d4ZNp3KMtgh/ZO59IuW
 176w9+1k6cc3bY3PnD0nfiFiQidj2elSJVZ1gPG49qhwkrp3Hsni6a56uNDGC0iBii
 vi71ZUiwj/gEayxBxzHj38pEctRjyTe2f1jKp4fU=
Received: from unknown (HELO kicinski-fedora-PC1C0HJN)
 (kubakici@wp.pl@[163.114.132.6]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <kvalo@kernel.org>; 22 Apr 2022 14:49:28 +0200
Date: Fri, 22 Apr 2022 05:49:19 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Kalle Valo <kvalo@kernel.org>
Cc: Bernard Zhao <zhaojunkui2008@126.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 bernard@vivo.com
Subject: Re: [PATCH] mediatek/mt7601u: add debugfs exit function
Message-ID: <20220422054919.6f056300@kicinski-fedora-PC1C0HJN>
In-Reply-To: <87k0bhmuh6.fsf@kernel.org>
References: <20220422070325.465918-1-zhaojunkui2008@126.com>
 <87k0bhmuh6.fsf@kernel.org>
MIME-Version: 1.0
X-WP-MailID: cfadbedbb822125ed36bbc0826aae61a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [4eNk]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_054936_129320_C665DA32 
X-CRM114-Status: GOOD (  12.58  )
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

On Fri, 22 Apr 2022 10:45:57 +0300 Kalle Valo wrote:
> > When mt7601u loaded, there are two cases:
> > First when mt7601u is loaded, in function mt7601u_probe, if
> > function mt7601u_probe run into error lable err_hw,
> > mt7601u_cleanup didn`t cleanup the debugfs node.
> > Second when the module disconnect, in function mt7601u_disconnect,
> > mt7601u_cleanup didn`t cleanup the debugfs node.
> > This patch add debugfs exit function and try to cleanup debugfs
> > node when mt7601u loaded fail or unloaded.

Is this actually needed?  Looks like wireless has a wiphy debugfs dir
now, so the entire thing should get removed recursively when probe
fails. The driver is not doing anything special.

> > diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> > index 20669eacb66e..1ae3d75d3c9b 100644
> > --- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> > +++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> > @@ -124,17 +124,22 @@ DEFINE_SHOW_ATTRIBUTE(mt7601u_eeprom_param);
> >  
> >  void mt7601u_init_debugfs(struct mt7601u_dev *dev)
> >  {
> > -	struct dentry *dir;
> > -
> > -	dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
> > -	if (!dir)
> > +	dev->root_dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
> > +	if (!dev->root_dir)
> >  		return;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
