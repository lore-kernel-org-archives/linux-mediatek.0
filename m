Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7D9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:45:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93AE206D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ev1KaogM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WTmhDVee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A93AE206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EHKTZ1Z/ebGW7ajHQ3RmceeXPohn0eVusuiiLCQeXkc=; b=Ev1KaogMGj5Xr2zfYl1LaoXOq
	o7jawLNkW4bOrcQXBxRtGAP3gLGPZia2aVl3kfnjIkRgKCO1vMawKbHDWk004RE9vUjdoM1zDNgvB
	0+fmz/f83YbK1CCLCe+/Dtmy1fj5bedVy5VrWtQSBxA9x6a3m5XlNyU2Z2p/FTDCB+21mk38CoAXi
	wvatPYOPz+8NT+ZlpM6z95q+AvdZToER1JGR6VPk1iHSmO/nTHMhst+gYFOwWXAW6gfo2v+V0bY5q
	p+0geLTtVAClmSyGDKxM/9CrWb3LBk608J7rlyvyjuBe65Y1S274MdfZL7fDQ8o7WvEbZaTDS++Vg
	bvoTB5pKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hif-0000lA-Bq; Wed, 29 Jul 2020 08:45:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hia-0000ib-DU; Wed, 29 Jul 2020 08:45:45 +0000
X-UUID: f4993d91b88246938ba76be94fb5175c-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ia1XARyByvYXLRx9mXxEAiykte60Wo0wfVOMz7hQaag=; 
 b=WTmhDVeeRYuU7vlrbTVytFuIX1pyrncV+YOI087Gokod0w9xBu5qbcPgo5RngmHfkvIBzztqGVPzz+YVMYDm0WiTtN3l0wnyoUZ76j2BJb25yDP4mqFL7QoacC+dQqC3YVtf95rUHj7J+jPgfoYifMrjkLTgtOfRx8CWy+PFWP0=;
X-UUID: f4993d91b88246938ba76be94fb5175c-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 828658589; Wed, 29 Jul 2020 00:45:50 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:35:33 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Jul 2020 16:35:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 16:35:30 +0800
Message-ID: <1596011707.11360.9.camel@mhfsdcap03>
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 29 Jul 2020 16:35:07 +0800
In-Reply-To: <72d317ef-7f69-9e61-b1d5-23d660c58560@gmail.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
 <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
 <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
 <1596010313.11360.2.camel@mhfsdcap03>
 <72d317ef-7f69-9e61-b1d5-23d660c58560@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_044544_651444_6479E0DE 
X-CRM114-Status: GOOD (  20.67  )
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

On Wed, 2020-07-29 at 16:15 +0800, Matthias Brugger wrote:
> 
> On 29/07/2020 10:11, Crystal Guo wrote:
> > On Wed, 2020-07-29 at 15:42 +0800, Matthias Brugger wrote:
> >> Hi Crystal,
> >>
> >> On 29/07/2020 08:30, Crystal Guo wrote:
> >>> merge all the reset numbers in one head file.
> >>>
> >>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> >>> ---
> >>>    include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
> >>>    1 file changed, 13 insertions(+)
> >>>    create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
> >>>
> >>> diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
> >>> new file mode 100644
> >>> index 0000000..d73a4ba
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/reset-controller/mtk-resets.h
> >>> @@ -0,0 +1,13 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>> +/*
> >>> + * Copyright (C) 2020 Mediatek Inc.
> >>> + *
> >>> + */
> >>> +
> >>> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
> >>> +#define _DT_BINDINGS_RESET_CONTROLLER_MTK
> >>> +
> >>> +#define MT2712_TOPRGU_SW_RST_NUM	11
> >>> +#define MT8183_TOPRGU_SW_RST_NUM        19
> >>
> >> Maybe I didn't explain myself properly. We want to have all resets in one file
> >> and do not want to have the resets for the watchdog in a different file. That
> >> means I don't thin your patch is correct and the effort should be abandoned.
> >>
> >> Regards,
> >> Matthias
> > 
> > Do you mean to keep the current way unchanged? For example, with a new
> > SOC 8192, should add a new head file mt8192_resets.h for the resets
> > numbers.
> > 
> 
> Exactly.
> 
> Regards,
> Matthias

OK, but the dt-binding mtk-wdt.txt still need to update, please help me
to review, many thanks~

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
