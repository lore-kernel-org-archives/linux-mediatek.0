Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD19C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XppWj95E8cWYPktwotHMP9jFVzh+Z+y5iJrUNDY18Rg=; b=P2eItpI3l5jZ+kCdYmEFDMBfJA
	ssrqjfQATsY1uYpm8pe8Ig8AOdcNQkPxGrdT6yiR72aiBs8NE737BXjGrM1EOtcF2O6oUGq3eVnZm
	XoxRFfbLZUSfVS0TkkX8fFFrsmIN6WWON4AYI3/rs1rRDQ9ntqwc2Xs0M28ftCLD1A7c1QXIffdBI
	t0HRgF5HGPdUUvsATJYojxTDsYuE8mYVrySC2yhzAZ5vWK967aGSpsR+uFrU1BXBUdSATO4mp4lg2
	2mxoHBXPyhW9OGDf57EK6L6B8g53QXnaa3c8KiBcR9f11b5Z+ANRB8mMfYyuGb/di8XsEqjzDLn1x
	UNbRDibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY2ee-0060jS-Q8; Fri, 03 Mar 2023 10:28:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY2eV-0060fR-3F; Fri, 03 Mar 2023 10:28:40 +0000
X-UUID: 26385798b9ae11eda08d4d6090ec5a5c-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XppWj95E8cWYPktwotHMP9jFVzh+Z+y5iJrUNDY18Rg=;
	b=qGB+y1EA8+PTYFtLW4yI6RhdYnlSvAEc6Bsaoy2RNXiVlEDGf4U7axqz9cMRrJsc/GZLLaAZwGDitFUA/c4yNHgC56+PoAriuIuq4xnyTig0oOtpDNIbB56aDVrOBC2ygjMrnUcGYs+FD7z7Aqb0OL3gCaRIMDGj8nb0PQDc7hU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:af92754b-3148-41c0-a556-43ba8337ffc5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:5b8badf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 26385798b9ae11eda08d4d6090ec5a5c-20230303
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 923408592; Fri, 03 Mar 2023 03:28:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 18:27:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 18:27:58 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: Dereferencing a pointer that might be NULL
Date: Fri, 3 Mar 2023 18:27:51 +0800
Message-ID: <20230303102751.9374-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_022839_184543_714B0A2F 
X-CRM114-Status: GOOD (  10.44  )
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

From: jason-ch chen <Jason-ch.Chen@mediatek.com>

The res might be NULL when calling resource_size.

Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index eacdf241f4ef..863d18f63f58 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -829,6 +829,9 @@ static int scp_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, scp);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!res)
+		return -ENODEV;
+
 	scp->sram_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR((__force void *)scp->sram_base)) {
 		dev_err(dev, "Failed to parse and map sram memory\n");
-- 
2.37.3


