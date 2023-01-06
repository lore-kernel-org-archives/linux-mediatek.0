Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B9C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjjQa6tfGqAYgeZlc/YDNnK2piaGCELP74Iq2RoJg9U=; b=SQTN7AHNte5fyIAgZfcJLiBa75
	Osr9Dqb5OFLThJIce2oYloPkAoOcocgiF+o+6nXGwDPFwa9wspEnf4WK9vHuhTbanc9WSumyOuERL
	GC4aRbg6RwbXuVXi3rC/EvHzRDJC2iwrwusIHfSJ3IE3aqZy9FcDQNoVPj3WDlT66HqobX7z5Dq9a
	PAEbsnpusgGY0gGzaqNIT7SaT8u1wJZBJsbCfBfEP7STrNNEBigzVBvGkSH1xG/ydxrA92sLPpKgc
	NqdGbA+8YEgnLxlqNdSxfV+cdvxn5htuuqYHm33+YWgen7zMN0O9luz3ZZrUc/vilOqfuq7g4+G4R
	3hnnlCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDd3l-00HPkD-RV; Fri, 06 Jan 2023 03:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDd3k-00HPji-Fg; Fri, 06 Jan 2023 03:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vjjQa6tfGqAYgeZlc/YDNnK2piaGCELP74Iq2RoJg9U=; b=Z0M3DI37LKOYgXCLWo0Larioxp
	TU6G7syAg9G3VyJ2EVEobpUL/S1KRcY5RSb4JwGUmRAAVsta0Vf8win4tc/r2uk2fz1Us/pCZMVm3
	NKAMKUfwN/W1Z40DOF/y5753j/wued5ZUlY/VvOeFmbRNyYjBE3OZ7ocfOm0644yJr2ow0v8R/+Ko
	npUvOu8jBLx8n/FhD+uRMRE0wv955l/oyUrxCg/cWWRE5IzxFOjxWVbk7jhf/befXahusXDWoyctJ
	dUiCAGdnyLrULClrJxZf8H1ERQROvbJK4DhrOL54v/aQxSz94X7w/X8czXbJxQ3x2qOwUA15lpmK0
	p5sIzDEQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDd3Y-001gEp-1L;
	Fri, 06 Jan 2023 03:06:12 +0000
X-UUID: 1beb322e14454832b3dabd3f2e6c9380-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vjjQa6tfGqAYgeZlc/YDNnK2piaGCELP74Iq2RoJg9U=;
	b=eLa6Q+GeXAaIjv3urHuHTkZjc0fqxuAmBaJRT9bdsCPpeOzT6mLmrk6c7U7SWIRBVQCRmuQwAAZc0T4KhryNE/ItFF/+A6SL/lzICLrpIyWaz2K9a+9geCbYDuDp/+PBfBqBziAp7Ya8l2MZ668Vvxp+xXd+8o4QR2ol1aXEg98=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:4b479b1e-d97b-4bc0-adb3-35146a02df0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:a16a698b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 1beb322e14454832b3dabd3f2e6c9380-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1444437710; Thu, 05 Jan 2023 20:06:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 6 Jan 2023 11:05:27 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 11:05:26 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 1/2] drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
Date: Fri, 6 Jan 2023 11:05:20 +0800
Message-ID: <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_030609_518754_5E72F61B 
X-CRM114-Status: GOOD (  13.55  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

According to Figure 16 Turnaround Procedure on page 36 in [1], you
can see the status of LP-00 -> LP10 -> LP11. This state can correspond
to the state of DSI from LP00 -> LP11 in mtk_dsi_lane_ready function
in mtk_dsi.c.

LP-00 -> LP10 -> LP11 takes about 2*TLPX time (refer to [1] page 51
to see that TLPX is 50ns).

The delay at the end of the mtk_dsi_lane_ready function should be
greater than the 2*TLPX specified by the DSI spec, and less than
the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
problems caused by the RX specification.

[1]:mipi_D-PHY_specification_v1-1

Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds transfer")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7d13028fb6..9e1363c9fcdb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -721,7 +721,7 @@ static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
 		mtk_dsi_clk_ulp_mode_leave(dsi);
 		mtk_dsi_lane0_ulp_mode_leave(dsi);
 		mtk_dsi_clk_hs_mode(dsi, 0);
-		msleep(20);
+		usleep_range(1000, 3000);
 		/* The reaction time after pulling up the mipi signal for dsi_rx */
 	}
 }
-- 
2.18.0


