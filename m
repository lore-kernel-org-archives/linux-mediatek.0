Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F114AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4AC42078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHQibobl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JnBBbjpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4AC42078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8ueqfY3fgrCN4H6vLBXvt+8rjLUrhGWaqk337DPCkY=; b=aHQiboblaxDGo9
	dMIRd+7awHzfz2OuVBCuxTaQs5WMtiyGgT7S3aIsHDUd1aQlfIEYwJRUT3YIhpdjtQhK9xvqjCAId
	hscyr1EJngGeBycEHcq1mchNPJfXad16KJOvH0MdpVDazdFdjQ6bIUlu9IqLBmj+YiKv0fmacnyec
	TxOKUo+zV+eWybLhPBZllmjfUQANgFXaQKOTV/alnMPLRMiHA/fcYCyplW4pntw3euxKZhmgg6Gfc
	wxEirdgPLs0upsKtegBMrH2AdMFDhQlAVBEMSZiMpm2TsZOLhla3kGAVmE7ic4PoLu8K8g935F3sl
	9zqOvqxzmEcwAXU5Moog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlsXb-0005iS-1E; Thu, 18 Jun 2020 11:17:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlsXR-0005az-6h; Thu, 18 Jun 2020 11:16:59 +0000
X-UUID: 556d89a659da4634b0f0c027bcdca412-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Rw+XJf9G3LmNKirn/C94v5PKCGl3yGm8pZ+FUDGL5Qk=; 
 b=JnBBbjpEVatR6pLaF0QmRVXLPk/Tl8nOMfTNA9yHHW4rez2Om5Rb5fxwkoH7OPm6TWslWbxBw9HJlpKWvTF1/9sR8a22NkSkWt2zUzhrOP0XGx4TJ9xjpt/bHacnWhhrTR4sVe32RaQBjfxn8ZHHzRi/fqANXsY51Jqf93VTMq4=;
X-UUID: 556d89a659da4634b0f0c027bcdca412-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1002334691; Thu, 18 Jun 2020 03:16:31 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 04:06:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:06:32 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 19:06:32 +0800
Message-ID: <1592478394.6408.9.camel@mtkswgap22>
Subject: Re: [PATCH v8 0/4] Add basic SoC support for mt6765
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Date: Thu, 18 Jun 2020 19:06:34 +0800
In-Reply-To: <1582279929-11535-1-git-send-email-macpaul.lin@mediatek.com>
References: <1582279929-11535-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_041657_254220_A014BABA 
X-CRM114-Status: GOOD (  18.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Loda Chou <loda.chou@mediatek.com>, Fabien
 Parent <fparent@baylibre.com>, Mars Cheng <mars.cheng@mediatek.com>, Will
 Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Ryder Lee <Ryder.Lee@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, Evan
 Green <evgreen@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Sean Wang <Sean.Wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, CC Hwang <cc.hwang@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-02-21 at 18:12 +0800, Macpaul Lin wrote:
> This patch adds basic SoC support for Mediatek's new 8-core SoC,
> MT6765, which is mainly for smartphone application.
> 
> Changes in V8:
> 1. Origin V7 patchset:
>    https://patchwork.kernel.org/cover/11370105/
>    Split origin V7 patchset into 2 patchset,
>    keep remain patches #2, #5, #6, and #7 in the same order as this
>    V8 patchset.
>    [v7,2/7] dt-bindings: mediatek: Add smi dts binding for Mediatek
>             MT6765 SoC
>    [v7,5/7] soc: mediatek: add MT6765 scpsys and subdomain support
>    [v7,6/7] arm64: dts: mediatek: add mt6765 support
>    [v7,7/7] arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks
> 
> Changes in V7:
> 1. Adapt V6's patchset to latest kernel tree 5.5-rc1.
>    Origin V6 patchset:
>    https://patchwork.kernel.org/cover/11041963/
> 2. Correct 2 clock-controller type in documentation:
>    mipi0 and venc_gcon.
>    [v7 1/7] dt-bindings: clock: mediatek: document clk bindings
> 3. Remove V6's patch 03 because it has been taken into 5.5-next-soc
>    [v6, 03/08] dt-bindings: mediatek: add MT6765 power dt-bindings
> 3. Update Reviewed-by: Rob Herring <robh@kernel.org> for
>    [v6, 04/08] clk: mediatek: add mt6765 clock IDs
>    --> [v7, 03/07] clk: mediatek: add mt6765 clock IDs
> 4. Update SPDX tag for
>    [v6, 05/08] clk: mediatek: Add MT6765 clock support
>    --> [v7, 04/07] clk: mediatek: Add MT6765 clock support
> 
> Changes in V6:
> 1. Adapt V5's patchset to latest kernel tree.
>    Origin V5 patchset.
>    https://lore.kernel.org/patchwork/cover/963612/
> 2. Due to clk's common code has been submit by other platform,
>    this patch set will have dependencies with the following patchsets
>    as the following orders.
>    2.a. [v8,00/21] MT8183 IOMMU SUPPORT
>         https://patchwork.kernel.org/cover/11023585/
>    2.b. [v11,0/6] Add basic node support for Mediatek MT8183 SoC
>         https://patchwork.kernel.org/cover/10962385/
>    2.c. [v6,00/14] Mediatek MT8183 scpsys support
>         https://patchwork.kernel.org/cover/11005751/
> 3. Correct power related patches into dt-binding patches.
> 4. Re-order V5's 4/11, 6/11, and 7/11 due clk common code change
>    and make dependencies in order.
> 5. Update some commit message in clk related patches.
> 
> Changes in V5:
> 1. add clk support
> 
> Changes in V4:
> 1. add gic's settings in reg properties
> 2. remove some patches about dt-bindings since GKH already took them
> 
> Changes in V3:
> 1. split dt-binding document patchs
> 2. fix mt6765.dtsi warnings with W=12
> 3. remove uncessary PPI affinity for timer
> 4. add gicc base for gic dt node
> 
> Changes in V2:
> 1. fix clk properties in uart dts node
> 2. fix typo in submit title
> 3. add simple-bus in mt6765.dtsi
> 4. use correct SPDX license format
> 
> Mars Cheng (3):
>   dt-bindings: mediatek: Add smi dts binding for Mediatek MT6765 SoC
>   soc: mediatek: add MT6765 scpsys and subdomain support
>   arm64: dts: mediatek: add mt6765 support
> 
> Owen Chen (1):
>   arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks
> 
>  .../memory-controllers/mediatek,smi-common.txt     |    1 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt6765-evb.dts        |   33 +++
>  arch/arm64/boot/dts/mediatek/mt6765.dtsi           |  253 ++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |    6 +
>  drivers/soc/mediatek/mtk-scpsys.c                  |  130 ++++++++++
>  6 files changed, 424 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6765-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6765.dtsi
> 

Dear Matthias and Rob,

Just a remind of these patches related to MT6765.
Thanks for Stephen's help, the other clock related patches of MT6765 has
been already merged into 5.8-rc1. I've tested these v8 patches of MT6765
on 5.8-rc1 and seems they were able to be applied. Could you kindly help
to check if these patches were qualified to be merged into your tree?

Thanks a lot!

Best regards,
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
