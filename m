Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7711CC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:51:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD7261166
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD7261166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xcu7iML9TZhgrp52avt2rugQY2RuIKzbexVs9qHyE2I=; b=eOiOf5vAZSMU9w/nM9luzUxXe
	v+86G4NhZH6Y/nhJCPNTxrvLCpabK53KDC7F/ZCX9x2v81MXUKr0D5CpSEg21VYbKLNjqACFPS2VA
	eT/ZICR1vkvzjGlvV50KMc0+ltXINl0E9OEUWEeecTKhsUW3fpekTAeeyx86dDC5yJ8D0ZqQfaA5w
	N2V1T0w2ca2gE0B1XmmFYCj+4ayL+7pEKjSGgHXNtUngdbVHTYW70S22gDmyMH+f5vgLNzpAPRpdd
	ORyr/yRD3EeA1aMSMqw/xYwcQSv++wJxWkNUh8vNrk/NjteRHxtyObg0rUO67j1FK+hQNvvucm6pG
	yCpKD0enA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURKH-007YOd-3G; Thu, 08 Apr 2021 09:51:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURKD-007YNW-7H; Thu, 08 Apr 2021 09:51:47 +0000
X-UUID: e485a98e5700462aa2f4f34b5c71a7fa-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DhXrt3L4CKxUl57HEQInxirgPEfKt48YlqcSx9oo5a8=; 
 b=TJ+F2AYKnA5LLMYOPdLnxUWZCyLB3ldaQBgRk5P3ZoFyJtj3AyLFiEDIOcqeGWass7SOpGYpBZUi+EqKQMn0RaC2dOi6a/O4l3nVkW26oWNy6dBblRLhyR5dQvemm50KNv0qJP5HhTt/tgg97LYqh1cj8aQ9N201RgCuuZtChG8=;
X-UUID: e485a98e5700462aa2f4f34b5c71a7fa-20210408
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1806522843; Thu, 08 Apr 2021 02:51:42 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 02:51:40 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 8 Apr 2021 17:51:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:51:35 +0800
Message-ID: <1617875495.12105.10.camel@mhfsdcap03>
Subject: Re: [PATCH 4/6] usb: xhci-mtk: add support runtime PM
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown
 <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, Tony Lindgren
 <tony@atomide.com>, Tianping Fang <tianping.fang@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 8 Apr 2021 17:51:35 +0800
In-Reply-To: <1617874514-12282-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <1617874514-12282-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E15A2741E4BB7D8CC38E834F7543B5CB54B1540CBD14BBD60B90D85081593F412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_105145_763368_59483029 
X-CRM114-Status: GOOD (  12.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ikjoon,

On Thu, 2021-04-08 at 17:35 +0800, Chunfeng Yun wrote:
> A dedicated wakeup irq will be used to handle runtime suspend/resume,
> we use dev_pm_set_dedicated_wake_irq API to take care of requesting
> and attaching wakeup irq, then the suspend/resume framework will help
> to enable/disable wakeup irq.
> 
> The runtime PM is default off since some platforms may not support it.
> users can enable it via power/control (set "auto") in sysfs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c | 140 +++++++++++++++++++++++++++++++-----
>  1 file changed, 124 insertions(+), 16 deletions(-)

Please help to test the series on mt8192 chromebook, thanks a lot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
