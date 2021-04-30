Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B73C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 13:57:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2518661462
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 13:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2518661462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BcqtUlfR//ceKM1adOi2YSU74CnJKdmwmDLPrev77HY=; b=ZJFJ8eKktG7rUNrUx2E4//VN+
	k6mn66XPDIQksxd9LgBIXew5vBP4aJRLRiY9UrVMt/wkJlUCHccLYEsCTZznVUJqxuFemUH6mBxJc
	k5HuGk0KRMCzDwpNmd7wv+epnTEgo2Gek0OVDzHtRGZM2ycfigenWknEVDnVbHHH6M1xC7UAHRtIK
	ojGfPoniflXr9YgOorZCqtGrYm/lWW1Ja8O1/d4lo2v50qjhaF9EEFIxHYzWmuNIDpGRZb85Rp2v8
	RleFVDPS9XTwMOWomB0LQ0p41ioehXgE4gyg7cp7Scc2675d97N37tgNyipPYEldbkNadajwtydSz
	ygXB+XuFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcTeB-007x16-Do; Fri, 30 Apr 2021 13:57:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcTe0-007x0l-Ii; Fri, 30 Apr 2021 13:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Q1fICto2HNQZSfutCtic/S1RJWRyYhwo5x7lPTKn7TI=; b=nLSaBOMpDEY+nwzm+9DgG6C+Mq
 0Iu5YuwnFBdrufxNVq2J9RsgYBzkfFEC8Rcu6H80SXAEqXKEWi6m0Vab1keHS6wD3uMc9VpRv16ER
 lTxgWetvQbnfdIfhZIQQS7qWcUn+EOAx48SgCH0Spht0uJmA/JSHTQOZVXymWCB6atdj5gQYHj1n8
 AvwCX71uKW7QP8iUPSk2nSBmS/s5aUP5wagIAxmySRTRu2mXdHFA5Xn8DBAdNNrLeUW1NtT2zf4LU
 IX/ur2JoRN8g2ac5vyjBrDxFeDQJj6cJq1z1fKkAluFyQ3e3dB63Y3rYi2knvIoYX/E2LoqkFjr3W
 j0N1O8Yw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcTdw-001QLg-Ey; Fri, 30 Apr 2021 13:57:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23F7961459;
 Fri, 30 Apr 2021 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619791039;
 bh=4U5STTHKz/FQJupb+0tWwRXQW3K2+e2V43lp6ZRD56o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iV4LzR+dEAD1STOrVm6PhT5nUrmtpPuQVeRzNUsqi19AQ1O07bKlkLkXelA5+nZrg
 qnNsR0/ENWZsxnKRaaD3AijsarApdAIwB0HIKCgGE4WQkIuXQ7qwM0Vkk7wnaqGCjo
 65c5ekfpt1HUuMmQBDEhuHKYNLE74VTbNE4PC0is=
Date: Fri, 30 Apr 2021 15:57:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Bin Liu <b-liu@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, David Miller <davem@davemloft.net>,
 DENG Qingfang <dqfext@gmail.com>
Subject: Re: Re: [PATCH] musb: mediatek: rename driver
Message-ID: <YIwMvUVmeeYT1aph@kroah.com>
References: <20210430124317.97376-1-linux@fw-web.de>
 <YIv969BCnPgXzrcg@kroah.com>
 <trinity-5166e76d-779d-4b05-870b-59971bd1571c-1619789439850@3c-app-gmx-bap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-5166e76d-779d-4b05-870b-59971bd1571c-1619789439850@3c-app-gmx-bap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_065720_568682_D6C2C645 
X-CRM114-Status: GOOD (  17.01  )
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

Please do not top-post :)

On Fri, Apr 30, 2021 at 03:30:39PM +0200, Frank Wunderlich wrote:
> Hi Grek
> 
> the problem is that the name mediatek.ko does not point to musb-subsystem. I had discussed with Min Gao (author of this driver) some time ago about this as the name may conflict with other modules (don't remember which was that).
> We have searched issue using the driver on my board (not yet resolved).
> 
> if the module is loaded it shows (based on name) only "mediatek" and user does not know that is the mediatek musb driver, not very good in my eyes as mediatek is a vendor designing many different hardware and so drivers. Imho the module-name should at least give a clue to the subsystem to avoid confusion/conflicts
> 
> Now the discussion comes up again here for a new driver:
> https://patchwork.kernel.org/project/linux-mediatek/cover/20210429062130.29403-1-dqfext@gmail.com/#24148777
> 
> so i decided to rebase and post my patch created in past to clean this up.

All of this information needs to go into the changelog text, what you
wrote there does not explain all of the above.

> and yes this can result in user-space issues depending on the name...because of this i have not added stable-tag ;)

Why does stable matter?  If this could result in a userspace breakage,
that's not ok for any kernel change.

Why not just have any new driver not use this name, as it is, it's not
hurting anything.  Until you can guarantee that renaming this is not
going to break anything, I can not take it.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
