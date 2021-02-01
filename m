Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D87C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 01:50:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E1164E2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 01:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E1164E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AKXPYaFAn+8ZLcbE6ThYhgpCNfn4tt3+digrkk3RJG8=; b=M4SNZkFb5YO8+p+bfRp54SZ5l
	6TnDvdkjOzCuhYFo1Op4uyt5F7IYECkX71myxHh+9M8C17oZeTvBChmDBKpcTbN/tTZu77Godc+EG
	FCZ9iYFvh49h24ibkUFtoKITrnU2wwrpFL79k82Ng1p+4sbVMvkU4YbGv42P8zHfFoOTWgxCa8dyF
	FBIZySbQu51pke0sjRGaRfmWx35BaB8eSwYXWGNsiYklpv6DR5sdWvzKe4AMvlE5BnQFJdS3u8DZK
	NVQ7+ghIY4d2iTiwB6veH+c2Oiu8B33EfKjKsuYNl+oHAMWxG02WGFFr1KsNNs+6Oep/HlzDGbvCf
	ZQDE/r38w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6OMY-0004SR-HQ; Mon, 01 Feb 2021 01:50:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6OMV-0004Rv-Ey; Mon, 01 Feb 2021 01:50:45 +0000
X-UUID: 1bba3325886b41f9b1b97803a58f16a6-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cqrms7Ue1/V7oS95GhlRfd1HqRHxwPoPO4V21qXshyk=; 
 b=nAi6dqLoS9jhSl9/cDrzkyXEQmXCt+gNIiBJlXIc180X9tRSSeWnrCnj++Hy/ZnJqlu8cHeErBEbwxg89T8Ir4KvDR3wOqw+TmvIozxiCj72ofmB665V2hyYRWfoC89Vs2aDovBO17hSEpxbkrYkatkxJjNo4YA/jNr6VWjhx3E=;
X-UUID: 1bba3325886b41f9b1b97803a58f16a6-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1116133000; Sun, 31 Jan 2021 17:50:37 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 17:47:48 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 09:47:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Feb 2021 09:47:42 +0800
Message-ID: <1612144062.25113.6.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix UAS issue by XHCI_BROKEN_STREAMS
 quirk
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 1 Feb 2021 09:47:42 +0800
In-Reply-To: <7ad022d3-ff83-9126-ee74-6d1e4d381366@gmail.com>
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
 <20201216115125.5886-2-chunfeng.yun@mediatek.com>
 <CANMq1KDBmuoBNeizm9+f1yJgqF9oMqU5k26KfZrSdjrPQm_LwA@mail.gmail.com>
 <1608171557.23328.53.camel@mhfsdcap03>
 <CAKxU2N8q1XjDbWbv5ksqYr7RMEedV7fng7OUccVggsT89Oyf5w@mail.gmail.com>
 <1608794285.23328.79.camel@mhfsdcap03>
 <7ad022d3-ff83-9126-ee74-6d1e4d381366@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A5024271AC4526812F95AD3BC549251504E6929E05351F62AF340B5A5392FFC52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_205043_683415_3FFCCDBD 
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2021-01-31 at 15:13 +0100, Matthias Brugger wrote:
> 
> On 24/12/2020 08:18, Chunfeng Yun wrote:
> > On Wed, 2020-12-16 at 19:43 -0800, Rosen Penev wrote:
> >> On Wed, Dec 16, 2020 at 6:29 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >>>
> >>> On Wed, 2020-12-16 at 20:28 +0800, Nicolas Boichat wrote:
> >>>> On Wed, Dec 16, 2020 at 7:53 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> [...]
> >>>>>         mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
> >>>>> +       mtk->broken_streams =
> >>>>> +               of_property_read_bool(node, "mediatek,broken_streams_quirk");
> >>>>
> >>>> Would it be better to add a data field to struct of_device_id
> >>>> mtk_xhci_of_match, and enable this quirk on mediatek,mt8173-xhci only?
> >>> This is the common issue for all SoCs (before 2016.06) with 0.96 xHCI
> >>> when the controller don't support bulk stream. If enable this quirk only
> >>> for mt8173, then for other SoCs, the compatible need include
> >>> "mediatek,mt8173-xhci" in dts, this may be not flexible for some cases,
> >>> e.g. a new SoC has the broken stream as mt8173, but also has another
> >>> different quirk, the way you suggested will not handle it.
> >>> And I plan to remove "mediatek,mt8173-xhci" in mtk_xhci_of_match after
> >>> converting the binding to YMAL.
> >> I'm guessing this also applies to mt7621?
> > Yes, mt7621 doesn't support bulk stream
> > 
> 
> Then please provide patches to the DTSI for all SoCs that have this problem.
> Either as a follow-up or as part of this series, if you need to resubmit.
Ok, I'll send new version, and also try other way to fix it without add
property in DTS, thanks

> 
> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
