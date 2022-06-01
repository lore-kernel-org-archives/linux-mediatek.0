Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F3FCCA468
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIWXKFaNEwxHZaHunFBgz3EGfQnE2KozS3kKJ0IB60Q=; b=nGeM3RADSTVjvE
	r0NkFdAblmE2k2E5M6lIw2X5bLB4HnIltFMtmIK00tRZ8CX8zm7SFFJ4o30R6kjOtJPFsPLvw8LRF
	5Mr40Wh9eJCrDtKtwGbjZlMqV7zkjF1KrSn21GED5Ii6YGVhAyk95dEzUtgwO6sSJPC9Z1qfChG2S
	n/NDsp3U7JwGFpVf45fgVFgzExeLhQSCOHdWjmZEdEkcBWzCvIK21JvzyPVoqsQ3MUTnw0dJMH9Ec
	rkE/LhCIfl/pNjexosEONgGBSD1/ZOlUbw6QL6ujM8RrF5U+ncC2lG9jmNePB/iUg0pqiweLdpgJE
	tSciqQkO7p+vH32QJekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwPN5-00Ggvx-FO; Wed, 01 Jun 2022 14:30:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwOyN-00GVAb-VI; Wed, 01 Jun 2022 14:05:22 +0000
X-UUID: abc7ac1123aa48be83838c138f95ffc9-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2f91f77a-1917-4aa5-98da-cc8f89cee413,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:21ef780d-3a0d-4bbe-9d72-0e5d26d57423,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: abc7ac1123aa48be83838c138f95ffc9-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1434644222; Wed, 01 Jun 2022 07:05:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 06:59:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 21:59:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jun 2022 21:59:11 +0800
Message-ID: <b054866a5c043d3b6d5553057b5f5bf7b06681f0.camel@mediatek.com>
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for
 node_name_chars_strict
From: qun-wei.lin <qun-wei.lin@mediatek.com>
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh@kernel.org>
CC: <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <casper.li@mediatek.com>,
	<chinwen.chang@mediatek.com>, <kuan-ying.lee@mediatek.com>
Date: Wed, 1 Jun 2022 21:59:11 +0800
In-Reply-To: <7c6f0015-cf50-4c8b-060d-f6641d0aeb16@gmail.com>
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
	 <8d4b8cc3-8433-24f9-1fc5-12d71e640952@gmail.com>
	 <20220531214914.GA2388344-robh@kernel.org>
	 <7c6f0015-cf50-4c8b-060d-f6641d0aeb16@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_070520_112856_2C82980C 
X-CRM114-Status: GOOD (  22.32  )
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

On Tue, 2022-05-31 at 20:45 -0500, Frank Rowand wrote:
> On 5/31/22 17:49, Rob Herring wrote:
> > On Tue, May 31, 2022 at 04:43:18PM -0400, Frank Rowand wrote:
> > > On 5/31/22 01:33, Qun-Wei Lin wrote:
> > > > The function check_node_name_chars_strict issues a false alarm
> > > > when
> > > > compiling an overlay dts.
> > > > 
> > > > /fragment@0/__overlay__: Character '_' not recommended in node
> > > > name
> > > > 
> > > > This workaround will fix it by skip checking for node named
> > > > __overlay__.
> > > 
> > > This is not a false alarm.
> > > 
> > > Do not special case node name "__overlay__".  This node name
> > > should never
> > > occur in a modern overlay source file.
> > 
> > A dtbo -> dts pass will give warnings, so handling these nodes is 
> > worthwhile. Though thinking a bit more about it, I think this one
> > is off 
> > by default, but W=2 turns it on.
> 

When DTC detects an overlay target, it will generate a node name
"__overlay__" in function add_orphan_node [1]

Use the example on page 34 of the slide [2]. When the parser reads this
line in overlay source file:

&{/soc/base_fpga_region} {

It will build two nodes, one with no name and the other one is a
subnode __overlay__ [2].

So if we set W=2, the following warning will be issued:

Warning (node_name_chars_strict): /fragment@0/__overlay__: Character
'_' not recommended in node name

I think this is a false alarm because this __overlay__ is automatically
generated by DTC.

> Yes, at least as of 5.18-rc1 the warning is only if
> '-W node_name_chars_strict', so a dtbo -> dts pass will not give the
> warning for node __overlay__ by default.
> 
> -Frank
> 
> > 
> > Rob
> 
> 

We want to enable all warnings in DTC to ensure that all of our DTS are
compliant with the conventions.

[1] 
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/dtc-parser.y#n169
[2] https://elinux.org/images/0/03/Elce_2018_dt_bof.pdf
[3] 
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/livetree.c#n228





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
