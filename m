Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F83C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 13:57:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0776199F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 13:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A0776199F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dcNq2m4/r35ezeQq/suK+k37Pj8qEXFacfmzwvyrDEI=; b=EV/oaj3ZRydyqgjc3LQM6B7kiH
	8vbw2+k/kpZH4yTbaX/tU4H7Xckwi4r/gkNfx8Muyu+y2T1ZslZyPpG+Vw5j8uAPvLMNKy8k/oBpI
	L+tGEJuKXur6zz8z4AMwTBjZW8mmf+oE4eHaFT1d33EZNZ96nuxAbDR7Jm9oyvG+E40WJV6Ij4HqZ
	SbqPPyZKdTt6USbLPENvHx6m6VwaCmHCJCAT8C6lqMuVEl6CmyHyQkkwdsvd5qaxEygBRZL6LCNR4
	e6aEx86D+bh60fvxpI85jlo1YdPiFPqlVbcDK3/OgN4T7Jg/CDAUz55oQK1+Ka6NjJbyBU7B7kNT4
	ZFjza3Zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOhXH-00F596-Um; Tue, 23 Mar 2021 13:57:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOhWx-00F53g-SY; Tue, 23 Mar 2021 13:57:16 +0000
X-UUID: 79adf15ef1414521a5206be061faf8d2-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=td1L0UInaxFfqpThph5FJdz39s64+8dtfOjceV54mJs=; 
 b=IGm+jBSgydNqVN2i56P5UOKf1jFWCo+7xuUGoZLw9vr69eVyd4G6etSpYBoJnTzu0I8tZ+XtlGlheIIDdpKLIkan0FS2hq8QtDSw0SVKGqsFNfiYO+/uIneXxwKrAZPTSbdYWhpoNQUlB4iMysldwscAaOYBpvRwRN0Lscrd1Sw=;
X-UUID: 79adf15ef1414521a5206be061faf8d2-20210323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1549170548; Tue, 23 Mar 2021 05:57:03 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 06:57:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 21:56:58 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 21:56:58 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v13 0/7] soc: mediatek: SVS: introduce MTK SVS
Date: Tue, 23 Mar 2021 21:56:50 +0800
Message-ID: <20210323135657.2701-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A33E67F89CD86AA5EB5C20A89A9B6C49CB4E1286C37074145C82D3EADA8A33B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_135712_473294_B2D7CA52 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device(). After retrieving subsys device, SVS driver does
device_link_add() to make sure probe/suspend callback priority.
3. SVS dts refers to reset controller [4] to help reset SVS HW.

#mt8183 SVS related patches
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201013102358.22588-2-michael.kao@mediatek.com/
[3] https://patchwork.kernel.org/project/linux-mediatek/patch/20200306041345.259332-3-drinkcat@chromium.org/

#mt8192 SVS related patches
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201223074944.2061-1-michael.kao@mediatek.com/
[3] https://lore.kernel.org/patchwork/patch/1360551/
[4] https://patchwork.kernel.org/project/linux-mediatek/patch/20200817030324.5690-5-crystal.guo@mediatek.com/

changes since v12:
- Change reg_data[3][] to reg_data[SVSB_PHASE_NUM][]
- Change MT8192 SVS GPU opp count from 16 to 14 for project requirment
- Remove redundant "pd_req = false" in svs_mt8192_banks
- Assign svsp->bank_num by ARRAY_SIZE(svs_mt81xx_banks)
- Replace `,` with `;` in svs_get_svs_mt8192_platform_data()

Roger Lu (7):
  [v13,1/7]: dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v13,2/7]: arm64: dts: mt8183: add svs device information
  [v13,3/7]: soc: mediatek: SVS: introduce MTK SVS engine
  [v13,4/7]: soc: mediatek: SVS: add debug commands
  [v13,5/7]: dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v13,6/7]: arm64: dts: mt8192: add svs device information
  [v13,7/7]: soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   89 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   18 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   34 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2494 +++++++++++++++++
 6 files changed, 2646 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
