Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF3C6FD18
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Apr 2023 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VwFMHD30sqUe/T7ly/CJPme7mMd8qDj0hDd4kicbgfQ=; b=YJXYuyfM6gsin4+zuE8vuZ86zk
	xUV6EJzuU4Ixn3kIkr3oXi2W8jcqKFOKPA4yy5OgUKRSKdIei7dGVVh44jOZPPGt6z/Y36ZRxnUBb
	urEgWTjRhLfdvcnlIEIkHSfdkp0a5KMo+4Jm9NG22GZ4rWsWI0a/RY8pd6PEM24V33URgpUycQysn
	FS63DgeruSAqJzcdJsOn08PET0rscgawI8x4l/s0Miob3BvzYgjJ4jd5FjGtw6Fr84MCa80U1aWUt
	Z56llrBh5bo2A3upEKdsc8MgtitGqybtjkaEtEhtFuZbp1AWAwmyyEW0lkiw1NguOCkhGSrFuRXdZ
	g4pfTOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqAeL-00ClXM-1O;
	Sat, 22 Apr 2023 10:39:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqAeH-00ClQc-0A
	for linux-mediatek@lists.infradead.org;
	Sat, 22 Apr 2023 10:39:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a52667955dso33424795ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Apr 2023 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682159955; x=1684751955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwFMHD30sqUe/T7ly/CJPme7mMd8qDj0hDd4kicbgfQ=;
        b=ewG2D7wdS60JREzAvKokBNWOZ7UcwGBzs908jvdjHMrHYP29OwKPg+EVXSR4yNUfnn
         fty/BawtqqosvAmOT6sFTxbv+1W46qp3nSFjYCvQZ0ncwAEKiNg0fAPlqyWNYkw3jwJ8
         T8p/cJyO/phS3fq38f4z75mTQD16C2swRQ10s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682159955; x=1684751955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwFMHD30sqUe/T7ly/CJPme7mMd8qDj0hDd4kicbgfQ=;
        b=Eb6pJ9InUVl69CpZxBwYn3PT7C32toDl2HYEf2wNefpARkUVGcUNzPmKXuYQWswWFr
         0SycenkZ3pk0d6XCdqZs3lCfYvzhxAF8ZPc2SSL1iqR5YK6bVCWboV3ZmKKHCBjsyR5v
         WjIRlZTBbvgJnYurU8eGabIYAwpUlIeVukyUJN7u2gnTYGmM1fWR7UdpevL4EUrSqgJu
         HRm3KG3Hw2hw8Uy7KISr4S8ob39pgPu2b2I3PuBosb6PofRuweIAodqWEQzxhxrgKqYv
         qPK0oKF5/n9GNG+rSCRSDudbq0WYcwQdHdLXY+pYo7RxCVPa35UUDOj1RHPdA4A0o6/H
         pmeQ==
X-Gm-Message-State: AAQBX9cMoz68EEvcBcJJ8Baq4Y2D0zIztNuroWx1n6yNuGUR2tEUjliU
	qhS3wGlIfsp5/ywaL4qXvghSyA==
X-Google-Smtp-Source: AKy350ZFr/ruuyY8q22yZySnT8vteG7lqkSxAD4UjnYogF8dD+F+Bkmuc4hJmjU41ovyHJpko1ErlQ==
X-Received: by 2002:a17:902:c94c:b0:1a5:2fbd:d094 with SMTP id i12-20020a170902c94c00b001a52fbdd094mr10186859pla.9.1682159955385;
        Sat, 22 Apr 2023 03:39:15 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:c5d6:106b:dcb1:8d57])
        by smtp.gmail.com with ESMTPSA id ls17-20020a17090b351100b0023a9564763bsm5627694pjb.29.2023.04.22.03.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 03:39:14 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Pin-yen Lin <treapking@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: mediatek: vcodec: Only apply 4K frame sizes on decoder formats
Date: Sat, 22 Apr 2023 18:39:05 +0800
Message-ID: <20230422103905.1995271-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_033921_091925_1F298F72 
X-CRM114-Status: GOOD (  10.27  )
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

When VCODEC_CAPABILITY_4K_DISABLED is not set in dec_capability, skip
formats that are not MTK_FMT_DEC so only decoder formats is updated in
mtk_init_vdec_params.

Fixes: e25528e1dbe5 ("media: mediatek: vcodec: Use 4K frame size when supported by stateful decoder")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index 29991551cf61..0fbd030026c7 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -584,6 +584,9 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 
 	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) {
 		for (i = 0; i < num_supported_formats; i++) {
+			if (mtk_video_formats[i].type != MTK_FMT_DEC)
+				continue;
+
 			mtk_video_formats[i].frmsize.max_width =
 				VCODEC_DEC_4K_CODED_WIDTH;
 			mtk_video_formats[i].frmsize.max_height =
-- 
2.40.0.634.g4ca3ef3211-goog


