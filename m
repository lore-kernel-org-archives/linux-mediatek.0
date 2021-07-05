Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA26C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D9D613C1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D9D613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tr5PGqtx/6bVe5KcNC9JhKIwDexbh+fbIHdQIw9LoJc=; b=TSm0OsaC8+8+LC
	8a3j06F2xwrC5ucFI1GvOKoB2fN6MNf3uLzd2MlTAuO032VbbvPpNPPL6m+iB2K0L8YOpe68fUV38
	GmuSO4ps4OqveYyoNrF6+esQaeIMJvzbA5Z+Ag2azSfCfD/8xC8RWFL28C9ANPKKE4x5F8LHMNZ3W
	O3b+06XSiCpg231RRjYJEvBeW+B5YT65+IwYsjclavS4B1yQIivZoAc2oZHMhRiDXIw49+CAQdhQY
	739mA+DPUI6YODkNKIJX/PG6UUUAan2kYZGg4nzOOY835xSHMki5/azcnVikSwhM8z6pY/fAafPMn
	6Y4DSZk57TQwkqa11Vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0LRx-008WUl-5w; Mon, 05 Jul 2021 10:03:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0LRs-008WTP-NG; Mon, 05 Jul 2021 10:03:35 +0000
X-UUID: 86bf2a14eec0428db110a89466c24eff-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qjFTiKVPWCA8micJlEL90LBUjNjhF4nry1qQVe8ts68=; 
 b=YSzSvTIgfwIziegZz65l5iwf5mr7dMMdjDGBVDTQNaGlTYcdTQLlbBDrk+USuZLgbki/KtrZcDg5V8/nOY7WwD0FkA1Su7hKAADhp5LcyhiHMN09snxh4WByp5i8Kcrm/dleTL0YYbz+njm+6UpgRPIzeUj7WPOHA3Mfb19yU7A=;
X-UUID: 86bf2a14eec0428db110a89466c24eff-20210705
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 493542827; Mon, 05 Jul 2021 03:03:28 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 03:03:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 5 Jul 2021 18:03:21 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 18:02:55 +0800
Message-ID: <1625479369.1462.5.camel@mhfsdcap03>
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
 <kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Date: Mon, 5 Jul 2021 18:02:49 +0800
In-Reply-To: <CA+Px+wUXK2t42S0HgcOj7_kbkSskHGris5LBquTS3d+hi8kCaQ@mail.gmail.com>
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
 <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com>
 <CA+Px+wW6PrYihYo8F2Op8XPfVHMmO7ODRQrF75DQxc4gRM-qfg@mail.gmail.com>
 <1625039759.22769.3.camel@mhfsdcap03>
 <CA+Px+wUXK2t42S0HgcOj7_kbkSskHGris5LBquTS3d+hi8kCaQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5CA3E85676367427232AB1A8B5467898C9A52067B3761DD5EF6A12AF6A2BD2642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_030334_214374_6269AFB4 
X-CRM114-Status: GOOD (  24.21  )
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

On Mon, 2021-07-05 at 16:09 +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 30, 2021 at 3:56 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > Mt8195 has two hardwares, "mediatek,mt8195-jpgenc0" for hw0 and
> > "mediatek,mt8195-jpgenc1" for HW1. These two nodes will register
> > hardware interrupt, initialize clock, power domain, remap register base
> > addr and other operations. But the device node is not registered.
> > "mediatek,mt8195-jpgenc" will register the device node to represent jpeg
> > encode device. Then the component framework is used to manage the above
> > two hardwares.
> Please don't top-posting.  Inline your replies so that people can
> easily follow the discussion.
> 
> I still don't quite understand why it needs to introduce 2 compatible
> strings.  If hw0 and hw1 are different from interrupts, clocks, power
> domain, and etc, couldn't you use the same compatible string (e.g.
> "mt8195-jpgenc") and provide them different DT attributes?
Dear Tzung-Bi,

As you replied, I can use the same compatible string (e.g
"mt8195-jpgenc") and provide resources with different DT attributes.
But there are the following problems:
The following description takes the resource of clock as an example:
1. If different DT attributes are used to represent different clock
information,the structure array (e.g.struct clkinfo) can be used in the
driver to save the corresponding information, which will increase the
complexity of the software;
2. When using hw0, you only need to turn on clock0, but not clock1,
which can reduce power consumption. When the driver uses one of the
clocks, it needs to extract each structure from structure array
(e.g.struct clkinfo) and compare the attributes to confirming which one
to use.
The software architecture is as follows:
if (...) {
[...]
} else if (...) {
[...]
} 
......
At present, there are only two HWS, and the software architecture is not
complex. With the increase of the number of hardware, the software
architecture will become more and more complex.
To sum up, using different compatibles to represent different HW
can reduce power consumption, decrease code complexity
and enhance code readability.
> 
> > On Fri, 2021-06-25 at 17:18 +0800, Tzung-Bi Shih wrote:
> > > On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > > >  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > Note: the patch won't apply after [1].
> > >
> > > [1]: https://lore.kernel.org/patchwork/patch/1445298/
> > >
> > > >  Required properties:
> > > >  - compatible : "mediatek,mt2701-jpgenc"
> > > > +- compatible : "mediatek,mt8195-jpgenc"
> > > > +- compatible : "mediatek,mt8195-jpgenc0"
> > > > +- compatible : "mediatek,mt8195-jpgenc1"
> > > Why it needs 3 compatible strings?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
