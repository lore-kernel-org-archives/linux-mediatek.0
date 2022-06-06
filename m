Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9452EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZw015uZnMpkOeui/hNkOL/FC98Q4ZCuZlMM0W8N7nA=; b=WppRgxk0ny3IGg
	D1QqQIHOUlkxi8M6MHUmYGkWeixFdAxJrLX1pYcfepMkLgWufiZoKKbWm9NFYCFtQKTS83VKXjSLu
	bYqpWvg1521mvhnnw9ttFJIuNPNNOq/fHpnkqTds1GfUGxYqB9fLwCFknL7lwKJQ2OcAlU9XCfZ/5
	HjO62Ylg1r+k8ktAsZlLae/ctVTsGR4UW2uW4QObdEaSRVIy6x2w8pYH28oBwmPWLOUnYtZ5XPwoK
	67+ZZ3U2RyWeLkz+W0Quj9JxDCSr7K5ejNMVagfVJ6FMX2Gd2rcISatSMyhwHZ0VX5eN6OKiKIWLy
	v6WH7WC5lhq0TAfx8GAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyAAq-000mud-OH; Mon, 06 Jun 2022 10:41:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyAAm-000mtH-TU; Mon, 06 Jun 2022 10:41:27 +0000
X-UUID: 29c3731d34e64cbd97f99848cbf609f6-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:dfd4893d-467c-4cce-b705-467cde8b358d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:ba28c2ad-3171-4dd4-a2d9-73b846daf167,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 29c3731d34e64cbd97f99848cbf609f6-20220606
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 360029580; Mon, 06 Jun 2022 03:41:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jun 2022 03:41:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 6 Jun 2022 18:41:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 6 Jun 2022 18:41:17 +0800
Message-ID: <3f02705349535c8a28451233a5f5fc152ac8fa81.camel@mediatek.com>
Subject: Re: [PATCH v1 05/15] remoteproc: mediatek: Add SCP core 1 driver
 for dual-core scp
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Prashant Malani
	<pmalani@chromium.org>, Brian Norris <briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Date: Mon, 6 Jun 2022 18:41:17 +0800
In-Reply-To: <4062e8be-3ac7-c6e5-dc15-bb11bd6051fc@collabora.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
	 <20220601112201.15510-6-tinghan.shen@mediatek.com>
	 <dd12145b-bbb3-b771-b8f7-075ea20bee17@collabora.com>
	 <fe9fae165443f0db55f2bac2bbe214f3b018052d.camel@mediatek.com>
	 <4062e8be-3ac7-c6e5-dc15-bb11bd6051fc@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_034125_006319_D0717328 
X-CRM114-Status: GOOD (  32.03  )
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

On Mon, 2022-06-06 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
> Il 06/06/22 11:52, Tinghan Shen ha scritto:
> > On Mon, 2022-06-06 at 11:15 +0200, AngeloGioacchino Del Regno wrote:
> > > Il 01/06/22 13:21, Tinghan Shen ha scritto:
> > > > MT8195 SCP is a dual-core processor. The mtk_scp.c driver only controls
> > > > SCP core 0. This patch adds a basic driver to control the another core.
> > > > 
> > > > Core 1 and core 0 of the SCP are housed in the same subsys.They see
> > > > registers and memory in the same way.
> > > > 
> > > > Core 1 of the SCP features its own set of core configuration registers,
> > > > interrupt controller, timers, and DMAs. The rest of the peripherals
> > > > in this subsystem are shared by core 0 and core 1.
> > > > 
> > > > As for memory, core 1 has its own cache memory, and the SCP SRAM is shared
> > > > by core 0 and core 1.
> > > > 
> > > 
> > > Hello Tinghan,
> > > 
> > > checking all the patches that are introducing support for the secondary SCP core,
> > > it's clear that you're practically reusing *most of* mtk_scp in mtk_scp_dual.
> > > 
> > > I don't think that adding a new configuration option for MTK_SCP_DUALCORE (nor a
> > > new file just for that) is a good idea... the code is "short enough" so you should
> > > really just add support for multi-core SCP in mtk_scp.c instead.
> > > 
> > > After doing so, I have a hunch that we'll be able to reduce the size of this
> > > implementation even more, as I see literally too much common code :-)
> > > 
> > 
> > Hi Angelo,
> > 
> > Thanks for your review.
> > 
> > This series has 2 new files, mtk_scp_dual.c and mtk_scp_subdev.c.
> > Is your advice to merge both files into mtk_scp.c,
> > or to merely merge mtk_scp_dual.c to mtk_scp.c?
> > 
> > Thanks,
> > TingHan
> > 
> > 
> > 
> 
> I suggest to merge both into mtk_scp.c and commonize/generalize functions inside
> of there as much as possible... including the removal of #if IS_ENABLED(...)
> macro usages, as you can simply check that during runtime by setting a bool
> variable to true when it's dual-core.
> 
> Let's do this first step.
> I'll give you a more exhaustive review on v2, when this main step is done.
> 
> Cheers,
> Angelo

Hi Angelo,

Ok, I'll merge these files and send next version.


Thanks,
TingHan



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
