Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612C4C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:42:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47C221532
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="me6IDBw6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZYveQDH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47C221532
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hio+4XSqDVSTVjV3ayOQcVO657lYp55qy2GeVtN7ubI=; b=me6IDBw6B7TPq41ozF/uGJZYM
	AEwI6gHLY0hxi0F0754o9z+nFG6V7PSS98A+E+UUSMJXM5UzNspy9VuHvv3udEeN6PYkhBUyRgusZ
	2Sy8yZEYo9VtCZ7fyB1ils3mPm6fjPMkz4458dgL26VfR79mIZrb0EG1WIMU7Z8KM6MuZk2Gmx54m
	A0g30soC8L/IcIX/i4pW5v9kqCM1nXmZFYFF3/1tnzrlSmLm2hfnE8mv5+kMoRmCtTEJ9ZSY7CUAE
	IO9UOgZfFiFDtWPMWxuim8dzv/rMlJX6ZnCHdpv7a2j0LqK6Cpnwdn0j52xNZ3ruHUoQJXrxW5lgt
	1IbS8SBUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXKG-00044k-Ez; Tue, 08 Sep 2020 06:41:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXKB-00043z-Pg; Tue, 08 Sep 2020 06:41:53 +0000
X-UUID: 123981ca29484499ad42007ef49e5caa-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UZzo7qmXCyALSuToyb3vvmrBpWA69LVmzt4LRB/qeiQ=; 
 b=ZYveQDH6XVVIMBwYuEOqnQrp53Y5yIcV6hrCQ5hnjYZ3leSxv8vATtmGBNcWoGEufJsIAhdJHSqVwKD9xT6uCyZvCjc3XLAVwqLwnUPcCTZ1sFWIkbDKcbZ8E2fLAYfucpcT78EJC0PB9pjMT3QR/hX8bV62YQJ3Axb9v/ECets=;
X-UUID: 123981ca29484499ad42007ef49e5caa-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1680519244; Mon, 07 Sep 2020 22:41:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:31:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:31:35 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 14:31:36 +0800
Message-ID: <1599546695.24690.5.camel@mtkswgap22>
Subject: Re: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Date: Tue, 8 Sep 2020 14:31:35 +0800
In-Reply-To: <1596114272.18804.1.camel@mtkswgap22>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
 <1595416581.5511.6.camel@mtkswgap22>
 <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
 <1596114272.18804.1.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 76787EE110FFF9F4F0880A7419F16CD0727562E97C40491A1E90F6A9E641C2B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_024152_038335_AB542BEE 
X-CRM114-Status: GOOD (  24.81  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

Gentle ping on this patch set.

Thanks!


Hanks Chen


On Thu, 2020-07-30 at 21:04 +0800, Hanks Chen wrote:
> Hi all,
> 
> Gentle ping on this patch.
> 
> Thanks!
> 
> Hanks Chen
> 
> 
> On Wed, 2020-07-22 at 17:21 +0200, Matthias Brugger wrote:
> > 
> > On 22/07/2020 13:16, Hanks Chen wrote:
> > > On Wed, 2020-07-22 at 10:43 +0200, Matthias Brugger wrote:
> > >>
> > >> On 22/07/2020 05:09, Hanks Chen wrote:
> > >>> remove the redundant clk interface of uart.
> > >>> CLK_INFRA_UART3 is a dummy clk interface,
> > >>> it has no effect on the operation of the read/write instruction.
> > >>>
> > >>> Change since v2:
> > >>> Commit "dt-bindings: clock: remove UART3 clock support"
> > >>
> > >> Sorry just another comment. I think we can make this one patch deleting everything.
> > >>
> > > Sorry, I don't understand the comment. Do I need to merge them into one
> > > big patch?
> > > Btw, if I use one patch, I would get check patch fail.
> > > ---
> > > [2020-07-22 19:12:49,046 ERROR] Run check patch results:
> > > WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a
> > > separate patch. See:
> > > Documentation/devicetree/bindings/submitting-patches.rst
> > > ---
> > 
> > Hm, I think that's a debatable error message from checkpatch, but let's leave it 
> > as it is.
> > 
> > Regards,
> > Matthias
> > 
> > 
> > > 
> > > Hanks
> > > 
> > >>> -- remove Fixes tag
> > >>> Commit "clk: mediatek: remove UART3 clock support"
> > >>> -- remove Fixes tag
> > >>>
> > >>> Hanks Chen (2):
> > >>>     dt-bindings: clock: remove UART3 clock support
> > >>>     clk: mediatek: remove UART3 clock support
> > >>>
> > >>>    drivers/clk/mediatek/clk-mt6779.c      | 2 --
> > >>>    include/dt-bindings/clock/mt6779-clk.h | 1 -
> > >>>    2 files changed, 3 deletions(-)
> > >>>
> > > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
