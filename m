Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C43EC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 01:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294A62072C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 01:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OvXfwjPD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ROVHPn8i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294A62072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0f8y1Ba0SKrgCSEHKRQUbiDBv+ogzjbvp0FBbcPtDGA=; b=OvXfwjPDq/JbXL
	a6ZvkkzZe+WqxG5ftv4wfQr26seGW3tVAzs6F4fwnptYNPaOtOl4ml9ryNJCEODIdnPHAHzbojBPz
	NKGDuTVIuAhc/56GUE9uTY2dM8yyEfI0PHCjffIz4NLUZuZy7TejWAJ7+iU5gjSlBOzlHfGtXgbyO
	vpnOmbURlXKZrQKwyrnGC4q6TXRWJRsCQsd61xnI9RzBigKOJEVEN4Jji3QRGBTy+IAFyP7N2h74F
	RbXAI2I6vtVDHGza84XJ8jwv8YSRvKrYLZ6YE9MlxkwbGsw8RDF6YpWYtBifflMMuyPLHsz5wBCCW
	LQh9I16chWG2qNWit9pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbwBJ-0000ZK-Ng; Fri, 22 May 2020 01:09:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbwB6-0000Lz-Ul; Fri, 22 May 2020 01:08:50 +0000
X-UUID: 421719b9c7224a9d8bd8ed97aedd6d24-20200521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oO4SaPPTxCTE7bONxyRSPlLMv4RJZyUeyjDZC6W1AEY=; 
 b=ROVHPn8iwca7HZzyKWs2KF9hhqwvvnFRObwGofNd4GBJJfcYd1Q2tSlaUYJIVI1P31DREcOb+bwmVKI2M1jh8bhiXMPnPg9nzhmHSur3L4SFkD7aI8DjWoofPPqIwdPXga+KWwx3LWDqxKP9O3c/1j8epjyPIImdGQc7NtbHYi8=;
X-UUID: 421719b9c7224a9d8bd8ed97aedd6d24-20200521
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1726016359; Thu, 21 May 2020 17:08:34 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 May 2020 18:08:40 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 May 2020 09:08:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 May 2020 09:08:34 +0800
Message-ID: <1590109620.5899.18.camel@mhfsdcap03>
Subject: Re: [PATCH v3 0/7] add support USB for MT8183
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 22 May 2020 09:07:00 +0800
In-Reply-To: <2e98982b-ab8a-9fa9-0903-881ebce916a5@gmail.com>
References: <1567150854-30033-1-git-send-email-chunfeng.yun@mediatek.com>
 <1567562067.7317.52.camel@mhfsdcap03>
 <2e98982b-ab8a-9fa9-0903-881ebce916a5@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D722D1425AC6E7F67072680642C70D142CB6E1803E9F058E532825CF51FE18462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_180848_993714_FCA3A10D 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On Thu, 2020-05-21 at 14:41 +0200, Matthias Brugger wrote:
> Hi Chungfeng,
> 
> On 04/09/2019 03:54, Chunfeng Yun wrote:
> > Hi Greg,
> > 
> > 
> >   Please don't try to pick up this series, the dependent ones are still
> > under public review, I'll fix build warning and send out new version
> > after the dependent ones are applied
> >   Sorry for inconvenience
> > 
> 
> I think the pmic driver is upstream now and show up in linux-next soon.
> 
> I propose to rebase the series and send it again.
Ok, I'll resend this series, thanks a lot

> 
> Regards,
> Matthias
> 
> > Thanks
> > 
> > On Fri, 2019-08-30 at 15:40 +0800, Chunfeng Yun wrote:
> >> This series support USB DRD controller and enable it's remote
> >> wakeup functoin for MT8183, they depend on the following
> >> series patches:
> >>
> >> 1. this series add support MT6358 PMIC
> >>   [v5,01/10] mfd: mt6397: clean up code
> >>   https://patchwork.kernel.org/patch/11110487/
> >>
> >> 2. this series add support pericfg syscon
> >>   [v2,1/2] dt-bindings: clock: mediatek: add pericfg for MT8183
> >>   https://patchwork.kernel.org/patch/11118183/
> >>
> >> 3. add property mediatek,discth for tphy
> >>   [06/11] phy: phy-mtk-tphy: add a property for disconnect threshold
> >>   https://patchwork.kernel.org/patch/11110695/
> >>
> >> v3 changes:
> >>   1. changes micros define
> >>   2. remove #reset-cell
> >>   3. update dependent series
> >>
> >> v2 changes:
> >>   add patch [7/7]
> >>
> >> Chunfeng Yun (7):
> >>   dt-bindings: usb: mtu3: support USB wakeup for MT8183
> >>   dt-bindings: usb: mtk-xhci: support USB wakeup for MT8183
> >>   usb: mtu3: support ip-sleep wakeup for MT8183
> >>   usb: mtk-xhci: support ip-sleep wakeup for MT8183
> >>   arm64: dts: mt8183: add usb and phy nodes
> >>   arm64: dts: mt8183: enable USB remote wakeup
> >>   arm64: dts: mt8183: tune disconnect threshold of u2phy
> >>
> >>  .../bindings/usb/mediatek,mtk-xhci.txt        |  1 +
> >>  .../devicetree/bindings/usb/mediatek,mtu3.txt |  1 +
> >>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 23 +++++++
> >>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 63 +++++++++++++++++++
> >>  drivers/usb/host/xhci-mtk.c                   | 14 ++++-
> >>  drivers/usb/mtu3/mtu3_host.c                  | 14 ++++-
> >>  6 files changed, 114 insertions(+), 2 deletions(-)
> >>
> > 
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
