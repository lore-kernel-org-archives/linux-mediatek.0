Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5F3C369A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GIXtBLCtXr6MqBqJlnp57Xa9ytuceXIA441Kk55rrF4=; b=O20ppNrNvPmP5zsgTujdQ3Mte2
	82ThzEPQHEd6bSg6uPRrO7gdHsGEolzzLctI9U1N1JYbusryWRXtYTbXc1T90pVicmjPYwYmvohbg
	tEbpG1vu+7a6nwddmY7eat/fcVzC6Dgk6K2HV42lxRKiXGFhcpnI3ZobSw0iH8DQnQmf/id7mKxDH
	KCJWFxxjtbVRVdOnr+bpQkrkeiSk+FAQ9Z/NebRa/DKWnXO+NyDk02flf2A1BciKZBYn/D+O+TURG
	8AeiKYautOXhk/PSksmHanzw4/SKNOzsuLZTrm8lM8HHb1bhENKPY4wsYyJUhxoUUlxrdmXwjh2pZ
	JtuEerUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stM06-00000004FIQ-3U76;
	Wed, 25 Sep 2024 06:59:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stLpo-00000004DHI-2xn1;
	Wed, 25 Sep 2024 06:49:14 +0000
X-UUID: 41daf4dc7b0a11efb3adad29d29602c1-20240924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GIXtBLCtXr6MqBqJlnp57Xa9ytuceXIA441Kk55rrF4=;
	b=h4NHbUVkb04ybPSWFtztF6K7iNELGQ5AtIBX7yYhcCKSlOmHpsE2tSvSZ+aAXVGLZrXv3hdkzTFsXxZAjA12AAjj4mJbm3VXtUDq/8ZanClT6gCl42eo5tDO6/QYVh7yzSyZN1m8/ZfJwvfF3/fM8koj+0lUtuaQXDtD3BcFY/c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5671f086-cbfc-4f81-bb83-10aff57b85a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e39abbd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 41daf4dc7b0a11efb3adad29d29602c1-20240924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 432261008; Tue, 24 Sep 2024 23:49:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 14:49:00 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 14:49:00 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/1] drm/mediatek: dp: Add sdp path reset
Date: Wed, 25 Sep 2024 14:48:22 +0800
Message-ID: <20240925064854.23065-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.788000-8.000000
X-TMASE-MatchedRID: sCy2GwBQH7yvhOOX3csmVw0QY5VnQyAN6SXuwUgGH0iyrCkM9r1bWojW
	iMxtXqDIzP/fGiNMYHU3LXzHrryidfA5M+x5Rjkcl1zsjZ1/6ayeEP0DdJruliz+5QCTrE/s+Vi
	hXqn9xLF1Xu18Rs/cG0cr8zPjxcDfEJHpQ2Y9lURCxKB9Mp7mVU9nxZsOR/FT1MUvXa3LfbejNb
	S0t/0QSUHNY7W6Yix9gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyZ/VrItWeJXv016YqZfAT5G4MD
	qojiLaNlLcFj/78QgopdIrrqkKoT7TTdbRCVjfgjo5opvXOhw94O3plWBIsE0JYdnh79GXHbVGO
	i6nZUJxa9755XPg+nlWTm62ZDVWUZUXf532uejGkjwQURlVuKA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.788000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B195F4980861ED25D8E68E8EB5B3E84150ECCA730C5C97F8B4AD11662FEE14EF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_234912_778896_4F5073C9 
X-CRM114-Status: GOOD (  12.71  )
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

When using type-c to type-c to connect to the monitor,
the sound plays normally. If you unplug the type-c and
connect the type-c to hdmi dongle to the monitor, there will be noise.

By capturing the audio data, it is found that
the data position is messy, and there is no error in the data.

Through experiments, it can be restored by resetting the SDP path
when unplugging it.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in V3:
- No change.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240923132521.22785-1-liankun.yang@mediatek.com/

Changes in V2:
- Fix build error.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.23728-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..4003bd83f64e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1052,6 +1052,18 @@ static void mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
 			   0, DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0);
 }
 
+static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+				SDP_RESET_SW_DP_ENC0_P0,
+				SDP_RESET_SW_DP_ENC0_P0);
+
+	/* Wait for sdp path reset to complete */
+	usleep_range(1000, 5000);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+				0, SDP_RESET_SW_DP_ENC0_P0);
+}
+
 static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
@@ -2314,6 +2326,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 			   DP_PWR_STATE_BANDGAP_TPLL,
 			   DP_PWR_STATE_MASK);
 
+	/* SDP path reset sw*/
+	mtk_dp_sdp_path_reset(mtk_dp);
+
 	/* Ensure the sink is muted */
 	msleep(20);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 709b79480693..8ad7a9cc259e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -86,6 +86,7 @@
 #define MTK_DP_ENC0_P0_3004			0x3004
 #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK		BIT(8)
 #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0		BIT(9)
+#define SDP_RESET_SW_DP_ENC0_P0				BIT(13)
 #define MTK_DP_ENC0_P0_3010			0x3010
 #define HTOTAL_SW_DP_ENC0_P0_MASK			GENMASK(15, 0)
 #define MTK_DP_ENC0_P0_3014			0x3014
-- 
2.45.2


