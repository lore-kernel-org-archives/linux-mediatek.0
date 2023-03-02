Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66591C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E166X9hjpFg3mdEW6iD+dySuMT8kiQ1PL60Qkh8UwsI=; b=eFNrpXnJIt3AZu7woTbPj2Lk0f
	wprXpjovy9Iw4NxkMjM1OOzXCCdQ+T/zetF/wT0eywTzKoZkwFMbsjvknOSIEOO7+5HSYGxTddc6C
	hzI1bUA5rexHkE81UWz1Jjrb5xMlagx3zNy8AsGXkrg/gXL3EZc+l+ZY0AmJBC1zLbASGpHcJyAD9
	oaTHZv7w1wvMRug+mRwfH6Pe6d0hr+R4oyCKzeHXCJkfJar4gjkWo3zGBcLrlZVwKzDJmDn0m63M6
	agbdghJMhnLpTXEeiFuZQACE5Hd9uvauwibQ/1tkAC/hM4yb2nX8OZ86fJ+lXGPu5zHx/My1h59zh
	N6gj5luw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXipT-002IlL-3P; Thu, 02 Mar 2023 13:18:39 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXipJ-002Ij1-01
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 13:18:30 +0000
Received: by mail-pg1-x52a.google.com with SMTP id y19so9755633pgk.5
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677763107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E166X9hjpFg3mdEW6iD+dySuMT8kiQ1PL60Qkh8UwsI=;
        b=TG5uXivyNeE/uoFeSDp+u5QoerHsyjFLS7lek+Tf1ikHN52gtt0elSpqkLtCPZW6ii
         W9CAReiVFbYFHVv+l7tSM7T26G7D7eRK5DYrTLuHGSw9CexbtpUHtZmti+kD/mvHiTb6
         mWvv4X7tHbBuKoClb79/qw+aiqm/2uT0784MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E166X9hjpFg3mdEW6iD+dySuMT8kiQ1PL60Qkh8UwsI=;
        b=AT+Dqwo6/0zsMxUtcgqq0+muJ/DmGY3Vftz1MhX9UM3WpVPHz0SplAD/vqRCMkMRI/
         Gu05Qj9KbwzjCjy9LAXE1MdrbFmL3Q7IQhoAgAACvzvXN2u+OFuStLSPKDBjibI29O/m
         8ieckQaGopx4eGpMf1F4Xpmzrai0395t/3ZYblV8Ktilevnu0jWAu/eBihgbJhpQSfIQ
         aVD9C7evPBJqlwnpL7H0fTji6MynXcRpWoBYm8gAh9j7bFK4TwtpE9snkiVBtWFumQTF
         SYizpvUBp1WrxzDGIllypW2LIxKMwLVP+v07smeIe/zfuuCKk9jPc3hZfhxDH5r9EF82
         QcYQ==
X-Gm-Message-State: AO0yUKVx1LgjBOA0hGsvjTyYfX5YLwvkYCeFLCB84aB18oSyofxJNb7M
	AdQS+5qq5wEkod+l9gCEjAVBnQ==
X-Google-Smtp-Source: AK7set8K94g2rR6EFJDYXdaB7Du5j026byxnZEvzejgfLdVXgs+t85RvFhpPuQA9xTO2WjR7dpu7AA==
X-Received: by 2002:a62:4ec8:0:b0:5cb:eecd:387b with SMTP id c191-20020a624ec8000000b005cbeecd387bmr7538411pfb.33.1677763107334;
        Thu, 02 Mar 2023 05:18:27 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:739f:8bcf:3d43:dae5])
        by smtp.gmail.com with ESMTPSA id s15-20020aa7828f000000b005905d2fe760sm9840086pfm.155.2023.03.02.05.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 05:18:26 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] media: mediatek: vcodec: Use 4K frame size when supported by stateful decoder
Date: Thu,  2 Mar 2023 21:18:21 +0800
Message-Id: <20230302131821.2060936-1-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_051829_093795_31321F7D 
X-CRM114-Status: GOOD (  14.13  )
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

After commit b018be06f3c7 ("media: mediatek: vcodec: Read max resolution
from dec_capability"), the stateful video decoder driver never really
sets its output frame size to 4K.

Parse the decoder capability reported by the firmware, and update the
output frame size in mtk_init_vdec_params to enable 4K frame size when
available.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c        | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index 035c86e7809f..679f4dc9acfb 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -11,7 +11,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
-static const struct mtk_video_fmt mtk_video_formats[] = {
+static struct mtk_video_fmt mtk_video_formats[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_DEC,
@@ -580,6 +580,16 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 {
+	unsigned int i;
+
+	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) {
+		for (i = 0; i < num_supported_formats; i++) {
+			mtk_vdec_framesizes[i].stepwise.max_width =
+				VCODEC_DEC_4K_CODED_WIDTH;
+			mtk_vdec_framesizes[i].stepwise.max_height =
+				VCODEC_DEC_4K_CODED_HEIGHT;
+		}
+	}
 }
 
 static struct vb2_ops mtk_vdec_frame_vb2_ops = {
-- 
2.39.2.722.g9855ee24e9-goog


