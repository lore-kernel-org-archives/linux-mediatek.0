Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C1CCF9FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Nov 2025 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRIS9Quy51a3mNw2C7dYSGFB2RcLs93hOIiFJCI5w1w=; b=rWAzDg129hoZm57zN6OioczqPD
	v5MHk8MLFQdmDH8tZBP3IyhKZ/gLmfq3gLpf81PVLv7JT8mNDqOqvjuLsexTJKZaR9nmAIVw+iPaH
	roLm7qbwc4FRcYDAenMwIh+uU5H1OW6OcBcg9sXQC5Q7C0RFxV3euweO+n67XLGlWQ3hnhr5hruVI
	kTKpL6Gfwd9jJ2r+R6BUWmWRnf3KGG2ryF4eh3hCWkDtkXTuHXeZKllec6W1dBAVdG2s+mo/BMvCC
	gjbO5kYULr0gV5gtPwnX6rZp6kjDLiO5UFUTF6U8/XGng18Km6YpuMqKedKSvBDQ5rEAEewyaqviF
	5QklPxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFv19-00000009xof-3sPv;
	Mon, 03 Nov 2025 13:54:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFv17-00000009xoE-2JrU;
	Mon, 03 Nov 2025 13:54:43 +0000
X-UUID: fd007b12b8ba11f0a52f393f94899d25-20251103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yRIS9Quy51a3mNw2C7dYSGFB2RcLs93hOIiFJCI5w1w=;
	b=u/3tIrrrfRovPzAGVtxQ20mxQ+KVWiAShCbEt6DZCLiumDCW406iTSOVJ8Dm3S8h8BgjCM97elpOgeYNJ2AKzFEeGupKQg3gsGwniVrab+MKBVb/mTLHjAdUCyCTgcDnclBGUNIVLKCCJPqc20Xt2FShP+LMEHB+zGdJm4OXb+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9520e8b7-509e-42d9-9b46-5b97a059e60c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:b23b8f26-cfd6-4a1d-a1a8-72ac3fdb69c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd007b12b8ba11f0a52f393f94899d25-20251103
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 709616032; Mon, 03 Nov 2025 06:42:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 3 Nov 2025 21:42:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 3 Nov 2025 21:42:48 +0800
From: niklaus.liu <Niklaus.Liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<zhigang.qin@mediatek.com>, <sen.chu@mediatek.com>, Niklaus Liu
	<niklaus.liu@mediatek.com>
Subject: [PATCH 1/1] soc: mediatek regulator: Add Support for mt8189
Date: Mon, 3 Nov 2025 21:42:26 +0800
Message-ID: <20251103134241.3773-2-Niklaus.Liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251103134241.3773-1-Niklaus.Liu@mediatek.com>
References: <20251103134241.3773-1-Niklaus.Liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_055441_594072_3DD8D295 
X-CRM114-Status: GOOD (  14.50  )
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

From: Niklaus Liu <niklaus.liu@mediatek.com>

Enhance the regulator coupler driver to support GPU power control on the
MediaTek MT8189 platform. This update ensures proper coordination of
multiple regulators required for GPU operation,improving power management
and system stability.

Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
---
 drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..f6e3b2a3a5a8 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -42,6 +42,18 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
 	int max_uV = INT_MAX;
 	int ret;
 
+	/*
+	 * When vsram_gpu is enabled or disabled and the use_count of the
+	 * vsram_gpu regulator is zero, the regulator coupler driver will
+	 * execute regulator_do_balance_voltage, which adjusts the vsram_gpu
+	 * voltage to the minimum value. This may result in vsram_gpu being
+	 * lower than vgpu. Therefore, when enabling or disabling vsram_gpu,
+	 * the 8189 temporarily skips the regulator coupler driver's modification
+	 * of the vsram_gpu voltage.
+	 */
+	if (of_machine_is_compatible("mediatek,mt8189") && rdev == mrc->vsram_rdev)
+		return 0;
+
 	/*
 	 * If the target device is on, setting the SRAM voltage directly
 	 * is not supported as it scales through its coupled supply voltage.
@@ -148,7 +160,8 @@ static int mediatek_regulator_coupler_init(void)
 	if (!of_machine_is_compatible("mediatek,mt8183") &&
 	    !of_machine_is_compatible("mediatek,mt8186") &&
 	    !of_machine_is_compatible("mediatek,mt8188") &&
-	    !of_machine_is_compatible("mediatek,mt8192"))
+	    !of_machine_is_compatible("mediatek,mt8192") &&
+	    !of_machine_is_compatible("mediatek,mt8189"))
 		return 0;
 
 	return regulator_coupler_register(&mediatek_coupler.coupler);
-- 
2.46.0


