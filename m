Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9A4C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 01:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A83206DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 01:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKsaO/7H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="NQAQr7m/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82A83206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iPUlyPFkLmw2aqron36YV324M9+1e8qSnpmf+f6J90=; b=BKsaO/7H0FDSeZ
	EI8Y93mT6qXEh0Ss7K4QqeMXQmKJ4GGp7HruKVrvTUdUkaXwjlw+WESbnMI1PeKJ6gc3nKm6jZP0X
	YHDM7PdyZnYb6hYSAv6NIQK5fHnvP/YihJZ0AS17DEdu5MmRUErZKcfcWl9jzfZZeAtdbWHE30x3T
	gOTbCunMrybWGAYf5n7M/rNB+fcPtxR8il4b25EQjiQZBp119DVPDh2pieoEIhT5kfI9YXVb+0m5G
	OwCe+MxCcCuTClTDgAQYDrA+bC2o5lzmtubGRv+3eSKpAuX6dQP3CBv0ibcxDcttiDNsdwQomPWJ/
	tUFU5MK0+QDv5J1Fntww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilkDD-0001gp-1m; Mon, 30 Dec 2019 01:51:15 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilkDA-0001eJ-2q
 for linux-mediatek@lists.infradead.org; Mon, 30 Dec 2019 01:51:13 +0000
Received: by mail-qt1-x843.google.com with SMTP id q20so28793553qtp.3
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Dec 2019 17:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=DQz0FjxnkcrZB95uhqUPghs+uepx++Cg0e03CfkfPoI=;
 b=NQAQr7m/F84JH6xZgLELtcSkwP8nDBWDreyVi/HwY6F+R43tc1G6CqQ1ZDu4ZZlufq
 3Xb8mxcqIxjSyfjiAkSJ603jB/Iio7i+XeJiG5MjAsV2E7hiLnNEKcLzmeEipmCg1Yut
 h41C8++kK5khfZ1ScnrCeyJGectHWrMS2ZNrxeyGnLhDoz2k0QtWDU7AydNZctkJI62n
 NTHF7uI+hScdljY+KOxgYAXbn8rZ8PP83oIIS7vWGV5y1RdsKKMflYrlbo0VevLH+nOX
 R0H8MB/RhTNYwvUjha/DLBj08zFieM+CNEV1v1ORLVREf2uGTMxN/s/RkqcLp7rJ2eBn
 2jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=DQz0FjxnkcrZB95uhqUPghs+uepx++Cg0e03CfkfPoI=;
 b=QOWUk4wgOB0XMLJV/hnumYXeUdimO0qsDQfCrr6pvc05DF16Mni8st2KXsYUJF04WX
 bovFR0EOnsXNYxQO2c/SL1h7UljxRmhN5CV9FCkzksqADvc5MEsji3LdKsixZHo9uczr
 2lG1aOTESF6MSozpv2kGhCQ8ojG2IwIAfvUlozORQrBxHZ7exD4Pe8nt0s8wFGOxFhob
 GhHspv2ansK64vaIbTL1zmEUbEOffC6LAZEIqO3yfGZJe78w6SxvQM2WcYhn/NYYpqHd
 revF0oDLaoOGBnQJjeFhmKSHcZ4rY6l1Pcm1IXu7pFNKf7oX5ECq5d8PvQObaJwll+87
 odZw==
X-Gm-Message-State: APjAAAUIpgudaoyrKIu0HHTOljB5Rt9/4n/t90+PLjE8dW08N9ZvTp3J
 LjPX3tpzK1JuKzjTcAZh/hzT1w==
X-Google-Smtp-Source: APXvYqwzmOuuJ/FWC8WUTBhMOEyOdQD8LKElXYoAdbbrcMNiJXbkj+74dGHMmtNBqsGrYq3Tk3/Bhg==
X-Received: by 2002:ac8:1109:: with SMTP id c9mr29537417qtj.251.1577670670398; 
 Sun, 29 Dec 2019 17:51:10 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id q126sm12015666qkd.21.2019.12.29.17.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Dec 2019 17:51:09 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
Date: Sun, 29 Dec 2019 20:51:08 -0500
Message-Id: <D8935037-8A59-4A64-9C35-52486DC01015@lca.pw>
References: <1577669436.25204.8.camel@mtkswgap22>
In-Reply-To: <1577669436.25204.8.camel@mtkswgap22>
To: Miles Chen <miles.chen@mediatek.com>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_175112_170118_03182C71 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



> On Dec 29, 2019, at 8:30 PM, Miles Chen <miles.chen@mediatek.com> wrote:
> 
> Yes, printing top 10 will be too much. That's why I print only the
> greatest consumer, and test if this approach works.
> 
> I will resend this patch after the break. Let's wait for others'
> comments?

Sure, but to make my point clear.

Nacked-by: Qian Cai <cai@lca.pw>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
