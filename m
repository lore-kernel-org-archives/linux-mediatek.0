Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMxohULAuuYfI5l2/+Li5GYtdpMqDqV8rdtZO8xS1J8=; b=b3vSddf+2lG6z1hLHeh0HIu1Jn
	sIhc/+f0CFIKai/YMbx9nyj5QkzJdAs8QohQ67a/ONb2tFcB+MAcodaDQhy9cyvWINQbQgzKepkky
	/Y7CbnTDU0Us2nIy+FoIRmB+V3MYvqylvGLSuJnRpDhBq6EAf4WExXHF0xjXfw+vbnCDUC9M/3ppL
	5J0NI1B7rSqiCXc4x6/Es7curIlAa2oUVZY1Vx6ThqFGwMR2tnKP2hXGIhVuSvourCqFzcMjgY2X6
	zOIri98b4KkMJDyEC0ZxFZC9QyD3HxXrjRM1Kz87LFpQW2Ydhrg0JvIVnF/ZDp5wJIi6xtoKZJVAG
	+o8duK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o36RW-00FjDg-8Q; Mon, 20 Jun 2022 01:43:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o36RR-00FjCa-6s; Mon, 20 Jun 2022 01:43:03 +0000
X-UUID: 503f6fcfd5184576b952db181896cea3-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:cbed7c0a-1378-47da-b3ac-364965c10b7b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:f26f1d49-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 503f6fcfd5184576b952db181896cea3-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1986011637; Sun, 19 Jun 2022 18:42:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 18:36:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 09:36:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 09:36:24 +0800
Message-ID: <a982aa2fb069e498ee259e43501025936b005091.camel@mediatek.com>
Subject: Re: [PATCH v20 0/6] Add mutex support for MDP
From: moudy.ho <moudy.ho@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Mon, 20 Jun 2022 09:36:24 +0800
In-Reply-To: <5f53e0a4-f6d5-f9be-222b-e6361b837071@gmail.com>
References: <20220610063424.7800-1-moudy.ho@mediatek.com>
	 <5f53e0a4-f6d5-f9be-222b-e6361b837071@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_184301_285015_2C819B20 
X-CRM114-Status: GOOD (  32.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-06-17 at 15:54 +0200, Matthias Brugger wrote:
> 
> On 10/06/2022 08:34, Moudy Ho wrote:
> > Change since V19:
> > - Reduce parameters pass to function "mtk_mutex_write_sof"
> >    to avoid redundant action.
> > 
> > Change since V18:
> > - Rebase on v5.19-rc1
> > - Remove unnecessary functions:
> >    "mtk_mutex_set_mod", "mtk_mutex_clear_mod",
> >    "mtk_mutex_set_sof" and "mtk_mutex_clear_sof", and export
> >    "mtk_mutex_write_mod" and "mtk_mutex_write_sof" to
> >    set MOD/SOF directly.
> > - Remove unnecessary SOF tables and add new enumerations of SOF
> > instead.
> > - Adjust the error checking for CMDQ operations.
> > 
> > Change since V17:
> > - Rebase on v5.18-rc6
> > - Fix undeclared identifier causing compilation to fail.
> > 
> > Change since V16:
> > - Rebase on v5.18-rc4
> > - Fix misplacement of definition "CONFIG_MTK_CMDQ" which
> >    caused compilation error when CMD is not supported.
> > 
> > Change since V15:
> > - Rebase on linux-next.
> > - As suggested by Angelo, split common parts into independent
> > functions to
> >    make functions more concise.
> > - Based on safety considerations, increase the returned error
> > number and
> >    message to facilitate error handling.
> > 
> > Change since V14:
> > - Rebase on linux-next.
> > - Add new SOF and MOD table for general interface to integrate the
> > requirement
> >    of different modules.
> > - Remove unnecessary MOD structure.
> > - By Rob Herring's suggestion, revise the description of
> >    "mediatek,gce-client-reg" in MUTEX dt-bindings.
> > - Delete the redundant definition of MTK_MUTEX_ENABLE and modify
> > corresponding
> >    function.
> > 
> > Change since V13:
> > - Rebase on linux-next tag:next-20220316
> > - Adjust the MUTEX MOD table structure and corresponding functions.
> > - Adjust the definition style about 8183 MDP MOD.
> > - Remove redundant definitions and enumerations.
> > - Adjust the CMDQ operation in MUTEX to be backward compatible
> > 
> > Change since V12:
> > - Rebase on linux-next
> > - Remove ISP related settings in MMSYS
> > - Removed CMDQ operations previously used by MDP in MMSYS
> > - Move mediatek MUTEX dt-binding path
> > - Add additional property in MUTEX for CMDQ operations
> > 
> > Change since V11:
> > - Rebase on v5.17-rc6.
> > 
> > [1]: 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next*soc&id=5f9b5b757e44de47ebdc116c14b90e3cc8bc7acb__;Lw!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5DQsUzWs$
> >  
> > [2]: 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next*soc&id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24__;Lw!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5AuVaksc$
> >  
> > [3]: 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next*soc&id=15f1768365aed810826a61fef4a744437aa5b426__;Lw!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5NwN4SIb$
> >  
> > 
> > Change since v10:
> > - For some ISP application scenarios, such as preview and recording
> >    at the same time.
> >    The routing table needs to be discarded, and the calculation
> > result
> >    on the SCP side is used to write a suitable mux setting for
> >    1 input and 2 output.
> > - Adjust the GCE client register parsing method to avoid redundant
> > warning logs.
> > 
> > Change since v9:
> > - Add API for MDP getting mutex mod.
> > 
> > Hi,
> > 
> > This patch splits mmsys and mutex settings from Media Data Path 3
> > (MDP3),
> > and original mailling list list below:
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20211201095031.31606-1-moudy.ho@mediatek.com/__;!!CTRNKA9wMg0ARbw!xbP5nA78eRJ8wIp4yFgD5aE4jwxaKHyasyrDibJyg6s4V_rFBmX96_JR5Ov7mlf5$
> >  
> > Corresponding settings and interfaces are added for MDP operation
> > in the
> > mmsys and mutex drivers, which increases the independence of the
> > modules
> > 
> > Moudy Ho (6):
> >    soc: mediatek: mutex: add common interface for modules setting
> >    soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
> >    dt-bindings: soc: mediatek: move out common module from display
> > folder
> >    dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
> >    dts: arm64: mt8183: add GCE client property for Mediatek MUTEX
> 
> If fixed the commit subject to arm64: dts: mt8183...
> Whole series applied,
> 
> Thanks!
> 

Hi Matthias,

Thanks for the correction, I'll fix it as soon as possible.

Regards,
Moudy

> >    soc: mediatek: mutex: add functions that operate registers by
> > CMDQ
> > 
> >   .../mediatek/mediatek,mutex.yaml              |  14 ++-
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
> >   drivers/soc/mediatek/mtk-mutex.c              | 119
> > +++++++++++++++++-
> >   include/linux/soc/mediatek/mtk-mutex.h        |  27 ++++
> >   4 files changed, 159 insertions(+), 2 deletions(-)
> >   rename Documentation/devicetree/bindings/{display =>
> > soc}/mediatek/mediatek,mutex.yaml (81%)
> > 


