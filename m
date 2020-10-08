Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1307FC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 02:39:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B9620B1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 02:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rY/ZuRYd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QP8HHD/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B9620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ucIW+FgFYCGzh9SGStWZ3GgJxtsNhoP1PYSYH/BaT/A=; b=rY/ZuRYdVYTXO4HPu8A9VDX5C
	vD1EAmOdxOA4vRewxR0d696+RguXbsOsM68Y6DPWZ9tiv8mF84Q2H2CTCLswldWS4KeXrTC+EkJmo
	p+vy6f94ucmLrrfqgSCj149s0K1FNX3sRADfXUoSE6Iu8THXPQK1/l4fYKWeXszTAqTbnyb+FHd9/
	zfs4CPXhMywwm7UoxXFjlGDcLVETkTRQQ5EKLjxxxoidZOt2fDcJ6G33Lk3OdvJi0ZsrU4dkoHfsU
	rnPoiwc1Qv7BY8X47odX3hAwnyydg/uW8OV9InPkK//1QYXZ32sIoRYnOiPymcwyq5nFcvZT3d4BH
	4ycBBKWUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQLq1-0001Er-Av; Thu, 08 Oct 2020 02:39:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQLpy-0001Ds-EI; Thu, 08 Oct 2020 02:39:23 +0000
X-UUID: 75d2a4540cca4c90989effef3ffeeb70-20201007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mpoi5o7pn88Bf30tloJ48idTmrzVeVxim+3Lb5r6NCI=; 
 b=QP8HHD/hqOJK2BMlqTzUSzKuBNuV+8HQ274q87a1he2M3BcCLHgXwTzsCyPvJRfQblHYvsVF5NYTlaKLUw/U01XVqTiUpcuipyi0HeIvdMKv/8EMzk58SdiWFkLxZTTRKnB1XxhW/chTAnolXIPeWbGOB3irphVjn9gbfO0DSm8=;
X-UUID: 75d2a4540cca4c90989effef3ffeeb70-20201007
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1132673164; Wed, 07 Oct 2020 18:39:17 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Oct 2020 19:39:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 10:39:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Oct 2020 10:39:13 +0800
Message-ID: <1602124753.29177.7.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 8 Oct 2020 10:39:13 +0800
In-Reply-To: <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
 <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
 <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B6413CFD2C10AA86898B0C0F25664CFCFEF09CBDE40F37D9A417BA19BDDAEC32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_223922_762714_0B7BA1F8 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-10-07 at 19:00 -0700, Stephen Boyd wrote:
> Quoting Hanks Chen (2020-10-03 03:06:47)
> > Hi Michael & Stephen,
> > 
> > Please kindly let me know your comments about this patch.
> > Thanks
> > 
> 
> What's the base for this patch? I tried applying to v5.9-rc1 and it
> didn't work.

Sorry, what does that mean?

Do you have encountered a merged conflict or run time failed?

I based on kernel-5.8-rc1 to add it and it can boot to kernel shell.

Thanks!


Hanks Chen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
