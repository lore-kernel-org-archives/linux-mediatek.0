Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF7EC46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf1g6m2wSSYkxja2mmT0kfCPsNwG64PKQczUalAJj+U=; b=LfMRtJxPuRrmCbFwtt92DRdKV1
	hhugnyIUozduCizxKLlvTBxkAfb9hjEVPObGoBN1DGI9mzfApZGa4mvHIL7/S/mQmM/9YJz912LIE
	AXpF3HSAL0+EaO5Y8VKwKC3kBO1kFHRNJCKKm/hxtWRWhue/dRDxDcToHE5Jjr7QIOt2qj5Ryuw/p
	7aNggSU4mPPTop7Z1WEmerijgHnAiW/QCWs/aQOYrDwwx18GrFv8V/lB4K7aVlQD++GIG/qboeRtG
	lEYuwIpPHv0B9tQUmubqirdcFx6lAzVPAlQLu4gXYTyOBaXS009NM/NyAgUudrLQgumau82p8z3f0
	pmtd6AZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pARqC-003GQu-Ba; Wed, 28 Dec 2022 08:31:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pARq4-003GKa-KB; Wed, 28 Dec 2022 08:31:10 +0000
X-UUID: 199ed6c7019248dda5286abce54a7101-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xf1g6m2wSSYkxja2mmT0kfCPsNwG64PKQczUalAJj+U=;
	b=BMWnw7puXNbVtysTKSzugPZF8FIWAhuA43jjk8Xruvl+uKqo3mCXBhkQvff/0BXNQW/8nlboLtpbJtH8kqNumYMTLVy5Soy+preeGArG6YjHOJ2tmRTn0O4b9U2Ult71Dzo0lleugOxA+PYfp/NuDooXikWUivxeAKeee4wcTnw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:267cfbce-03c7-4478-963d-0e274816c82c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:95db2df4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 199ed6c7019248dda5286abce54a7101-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 176828933; Wed, 28 Dec 2022 01:30:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 15:50:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 15:50:17 +0800
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
Subject: Re: [PATCH v2 11/23] clk: mediatek: Switch to mtk_clk_simple_probe() where possible
Date: Wed, 28 Dec 2022 15:50:16 +0800
Message-ID: <20221228075016.12309-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-12-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_003104_981913_55A0FCD6 
X-CRM114-Status: GOOD (  12.24  )
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

> mtk_clk_simple_probe() is a function that registers mtk gate clocks
> and, if reset data is present, a reset controller and across all of
> the MTK clock drivers, such a function is duplicated many times:
> switch to the common mtk_clk_simple_probe() function for all of the
> clock drivers that are registering as platform drivers.
> 

...snip...

> +
> +static const struct of_device_id of_match_clk_mt8183_simple[] = {
> +	{ .compatible = "mediatek,mt8183-infracfg", .data = &infra_desc },
> +	{ .compatible = "mediatek,mt8183-pericfg", .data = &peri_desc, },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_mt8183_simple_drv = {
> +	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
> +	.driver = {
> +		.name = "clk-mt8183-simple",
> +		.of_match_table = of_match_clk_mt8183_simple,
> +	},
>

cool, replace clk_mt8183_infra_probe and clk_mt8183_peri_probe with
mtk_clk_simple_probe

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

