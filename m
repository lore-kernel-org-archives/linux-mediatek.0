Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17873C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DshSKXiXcq26A7KQ+aa3UgT2BGCnX15r04XpZzcKrtQ=; b=sHLI3KL1IzpWA2D75aEws0zdmq
	yEXat0dJpfmn98WaL+OTwQY3kaBoD14z87/JfUiZ4q3ifMrM19vjUXShxrbI5mEcrnqhyD7yCz/Pj
	MV6YWUGd7JdP+GyDG3QZh94yT4t2QtrVrNMkpWgqC03ZWGCca/MP+z1teLplZnMQjh6/RlADEh4m+
	zeW5xc3uq5o6WsNhL1Q5KPIKGfz1ZnCKpdLGo0A3WMcSNVqaxyeYx3riRSe1o1gDzeHPW8xEVte2n
	lHQZUFcdaKbQH1trc0Ecy79qtnUfMwY1D1ctDIBxrsFzNMskKvBQmEC+kSuKyb9f5pGmCwq5pR8PF
	3OaibRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgX1-00AhQx-L1; Wed, 22 Feb 2023 04:15:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgWz-00AhPo-1n; Wed, 22 Feb 2023 04:15:02 +0000
X-UUID: 766a03b8b26711eda08d4d6090ec5a5c-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DshSKXiXcq26A7KQ+aa3UgT2BGCnX15r04XpZzcKrtQ=;
	b=eHOZ7f+bJQtDlQwD/XEhMpu5uL6s4p7ixCLbyck8u0HCskwB+02JLh9dH8ZIfkCqRLEVzbrBSH+DqebPqhSK2o4gxz5WTUAk1ClH5+YlUAEtMIWv+aw6xvWMY+W51l8fZ9NRWRhNEwV+dPJ5s9Qjqtwt2STICJ48NM95lQFHIOM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:2313e770-353e-402b-b386-1e8f1d2ffaa1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:2362bff3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT
X-UUID: 766a03b8b26711eda08d4d6090ec5a5c-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 64580348; Tue, 21 Feb 2023 21:14:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Feb 2023 12:14:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 12:14:22 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chen.zhong@mediatek.com>, <chun-jie.chen@mediatek.com>,
	<daniel@makrotopia.org>, <edward-jw.yang@mediatek.com>,
	<fparent@baylibre.com>, <granquet@baylibre.com>, <johnson.wang@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <msp@baylibre.com>,
	<mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>,
	<sam.shih@mediatek.com>, <sboyd@kernel.org>, <sean.wang@mediatek.com>,
	<wenst@chromium.org>, <yangyingliang@huawei.com>, <zhaojh329@gmail.com>
Subject: Re: [PATCH v4 49/54] clk: mediatek: Add MODULE_DEVICE_TABLE() where appropriate
Date: Wed, 22 Feb 2023 12:14:22 +0800
Message-ID: <20230222041422.4429-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230221115549.360132-50-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-50-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_201501_133601_34CC5A52 
X-CRM114-Status: GOOD (  11.30  )
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

Hi,

> static struct platform_driver clk_mt8195_venc_drv = {
> 	.probe = mtk_clk_simple_probe,
>diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
>index 84805a114387..3d1ad92b663e 100644
>--- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
>+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
>@@ -95,6 +95,7 @@ static const struct platform_device_id clk_mt8195_vpp0_id_table[] = {
> 	{ .name = "clk-mt8195-vpp0", .driver_data = (kernel_ulong_t)&vpp0_desc },
> 	{ /* sentinel */ }
> };
>+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8195_vpp0);
> 
> static struct platform_driver clk_mt8195_vpp0_drv = {
> 	.probe = mtk_clk_pdev_probe,
>diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
>index 3e91dfed2996..b463f8e197c6 100644
>--- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
>+++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
>@@ -93,6 +93,7 @@ static const struct platform_device_id clk_mt8195_vpp1_id_table[] = {
> 	{ .name = "clk-mt8195-vpp1", .driver_data = (kernel_ulong_t)&vpp1_desc },
> 	{ /* sentinel */ }
> };
>+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8195_vpp1);

I got the following build break with ARCH=arm64 allmodconfig:
Do I miss something?

linux-next/drivers/clk/mediatek/clk-mt8195-vpp0.c:98:31: error: 'of_match_clk_mt8195_vpp0' undeclared here (not in a function)
linux-next/drivers/clk/mediatek/clk-mt8195-vpp1.c:96:31: error: 'of_match_clk_mt8195_vpp1' undeclared here (not in a function)

ARCH=arm64 allyesconfig, defconfig: passed

thanks,
Miles

