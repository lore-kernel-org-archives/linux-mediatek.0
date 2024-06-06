Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C45C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TulsrRhbIDs8TKsNZRbXbYoBg2+wZ1zCZBN14dFoG5E=; b=kTu4lAWf4scOw6qUEQO9/+8UoE
	SUAEmBW/KL5t+PaRJJtA3rTXP/nmczwbRMYOMs1dI2VU0adcS3OqIN32l37hwqQvTDO7BKeBrpHkD
	2mEa1N6Tm0dJkfc/FEMOZsIRMBjdIfm6Nhp0fJMsVZq52MBQaEYSgqecWrd1M9hxKddZFqjlnN8J2
	26IcFkBZQgdXQnebBd2MtFgYNvWTBFXMK3ZCW16LXTwAnE0vbEWiu+v2SJ44HrBHknDuOcIWqh7rU
	oyu+oAV8jgep4gA07IWyoJIo8oO2ou0r52TEsIThrVsRSrPuIoDif9LUjMNZwpU4bLdonLyRIsvx9
	FJufEAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF94i-00000009170-46qk;
	Thu, 06 Jun 2024 09:06:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF94f-0000000914x-40rn;
	Thu, 06 Jun 2024 09:06:23 +0000
X-UUID: 06e9e59023e411efaf04eb0598667787-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TulsrRhbIDs8TKsNZRbXbYoBg2+wZ1zCZBN14dFoG5E=;
	b=meRGJnk6ziUMw8bfG5YwdnTXZ8OftlmFv16yhdTHyNmchu5fd0JqfDbu98jsgYSDLlISiTU91vS0GZoI9UyrVnhGbQT9sNTPi+5Fg9gWw3pCpdUU8wo9L13137J8ucGYCwdR+YaThhS29S2ltUZ7vW8JurHZrMQ5EsZz/UBvwds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:43608eb4-5154-4774-8c21-952a986bfbf5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:3aa2c984-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 06e9e59023e411efaf04eb0598667787-20240606
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147348820; Thu, 06 Jun 2024 02:06:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:06:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:06:11 +0800
From: jason-ch chen <jason-ch.chen@mediatek.corp-partner.google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM size
Date: Thu, 6 Jun 2024 17:06:09 +0800
Message-ID: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.374200-8.000000
X-TMASE-MatchedRID: Xmee87WA04ARm9WAyl7+Dna57ruHAnHxJDAZBInjo2YUtdRZTmEaIUUe
	RhGY4VMdIV4u8YKdeKsBtjkcfRMmqUN64DZ+6OgVngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AGsWV0bdkf4OZnI7w0MyspY5QW3P0Do1rUHGWE57KOVV6Bw96C56Hm+BeJ5GJM55Sw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.374200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8F2C02F9BB7FE52F84685050D7437B8500119C0C2DF2251449391A35E88052222000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_020622_031677_C3D620F5 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Jason Chen <Jason-ch.Chen@mediatek.com>

Increase MT8188 SCP core0 DRAM size for HEVC driver.

Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b885a9a041e4..2119fc62c3f2 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1390,7 +1390,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
 };
 
 static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
-	.max_dram_size = 0x500000,
+	.max_dram_size = 0x800000,
 	.ipi_share_buffer_size = 600,
 };
 
-- 
2.34.1


