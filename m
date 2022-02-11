Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF30C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 03:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MM2PSJYid+cPuyCGF0XfuT4VVhFGUKUQlasNzOArPo0=; b=Fisubpv3XLnBYR
	Ji5QUHlk/8+KgeCCtbWidnPcyADbcR00nMo9A0rCgMnr80rT07WlGYPy+oKjXyXIxQ5w7NmoLQiTg
	qohd0E0reLv6RBQL+j8UJI97fSPTiOPuO2naTT5kE7CZmlK627Z04XkhlpjYE9Z1WMdhHyQMy5O1B
	50yons1734uw/NktGhtDfJsAa2UzM9fpndKnuVAT+eX1UY0bxs6VKo/AuUC2tbm/4niAycYqBuaKB
	5m7FWJ9/WU0Nikam5V5d976bnMf1+0OV90Ng4BD3jvUWC9aXDwrKB9etkWEMKfVBfzcU+4Fq6SwVh
	tQSWfrcoFDISNkFpfB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIMx1-005eeA-65; Fri, 11 Feb 2022 03:50:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIMwI-005eL6-Gd; Fri, 11 Feb 2022 03:49:46 +0000
X-UUID: 30fc73c655714fb4b685114ea869c3fb-20220210
X-UUID: 30fc73c655714fb4b685114ea869c3fb-20220210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1211100370; Thu, 10 Feb 2022 20:49:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 19:49:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 11 Feb 2022 11:49:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 11:49:34 +0800
Message-ID: <fa9336d8fb2b24538f4ebcc2474a37bd8f7b8653.camel@mediatek.com>
Subject: Re: [V11, PATCH 12/19] interconnect: mediatek: Add interconnect
 provider driver
From: Dawei Chien <dawei.chien@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>, James
 Liao <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
Date: Fri, 11 Feb 2022 11:49:34 +0800
In-Reply-To: <abf785dd-c1d8-b433-f280-3c42043e4684@collabora.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-13-dawei.chien@mediatek.com>
 <abf785dd-c1d8-b433-f280-3c42043e4684@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_194942_612801_94021F13 
X-CRM114-Status: GOOD (  13.25  )
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

On Thu, 2022-02-03 at 16:19 +0100, AngeloGioacchino Del Regno wrote:
> Il 12/08/21 10:58, Dawei Chien ha scritto:
> > From: Henry Chen <henryc.chen@mediatek.com>
> > 
> > Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
> > using the interconnect framework.
> > 
> >               ICC provider         ICC Nodes
> >                                ----          ----
> >               ---------       |CPU |   |--- |VPU |
> >      -----   |         |-----  ----    |     ----
> >     |DRAM |--|DRAM     |       ----    |     ----
> >     |     |--|scheduler|----- |GPU |   |--- |DISP|
> >     |     |--|(EMI)    |       ----    |     ----
> >     |     |--|         |       -----   |     ----
> >      -----   |         |----- |MMSYS|--|--- |VDEC|
> >               ---------        -----   |     ----
> >                 /|\                    |     ----
> >                  |change DRAM freq     |--- |VENC|
> >               ----------               |     ----
> >              |  DVFSR   |              |
> >              |          |              |     ----
> >               ----------               |--- |IMG |
> >                                        |     ----
> >                                        |     ----
> >                                        |--- |CAM |
> >                                              ----
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> This patch deserves my Reviewed-by tag, but I cannot release that if
> the
> driver is not properly signed-off.

I would add singed-off tag on next version, thank you.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
