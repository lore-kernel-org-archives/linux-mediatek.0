Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7ACC369AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r7DM1OmTlAwvtjukMDEk3ahsIfChXG9XjEPCHP7QFb8=; b=uo0/UnkCPQWTP8W4LwnDDeLoSd
	D3l1hTB3K8k1bgn1CBfRo8egKXatxaDHM2RuPH9LnTlySBS7CHD8asl2hmmjoT0uGrWOSk/B/Ih/s
	henzeGv8UBd9cE9oHez8kOeaLyhQMEX5MEDi/nCCWFe7jvmZoxLVBbkXuWiHZpDHPw8vWzDy42Kbz
	FlRoMpiqC/HGa+TjyKBGuIIwSo4fP5kAq1eWTJsJEA4ZXj2v+yB5jTcJmcCXkDQpSy8cXjopVlj57
	T6fqoRJ4SDrlBPM1/RONN4IAYHOvxmVMnm+72/ng+IQq8AnF8YfFT78rxQHfeWVj8BspZVjTraP3t
	oFCbBWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stNbe-00000004WhC-3kYt;
	Wed, 25 Sep 2024 08:42:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stNaT-00000004WUp-2VO5;
	Wed, 25 Sep 2024 08:41:30 +0000
X-UUID: f11eb5647b1911efb3adad29d29602c1-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=r7DM1OmTlAwvtjukMDEk3ahsIfChXG9XjEPCHP7QFb8=;
	b=r0iPZGwZFUbGpu8UKobqoePl7TIAvPreNeKEbZ1K+Xs24qHrWm3YvIeTKb5DtrowUsIrRSN2lkBt5yAPjK5zKNVVN4lzcDmn5hHZl7Yrz8/svdsGfp9eQ/j2YuMtk+QctE16SjX+IJdE0tRcWPcJk8BYx/NCpNgorKgI5fMT1HQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f45f346a-cd2a-4505-a71e-05ff2972ad34,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:147fbdd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f11eb5647b1911efb3adad29d29602c1-20240925
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1746190837; Wed, 25 Sep 2024 01:41:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 16:41:17 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 16:41:17 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <rex-bc.chen@mediatek.com>,
	<msp@baylibre.com>, <granquet@baylibre.com>, <dmitry.osipenko@collabora.com>,
	<jitao.shi@mediatek.com>, <mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
	<liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/1] drm/mediatek: Fix wrong check of nvmem_cell_read
Date: Wed, 25 Sep 2024 16:40:24 +0800
Message-ID: <20240925084116.28848-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.492400-8.000000
X-TMASE-MatchedRID: SuWkWSV/ibcryFHbNnBLG0KcYi5Qw/RVsEf8CpnIYtnfc2Xd6VJ+ynOQ
	FTxg7zBiief1bXK4Giqi5055Kxg7KbBAQLqGlKiv4pdq9sdj8LUFHCcDXik5Rpsoi2XrUn/Js98
	n9dYnJNNQSFbL1bvQASAHAopEd76vrTCa7ZKhhkhBggx/bFjh7r0Dqq+NSXuwaGjbsK/Gvmg8gV
	7uQwboPw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.492400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 13CCA0BB40EB3E96C6F46EEAE16D8E08228DAD574439DD1B6B754A5BEAC8938E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_014129_670596_C2AAE93E 
X-CRM114-Status: GOOD (  10.90  )
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

If the len is 0, kernel crash will occur when performing operations.
Add the len check conditions to prevent kernel crash.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..0cc75ba96b98 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1082,7 +1082,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	buf = (u32 *)nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
+	if (IS_ERR(buf) || (len == 0) || ((len / sizeof(u32)) != 4)) {
 		dev_warn(dev, "Failed to read nvmem_cell_read\n");
 
 		if (!IS_ERR(buf))
-- 
2.45.2


