Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8DEC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 10:29:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EF4206DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 10:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1xteLHdT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a7TbNjMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EF4206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vNE4fuL2mJfaubq2pH69vqWNHQ2KTpq0HVrxt/FKJ7U=; b=1xteLHdTNAbz+w/ChqCArLT+j
	qxILGLHcGhrEvHPkUUMLV3LOHie59ySt4ivtRdBbDJIPDqHvAyZ9LM5QNAviYnj5dqbBe2/Qd0B4T
	wnzOaucimZe3RrYmHCIoIgTMihTU7rcetEcPBXcKcLCv9a+GZwDvdtuFqb3d7m0l7SIz6JKIW9PxO
	dc9Alel6qQow1bZqrEviWD3PTFgl5kcKRUybJwTGgCEPmdh9K2nU7LuU49dLcPMp7h9IlwUDfvE1O
	sotjF3YSCeFtGaN/yyhJY68ywWZnYCrMoPRqVsnfmvjwsEHC1LcskhyTuO291+8R/eJbMKSaYnhWJ
	/Dj/vN1Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6WxK-0002gK-Rn; Fri, 14 Aug 2020 10:29:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6WxG-0002fd-2K; Fri, 14 Aug 2020 10:28:59 +0000
X-UUID: 326a189bc58848bd98c8c56635e45881-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QnqghtOzbq3KGlzZDOOFuPYaiWSDiIunS5SQtsQzX8E=; 
 b=a7TbNjMcTwoef52DCAiq4qvog2xbhC6tzdCcQbHOFRcnYrQTNlhi9LIw7JdXWlCKaQ7PboJ3kXUxcWuqtqFhQ5ajaZWOUSW2Mr+1XQtJz0YmRSGVLXzCS8bVPDUDwuA1eKW4AB27gH/4mGEIXCDkBx8eJBELr34iQH+2lPhrFaw=;
X-UUID: 326a189bc58848bd98c8c56635e45881-20200814
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 333120911; Fri, 14 Aug 2020 02:28:52 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 03:28:50 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Aug 2020 18:28:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 18:28:43 +0800
Message-ID: <1597400867.23246.71.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Aug 2020 18:27:47 +0800
In-Reply-To: <20200813154423.GC5541@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200810185933.GI6438@sirena.org.uk>
 <1597217353.23246.45.camel@mhfsdcap03>
 <20200812120537.GA5545@sirena.org.uk>
 <1597333200.23246.68.camel@mhfsdcap03>
 <20200813154423.GC5541@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 78896913A2FA040185AB8D0D853821D095A23ADD59ED2AB8C1971EBF0E748D102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_062858_329857_87027192 
X-CRM114-Status: GOOD (  22.32  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-13 at 16:44 +0100, Mark Brown wrote:
> On Thu, Aug 13, 2020 at 11:40:00PM +0800, Jiaxin Yu wrote:
> > On Wed, 2020-08-12 at 13:05 +0100, Mark Brown wrote:
> 
> > > These functions are exported for other drivers to use rather than
> > > something done internally by the driver - if this were internal to the
> > > driver it'd not be a big deal but when it's for use by another driver
> > > it'd be better to go through standard interfaces.
> 
> > Can we move this part of the operation to the codec dai driver ops, such
> > as .startup and .shutdown? Because originally these functions are
> > exported to machine driver's dai_link .startup and .shutdown ops.
> 
> If it's internal to the driver sure.
> 
> > > So this needs the SoC to do something as part of callibration?
> 
> > Yes, the side of MTKAIF in SoC part named adda, we need config it before
> > calibration. We will also upstream machine/platform driver that use this
> > codec driver later.
> 
> It would probably be better to just leave this out for now then add the
> required bits to the CODEC driver as part of a patch series that also
> adds the machine driver that uses it so it's clear how it all fits
> together.  It sounds like it should be fine but this'd be easier to
> review.

Ok, I'll remove the functions that related to the calibration, and
upstream them again as part of a patch series that adds the machine
driver later.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
