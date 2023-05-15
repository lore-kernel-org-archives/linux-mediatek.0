Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31CAC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8+mgLP8tw6Gn815CsDCAAKOTV0JLl/QHPy8/G9qnF8=; b=LFrxT9VrIL99AtBFxlhPSZBehQ
	1BKJ5h7Nuw5IDZ6bGxT2FpzXSlsEJlCwYeNYZNqLQ8mRnR8NPbNX9Dma+Y0DzJ1DuibC4VI7w3zwT
	j0dkSPxhPO94kpvLa1OOiVUq5SJwkQ3qSzsChS3SYkLKaNmlWLpPvu7SSc+YGnAQqNPfYcq1NGBX0
	6SASxb1AyqQWgn8kGDoLNvuDGk8hJSGXTYXZbq0PgM2KXlnLukJzQJ7iOQbVGl69fYoZPYVAOtfae
	rFvX1MXlm835RT9LZGbLszQGAwdhmq7I666wkAXq1LE34YO9UxL6Puk2v+3euNoz4yjVksrEARJgB
	AUGHY15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV9v-001hFo-2M;
	Mon, 15 May 2023 10:10:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV9t-001hEr-0Y;
	Mon, 15 May 2023 10:10:26 +0000
X-UUID: b06511caf30811ed83ed1395ce914268-20230515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y8+mgLP8tw6Gn815CsDCAAKOTV0JLl/QHPy8/G9qnF8=;
	b=TlE6gOayBgxvvPdj/ZpCAMHpS50Ce2YU9CUjX1Qx2zqYrFISiFk7zOyVvSUsgUE9v4JflUWA4EMDtQOCFezpeoqcO11e1LjVCrdJ56Dgwg9NNh0IcYGLT9f+GEc+SFWfNPl8QIDqqlj8nMgIyLMNvpFPpgMELzTRsouN855Ojn0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:a7b8bd2e-edc6-4311-ad28-4ee22bc9b3d6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:46b1e1c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b06511caf30811ed83ed1395ce914268-20230515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 985564302; Mon, 15 May 2023 03:10:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 17:49:40 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 17:49:40 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <neil.armstrong@linaro.org>, <sam@ravnborg.org>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v4 1/2] drm/panel: boe-tv101wum-nl6: Remove extra delay
Date: Mon, 15 May 2023 17:49:54 +0800
Message-ID: <20230515094955.15982-2-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515094955.15982-1-shuijing.li@mediatek.com>
References: <20230515094955.15982-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_031025_219095_26083FED 
X-CRM114-Status: UNSURE (   9.19  )
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

Reduce the delay after LCM reset by removing an extra delay in the
initialization commands array. The required delay of at least 6ms after
reset is guaranteed by boe_panel_prepare().

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 783234ae0f57..a5652d38acda 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -780,7 +780,6 @@ static const struct panel_init_cmd inx_hj110iz_init_cmd[] = {
 };
 
 static const struct panel_init_cmd boe_init_cmd[] = {
-	_INIT_DELAY_CMD(24),
 	_INIT_DCS_CMD(0xB0, 0x05),
 	_INIT_DCS_CMD(0xB1, 0xE5),
 	_INIT_DCS_CMD(0xB3, 0x52),
-- 
2.40.1


