Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56863C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 15:06:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E716964E7B
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 15:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E716964E7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:From:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nIiJD/c9LgBAAmrjRnT/qVhoUzCu80sFHVg3TM275l0=; b=lVq9+sZZtXKgiQbaEGB8GlSR/
	bNQ1HqmQYiBDkNfw60MKvOza8iJ87iJH+5C4PpXJCUbcz29oIoCIpRN7Z/5HIOPII641b1OXFW1kG
	SM6MI1GTjzaH/9etgYCSkntz81yx4hv1Qjkr7o1GHSfVHLWPszY0MJe9fxPkkxhoLr/z//iXoaQJp
	3P21Q5cTPlbVOdhjyHBRNktXwHiUcnmqxXyT8ynLvzyEHCAOmiI86Y9HUqOsRNarofQjo2KIUh2im
	2uxY5HUibmUVXMl0oOBqUZYpnIMtj82oTZ4ZBby6Nodu+xRXHNgdZ0TYpZ+3unN/SXb8Q/OsyoTLR
	/spupLc9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l987c-0003nH-Ha; Mon, 08 Feb 2021 15:06:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l987V-0003kw-PL
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 15:06:34 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l987K-00034y-2B; Mon, 08 Feb 2021 16:06:22 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l987G-0001VY-3n; Mon, 08 Feb 2021 16:06:18 +0100
Date: Mon, 8 Feb 2021 16:06:18 +0100
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging: fix ignoring return value warning
Message-ID: <20210208150618.GI8233@pengutronix.de>
References: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
 <20210208134517.GG2696@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208134517.GG2696@kadam>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:57:09 up 68 days,  2:24, 102 users,  load average: 0.06, 0.08,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_100633_860308_1E5BBA9C 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Youling Tang <tangyouling@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dan,

On Mon, Feb 08, 2021 at 04:45:17PM +0300, Dan Carpenter wrote:
> On Sun, Feb 07, 2021 at 05:23:28PM +0800, Youling Tang wrote:
> > Fix the below ignoring return value warning for device_reset.
> > 
> > drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
> > of function declared with 'warn_unused_result' attribute [-Wunused-result]
> >         device_reset(&pdev->dev);
> >         ^~~~~~~~~~~~ ~~~~~~~~~~
> > drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
> > of function declared with 'warn_unused_result' attribute [-Wunused-result]
> >         device_reset(&pdev->dev);
> >         ^~~~~~~~~~~~ ~~~~~~~~~~
> > 
> 
> We can't really do this sort of fix without the hardware to test it.
> This could be the correct fix or perhaps switching to device_reset_optional()
> is the correct fix.  We can't know unless we have the hardware to test.

When device_reset() is the wrong function then adding a return value
check will turn this into a runtime error for those who have the
hardware which will hopefully trigger them to tell us why reset_device
is wrong for them.
At least for a staging driver I find this procedure opportune.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
