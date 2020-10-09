Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE9FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:43:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8762223C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USHVSBL7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qvJ2vFkr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8762223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kC3F6xTK3ku+RKnKlCtxeMKXTFCsUCPaLkGH93MAamM=; b=USHVSBL7Nk8tkkDIsgUp1QDYu
	yhqwYJDKc8NVCo3nrhvm0lqKJfK3qVS/HnRLb3XPRQ/2Gll5/s4QEahI5fOmPi1mqbsTADIQ5+oN6
	GvCrGWrCLznronKzo0Hp11UUjGtmcktzvuC4mxKuM6SYHK/7STh++5w7OGZkvm75R8v38U1xhH68k
	/UjjJMNpEe9Ra4tmXIkq+Rf/F2WAOZQIiu6iyPchjrPNLrkF5RZVsv1UvEQeeGsQ0f15iSw57zCRg
	PnOkBsxbZc+me0COf37xopKHR5X2/6n6MpHWZ8fqj1Hjzb+M1VLrv3XqiMcgYQ5Injr1jt0+cHoaD
	3LOGd/0QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQkFZ-0008EG-9d; Fri, 09 Oct 2020 04:43:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQkFW-0008Dd-97; Fri, 09 Oct 2020 04:43:23 +0000
X-UUID: 40f48b51fe6e40808dcfcf29cfbd863a-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ijk9zEMYAAMFlQhF4wPAOfPw0u7B12zhXrXvw8s3OT4=; 
 b=qvJ2vFkrUbJIVMh2+kD2N/bY0oLWLJujRrk8dO+7li+pIuoNacv1ssPSdChpJwZNIf7gT2+/3GVKv4i3VMvoV4+tE68T/1zJZwUC41DUWyrmc2T97DQMeqjqjBLvUOC1Ajo1K552cKHhWmyFaPMwthJYdmxRGImYJFoQqWed3pQ=;
X-UUID: 40f48b51fe6e40808dcfcf29cfbd863a-20201008
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1019566177; Thu, 08 Oct 2020 20:43:14 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 21:43:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Oct 2020 12:42:59 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 12:42:57 +0800
Message-ID: <1602218579.21446.57.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Register EM power table
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 9 Oct 2020 12:42:59 +0800
In-Reply-To: <20201009041912.nzhvubzmfox2twxg@vireshk-i7>
References: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
 <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
 <20201009041912.nzhvubzmfox2twxg@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9FC3C75B20CA1A3C7FC84E92EBC44B1270F1640D81729BFB725E74D47F77370C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_004322_457481_7B38CD21 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-09 at 09:49 +0530, Viresh Kumar wrote:
> On 08-10-20, 20:13, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Register CPU power table to energy model framework
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq-hw.c |   50 +++++++++++++++++++++++++--------
> >  1 file changed, 38 insertions(+), 12 deletions(-)
> 
> I don't see this file in mainline. What am I missing ?
> 
Hi, Viresh:

Yes, I base on my patches which is currently reviewed by Rob for the
Device tree part.
As I mentioned in cover letter.

This patch depends on Mediatek cpufreq HW driver patch submitted by
Hector Yuan.
 https://lkml.org/lkml/2020/9/10/13

I have asked your approval for sending my new patches based on it and
you said it's okay to you.
I will stop sending new patches if you have any concerns.
Thank you so much.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
