Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F152EC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmwG34WOnnehmf+JqdIsNLaLLdUUliz/XW6HtiMKxJo=; b=hyvR9tWlyVbNn7x/yG/LXFolRJ
	pXxOSbyVeaKuYT4H3/F+k7NQ/aVgaex4RkCnEKlpO9SiaPzhjnZ3o4EqpdkKvXgbOX0MEDw/DTKxj
	XZIjwp4iMdWTnnzZxY5ojoDnRWmgkSiUpT/0aym6+wruIRlHMCqc3viyUVpV0w68BpsVH86U6NdUc
	4f5Zi9NQcOZT9mvYXii6IWo9FiHmNFvQxE1a+oc1r56REIl2TY+2juZyXSZLqyR600Q6+yUjGanDv
	6byRa+3OoboaZk1BEI81T4xwgdi6ifTlJ1J1apHFoERCNxRVJIRjtFD6Ojc1m23DHUGhXZbjL43Ub
	tZCB+k4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAD3U-00Ea6G-1N; Tue, 27 Dec 2022 16:43:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAD3I-00Ea18-2R; Tue, 27 Dec 2022 16:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GmwG34WOnnehmf+JqdIsNLaLLdUUliz/XW6HtiMKxJo=; b=C/AqQopv9J58Wh6DIpq00WKSuN
	I5MP8IDpmCQXh/9mO4FSjLOLKxoVSRGZZvevVfns3eYKByU+UfWuNd190bvfHzRafvR48yDYxgfqN
	XHAw7HCcg7VUk/M4m+vfDZVBZvgCVNksU6Rql1f0dgq43EQtzUC8mNpllHexx3cDKr0ca1jrVRjFj
	Ee2xdACDI4Ch6EmytBGTpw45HFd0rKV0kKAeALpnLsqMjUpEOkcCE1TV+GCkORdNWcC51OpqI/FVw
	KSZm6p5tALFN41rzD7wClpgt9MPg/ZwaUatwvffgKHejkqaoA7PJDSM3wncDvtCfQ/jvvFJPOT+EJ
	Fc2G6anQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAD39-00FiAU-04;
	Tue, 27 Dec 2022 16:43:39 +0000
X-UUID: 4759ff6a34034ba4adf5b5921e72be80-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GmwG34WOnnehmf+JqdIsNLaLLdUUliz/XW6HtiMKxJo=;
	b=OkuHOdOwRd3J6Tc+OmcttU1C+Raq0QJK5xNi/GUl442HEuIVlERN8yQ5QoSWXTjfLyJWw05vWMCp7imD8/+qHSxnQ+kb9KCYMR4kil89V9yMUCxnsFy9nP6a4vRpLSaJR02tqVcK94dE014tdArWNU1COMqi/wh77AdCz2+tJ0o=;
X-CID-CACHE: Type:Local,Time:202212270918-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c20c72ef-8f88-4973-a558-b2ded6d76e04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:df778c8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4759ff6a34034ba4adf5b5921e72be80-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 708317128; Tue, 27 Dec 2022 09:43:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 28 Dec 2022 00:22:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 00:22:54 +0800
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
Subject: Re: [PATCH v2 12/23] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
Date: Wed, 28 Dec 2022 00:22:54 +0800
Message-ID: <20221227162254.18359-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-13-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_164336_200629_376DCD53 
X-CRM114-Status: UNSURE (   9.69  )
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

> As a preparation to increase probe functions commonization across
> various MediaTek SoC clock controller drivers, extend function
> mtk_clk_simple_probe() to be able to register not only gates, but
> also fixed clocks, factors, muxes and composites.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for doing this! I read the patch 23 first and I thought the
mtk_clk_simple_probe() cannot be used like that. So I got the whole series
and found this patch to extend mtk_clk_simple_probe. Cool.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

