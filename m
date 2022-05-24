Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 03:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GV5lLNEOXFgl1kssi3PaM1IvlREPAb4/YfZh+kdd1Qk=; b=QVYSuIGEZV7tAa
	9aH6vYtLMWkROlo92iIhC7MGoJFs8RTpI7D0X3Z8Krsscq23HCLYxsm0853L3wMZvZ849oqT1lZbv
	2xGDlprzi5DoM+Me6s9xmRpYysR1J4/aiALj9IwcWp5/KXkPxCQ9bKVpgo3ZPWIH1OcIZHSLRQJI8
	OHCXBPKa6O8eSOEYmrlmNfmgSyvkiYSOzdqzMXx0hRWnQCnTUrom5oPSlUHSopIbp9vBFqWkmXuR6
	0FXhzttlKbUYdLgWxrYI7xCxRulL7Ifn3KkY6i10sKBRI5XDzdi1lZjtiAa2x29M9Hull7PkXVwRY
	pEDdyDrR9WHGWilRppbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntLS1-006hmy-LH; Tue, 24 May 2022 03:43:17 +0000
Received: from edge01.meizu.com ([14.29.68.187] helo=mail.meizu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntLRq-006hl3-04; Tue, 24 May 2022 03:43:07 +0000
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 May
 2022 11:42:28 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 May
 2022 11:42:27 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] media: mediatek: vcodec: Use kmemdup rather than
 kmalloc/memcpy
Date: Tue, 24 May 2022 11:42:21 +0800
Message-ID: <1653363745-13988-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_204306_370874_36C47E0E 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index 023aba4ec2c4..67949bcedb58 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -523,13 +523,12 @@ static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance
 	if (vdec_vp9_slice_default_frame_ctx)
 		goto out;
 
-	frame_ctx = kmalloc(sizeof(*frame_ctx), GFP_KERNEL);
+	frame_ctx = kmemdup(remote_frame_ctx, sizeof(*frame_ctx), GFP_KERNEL);
 	if (!frame_ctx) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	memcpy(frame_ctx, remote_frame_ctx, sizeof(*frame_ctx));
 	vdec_vp9_slice_default_frame_ctx = frame_ctx;
 
 out:
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
