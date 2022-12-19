Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1D4C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BROO9oR3Wy6uXyXdf6VAMOjT4WTHQrLO8YJEyXD5pf0=; b=T0ymFgc5h8MQWPg0DHK+5AN8Kg
	/m947JvtzyVPHptwWxrVhjLrAWOEYJAtvkS954A2haB3YBVg+npqMQBOwsVs4/rFUI3Wh80k1tH95
	KAYhrYkFslaJ3BK7HQzGi/vFDTIjxe9z2S7qPH1cxIxJ8kMqrxIRUdC8DhtXFzbctJOIc8LNPYjwj
	yhv5uZNlokVslztKRSqTNlG/JQ4N6tIaDZo1zsOA5uudcDtF8OW1oZvgOabFpcYGGwxISd7BtymZb
	6CIUaE05FNorpjjTj3ULAXC6OWhoRWUSewHp/x6njWpkM8iCIJHFO34IIPjet+4k0iam0Med5C1O4
	9WjG6OvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ARf-009oOg-Ld; Mon, 19 Dec 2022 07:20:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ART-009oBD-85; Mon, 19 Dec 2022 07:20:08 +0000
X-UUID: c0f10da64daf4619b24ea6decd6b2930-20221219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BROO9oR3Wy6uXyXdf6VAMOjT4WTHQrLO8YJEyXD5pf0=;
	b=s8omwKzTGbwrTQIrRO8nvuguexXc2HqgFnpsHWE438TXr0fmU1QFjLcixggC3zWlLQqAgUawG+UwruAmRWj499j64gpDrRkgTZmwsgNMgzpbzaG/t904LoHG7Pamp103Tu4ADYC3T9XWj6VYP8OzuFJmTw49UgnzTVSriij59Bg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e4be6923-0e62-476a-b726-a16ea62893bb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:e4be6923-0e62-476a-b726-a16ea62893bb,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:ff91bd89-8530-4eff-9f77-222cf6e2895b,B
	ulkID:221219150056VY56XV4E,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: c0f10da64daf4619b24ea6decd6b2930-20221219
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 853444715; Mon, 19 Dec 2022 00:01:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Dec 2022 15:00:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Dec 2022 15:00:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] media: mediatek: vcodec: Using pm_runtime_put instead of pm_runtime_put_sync
Date: Mon, 19 Dec 2022 15:00:40 +0800
Message-ID: <20221219070040.2434-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_232007_393261_24EED9B5 
X-CRM114-Status: GOOD (  11.24  )
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

pm_runtime_put will set RPM_ASYNC flag then queue an idle-notification
request again, won't return error immediately until current request is
scheduled. But pm_runtime_put_sync run the ->runtime_idle() callback
directly, will return error immediately.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
index 4305e4eb9900..341b406f5272 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
@@ -72,9 +72,9 @@ static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_put_sync(pm->dev);
+	ret = pm_runtime_put(pm->dev);
 	if (ret)
-		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
+		mtk_v4l2_err("pm_runtime_put fail %d", ret);
 }
 
 static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
-- 
2.25.1


