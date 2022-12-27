Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B826C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rc16xLH1zQLY+rSM1/R8kL/wuk19rpEQf134yxXLu2M=; b=Mk67ZyK58WH7GIXScP8xLFBATj
	mCcoSWx0gL7o7kPcou0c9eKlA190sgMsvlfkiFxNRefiXNRAaSjrmTVkhMm2AbUJoG3xwYnON0D5A
	I4iDHIHe7okgVJEfMNPS2eSEqwkAi9r8zOGPTlezLXFT7G+Y9MF2eE7meg3QhIgz0sV+cuvIG+dz8
	IgdbLzMm9fLA+dGQZfPvFGWm9ocH6/gPQfL1wawSF5VPGJipgRFsqKdiSOMPK1Udp34VhowmJEjsy
	0Gt/k93wgHX9bu73nEjK18tkPd0ZYwpc2bNOIOo11XRYrlQENePMiQ9tkeydXrQAMTFVu9oVJWC8p
	bPngaugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA50I-00BCPO-56; Tue, 27 Dec 2022 08:08:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA4yw-00BBpM-0F; Tue, 27 Dec 2022 08:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rc16xLH1zQLY+rSM1/R8kL/wuk19rpEQf134yxXLu2M=; b=COcLOL8EjS8IUc67aR2xa9Uz/w
	7CkxPkZ3BgaUBoVjcvvRnIeTukDGudeJDLdm+HXjN+hGvVm5gQkOIg2hN33lxY4/2VK/FGCFF6biD
	QaEixI1yBq5HTh9Rt7DoqkgRJPlij8ydgdvwoM5ElnwAcWsUADP1qeKUbc6S0K2bpLAMWxOaSEvMU
	SyArb0JjQiYK1/uosWPxScThEirMmDCb8ogB/LZ1/tN9rbtHspsz/6GrpFnXMV3ggVc2MBt9GSiav
	H6Q9f2L+rIzI3Rqo+7ha2/3xKsYXEJBvuNC6Plo9ci3azNq3DW7TF+8yHNdP2tytVby1FQ/ipIvPb
	25YHq8nQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pA4yn-00FaHe-2I;
	Tue, 27 Dec 2022 08:06:37 +0000
X-UUID: 68784b1a9ed840fa854bf19022a80ee5-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rc16xLH1zQLY+rSM1/R8kL/wuk19rpEQf134yxXLu2M=;
	b=QuXlaXSQxrbVzoVSYTea2XiGy7AuAb4GFrwd6whkE0/HST9969KZWny9qyzQHpnILvUDxpNq0JlkanEWS8OVORd49vXbiRM5D4Q1OfxM0qikmjY6OMKnnfHuFnqLP3flSVNxNSuHSsC6VNAqAUqwX7oTVYYQCzmwUsOjMtc+MDc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:77486a21-2187-43d4-99b7-bd26d5576f34,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:3aba838a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 68784b1a9ed840fa854bf19022a80ee5-20221227
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 302586561; Tue, 27 Dec 2022 01:06:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 16:04:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 16:04:46 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>, <wim@linux-watchdog.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<clang-built-linux@googlegroups.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<singo.chang@mediatek.com>, Nancy.Lin <nancy.lin@mediatek.com>
Subject: [PATCH v29 09/11] soc: mediatek: mmsys: add reset control for MT8195 vdosys1
Date: Tue, 27 Dec 2022 16:04:41 +0800
Message-ID: <20221227080443.6273-10-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227080443.6273-1-nancy.lin@mediatek.com>
References: <20221227080443.6273-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_080634_929320_6E50E174 
X-CRM114-Status: UNSURE (   9.44  )
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

MT8195 vdosys1 has more than 32 reset bits and a different reset base
than other chips. Add the number of reset bits and reset base in mmsys
private data.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h | 1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 454944a9409c..a6652ae63431 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,7 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+#define MT8195_VDO1_SW0_RST_B					0x1d0
 #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD				0xe30
 #define MT8195_VDO1_HDRBE_ASYNC_CFG_WD				0xe70
 #define MT8195_VDO1_HDR_TOP_CFG					0xd00
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 02d08f85cc1c..dc36625cd2b8 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -90,6 +90,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8195-vdo1",
 	.routes = mmsys_mt8195_vdo1_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
+	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
-- 
2.18.0


