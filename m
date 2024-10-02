Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4294CF318C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 02:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zObuiTQhxW/rlGHABQlocVTuM4eYd/LNgN0pppkVxg=; b=mYt6tBHMkaDq7qQNkK+LYYeKpy
	zd1r8nNpd+I9j4vT53vb2VLBOHEU0ZbokpEbLuRZi/TBM6GXtUSVk6UZQye2QVHOfT7AtkFUiqxF6
	iMHik696fWsXKUYmN6WTfl3Hwp0+4UuR9gtCEy5Ijh1Qdqzqt4C7Zc4E5jrW7cxIZEL4IQ6SRwuwB
	cHqxvIlA0V4w2LxZkANy4qBwMG95SBrpFyAo6fNN0Z6wFcI6s8J0KposV3RJYl/TlPb6p1W1B/gCJ
	s8Rn060VHbQ0Zs0N5w/bG7mj362QPRyudZtSZtZJ71T1Jjvn6CO/5pKwpVleWPhwXqge+Z3lxy3le
	IUU6os2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svp01-00000004bx5-2SMP;
	Wed, 02 Oct 2024 02:21:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svozz-00000004bvo-3Npp;
	Wed, 02 Oct 2024 02:21:57 +0000
X-UUID: 1602cf6e806511efba0aef63c0775dbf-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1zObuiTQhxW/rlGHABQlocVTuM4eYd/LNgN0pppkVxg=;
	b=AFP5GQBMUNEA9zvyAce7Ei69EjmJelC1zCWurN+baaI93KnTK84+J//bCAY5/Cf4om8+mnOqYaRoN+mvVwfR+3KtTbwVQw4AxLbEjyMVGj0pj1Eaz9zJdtHek16Qzvok6QGEu1c3fEvTWV+KSOwrWxw+Vxh5hq6pCLeD/C32whA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:639be7a3-7676-4419-9322-c6176dbc00ee,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:6dc6a47,CLOUDID:ebff8f18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1602cf6e806511efba0aef63c0775dbf-20241001
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 919005042; Tue, 01 Oct 2024 19:21:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 10:21:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 10:21:49 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v3 2/6] clk: mediatek: clk-mt8188-topckgen: Remove univpll from parents of mfg_core_tmp
Date: Wed, 2 Oct 2024 10:21:34 +0800
Message-ID: <20241002022138.29241-3-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002022138.29241-1-pablo.sun@mediatek.com>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_192155_867096_124B6A95 
X-CRM114-Status: GOOD (  15.10  )
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

Same as MT8195, MT8188 GPU clock is primarly supplied by the dedicated
mfgpll. The clock "mfg_core_tmp" is only used as an alt clock when
setting mfgpll clock rate.

If we keep the univpll parents from mfg_core_tmp, when setting
GPU frequency to 390000000, the common clock framework would switch
the parent to univpll, instead of setting mfgpll to 390000000:

    mfgpll                            0        0        0   949999756
    univpll                           2        2        0  2340000000
       univpll_d6                     1        1        0   390000000
          top_mfg_core_tmp            1        1        0   390000000
             mfg_ck_fast_ref          1        1        0   390000000
                mfgcfg_bg3d           1        1        0   390000000

This results in failures when subsequent devfreq operations need to
switch to other frequencies. So remove univpll from the parent list.

This solution is taken from commit 72d38ed720e9 ("clk: mediatek:
clk-mt8195-topckgen: Drop univplls from mfg mux parents")

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8188-topckgen.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-topckgen.c b/drivers/clk/mediatek/clk-mt8188-topckgen.c
index c4baf4076ed6..6b07abe9a8f5 100644
--- a/drivers/clk/mediatek/clk-mt8188-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8188-topckgen.c
@@ -342,11 +342,14 @@ static const char * const dsp7_parents[] = {
 	"univpll_d3"
 };
 
+/*
+ * MFG can be also parented to "univpll_d6" and "univpll_d7":
+ * these have been removed from the parents list to let us
+ * achieve GPU DVFS without any special clock handlers.
+ */
 static const char * const mfg_core_tmp_parents[] = {
 	"clk26m",
-	"mainpll_d5_d2",
-	"univpll_d6",
-	"univpll_d7"
+	"mainpll_d5_d2"
 };
 
 static const char * const camtg_parents[] = {
-- 
2.45.2


