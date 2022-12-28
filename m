Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE008C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TGwloJUAR+sWvzTu+xAmrTJk0LoQNxpn5wak0pwHT4=; b=BciX4b/HgaE3th2rJ38bJU6pEP
	DjpHvzR9v1GAhuVCoHlz4SR6ch9Qpg2serL2AQfGG6ti03uDIrnLnPli1fIcgZRoGcTZkkuKDR7+A
	N8Yewi7EBKkk6r+ZNoeXjZBVBiZo4rTJ3BA1M+oDVS2c/gp5cGtEbEo8LN7NsUohDxQhAi4CTpYjZ
	QE+w3Xmu2wJr0AFGTDOxoqjusnrji/TDNFUckpktqVTMPulhrWlEr5Rz263qkULZ4sbJ5ewO3aC1T
	4sh1J4Qffn72bizzKdCvEyfzfa5fJMaMgXO2rpRy/Fbnmo9wWihoLkYaTsxAdXGTeiLGE1dz2n7cH
	PgJaxp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQne-002kOj-Bl; Wed, 28 Dec 2022 07:24:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQnX-002kHL-D2; Wed, 28 Dec 2022 07:24:25 +0000
X-UUID: eb3fc083d8e24bb5827b0f0939ef038e-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8TGwloJUAR+sWvzTu+xAmrTJk0LoQNxpn5wak0pwHT4=;
	b=LaxXbvQy8galBgQuPMrHSrwBJ/J5gKF9BqV7tc3eR4K6X57Cyzqy4Ww4nghH5daf/ilmsXg2QcBPLsUIfQOgHIYLA5t2yc5bsn+JrLYfyZfhwtBMVhDwOyvDIT49An3e7GkqoT8/gPMsqOAdTv5nvjkC0xnLzoyGL5dFZLS1yAU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fe3153a0-f800-4c71-b845-a81b4b418048,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:40189d8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eb3fc083d8e24bb5827b0f0939ef038e-20221228
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 620323840; Wed, 28 Dec 2022 00:24:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 15:24:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 15:24:14 +0800
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
Subject: Re: [PATCH v2 07/23] clk: mediatek: clk-mtk: Add dummy clock ops
Date: Wed, 28 Dec 2022 15:24:14 +0800
Message-ID: <20221228072414.26391-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_232423_690728_867D951A 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Angelo,

> In order to migrate some (few) old clock drivers to the common
> mtk_clk_simple_probe() function, add dummy clock ops to be able
> to insert a dummy clock with ID 0 at the beginning of the list.
>

...snip...
 
> +/*
> + * We need the clock IDs to start from zero but to maintain devicetree
> + * backwards compatibility we can't change bindings to start from zero.
> + * Only a few platforms are affected, so we solve issues given by the
> + * commonized MTK clocks probe function(s) by adding a dummy clock at
> + * the beginning where needed.
> + */
> +#define CLK_DUMMY		0
>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 


-- 
2.39.0



