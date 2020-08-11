Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529A2C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 11:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD8120716
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 11:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNSvM2BG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD8120716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PxLpqRziarkDGW/lCWPMOjVsE59DWnqGz/BPJfGa+eo=; b=UNSvM2BGBLT/f3j9NFMykMo7S
	UUI3JTooLiS9tscfaSyDyfIXfwYqmXZ2ludVS7rLFr9oYktP25b0w3xEQsFoqgkCfOkElMa8JPQF0
	Y19LnlbMAGSTaaOGi2qjsXfEA/q8lAfS1XqPb5SIEM+K47jeXETxdlR58x3jicbN7FVv/3KcEVic+
	6camBT4Rc3NtZVZGcOrSBeKiC+faPf5EhB9+KYxA+Kvk4ebvTiawPqrp5o06r6BpGWz3iK412wUST
	XyXa0BQC6w0H9vOSspOMrW1Rmt+XGBakKB8TucBUGfMGHpw+15vdD9EcByuZ5MjQOj8CF6EFbEZ03
	xYtJ3gaiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5SG5-0006PG-Hw; Tue, 11 Aug 2020 11:15:57 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5SG3-0006OI-0r
 for linux-mediatek@lists.infradead.org; Tue, 11 Aug 2020 11:15:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 00C5C67357; Tue, 11 Aug 2020 13:15:51 +0200 (CEST)
Date: Tue, 11 Aug 2020 13:15:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] net: untag pointer in sockptr_is_kernel
Message-ID: <20200811111551.GA3958@lst.de>
References: <20200811102704.17875-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811102704.17875-1-miles.chen@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_071555_177675_EC4D6D67 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, wsd_upstream@mediatek.com,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 11, 2020 at 06:27:04PM +0800, Miles Chen wrote:
> From: Miles Chen <miles.chen@mediatek.com>
> 
> sockptr_is_kernel() uses (sockptr.kernel >= TASK_SIZE) to tell
> if the pointer is kernel space or user space. When user space uses
> the "top byte ignored" feature such as HWAsan, we must untag
> the pointer before checking against TASK_SIZE.
> 
> sockptr_is_kernel() will view a tagged user pointer as a kernel pointer
> and use memcpy directly and causes a kernel crash.

Dave merged a patch from me to rever the optimized sockptr
implementation for now.  If we bring it back we should fold in your
fix.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
