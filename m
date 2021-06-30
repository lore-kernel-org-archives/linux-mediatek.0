Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C01C11F69
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:56:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3960761C82
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3960761C82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfENb5pdpfbi6hWNh+8pFBRDp6m1RJvQr5n+ykzDMis=; b=rNkOJNmNJdj6Gd
	3nkf6Wn8Np/OfJV8E6oiBRsYcEZowUQZLWphrqx0dz67tWPV+pYFz/qMKBRNyaJTah36kDedHMQJm
	rY9LT4fQRBXo8ycEwoF8W73cGiz6jTrKkGm9qeomTADFvmvnQArg6pn2mPn9EHN9aSK1jLDI0CNPx
	uVMmKb1Z8L71hpyJkQ9RMDvr57ZwAcOdMM5mJr/ARfdVe95EQnLN62JzxLtfeHCOQb+qHk2wE/Omn
	k+DPTXdbF1vfhbdyJz1PYIv2FTZUZL0zjVsWPxgHxntpAVud0piMm+iNPZhkUnP59KrkZA+bfF6yH
	0F2jsBC3lsu0fgO6bkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyV4t-00DCjC-Da; Wed, 30 Jun 2021 07:56:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyV4q-00DCid-K3; Wed, 30 Jun 2021 07:56:10 +0000
X-UUID: df3b7b45882e441da66d6905287661ac-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZHLFDzx6d6kGrf19Z7TqR9ArAz065bSSY/dxBUm1RQA=; 
 b=mIidB46dWx60s1Fw75tIUwMfUQnqMxeKqcCqKxVlz1XRiOzpdT21u7ghLdu3rPtmoMN8eX1Xdwr98MC866GWdRxKM/yLp6VLSY1ngdygNt1osY/VAxy+q/PEI3WxCD8WSS9H+zqU2cG2t5xM0H/9SmFSdPhg3nxcCNWvacIIncA=;
X-UUID: df3b7b45882e441da66d6905287661ac-20210630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1949843556; Wed, 30 Jun 2021 00:56:06 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:56:04 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Jun 2021 15:56:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:55:59 +0800
Message-ID: <1625039759.22769.3.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] dt-bindings: mtk-jpeg: Add binding for MT8195 JPG
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Rick Chang
 <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Wed, 30 Jun 2021 15:55:59 +0800
In-Reply-To: <CA+Px+wW6PrYihYo8F2Op8XPfVHMmO7ODRQrF75DQxc4gRM-qfg@mail.gmail.com>
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
 <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com>
 <CA+Px+wW6PrYihYo8F2Op8XPfVHMmO7ODRQrF75DQxc4gRM-qfg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 254DB0042B2B101053AED848A743D13780EE9ECC94EA484359C9AFDFDEF293B12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_005608_710849_3B0ACD06 
X-CRM114-Status: GOOD (  12.92  )
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

Dear Tzung-Bi,

Mt8195 has two hardwares, "mediatek,mt8195-jpgenc0" for hw0 and
"mediatek,mt8195-jpgenc1" for HW1. These two nodes will register
hardware interrupt, initialize clock, power domain, remap register base
addr and other operations. But the device node is not registered.
"mediatek,mt8195-jpgenc" will register the device node to represent jpeg
encode device. Then the component framework is used to manage the above
two hardwares.

Sincerely,
Kyrie

On Fri, 2021-06-25 at 17:18 +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> >  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> Note: the patch won't apply after [1].
> 
> [1]: https://lore.kernel.org/patchwork/patch/1445298/
> 
> >  Required properties:
> >  - compatible : "mediatek,mt2701-jpgenc"
> > +- compatible : "mediatek,mt8195-jpgenc"
> > +- compatible : "mediatek,mt8195-jpgenc0"
> > +- compatible : "mediatek,mt8195-jpgenc1"
> Why it needs 3 compatible strings?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
