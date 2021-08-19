Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00E6C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 07:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA716112D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 07:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CA716112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4rWkisPC0RULXoIdnw49JmIXjIV6/GbiMUbHe5uEy4=; b=gRY1L3Xv213jdd
	vL4BqHOhmsO7kAGsqGLp4mEbOh75GEPQhg9Ne49/w8sDvKK+gXTItC7coVrjspVtGEulzc6/PUmuD
	YfPLRbRnZKBja/VLiPS+kOarARZNjMBiqOI0gb9sRg1sQhEX3LfcCYt6w59heTZgwCGxTTY5Ks6og
	BDh+lEj4MY0oQeaGxcvNb3JBz0VXCUDyroIkPKHTwxQgkBb6Prlg1a0azb0vIOImKXaa59vzVoIwL
	0CMNZpjQ7LIuAWAp8hwV2KpWZAYBsCpoaK3iG2z9rW7YsOql4lhex9Fb+Rq3xwkrDo7e2mGz0MBA9
	el+iPmWAc3oOxtR4jmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGcFY-007TL1-Ln; Thu, 19 Aug 2021 07:14:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGcFR-007THZ-SG; Thu, 19 Aug 2021 07:14:03 +0000
X-UUID: 18e32963019142ab8691515eb9e6990d-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/muT9XpC+z47+tIQYbGjPzGaimqcXokZABmz7lDUyYU=; 
 b=E69u6PyE118kmWIHFOuoYNQ7dyk903A//Kg2LPsBFx/iR1brQIbH3fwtUFyEInYUVbMtIMjdJa0KUASI0uvp+U2DHLqSL2j9f0OKJOI9+TktnL7egWkUrRWjPizBODhLQPLOC50NlYglRZIPRjY+XZYXCN5I+bZFA5BiOuGXsgs=;
X-UUID: 18e32963019142ab8691515eb9e6990d-20210819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1152915; Thu, 19 Aug 2021 00:13:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 00:13:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 15:13:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Aug 2021 15:13:47 +0800
Message-ID: <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>, devicetree
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Date: Thu, 19 Aug 2021 15:13:48 +0800
In-Reply-To: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_001357_962207_94FBBBF5 
X-CRM114-Status: GOOD (  25.24  )
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

Hi Ezequiel,

Thanks for your suggestion.

On Wed, 2021-08-18 at 11:11 -0300, Ezequiel Garcia wrote:
> +danvet
> 
> Hi,
> 
> On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
> > 
> > This series adds support for multi hardware decode into mtk-vcodec, 
> > by first
> > adding component framework to manage each hardware information:
> > interrupt,
> > clock, register bases and power. Secondly add core thread to deal
> > with core
> > hardware message, at the same time, add msg queue for different
> > hardware
> > share messages. Lastly, the architecture of different specs are not
> > the same,
> > using specs type to separate them.
> > 
> 
> I don't think it's a good idea to introduce the component API in the
> media subsystem. It doesn't seem to be maintained, IRC there's not
> even
> a maintainer for it, and it has some issues that were never
> addressed.
> 
> It would be really important to avoid it. Is it really needed in the
> first place?
> 
> Thanks,
> Ezequiel

For there are many hardware need to use, mt8192 is three and mt8195 is
five. Maybe need more to be used in the feature.

Each hardware has independent clk/power/iommu port/irq.
Use component interface in prob to get each component's information.
Just enable the hardware when need to use it, very convenient and
simple.

I found that there are many modules use component to manage hardware
information, such as iommu and drm etc.

Do you have any other suggestion for this architecture?

Thanks
Yunfei Dong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
