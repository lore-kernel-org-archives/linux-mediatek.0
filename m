Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144F9C07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05M3M7J7kDkTRDSeF5O8eaR0ZRr7az9EUbdWM6vT2FA=; b=GSvfHV5k9+KEHct29V8U4eeG5i
	kTOfdoCReuOzIsPQjrR0W1Zxd3EcP0UaAAEoa7sDaYmLnvohtFJ0kHSadWk0Ca+Qx43ArIP1czH1b
	zy8C9VD0oFDqGiqa77b2vy7S6ivpAke6hAV1JXgHuSN0TjtNib20hRPR4rN2wNejJZ8DHE1rUehva
	FRfrm5GGkul7SHGlZqMJfeizRrYaaaWw0v79vrwRI3JXua9Z2xIfVL33Cf9VpGnbqiUTtVIu+sLvB
	iAwYezBS2oo9XGf+zvqvo13aCh4ditbBqUO2/vJUt7MXPbF8TWMZ1vCVPo3NahyFfFbL1BdV7PCVS
	nVcQTkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpaU-0020vE-NP; Thu, 29 Sep 2022 09:12:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpYj-00203y-VQ; Thu, 29 Sep 2022 09:10:25 +0000
X-UUID: 610fe930f9824e578c522c8cf554ec96-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=05M3M7J7kDkTRDSeF5O8eaR0ZRr7az9EUbdWM6vT2FA=;
	b=N9oZANvm1HKeH+fW6cUnhOHSNPJt+W1LdNsWuNfj+r13BvhosE2VpNCBX8tGNacpKRyQGIZRP9veeZ0nXG8sR4eWdX52b6nV0fduVokP5qo+gz/lRuAGaHfdqibFQZrljUmAYALD4fiei3omNge9Ws6G4AsXEy0pqCuYZbfomf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3b91ffff-5bfe-443f-b262-ad69684e425f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2a7ca3e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 610fe930f9824e578c522c8cf554ec96-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1518959611; Thu, 29 Sep 2022 02:10:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Sep 2022 17:08:39 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 29 Sep 2022 17:08:37 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>, kyrie wu
	<kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, irui wang
	<irui.wang@mediatek.com>
Subject: [V17,15/15] mtk-jpegdec: add stop cmd interface for jpgdec
Date: Thu, 29 Sep 2022 17:08:17 +0800
Message-ID: <20220929090817.24272-16-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929090817.24272-1-irui.wang@mediatek.com>
References: <20220929090817.24272-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_021022_059627_B81CAFC0 
X-CRM114-Status: GOOD (  10.94  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add stop cmd interface for jpgdec to stop stream

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 2fe0e2a1c127..79a8f1b1965c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -667,6 +667,9 @@ static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
 	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
 
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+
+	.vidioc_decoder_cmd = v4l2_m2m_ioctl_decoder_cmd,
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
 };
 
 static int mtk_jpeg_queue_setup(struct vb2_queue *q,
-- 
2.18.0


