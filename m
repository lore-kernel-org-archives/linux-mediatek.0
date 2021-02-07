Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B85C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 02:10:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084C064E87
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 084C064E87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1QSfgo8fXCHEkT0WnnsMiMCMv37pA5z2anqusPXyEug=; b=xpK3y2HXcqMocNejg7qmzcQMU
	gtWHa25WXAaxUXv0EUZKwH8SmGg+LHfc+aHLMFq/6sjVw26Gx9TS2chxzW/TuwN/0yrT2bopQgSL5
	KuDkdxAm2tFnWXjZ6bQxvbIDjBSpF/nwlP0lE24u/sfpq5cQcjjha9njUEjApWFBSpNWyXNDyIJco
	wvp+A5P9F5UuBwKkm2wFbhhRQa0ThwpVEuwJbDNKVQEGBd/f+dAfohNpn+WlKJn3mjMIaEbSLQVKE
	k2pKt3qEfY+Wba53N/xAUrkokSQukaChOwioKwA6TZscUlrjN+5OojBA9hFyAOa8bPa5tfdtr6nNr
	0sDBoUvXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8ZXE-0005rb-A9; Sun, 07 Feb 2021 02:10:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8ZXB-0005r5-A6; Sun, 07 Feb 2021 02:10:46 +0000
X-UUID: f17af4e31bd04ac0a71f21f29dc5994b-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TX4lSlAbeAqKjYx/w0Lj9bavqM0Zf4skWi3dYgpYSTE=; 
 b=kpPoCgCD2C0SU3+NlzPJem6BU0fRAM8Cqm0BusfJu+z2ZLmThP8ZutrCptxfrZAuHn6/rpb83/QKqHI9z96bNcwjEslsnpVNcmB2ILyipm39W3apDYkA0WrPb8MsrjptGZVzlfdPFdA9S1DP2TBMWCmmNm7SagZpBFwBoucYyPA=;
X-UUID: f17af4e31bd04ac0a71f21f29dc5994b-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1935425329; Sat, 06 Feb 2021 18:10:38 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 18:10:37 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 7 Feb 2021 10:10:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 10:10:33 +0800
Message-ID: <1612663833.5147.19.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: usb: mtk-xhci: add compatible
 for mt8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 7 Feb 2021 10:10:33 +0800
In-Reply-To: <YBp7hnyPJwgK598V@kroah.com>
References: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
 <YBp7hnyPJwgK598V@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5AAE49BA3F09489F842EFD23B49F651E0B37C4C1342176E6BF5BF481ACC3F1D62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_211045_589207_4206B457 
X-CRM114-Status: GOOD (  20.63  )
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
Cc: devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-02-03 at 11:31 +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 03, 2021 at 06:26:40PM +0800, Chunfeng Yun wrote:
> > There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
> > exclude IP0) have a wrong default SOF/ITP interval which is
> > calculated from the frame counter clock 24Mhz by default, but
> > in fact, the frame counter clock is 48Mhz, so we should set
> > the accurate interval according to 48Mhz. Here add a new compatible
> > for MT8195, it's also supported in driver. But the first controller
> > (IP0) has no such issue, we prefer to use generic compatible,
> > e.g. mt8192's compatible.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: no changes
> 
> Note, I do not apply patches with "RFC" as obviously you do not think
> they are worthy of being applied.  I don't see what you are asking to be
> done with this set of patches, please explain?
The DTS patch [2/3] in the series will cause merge conflict, due to the
dependent patches are not upstreamed.

Another problem is that I wander to know whether the compatible usage as
following is allowed:

arch/arm64/boot/dts/mediatek/mt8195.dtsi

   usb@11200000 {  // ip0
        compatible = "mediatek,mt8192-xhci",  // here use mt8192's
compatible, avoid changing SOF/ITP interval for ip0, because it's
default value is ok."mediatek,mt8192-xhci" is not supported in driver,
so finally will use generic copatible "mediatek,mtk-xhci".

                     "mediatek,mtk-xhci";
        ....
    };

   usb@11290000 {  // ip1
        compatible = "mediatek,mt8195-xhci",  // here use mt8195's
compatible, used to change SOF/ITP interval, due the the wrong default
value.
                     "mediatek,mtk-xhci";
   };

   usb@112a0000 {  // ip2
        compatible = "mediatek,mt8195-xhci",  // same as ip1
                     "mediatek,mtk-xhci";
    };

Thank you

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
