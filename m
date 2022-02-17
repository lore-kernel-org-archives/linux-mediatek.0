Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7230AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUf1zr0KLVbV3gcgb05mR199Yj4T08IKs7B9q4Rh3eY=; b=3St7BCt+yt6KhC
	4I0Mi/m3pmWoh1uWSEWv37k7zdVo+2sV15MVxxp5Piwt4MA11p5uvd5X5aC3BWkpxbPiWfuNY8cwD
	9gDguCUmBKL4vl/JTVF9ZiHHF1VuLbdQVGsn79S8DMzT/53TyDVkAuLcehKDmgzVqTnxrARzCW4/M
	h3lqj4gM9sAbzjjKOUOd4SzIrakzjZSK9g4EXdcQI2+jdsO2M6omMy23ePCwQzaGpB1H0HIfYqTlj
	IMoUXxSNMgPDoMTLuew1B4ST1Sa5etktxk27XWTiOocPsx6fIEUw1ER3oaTQAjCHAzMnZjbUneSWj
	HJF2x9OKXZp7xLDhYyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbhU-009JFr-UO; Thu, 17 Feb 2022 07:59:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbgD-009IOF-FK; Thu, 17 Feb 2022 07:58:24 +0000
X-UUID: e2bf054421b146f2819550412e6f15b1-20220217
X-UUID: e2bf054421b146f2819550412e6f15b1-20220217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 855381509; Thu, 17 Feb 2022 00:58:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 23:58:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 15:58:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 15:58:12 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,
 6/7] media: mtk-vcodec: prevent kernel crash when scp ipi timeout
Date: Thu, 17 Feb 2022 15:57:57 +0800
Message-ID: <20220217075758.11369-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217075758.11369-1-yunfei.dong@mediatek.com>
References: <20220217075758.11369-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_235821_571863_6F20B218 
X-CRM114-Status: GOOD (  11.55  )
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

From: Tinghan Shen <tinghan.shen@mediatek.com>

When SCP timeout during playing video, kernel crashes with following
message. It's caused by accessing NULL pointer in vpu_dec_ipi_handler.
This patch doesn't solve the root cause of NULL pointer, but merely
prevent kernel crashed when encounter the NULL pointer.

After applied this patch, kernel keeps alive, only the video player turns
to green screen.

[67242.065474] pc : vpu_dec_ipi_handler+0xa0/0xb20 [mtk_vcodec_dec]
[67242.065485] [MTK_V4L2] level=0 fops_vcodec_open(),334:
18000000.vcodec_dec decoder [135]
[67242.065523] lr : scp_ipi_handler+0x11c/0x244 [mtk_scp]
[67242.065540] sp : ffffffbb4207fb10
[67242.065557] x29: ffffffbb4207fb30 x28: ffffffd00a1d5000
[67242.065592] x27: 1ffffffa0143aa24 x26: 0000000000000000
[67242.065625] x25: dfffffd000000000 x24: ffffffd0168bfdb0
[67242.065659] x23: 1ffffff76840ff74 x22: ffffffbb41fa8a88
[67242.065692] x21: ffffffbb4207fb9c x20: ffffffbb4207fba0
[67242.065725] x19: ffffffbb4207fb98 x18: 0000000000000000
[67242.065758] x17: 0000000000000000 x16: ffffffd042022094
[67242.065791] x15: 1ffffff77ed4b71a x14: 1ffffff77ed4b719
[67242.065824] x13: 0000000000000000 x12: 0000000000000000
[67242.065857] x11: 0000000000000000 x10: dfffffd000000001
[67242.065890] x9 : 0000000000000000 x8 : 0000000000000002
[67242.065923] x7 : 0000000000000000 x6 : 000000000000003f
[67242.065956] x5 : 0000000000000040 x4 : ffffffffffffffe0
[67242.065989] x3 : ffffffd043b841b8 x2 : 0000000000000000
[67242.066021] x1 : 0000000000000010 x0 : 0000000000000010
[67242.066055] Call trace:
[67242.066092]  vpu_dec_ipi_handler+0xa0/0xb20 [mtk_vcodec_dec
12220d230d83a7426fc38c56b3e7bc6066955bae]
[67242.066119]  scp_ipi_handler+0x11c/0x244 [mtk_scp
8fb69c2ef141dd3192518b952b65aba35627b8bf]
[67242.066145]  mt8192_scp_irq_handler+0x70/0x128 [mtk_scp
8fb69c2ef141dd3192518b952b65aba35627b8bf]
[67242.066172]  scp_irq_handler+0xa0/0x114 [mtk_scp
8fb69c2ef141dd3192518b952b65aba35627b8bf]
[67242.066200]  irq_thread_fn+0x84/0xf8
[67242.066220]  irq_thread+0x170/0x1ec
[67242.066242]  kthread+0x2f8/0x3b8
[67242.066264]  ret_from_fork+0x10/0x30
[67242.066292] Code: 38f96908 35003628 91004340 d343fc08 (38f96908)

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 35f4d5583084..1041dd663e76 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -91,6 +91,11 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
 					(unsigned long)msg->ap_inst_addr;
 
+	if (!vpu) {
+		mtk_v4l2_err("ap_inst_addr is NULL");
+		return;
+	}
+
 	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
 
 	vpu->failure = msg->status;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
