Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66DCC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 12:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf6IcfalnyFtEwcYPBgscSxhCUGC67GQz9ghXYhk16o=; b=pG7Kete5YVVFSFnjU1qHm/n8Sj
	jceFRV+HDi11+KbnrSQ89f5R3u6QbNwbA4BnXwqx8+Osm+vkf0nej2tdpotmDHNkgW8BTtcaWlrIt
	qjk8o2Vn+abwK/vlvjppF1RFS27BLdVHRjwqdRSKkXQw1EVJZPg2TqGRyeFGTWuA+YHF7s0HlKi4p
	Q0H5Oodl8X+E6KosbEoMsvhimXwN1zoRoJyIOuW1C2qt/JnW8X17JXogCUye8pBKFvibQHxgwU9PD
	ROM49tjZ8+F0r+IMYbqLC7CrcPHRd/9MbuYhOmbQpg+s9py4XrK0h0Vm2LdU/5gTLdtgSJ4voZ6qo
	DboeE/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgOX-001Ciw-Sy; Tue, 03 Jan 2023 12:27:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfVt-000yLj-Ne; Tue, 03 Jan 2023 11:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vf6IcfalnyFtEwcYPBgscSxhCUGC67GQz9ghXYhk16o=; b=WCQAAfMyDiQMoLOD1vhR21cfZU
	Va/vDZ6u+L9L0Tb6n5W2zto8SUatpTep4Cm6MHR+KW3ox1gstFdVIDDIOL2nrz0PIDjNcGEfgZkU3
	Xqz+Bw3L46C91URdVswsDdvyZK8UHwfEZbMlcTsOykfScYLxeqcF0Pw75/f50WU/sBZDFuNJA6xc5
	vgfEJAvRK6EZkexwd8FR/5xedy9OZBgKyxBoFVDkYEXZe46p2CndJ8urCm4XQZWTnz5b2/G+NH5LP
	uaWKLuOVqX8MkPtrpNCdiLiJmNttFE/I6hh5EyQI2dLeRAWJRrgxFhEfT6xpW7w0zxXWzjTHI0qeW
	LjR5misw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCfUo-000aBu-2x;
	Tue, 03 Jan 2023 11:31:18 +0000
X-UUID: 8f17e31430d749be8833024e6854408b-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vf6IcfalnyFtEwcYPBgscSxhCUGC67GQz9ghXYhk16o=;
	b=iXBnmaZmVaA3MtKd34q/1M3YfSMRqyZ9ld57d4n4U0X8VJ8RshKnl+58Kx9wItjjHsOnFW7aV+FEcl6QzjBJWyOaAWb/XpIKTDPkzIT9qkaXUqq3+RNkAUmAytQvsNnZhNTKBwjb1OgdRN77ksm56h5pTBHow0Wg8X3UG/mMNXw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:96640c14-3b5d-43af-bec3-986258db0319,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:df66aaf4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 8f17e31430d749be8833024e6854408b-20230103
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1845160017; Tue, 03 Jan 2023 04:30:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 19:29:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 19:29:26 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 03/14] soc: mediatek: mtk-svs: clean up platform probing
Date: Tue, 3 Jan 2023 19:29:14 +0800
Message-ID: <20230103112925.16554-4-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230103112925.16554-1-roger.lu@mediatek.com>
References: <20230103112925.16554-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_113025_249956_4AFD5E8A 
X-CRM114-Status: GOOD (  12.69  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

We only ever call the SoC specific probe function from
svs_platform_probe. No need to carry that function in a global
datastructure around.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 465b60a5cedc..5abf94aafbac 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -319,7 +319,6 @@ static const u32 svs_regs_v2[] = {
  * @banks: svs banks that svs platform supports
  * @rst: svs platform reset control
  * @efuse_parsing: svs platform efuse parsing function pointer
- * @probe: svs platform probe function pointer
  * @efuse_max: total number of svs efuse
  * @tefuse_max: total number of thermal efuse
  * @regs: svs platform registers map
@@ -336,7 +335,6 @@ struct svs_platform {
 	struct svs_bank *banks;
 	struct reset_control *rst;
 	bool (*efuse_parsing)(struct svs_platform *svsp);
-	int (*probe)(struct svs_platform *svsp);
 	size_t efuse_max;
 	size_t tefuse_max;
 	const u32 *regs;
@@ -2347,11 +2345,10 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 	svsp->name = svsp_data->name;
 	svsp->banks = svsp_data->banks;
 	svsp->efuse_parsing = svsp_data->efuse_parsing;
-	svsp->probe = svsp_data->probe;
 	svsp->regs = svsp_data->regs;
 	svsp->bank_max = svsp_data->bank_max;
 
-	ret = svsp->probe(svsp);
+	ret = svsp_data->probe(svsp);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.18.0


