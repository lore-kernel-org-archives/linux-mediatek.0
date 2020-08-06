Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57659C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:22:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F0A204FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQmRndHC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BJVzeyvL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F0A204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YhU/Nee6u1RQ5NZRK4CxtiNmTce+T0TF0DgeMFkuMFQ=; b=NQmRndHCsyFaDSetxYVZ2HXxy
	OnHJtSFcbACECSVbRZMWnTgEfXjBzzEntGgAPPFt4AWDatuXz+VHAyYnV56tXOfqLrJb9SQacZR+a
	YH/NPhWr6sAETbpo6ziFW8j1dXs8OkxRTc+Xa9HDV9/076S2Zwpsn6gN2mhTX/o4gr5QsfuyBegGU
	qemLezjDjzv583ohlhQe5DlxrWxQLqK9r5wKZvjdStjsIp+utr5GJYT3YoNXlUWg3u5XBmu3I5keQ
	2MwYKtE9ElCVgGlCSoK4S4qrYQHSXk7TVnKiILsXnW9Iwv9w4nUClQ97pvMaLwMzqAvr+Y69EHoli
	KGkDTe+Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3bNW-0002hm-97; Thu, 06 Aug 2020 08:35:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3bNP-0002g8-KG; Thu, 06 Aug 2020 08:35:53 +0000
X-UUID: 6338a6adc7cd423b86b3e7aba7c647a4-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kEwBOGJANDh+F/Q2lyt1F9uF/E41qzsa4ccuEZY+/2Q=; 
 b=BJVzeyvLLW40XKV5p+Gpo9UcR/EDppuPMcKJfXFud4XooNiwfkNqxmQyJwdA/T80iGll5lEbBfnNuyNHemlHqr9y2+NqjmEYYgRHKMk52NG7avCyAg1J7st6Pfqn5ESEJqWMDMiP4a++5qyGPLoe0V6sGU/m4cf+bL6k8uR70Eo=;
X-UUID: 6338a6adc7cd423b86b3e7aba7c647a4-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hongxu.zhao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 344635955; Thu, 06 Aug 2020 00:35:41 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 01:35:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 16:35:36 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 16:35:35 +0800
Message-ID: <1596702748.6258.3.camel@mbjsdccf07>
Subject: Re: [PATCH] staging: Add Mediatek High Frequency Manager Framework
From: hongxu.zhao <hongxu.zhao@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 6 Aug 2020 16:32:28 +0800
In-Reply-To: <20200804081126.GA1765831@kroah.com>
References: <20200804075339.9820-1-hongxu.zhao@mediatek.com>
 <20200804081126.GA1765831@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CDE9EA66DEF166AB7602FC000924D7C8661AC13549ABA5FDBF57EE35C7AF2B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_043551_857397_784C5C55 
X-CRM114-Status: GOOD (  27.79  )
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 wsd_upstream@mediatek.com, Weiqi Fu <weiqi.fu@mediatek.com>,
 Hongxu Zhao <hongxu.zhao@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>,
 Cunliang Du <cunliang.du@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Zhen jiang <zhen.jiang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-08-04 at 10:11 +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 04, 2020 at 03:52:49PM +0800, hongxu.zhao wrote:
> > Add a new sensor framework into linux kernel which can support multi client request sensor data.
> > There are the following features:
> >     1.Ringbuffer between manager and client;
> >     2.Kernel space user interface;
> >     3.User space user interface with syscall;
> >     4.Each client hang detect mechanism;
> >     5.Polling timer management in framework no need driver concern;
> >     6.Polling kthread work intergrated into a single kthread
> >       worker to save system resources in framework no need driver concern;
> >     7.Proc file system to show manager device and client details;
> >     8.Compitable with android and widely used in many mediatek platform products;
> > 
> > Change-Id: I6361cdc2d51de50f66eede7df099c4575e7ec473
> 
> Did you not run checkpatch.pl on this?  :)
> 
> No need for change-id here.
> 
> But, most importantly, why is this in drivers/staging?  What keeps it
> from being in the "real" part of the kernel?  I need a TODO file in the
> directory of the driver listing what remains to be done and who is
> responsible for doing this work and reviewing patches.
> 
> Can you resend this with that file added and the Change-id removed?
> 
> Also, why not just use the IIO interface, why are you creating
> yet-another api for sensors?  We already have 2, making a third seems
> like something that guarantees this will never be mergable to the
> correct part of the kernel.
> 
> And finally, /proc/ is not for devices, that is what sysfs is for,
> please use that.

I have modified checkpatch issue, but blocked by ARCH=alpha build error
and I can't reproduce this build error in mediatek environment. I need
spend some time setting up an environment to solve this problem and will
send you the latest patch together after solving the problem of alpha
build error.

Firstly I want keep it in the real part of kernel and I send mail to
community to find the right maintainer, unfortunately, several emails
were not answered.
Secondly I found iio upstream history it also started from staging at
the beginning, maybe staging is the best start until it become mature we
can move it to the real part of kernel.

Actually, we have already assessed IIO subsystem, but the conclusion is
that it doesn't meet our requirement:
1. iio doesn't have sensor manager in kernel space.
2. each driver under the iio subsystem needs to create workqueue or
kthread by itself, waste system resources.
3. iio doesn't have hang detect mechanism to detect polling thread hang.

We need a sensor manager architecture in kernel space to select the best
delay and latency that multi-client(user space or kernel space user)
requested at the same time, and finally dispatch data to each client.
We need lower resource comsumption, each driver can poll data by kthread
work which intergrated into a single kthread worker to save system
resources in framework.
We need detect polling thread hang to decide whether to send data to
him.

About proc, proc is only for High Frequency Manager Framework to show
manager details and client details, is not for device drivers. we
recommend device driver(like test/test_app.c) use sysfs which under High
Frequency Manager Framework.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
