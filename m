Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05716C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CD5613BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8CD5613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v+Qdn9a9Lq8YQRKmMV2HvcXTG+iqJHdJMShQR3B56I=; b=wL82uL4LYul8Gx
	Ub2mc2kz7IkCfUDg1fUOdsjN+HIr0LkBAmZy2xjNrU3IvyJTA976GMpPN4sxkTUqd60ndnLquroBZ
	H4FD2L2Y9Xb+23zs/5e4lNdzvV6DWwn8gT21wA8Aci+ENjGrwi51H+B3PioTTEgWsmTUoFBsSZaWI
	IChXZ9v+d5WfgFtYYGNBU8xeZojeVxUZfu9TeGeUVydnbp+x2LkVzW5i4y7OY6/aufKVz/sO6tKlP
	TGYq+OIRNxWdukiI4oZKO6M4mLUpl/SB9cTABQRhdXdTYZ7LaVY4BHMRMCS0fvs/3SK2gZhYM+14m
	hEDRbJrAvoYe+B/L5EHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3zAB-000WoU-53; Thu, 15 Jul 2021 11:04:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3z9y-000WnF-Mq; Thu, 15 Jul 2021 11:04:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6BC7613BA;
 Thu, 15 Jul 2021 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626347046;
 bh=CtZTxWBhgkfpj48NrkT/qW6992ERI7R/jVxq3j9XRC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OW+Uut5UyBiCKe8zReiC47xuKdCP+DvO6Mld2qsVHrNf088APKcqWk0MjCxkXh9L4
 j4oj5ntEqj5tptncGvhQ08bEgcJEpK5Ryyj9W4OwvnTDKUMggAgFlihbGmzgqLTKY1
 VpW14IBcipVmZ2r3xFi5GbHjPzcsmlhaHIcbks6U=
Date: Thu, 15 Jul 2021 13:03:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-stable <stable@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Macpaul Lin <macpaul.lin@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jens Axboe <axboe@kernel.dk>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Subject: Re: Fix: Please help to cherry-pick patch "bdi: Do not use freezable
 workqueue" to stable tree
Message-ID: <YPAWHugJQhNMOpYN@kroah.com>
References: <1626323319.18118.17.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626323319.18118.17.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_040406_803926_34F0F645 
X-CRM114-Status: GOOD (  11.64  )
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

On Thu, Jul 15, 2021 at 12:28:39PM +0800, Macpaul Lin wrote:
> Dear Greg,
> 
> Our customers have feedback some similar issues as below link on Android
> kernel-4.14 and kernel-4.19.
>   Link: https://marc.info/?l=linux-kernel&m=138695698516487
> 
> They've reported system become abnormal when OTG U-disk has been plugged
> out after the system has been suspended.
> After debugging, we've found the root cause is the same of the issue
> (link) has been reported. We've also tested the patch "bdi: Do not use
> freezable workqueue" is worked.
>   Link: https://lkml.org/lkml/2019/10/4/176
>   commit id in Linus tree: a2b90f11217790ec0964ba9c93a4abb369758c26
> 
> However, we've checked that patch seems hasn't been applied to stable
> tree (We've checked 4.14 and 4.19). Would you please help to cherry-pick
> this patch to stable trees (and to Android trees)?

Now queued up to the stable kernel trees.  If you need something in
Android kernel trees, please contact google or submit a patch to AOSP
for the needed branches.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
