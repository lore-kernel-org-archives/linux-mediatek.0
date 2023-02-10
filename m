Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CC4C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 03:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/esUzcar84LHIMU9mBAOMspAX9dxk9LWm7hHmIrJC8=; b=z6cxZtVIlhAkbAgS1qtP8uzipS
	gEKFIhc4LSxzQLv8ZM0JkdOpXT3s+f7JKXSkDGHN859EpdCWNKdPqfryTiAOKvBYy6//AzyWMEoZF
	8YD/vrZ5QhtpbYKG3Jsyjebh/JAToFMq3iCzIl3NMCsma5glcLcrERGZu+ufSMm4DHsDvHuoyiI0R
	97RCq3ulqQs4v+qMNh2nmMQf9+1ZB0bltK2LAqH0GvrwKR7ZXAN8GtQBdbEgTS+XaBPlnCFCjbFg6
	dw7FnoCpsoTvnGT+f6FMpR7+q22/5hdWEZiAt0Z1UvEnK9y3bJ6/2It9/u1RZMu4Cupb345brPakr
	GLTlRp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJre-0043lT-E5; Fri, 10 Feb 2023 03:14:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJrZ-0043kh-4S; Fri, 10 Feb 2023 03:14:15 +0000
X-UUID: fba74606a8f011edbbe3f76fe852e059-20230209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=e/esUzcar84LHIMU9mBAOMspAX9dxk9LWm7hHmIrJC8=;
	b=Xq3fxDkbf4Mb2MTbQi7aCzQ/E0WUywEoLjJ5S4A+BX8tiQgheFAGi1qbRbU9U1yO5EZkJjQKijUKMQ0m95vvLhPteNCqj+7PjTIutqDHeF67qukghGiwHcGmhOWkdUYTZTK38AVeb8MxIYhaukDYWSDDRDh77eV7i6vzC3TTTCM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:62e33293-03ff-4984-bd9a-6831e5517e6a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.19,REQID:62e33293-03ff-4984-bd9a-6831e5517e6a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:885ddb2,CLOUDID:1f55db56-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230210111408UIZKUZNV,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: fba74606a8f011edbbe3f76fe852e059-20230209
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1067588012; Thu, 09 Feb 2023 20:14:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 10 Feb 2023 11:14:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 10 Feb 2023 11:14:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH v1] remoteproc: mediatek: Check the SCP image format
Date: Fri, 10 Feb 2023 11:13:54 +0800
Message-ID: <20230210031354.1335-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_191414_025747_FB21438C 
X-CRM114-Status: UNSURE (   9.38  )
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

Do a sanity check on the SCP image before loading it to avoid
driver crashes.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d421a2ccaa1e..0861b76f185f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -649,6 +649,7 @@ static const struct rproc_ops scp_ops = {
 	.load		= scp_load,
 	.da_to_va	= scp_da_to_va,
 	.parse_fw	= scp_parse_fw,
+	.sanity_check	= rproc_elf_sanity_check,
 };
 
 /**
-- 
2.18.0


