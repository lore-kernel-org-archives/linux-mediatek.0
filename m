Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15AAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTIBEWfUEwvi8Ni7b5PaoSl4qonL92kVD6YGJarC3dk=; b=BIGgeRBLd+3ZbvxvwQw++a/tXc
	FeZHoCV765ukJ7YBzh8vlwk5dg40Ep0q3JCsnKVeM4saPXKo3gOTLsIuMic1JXqI7eoEs3UqzWv0z
	NQMN3J4LOVevqvLbqGO2Yyx0ExRMK9cjJbAb5zYKS9IAWQjC++GkRIluSLvuYF1ivbFPWV5s/4dpL
	pl1hglQfFn+GY8kaMH9120IaoYUsT/j3IZwQjc92aiPs/D54z1kvirvnXioA7qp7R+DmpaNHoCE3V
	zkDw47ASGnl79EieLVzJFZtMzWs9s1XAcTlN8dnACPykIQKzaTxpqFUDVt6UeLDXH5KslwwUrclcR
	zYx910Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pARWK-0036ve-DY; Wed, 28 Dec 2022 08:10:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pARWF-0036pv-2k; Wed, 28 Dec 2022 08:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hTIBEWfUEwvi8Ni7b5PaoSl4qonL92kVD6YGJarC3dk=; b=BwSTdsHG29N5PET9dbha+gTVct
	YsWP95oYs8/nen5tIWKBN/LeVOtsUUBym87GV5w/AmcVUrLnYXrePa/PeWtdEsJlWmqVHHj6opuQl
	7kwdiTJsyxnVxyxJryj0LQ/OwSadjPHrzc5a0SeDsqip7k/oEuJwOvBurlO5Gx4Keju3dZGI9QbpS
	NJZ9yPdApTh/1cxwfxqb+c2pGqhaVMPoXTkNd1OxiCng1x4N+pCfNVighra6kw4POQalqWy0tbHgC
	OJZcrRe+vgTD1RJ7CMsLmh98s70EZoay3bFUTC+gLQk7eDf0znRGyleJVAZeLS0LX1UGn84BzC3IB
	VmU2ukWg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pARW4-00Fvek-2H;
	Wed, 28 Dec 2022 08:10:29 +0000
X-UUID: ffea90daf6df450cbd8006c0dbb49e17-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hTIBEWfUEwvi8Ni7b5PaoSl4qonL92kVD6YGJarC3dk=;
	b=miy4yJYTcHPN9rXRQALUVx1LE6cdWOyTXpC3PeeBsFzCBLKYyYwM0Ewxvfz727bu/XH8mMqFYusfBt9acAZAv98GxHlqypoKl1/3jV6N8DEchSGl9Qkoh/YGl2IZvIFLXJAFMENkgl+vkH3vUiKlH9WAy/l2HSbavh6keN2SMxM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e1714a4b-c44b-4474-98ab-b9b5643f1d49,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:2a312df4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ffea90daf6df450cbd8006c0dbb49e17-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1542112036; Wed, 28 Dec 2022 01:09:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 15:58:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 15:58:26 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <daniel@makrotopia.org>,
	<devicetree@vger.kernel.org>, <fparent@baylibre.com>, <ikjn@chromium.org>,
	<johnson.wang@mediatek.com>, <jose.exposito89@gmail.com>,
	<kernel@collabora.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <msp@baylibre.com>,
	<mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
	<ryder.lee@kernel.org>, <sam.shih@mediatek.com>, <sboyd@kernel.org>,
	<weiyi.lu@mediatek.com>, <wenst@chromium.org>, <y.oudjana@protonmail.com>,
	<yangyingliang@huawei.com>
Subject: Re: [PATCH v2 14/23] clk: mediatek: clk-mt8192: Move CLK_TOP_CSW_F26M_D2 in top_divs
Date: Wed, 28 Dec 2022 15:58:26 +0800
Message-ID: <20221228075826.27396-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-15-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-15-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_081025_606331_C616BE58 
X-CRM114-Status: GOOD (  14.54  )
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

> This driver is registered early in clk_mt8192_top_init_early() and
> then again in clk_mt8192_top_probe(): the difference between the
> two is that the early one is probed with CLK_OF_DECLARE_DRIVER and
> the latter is regularly probed as a platform_driver.
> 
> Knowing that it is not necessary for this platform to register the
> TOP_CSW_F26M_D2 clock that early, move it to top_divs and register
> it with the others during platform_driver probe for topckgen;
> 
> While at it, since the only reason why the early probe existed was
> to register that clock, remove that entirely - leaving this driver
> to use only platform_driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>

Thanks and this patch makes it easier to convert clk-mt8192 driver to a kernel module.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

