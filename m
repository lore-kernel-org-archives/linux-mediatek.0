Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D72C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:31:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BFEF20719
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:31:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJqp3GY9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D9vP0eaV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BFEF20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UCUvnqyHWkc6qZfonB3O/uwzPFuRwNaDrIEZhLc4NMU=; b=lJqp3GY9xr/oQherX9FT6fyQs
	HkNjXlZ3MytVXL6WTgP7Qf8VuTEvNGQabGQD0vObXsnD9dva7jlr9EjnOzRSXIJG4hP9XsaUvdGcv
	fOZ1tcdqkid4eLryQAs7O/6OH6xw2R5FfCrZV3xjGrdihI1hjRV7n11EuE1pcjvzbC1kUBDbDGIKR
	ph5KI2zZfapJE0SebE1CM/AIjaOS0vumPStfMdNyX/a0mU1wh70llp6n1dM9AprQHVgzY/w4LBkLA
	U0ybTd/7e38i4QOLf5Bh9iBXHt6/xOM8C27JLgyBvukoNK8Who8FPeKT68k69Kd4OFdS3KmHM5kqH
	uh6JmAShg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFAu-0004aj-32; Thu, 10 Sep 2020 05:31:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFAr-0004aD-QG; Thu, 10 Sep 2020 05:31:11 +0000
X-UUID: 0b0115f387094bc6a5305f52e2232b68-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oKrpi4B/EZKt0VCDAKyjczOSEl+6iwJZEeFQwxXZIAU=; 
 b=D9vP0eaV9obiIWcYbLltjWMKjXX22pHHPwwBJXgnUk9c4aYwMVe3aWEW61W4LG89qtCDt+a6pXCSOdmCSE+YvVWhBaRkctlXUp7gIe/BsFyR1VYqOv8lGFvQuk0pAzmtzEzz1Qjj/OKSCfNGex93bh9iNJMYbvCgLl+FuibD57s=;
X-UUID: 0b0115f387094bc6a5305f52e2232b68-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1309343567; Wed, 09 Sep 2020 21:30:54 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 22:30:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 13:30:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 13:30:50 +0800
Message-ID: <1599715851.7042.9.camel@mtkswgap22>
Subject: Re: [PATCH v7] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 10 Sep 2020 13:30:51 +0800
In-Reply-To: <20200910050341.pgyieq3q7ijitosn@vireshk-i7>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <20200910050341.pgyieq3q7ijitosn@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_013110_010549_756B4009 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 10:33 +0530, Viresh Kumar wrote:
> On 10-09-20, 12:31, Hector Yuan wrote:
> > The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> > The driver implements the cpufreq driver interface for this hardware engine. 
> > 
> > This patch depends on the MT6779 DTS patch submitted by Hanks Chen
> >  https://lkml.org/lkml/2020/8/4/1094
> 
> Thanks for hanging there. Looks good to me. I will apply it once Rob
> Ack's the binding patch.
> 

Many thanks for your help. May I know if you can add Reviewed-by tag to
this patch set. I would like to prepare some patches for more features
based on this. Is that okay to you? Thanks again.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
