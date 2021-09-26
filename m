Return-Path: <SRS0=WJkm=OQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B27CC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 03:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C5FD61077
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 03:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C5FD61077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R7aQBf2mPxcdsrTxrNHnB9IeU42zwvvlg/RSXQGR8Yc=; b=uNG32vVrimq1VV
	1pSQpiZlcqT39Pf7EWuXm0a2tvrRK2JC030rUyqdPB50NNf5WtzYMgTPu1n654lDJCh3vXRhIA7cz
	1c5THHU35gReImNitK4IB6xl2ykPdsm+PogrelvS8AGzt1T1oFkUFVJMo2amwzS7AjuFTd4bUpa8x
	tgnzx7Vqi50ZyYBRkWQcPwdKavL1RYf/6Vkjq7HBdg94Rln+gkt5WEVsXe9Tlj9y7IhQWopQHIOJy
	Tg4yIhq9RiRebluFZPueeSIqy5ZCWil7hRMAtkIhdLbfRqMC7GQB5ge8O0xbuMYLiiX2ZvPx0Wg6F
	FsAOlEHZnG3yyOAbiODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUL1F-00HYRX-CG; Sun, 26 Sep 2021 03:40:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUL12-00HYQ4-5X; Sun, 26 Sep 2021 03:39:49 +0000
X-UUID: 2ce31cb9ee6a4384ae9c162b88665cbe-20210925
X-UUID: 2ce31cb9ee6a4384ae9c162b88665cbe-20210925
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866629052; Sat, 25 Sep 2021 20:39:41 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Sep 2021 20:39:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 11:39:38 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Sep 2021 11:39:37 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Hirokazu Honda <hiroh@google.com>, Alexandre Courbot
 <acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] media: mtk-vcodec: MT8173 h264/vp8 encoder min/max bitrate
 settings
Date: Sun, 26 Sep 2021 11:39:35 +0800
Message-ID: <20210926033935.9258-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_203948_243780_CBF718C2 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set recommend min/max bitrate range for MT8173 h264/vp8 encoder.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
This patch dependents on "Clean redundant encoder format definition",
which already accepted into linux-next.git:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/patch/?id=4093eb21538ae4f2861b26f4615939e1fa50dc67
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 4489a9744cd7..5dce3681ce94 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -388,8 +388,8 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
-	.min_bitrate = 1,
-	.max_bitrate = 4000000,
+	.min_bitrate = 64,
+	.max_bitrate = 60000000,
 	.core_id = VENC_SYS,
 };
 
@@ -400,7 +400,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.output_formats = mtk_video_formats_output,
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
-	.max_bitrate = 4000000,
+	.max_bitrate = 9000000,
 	.core_id = VENC_LT_SYS,
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
