Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD36CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLUmYVMEkr7GkCeQonlOFTdxd8xgj9pInHaBtZ4xGv8=; b=HmXEiOHjdBti3eoqmuJ3V3k6w1
	skNSh41D78gAv0YjpCi+IW9+fJh3QHbcdiJqf5b8vMLPW7P4pzMPsgcGGHeNwXWboEiqVbWAY2VL0
	x5IE2dwXF0RfGMyAFTQwqm6J+Gx86zvoKpJA9zv0FtYWTPgamlgWPXUUA+y4XICdJR0vCLdWYq2q2
	OzvSYe45XCvFtgCjM/gcCfFdaDjxRt5kxnmXjAGt6lNjj5Xze/71PAdWG2TGoRDh7KxzSTmsUpm2E
	Kx8ZRfRRdOFCRHF5BKJwJQTBvytQRZOrxTwnaTSUE8s6fsQqOBUFNMK3ZuUnipKgdn1fTgfpvQdb2
	E5Hep0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB8fM-006Kee-AK; Fri, 30 Dec 2022 06:14:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB8ey-006KUY-1P; Fri, 30 Dec 2022 06:14:30 +0000
X-UUID: 6e4721f7ee5a43959b2adefac55f3534-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bLUmYVMEkr7GkCeQonlOFTdxd8xgj9pInHaBtZ4xGv8=;
	b=LcC6plm3opigBM4d+yMaxOQzXvW+dml69aYP1+UpQIKcneNk5MZWIQLqzefZ0Udfyitqbk2h6Zvg8Trp9yWA1QTNzTuuRdW9tIzznYfTR0hv5VhkpXNDRQwPssrTVf98Y+F9cPq8jSwvKYUCiIsjCc4IzAXeQOiNXIJQhqG3Tjo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:4ce2ea9b-7ce5-446d-8c07-bca88d598645,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:28e23653-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 1,FCT|NGT
X-UUID: 6e4721f7ee5a43959b2adefac55f3534-20221229
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2145810906; Thu, 29 Dec 2022 23:14:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 14:13:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 14:13:09 +0800
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
Subject: Re: [PATCH v2 00/23] MediaTek clocks cleanups and improvements
Date: Fri, 30 Dec 2022 14:13:09 +0800
Message-ID: <20221230061309.16643-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_221428_129595_9AC7D32D 
X-CRM114-Status: GOOD (  16.71  )
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


> Changes in v2:
>  - Moved dt-bindings CLK_DUMMY to clk-mtk.h instead
> 
> 
> This series performs cleanups and improvements on MediaTek clock
> drivers, greatly reducing code duplication (hence also reducing
> kernel size).
> 
> There would be a lot to say about it, but summarizing:
> 
> * Propagates struct device where possible in order to introduce the
>   possibility of using Runtime PM on clock drivers as needed,
>   possibly enhancing reliability of some platforms (obviously, this
>   will do nothing unless power-domains are added to devicetree);
> 
> * Cleans up some duplicated clock(s) registration attempt(s): on
>   some platforms the 26M fixed factor clock is registered early,
>   but then upon platform_driver probe, an attempt to re-register
>   that clock was performed;
> 
> * Removes some early clock registration where possible, moving
>   everything to platform_driver clock probe;
> 
> * Breaks down the big MT8173 clock driver in multiple ones, as it's
>   already done with the others, cleans it up and adds possibility
>   possibility to compile non-boot-critical clock drivers (for 8173)
>   as modules;
> 
> * Extends the common mtk_clk_simple_probe() function to be able to
>   register multiple MediaTek clock types;
> 
> * Removes duplicated [...]_probe functions from multiple MediaTek SoC
>   clock drivers, migrating almost everything to the common functions
>   mtk_clk_simple_probe();
> 
> * Adds a .remove() callback, pointing to the common mtk_clk_simple_remove()
>   function to all clock drivers that were migrated to the common probe;
> 
> * Some more spare cleanups here and there.
> 
> All of this was manually tested on various Chromebooks (with different MTK
> SoCs) and no regression was detected.
> 
> Cheers!

I tested this v2 series on mt6779 and mt8192 without any problem.

thanks,
Miles

