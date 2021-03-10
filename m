Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA77BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:48:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6869F64FE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6869F64FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AOvaMwjS01Lg14U+LQYSFoWoMCcKaq3ooJ0T5TReyrg=; b=bHReYWFdHVgegA2r+CdkZO3PF
	YjNZ3n+oOF4a7SRVUqMlaweEOFGBVZ3zxUtghM6fvfr47YgGoCaGxaFuXZ7wbCyxXXCIu/Hu4jaXv
	kUUxEe5XplusFCoWxZgyBhcva5FWWPL3oVDzKxpj4VzzH8ylu1GIJDY1/3PSXf92zWrrIve/gvZnh
	CtyMIdh171aRjm8bpCw79jDZnCq2nGCPTar6mPYboUQR5URg4Ge27hSJvu2H+HWuiLcYnhyw00umY
	cJKjsdvKaroXa99PfIv4vCNKW1bqVs2pDfsyYhvHkBMg74tyHCXlpFoQ17FFrXQGVjOuDr54MbJK+
	n7QogaHCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJsda-0069aq-05; Wed, 10 Mar 2021 06:48:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJscn-0069VP-BZ; Wed, 10 Mar 2021 06:47:27 +0000
X-UUID: 8f34da92366444c4b40a1e77866ec012-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9z0q3W8h4HtnBrcH7kLLN3Z5S/u7w6GS8l4uijg9/fw=; 
 b=XeNmg6ZPiLZBMnTovh1JDTdOs4dXUYr87pj/2r4pfsIh8h09GyKb6lAJVsB0pnYudCH57XgqoWP3faUY1C17uwU8fQ1jtynBLYpbYOmNKcaOvWygg4l0tYc2ievq5o7005pT8fcxfcCsg5pcoe/K/w2YFvbFKxJydIyRdhXx9wQ=;
X-UUID: 8f34da92366444c4b40a1e77866ec012-20210309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1404695187; Tue, 09 Mar 2021 22:47:11 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 22:37:09 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 14:37:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 14:37:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wendell Lin
 <Wendell.Lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Macpaul Lin <Macpaul.Lin@mediatek.com>, Owen Chen
 <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 <Yong.Wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Ryder Lee
 <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, CC Hwang
 <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v10 0/4] Add basic SoC support for mt6765
Date: Wed, 10 Mar 2021 14:36:54 +0800
Message-ID: <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 434342E2F5CF57348F9BEE9B788608533B4CB2C5C4A939C944A86D8F12F56F4D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_064723_408931_E6E0FDDA 
X-CRM114-Status: GOOD (  18.98  )
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

This patch adds basic SoC support for Mediatek's new 8-core SoC,
MT6765, which is mainly for smartphone application.

Changes in V10:
   [v10,1/4] dt-bindings: mediatek: Add smi dts binding for Mediatek
            MT6765 SoC
     - No Change.
   [v10,2/4] soc: mediatek: add MT6765 scpsys and subdomain support
     - No Change.
   [v10,3/4] arm64: dts: mediatek: add mt6765 support
     - Remove interrupt in mmsys node.
     - Replace smi_common@14002000 to smi@14002000
   [v10,4/4] arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks
     - No Change.

Changes in V9:
1. Origin V8 patchset:
   https://patchwork.kernel.org/cover/11396015/
   [v9,1/4] dt-bindings: mediatek: Add smi dts binding for Mediatek
            MT6765 SoC
     - No Change.
   [v9,2/4] soc: mediatek: add MT6765 scpsys and subdomain support
     - Fix build error based on 5.11-rc1 because
       - bp_table has been deprecated.
       - basic_clk_id has been renamed to clk_id.
       - correct the number order in marco GENMASK().
   Note: mediatek is working on porting mt6765's scpsys to driver
         "mtk-pm-domains", however we think supporting for "mtk-scpsys" is
         required before new glue is available.
   [v9,3/4] arm64: dts: mediatek: add mt6765 support
     - No Change.
   [v9,4/4] arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks
     - No Change.

Changes in V8:
1. Origin V7 patchset:
   https://patchwork.kernel.org/cover/11370105/
   Split origin V7 patchset into 2 patchset,
   keep remain patches #2, #5, #6, and #7 in the same order as this
   V8 patchset.
   [v7,2/7] dt-bindings: mediatek: Add smi dts binding for Mediatek
            MT6765 SoC
   [v7,5/7] soc: mediatek: add MT6765 scpsys and subdomain support
   [v7,6/7] arm64: dts: mediatek: add mt6765 support
   [v7,7/7] arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks

Changes in V7:
1. Adapt V6's patchset to latest kernel tree 5.5-rc1.
   Origin V6 patchset:
   https://patchwork.kernel.org/cover/11041963/
2. Correct 2 clock-controller type in documentation:
   mipi0 and venc_gcon.
   [v7 1/7] dt-bindings: clock: mediatek: document clk bindings
3. Remove V6's patch 03 because it has been taken into 5.5-next-soc
   [v6, 03/08] dt-bindings: mediatek: add MT6765 power dt-bindings
3. Update Reviewed-by: Rob Herring <robh@kernel.org> for
   [v6, 04/08] clk: mediatek: add mt6765 clock IDs
   --> [v7, 03/07] clk: mediatek: add mt6765 clock IDs
4. Update SPDX tag for
   [v6, 05/08] clk: mediatek: Add MT6765 clock support
   --> [v7, 04/07] clk: mediatek: Add MT6765 clock support

Changes in V6:
1. Adapt V5's patchset to latest kernel tree.
   Origin V5 patchset.
   https://lore.kernel.org/patchwork/cover/963612/
2. Due to clk's common code has been submit by other platform,
   this patch set will have dependencies with the following patchsets
   as the following orders.
   2.a. [v8,00/21] MT8183 IOMMU SUPPORT
        https://patchwork.kernel.org/cover/11023585/
   2.b. [v11,0/6] Add basic node support for Mediatek MT8183 SoC
        https://patchwork.kernel.org/cover/10962385/
   2.c. [v6,00/14] Mediatek MT8183 scpsys support
        https://patchwork.kernel.org/cover/11005751/
3. Correct power related patches into dt-binding patches.
4. Re-order V5's 4/11, 6/11, and 7/11 due clk common code change
   and make dependencies in order.
5. Update some commit message in clk related patches.

Changes in V5:
1. add clk support

Changes in V4:
1. add gic's settings in reg properties
2. remove some patches about dt-bindings since GKH already took them

Changes in V3:
1. split dt-binding document patchs
2. fix mt6765.dtsi warnings with W=12
3. remove uncessary PPI affinity for timer
4. add gicc base for gic dt node

Changes in V2:
1. fix clk properties in uart dts node
2. fix typo in submit title
3. add simple-bus in mt6765.dtsi
4. use correct SPDX license format

Mars Cheng (3):
  dt-bindings: mediatek: Add smi dts binding for Mediatek MT6765 SoC
  soc: mediatek: add MT6765 scpsys and subdomain support
  arm64: dts: mediatek: add mt6765 support

Owen Chen (1):
  arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks

 .../mediatek,smi-common.yaml                  |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt6765-evb.dts   |  33 +++
 arch/arm64/boot/dts/mediatek/mt6765.dtsi      | 252 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   6 +
 drivers/soc/mediatek/mtk-scpsys.c             |  91 +++++++
 6 files changed, 384 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6765-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6765.dtsi

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
