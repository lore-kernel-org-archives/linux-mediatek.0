Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB24AC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:24:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578FD2137B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JZsSvvbl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yuJPji+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 578FD2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yHOON7o2xcplVbOoK+KjYySxXmz8dcaQ7lQZI+QcTO4=; b=JZsSvvblCkct36/JTd411fLjn
	7qHPS3R36Yn8GoFvAu4r+mRx4aH2STbmfzp6BMnRrRCVhrcfxHc+bbCnn1R6nRboicZmDM3wxKgi4
	wr1rolR7Q7Ut8UBLfDhdiFuTzHx92sFEQx8VIfpwamrgtcHMANmdWIrFFlbDH85MZk7qbKokJoEGX
	S9N14HtXvSGzThPvDpaP//a0RTYHgyAH9k+427p/qR6J93/5G4i7MqBZo06Db5gbsqLk6npwVpqRk
	l7+/NpHb3SrUYjw0NcCdG+1i6mBJCNmLAqcvigdePbbIlLw9oqHwLkyI8o4ofZPjPsfyDYz1r5tNV
	d5R6372VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFGBt-0002F5-0l; Mon, 07 Sep 2020 12:24:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFGBq-0002ES-GR
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 12:24:07 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93FBB2137B;
 Mon,  7 Sep 2020 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599481445;
 bh=bdonkDzkbL50PhcUvl8MR/m3J5LP13sgCsKeaOyI06I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yuJPji+mRKsU7eqW0OeCgvQgj/Dkjss9IeGwaMOI/th/JBbZP5C6U6az5xushEADW
 S7GZJpVkp2LdRT9Tx3BX+hA4c9esoEM2NHRnX1zeMhu0gbGLyFk1AsntkSbH3oBadi
 P8mOw49bwHLgFcTOasi7NcKWFoSh1KTUSkTv+3fY=
Date: Mon, 7 Sep 2020 14:24:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v8] binder: transaction latency tracking for user build
Message-ID: <20200907122419.GB2029056@kroah.com>
References: <20200907070045.GA605692@kroah.com>
 <1599480055-25781-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599480055-25781-1-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_082406_620750_8FE380A0 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 08:00:52PM +0800, Frankie Chang wrote:
> Change from v8:
>   - change rtc_time_to_tm to rtc_time64_to_tm.
>   - change timeval to __kernel_old_timeval due to 
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c766d1472c70d25ad475cf56042af1652e792b23

That feels wrong, why can't you use the "new" structure instead?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
