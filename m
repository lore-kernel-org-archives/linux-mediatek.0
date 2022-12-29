Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HORV9bMIP2LGFNhuhm7UuJjpXIYYSO+nEqUSjtucA64=; b=GQEp9OTBvIh12/Jr7kKtHoS5En
	4qR3odpnDfNmxWFOJbEEOrgRZgXS8Pka7brELu8j8pAp/ZvKtmd8xCpRnUnnteh4iXvVRYS087JOF
	uNQiKw5ELBjYx2sPbaYszh4FawTS5ji5eynAKmx3wtr3eTCSwnyJUdu9usd+NdxMsUy6vXn6E97nj
	M7buFLRzfGnYtQVzdcWUekxlel2z4kicBfnqAxTK1fE58B/0ekmWJ0iiWqDMyQvk11lpn4x0GwLe8
	umw62e3Ii4K1xE7FzwRCIzYr7At9xHeanv7dLJjcsEiKtao7pJrQK0A719Xc7DtLs99kuStSi75rc
	GOU321JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAoBA-00DfxM-VM; Thu, 29 Dec 2022 08:22:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAoAz-00DfsY-5N; Thu, 29 Dec 2022 08:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HORV9bMIP2LGFNhuhm7UuJjpXIYYSO+nEqUSjtucA64=; b=GcQ7DB2f2ARU0cWkWAsa+1anm+
	jhcSC3FNX7BLREjbXMtBX/bNhGhnLRvQypsLEQ91perQEC/5CdtUHlik9+tn0vRQKB70oz1v8Duds
	ARaYvUPjtekxihNRIPmfghCT4jVK36Qelbx5Ifiws4Ag+fybIOJSk4n+c/WPHSXunIQ5k7S6CdBTl
	YN+bfldwCi9jzWa3Rhrb5lNmW5tE9wDTjtrNRkKWa2HVEeYHPcfAJNM6jjcqc+CmZgMD4yB/bRsXF
	vhc8H/x//2R6yR0wNOaDZho9JGFBqCpRJbv5tLCRKGQs/q7nnYD0iYKvNyaU/oxjVlj/Cc5hgBT97
	eh3SH8aw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAoAq-00GL43-2n;
	Thu, 29 Dec 2022 08:22:04 +0000
X-UUID: cb3ae1033dad445a81f21e44eef1d8b6-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HORV9bMIP2LGFNhuhm7UuJjpXIYYSO+nEqUSjtucA64=;
	b=ZqQORkXKc0FXCVkrXWlcGmciE2mqA3pl3o8oVeVjFL79KQvZtLwheEdRXYCvqB019ANXgSU+d+iNNrzEVvG9dB/JK16L1Qi5KzDJCdGTxd8mhI3+kzHke7OX6a5Qg0Rx2c2t/i7G7ZshW/fJIGPQhDdwJFBvB5lXEyh8mloPOo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:4130a297-36a4-4fa0-bc41-47e032e9beaf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:4df6b98a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cb3ae1033dad445a81f21e44eef1d8b6-20221229
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1865370965; Thu, 29 Dec 2022 01:21:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Dec 2022 16:21:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 16:21:03 +0800
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
Subject: Re: [PATCH v2 18/23] clk: mediatek: clk-mtk: Register MFG notifier in mtk_clk_simple_probe()
Date: Thu, 29 Dec 2022 16:21:03 +0800
Message-ID: <20221229082103.21064-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-19-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-19-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082201_609371_F0E4B300 
X-CRM114-Status: UNSURE (   9.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>In preparation for commonizing topckgen probe on various MediaTek SoCs
>clock drivers, add the ability to register the MFG MUX notifier in
>mtk_clk_simple_probe() by passing a custom notifier register function
>pointer, as this function will be slightly different across different
>SoCs.
>
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> drivers/clk/mediatek/clk-mtk.c | 8 ++++++++
> drivers/clk/mediatek/clk-mtk.h | 3 +++
> 2 files changed, 11 insertions(+)
>
>diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>index b0a6225cd7b2..df6281492fb6 100644
>--- a/drivers/clk/mediatek/clk-mtk.c
>+++ b/drivers/clk/mediatek/clk-mtk.c
>@@ -533,6 +533,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
> 			goto unregister_composites;
> 	}
> 
>+	if (mcd->clk_notifier_func) {
>+		struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
>+
>+		r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
>+		if (r)
>+			goto unregister_clks;
>+	}

Should we have a IS_ERR_OR_NULL() check for clk_data->hws[mcd->mfg_clk_idx]?

thanks,
Miles
>+
> 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> 	if (r)

