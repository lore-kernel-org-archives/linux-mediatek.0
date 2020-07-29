Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A2DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:22:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4798B20838
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDjul45P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ooo12Yr5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4798B20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K3/gbsNBNTLC4Z31XM2MxljxUqUGymL98qEu/hMqWpI=; b=QDjul45PV5XFThSFfCLA8OwsL
	h4iQsiAtMryZm5r1JiDy0FaZ0giH+BcvuCp/ntk8JG+djJpdE/WlD+zLLzhtIilqlYufpz09X7P3e
	aCoIEkpz8nOP9YygOrC6nmElkgIOJKnJJU+DmocNg20fFK2I0Xf4paq2q4z5/r2Wd+GRs5nXhzuJH
	4AdiEIjuUZZM6wCJRqznPksHWLrXbFIYh3vkRIMEPvSpZx9bkD6Q22KK3r4tfftiCijssGKAk48Fz
	FjwK5rUvUZT0dthG9hhs1SzEp7/yH+MTP9OFMYzqIUenMi0dYPTWlNfzGcuO91YS+8FgSVBY0IEAU
	pvtq3iTKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hMF-0004KQ-18; Wed, 29 Jul 2020 08:22:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hM9-0004Hy-M5; Wed, 29 Jul 2020 08:22:34 +0000
X-UUID: 46f70ffe8c88467989564a186dcffda2-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=H3idPQTUXz+EWlLU7Ek+7vnRUsZER+6TN+XpZ69MkBo=; 
 b=ooo12Yr5ScuTGaWTFxIGpqCi/D5DYxTjspgC6kYEGRFdoWNWTIXn/6eTWfWVZVQtTDtCdsuxWuR//p6YfabTjxQH5fEqlp+lfTh9oiyGvlgYY0zr7GMU5ck0g7JVMHv1VWephnb7PKx52CBy/gzgXHbv+mfOhig7peI5v2nAE+Y=;
X-UUID: 46f70ffe8c88467989564a186dcffda2-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1342134647; Wed, 29 Jul 2020 00:22:44 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:12:26 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Jul 2020 16:12:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 16:12:16 +0800
Message-ID: <1596010313.11360.2.camel@mhfsdcap03>
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 29 Jul 2020 16:11:53 +0800
In-Reply-To: <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
 <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
 <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 49384A5751F6C3098C0961C234D96D309D10B032A745AB30AF2B8990DB3650B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_042233_852724_9F5F4A50 
X-CRM114-Status: GOOD (  20.54  )
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
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= <erin.lo@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 15:42 +0800, Matthias Brugger wrote:
> Hi Crystal,
> 
> On 29/07/2020 08:30, Crystal Guo wrote:
> > merge all the reset numbers in one head file.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >   include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >   create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
> > 
> > diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
> > new file mode 100644
> > index 0000000..d73a4ba
> > --- /dev/null
> > +++ b/include/dt-bindings/reset-controller/mtk-resets.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Mediatek Inc.
> > + *
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
> > +#define _DT_BINDINGS_RESET_CONTROLLER_MTK
> > +
> > +#define MT2712_TOPRGU_SW_RST_NUM	11
> > +#define MT8183_TOPRGU_SW_RST_NUM        19
> 
> Maybe I didn't explain myself properly. We want to have all resets in one file 
> and do not want to have the resets for the watchdog in a different file. That 
> means I don't thin your patch is correct and the effort should be abandoned.
> 
> Regards,
> Matthias

Do you mean to keep the current way unchanged? For example, with a new
SOC 8192, should add a new head file mt8192_resets.h for the resets
numbers.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
