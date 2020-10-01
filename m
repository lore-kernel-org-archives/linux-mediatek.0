Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25493C4727E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 15:16:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870A1207F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 15:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsoPH0zW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUkMQOvw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870A1207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mU0sNsQmFo/VYKNldv5CqFVSwu05O6s9p8Hzo3e42pI=; b=GsoPH0zWqbXjOgE0IwdVIt5CM
	JHfNrAZ+Zb7tZa5reHC5auzQmqdd09FETQvh1Wq6TKubFxoeB7xZFPVdohWU0f8DZKl36xlqHOlga
	3GcZLfkso9bEFFmM5IquOYJuwrDpGncQVaH7OzXF2MRsyi8u/PhGTfaQE8jxcoDnJT3fBmZN6QXHA
	KBcMnv1q++Ywv05G0oBGBkn/odpMbJ1Ah9fQXC0RoyOvOYe88mjmposXu1Sk9srw57fFCCqoeIaKh
	jRgolJgEerqz23Uv7fIMk0Z7dV8TCbNbb71VxbVjuHpAF5FWPccVtjE8/Q7ZCTf9b5VrFub05d0Yh
	TujDJNGzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO0K7-0006yE-Bn; Thu, 01 Oct 2020 15:16:47 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO0K4-0006xB-JZ; Thu, 01 Oct 2020 15:16:45 +0000
Received: by mail-oi1-x243.google.com with SMTP id t76so5917504oif.7;
 Thu, 01 Oct 2020 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xfo+wi8t+ry7BWDgiqCTQIEDykykW+Wdj6olsxhBuHM=;
 b=DUkMQOvwX9tEFpayXGRxRPn++TYJ9jiz9fwz/633eCw9tR3sQKE4FKsR/jzjr+s/YX
 g0o1fbnY3WutEp3eHUWQo3YPoGazs1ktGnBmH2R4qIgqJEKQbgESECy7F88ZPX/4+DL1
 HAIa9j9AL0e6zNXnGhymwc5s4KQ+OfvYt5S8pDmX4yzTNd24aFHBi3ny3Gq/o9rQ2Xcw
 0d6/ITBVFV8pcaKkFqbH8KOZK1oXOTn7A/nevTUZKb5RpvHnVOlWK0rFUCq5kIb/Sa8P
 IJQkDT1fRXEwv1M1FPnuBWqGh6bLKfPDwM5tLUvFALeJLdYy6yDhuf251DtZ0lWrptXL
 qC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xfo+wi8t+ry7BWDgiqCTQIEDykykW+Wdj6olsxhBuHM=;
 b=uAO4m2OaJNG/WeDciM2HNVILH4BHr590Wiut7zSm7EkTslWbDA2J6ZJcenI+BDEJ9Q
 4FGn9PZELM6gCkcJic8FtnicjE55DmIQgVscykOLcXEYA/HFWR3GKEicqsvkcXv5eh2e
 gm/5dq4chCM7l47KSgZ6C+Ie7VU/ZGhzMZ12JDBMFouhCIMV6GCpo9t1EdAccc9NKpfI
 AzL5kFb5kVt4VAqociOHLXVI5sCI+VLwfnfwVgn5J9WTKVe1EtFlGX9d5kTE/p13tFgO
 pFfSEbfXW3gXjkpWLF/6mbMtQGvGLkY40nC+bhux5klQlaFZTUwhwd+JU1MfsEYFGGtP
 a2Sg==
X-Gm-Message-State: AOAM531SpH3W2/ry/7XfnPXTQ9m9qYDr69HT2y/cALMcHPe5G6pAcgWE
 uFMgTzDQG4GQMvtSci/uJNY=
X-Google-Smtp-Source: ABdhPJzNY7ZqiaCZjpk22anICOz/42ohUgqmMs/7vgXX1GSTHq9VQpTOE4Uio9zydoJgs6seiTebtw==
X-Received: by 2002:aca:4142:: with SMTP id o63mr257451oia.167.1601565401239; 
 Thu, 01 Oct 2020 08:16:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 34sm1250405otg.23.2020.10.01.08.16.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 01 Oct 2020 08:16:40 -0700 (PDT)
Date: Thu, 1 Oct 2020 08:16:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
Message-ID: <20201001151639.GC64648@roeck-us.net>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_111644_649316_14BD3A24 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 01, 2020 at 04:23:02PM +0200, Matthias Brugger wrote:
> Hi Crystal,
> 
> It seems you forgot to send the email to one of the maintainers, Wim.
> Please make sure you add all the maintainers from get_maintainers.pl when
> you send a series.
> 
> Regards,
> Matthias
> 
> On 29/09/2020 05:20, Crystal Guo wrote:
> > v5 changes:
> > fix typos on:
> > https://patchwork.kernel.org/patch/11697493/
> > 
> > v4 changes:
> > revise commit messages.
> > 
> > v3 changes:
> > https://patchwork.kernel.org/patch/11692731/
> > https://patchwork.kernel.org/patch/11692767/
> > https://patchwork.kernel.org/patch/11692729/
> > https://patchwork.kernel.org/patch/11692771/
> > https://patchwork.kernel.org/patch/11692733/

This is less than helpful. It doesn't tell me anything. It expects me to 
go back to the earlier versions, download them, and run a diff, to figure
out what changed. That means the patch or patch series ends at the bottom
of my pile of patches to review. Which, as it happens, is quite deep.

I will review this and similar patches without change log after (and only
after) I have reviewed all other patches in my queue.

Guenter

> > 
> > Crystal Guo (4):
> >    dt-binding: mediatek: watchdog: fix the description of compatible
> >    dt-binding: mediatek: mt8192: update mtk-wdt document
> >    dt-binding: mt8192: add toprgu reset-controller head file
> >    watchdog: mt8192: add wdt support
> > 
> >   .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
> >   drivers/watchdog/mtk_wdt.c                         |  6 +++++
> >   .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
> >   3 files changed, 39 insertions(+), 2 deletions(-)
> >   create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
