Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F4EC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 13:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74BA2071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 13:22:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMzc5jU+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fTbR+yoo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74BA2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JR5jByb4faSu3k2gZEiRE0GDuh5EzS/PDx+6gp9OnA=; b=jMzc5jU+W3O0Ij
	xb1bbEUcQ07ANX+zQqqwuiGB5kk4FS9TwGEHBq7crgXNCT5ajW3wWZuLHao0YROkzzcl8A6sIK9sM
	3Qx4bJR+Q/GoZsCR+fioGXH1IEyuSX0q4w0bt1F7C6Z8n9nip4FAgBoaz/zILvt4JPjfXMrh7Klnk
	MEB1ireIg5wrAoyeMGcpwY4nCF38unl938zk+Wo2wR2C9rngVZiVZ5DJI/QiP0+b9qNYVWjZ7gCsu
	Bv2fOlvAjJR26gmb4fCkpzB3ZOrWdULO8j8oHjtftvpesNAycumJ31mPD6Ovh3XPab+/4kikOZVBn
	qQ5hd6Bu1b51wWhDH4FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZanw-0002LE-FK; Tue, 26 Nov 2019 13:22:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZamj-00075j-5G; Tue, 26 Nov 2019 13:21:42 +0000
X-UUID: d3b3bd13d20f497fa05fe903a6ec3ebc-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WlPnUjC0Phkva1NreMCotJOZ/GKrJRhduHCPYVkHaA0=; 
 b=fTbR+yooKFztBsSCvuDvMAttoEjWpz/cVcLKPpJ0EKQDKoVquDsLw2z6NDMp4LE8xBsTaUIdyaWLDrnkeuz/7PjepOy4ZfdEqmF5PeXP9dKNECa7JVUnL5cjvKLdK8Xg6pEdDnGpD9cuvGStTSGBN/wHZNXXBlA0fvIAWj10pg0=;
X-UUID: d3b3bd13d20f497fa05fe903a6ec3ebc-20191126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yt.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 378892954; Tue, 26 Nov 2019 05:21:29 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 05:11:40 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 21:11:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 26 Nov 2019 21:12:01 +0800
Message-ID: <1574773890.12247.23.camel@mtksdccf07>
Subject: Re: [PATCH 1/1] sched: panic, when call schedule with preemption
 disable
From: Kathleen Chang <yt.chang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 26 Nov 2019 21:11:30 +0800
In-Reply-To: <20191121123048.GQ4097@hirez.programming.kicks-ass.net>
References: <1574323985-24193-1-git-send-email-yt.chang@mediatek.com>
 <20191121123048.GQ4097@hirez.programming.kicks-ass.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_052141_236933_F2ACDFD3 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-11-21 at 13:30 +0100, Peter Zijlstra wrote:
> On Thu, Nov 21, 2019 at 04:13:05PM +0800, YT Chang wrote:
> > When preemption is disable, call schedule() is incorrect behavior.
> > Suggest to panic directly rather than depend on panic_on_warn.
> 
> Why!?


1. Panic directly will easily find the root cause. 

   Call scheduling in atomic affects not only performance but also
system stability. 
    ex: 
      Call scheduling in IRQ will result in IRQ enable after schedule() 

2. A lot of warnings depend on panic_on_warn. It is not practical to
set panic_on_warn=1. 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
