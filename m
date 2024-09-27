Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010B2CEBF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB/yo+uUDu60iTGj0eNBNGf96u17itn7z6xuJdDMop4=; b=tGID9RV73HBlT3PsQhQzxkdjgB
	zOQwxzdALqFiqiKngp9j2VqebP4jC5i1EuwEN+Tg58xwvbtmyJH1bEw6j6YXP+uZuljtBmZQ7ub66
	sGQHuthcJuRI/T6Pu0BccJ+m59ztJHoChLjenSA0ToLx+1MGfDN4ZRhgLTSa8PTtTzieHKFbLzlQi
	oOqIzriLJBViqYvf5GgVagUg4ml6bS96D54Kjj5znDl89onWvaX2CsAiy25lAE8rmG1ZQZub4fgxC
	rt3smTYVaegGhKSo41exCf/Ojwc+JH6QEe7us2r8+7Ua2pOFgTTp4HWw1Hg0lzpURrBap57bbo51a
	Efm567fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su8KL-0000000ApdQ-2lFR;
	Fri, 27 Sep 2024 10:35:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8FY-0000000Aogu-1xI7;
	Fri, 27 Sep 2024 10:31:11 +0000
X-UUID: 947fe3987cbb11efba0aef63c0775dbf-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yB/yo+uUDu60iTGj0eNBNGf96u17itn7z6xuJdDMop4=;
	b=cphuQt3KuQC7OF0CN+0VbDZpjjTRzJmK/DHotImqGjLEmozZ6hvT21YQT3KWEUaVyxvNtfuF6vg+Wq29jEUXjtTV3LiyGvI9WpYOZRLR5UgpMWZPPMQR2920y/SbNnXBClpw5hsVbpqIqYW55CoR6fjy7enJR05sBFCqgYORxEw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:71916a82-51cb-47b2-b506-1029711e2af4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:abde5a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 947fe3987cbb11efba0aef63c0775dbf-20240927
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1291378393; Fri, 27 Sep 2024 03:30:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 03:30:53 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 18:30:53 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v2 3/6] nvmem: mtk-efuse: Enable postprocess for mt8188 GPU speed binning
Date: Fri, 27 Sep 2024 18:30:02 +0800
Message-ID: <20240927103005.17605-4-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240927103005.17605-1-pablo.sun@mediatek.com>
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_033100_532102_D9697720 
X-CRM114-Status: GOOD (  11.24  )
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

Similar to mt8186, the efuse data for mt8188's GPU speed binning
requires post-process to convert the bit field format expected
by the OPP table.

Since mt8188 efuse is not compatible to mt8186, add a new compatible
entry for mt8188 and enable postprocess.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 drivers/nvmem/mtk-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 9caf04667341..38d26e5c097a 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 static const struct of_device_id mtk_efuse_of_match[] = {
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
+	{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
 	{/* sentinel */},
 };
-- 
2.45.2


