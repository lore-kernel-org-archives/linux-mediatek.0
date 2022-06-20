Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CECC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Birko6BVm9pR0csOE6qLnvHxtv0sU5B7VPcVJ+8JxPc=; b=x87NcaaTgKU1ky+kQH1SddrdbC
	hYghUGKwg+xxwPnrWnqTP4G/8JfNSFr51Fg9EGfWhvckvZMRzFivjhraLhePaMClbDaGunEspyAmv
	BZos0o0fwnpiHo5NmR66apXWLVTQxnASOXhUfzAnjwd6uPmltPiivMz/XJ4pWscmVVeCcWhWF3SeL
	vJ0hmpyZdgpqBYhPXhQHAbzW3PFu4QH+qEJ8ej5pYKVOOJCZ4/U29TlQEHrM2Rp63mdd9JA9BKJsG
	dmBkSRPE2SigMljzzi1NjbS3bzXhgrtd4rjm9bUH0XLqHn+kMG0O5byx/PhkR4I5NO/i5EXoyraC7
	vkaW9+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Az3-00GRkt-MG; Mon, 20 Jun 2022 06:34:01 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Az0-00GRkF-Aq
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 06:33:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id f65so9434059pgc.7
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Birko6BVm9pR0csOE6qLnvHxtv0sU5B7VPcVJ+8JxPc=;
        b=ldgy2d2NIgPPCbeDgHy9tMwLL0sSFkkSQiXVaMf/pMsE6csJ6BV7bYSFqjXwyMBXNX
         yv8TkM+IvFKk7ZdfVk1UiDSJ9YmxIREDRU+5HqXCAJHLcJLAtsIYZcvi5sH9cpDpBbGL
         UUk5ekd552hFetSwY9djMDHRD4wkxKncOG/cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Birko6BVm9pR0csOE6qLnvHxtv0sU5B7VPcVJ+8JxPc=;
        b=fdv28tpL0X+Xnm2QykNUpJwm8HboITEwDshBqR9uKl5xObbyabze3GhLNF23PQbTXb
         vyfF2xrrEPhIVl7Qrgq1FamuV8DtbsXDFbPLjresl8O0dwRsCw77xN0/8hAOAuPjwkc1
         bqLqMxa/Pc/kK27D6M0poJtCPHAol+UdlTstB3cbwFvm8GsWlNHr4sRnZshEjtQLRxtN
         If4YvuACK+NTldqvkxLiMjQXYY233gsB7MN5U8BG5Xypjeakg1sOMijrG2USosZjOMvM
         kXPT+kHvRrvY6ZILG9968mPGN8xoEi+yU5CV2cw+T1xNDOhGqFsVBbwyyQPbUJ5K6EFE
         qMBQ==
X-Gm-Message-State: AJIora8yjzcI85WrBXf5MgFI+2fajKr1dJ2JB37RaSrgjayVMOMjkrS9
	UHOnZLGgvP4098MQjHbZ2nwW2Q==
X-Google-Smtp-Source: AGRyM1t30EpNMhJshHyan9sCFogrNebskjDCdtDu7RD9nTf7m9a5w3aM9FmTOmPTfnxHw+fbPTOdUQ==
X-Received: by 2002:a63:6c06:0:b0:3fd:ae53:387f with SMTP id h6-20020a636c06000000b003fdae53387fmr20337064pgc.536.1655706837540;
        Sun, 19 Jun 2022 23:33:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a218:a2c3:eda2:6dc7])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902d88500b0016762bb256csm7733286plz.281.2022.06.19.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 23:33:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH] media: mediatek: vcodec: Skip SOURCE_CHANGE & EOS events for stateless
Date: Mon, 20 Jun 2022 14:33:49 +0800
Message-Id: <20220620063349.2754116-1-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_233358_436378_0E12C01E 
X-CRM114-Status: GOOD (  11.67  )
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

The stateless decoder API does not specify the usage of SOURCE_CHANGE
and EOF events. These events are used by stateful decoders to signal
changes in the bitstream. They do not make sense for stateless decoders.

Do not handle subscription for these two types of events for stateless
decoder instances. This fixes the last v4l2-compliance error:

Control ioctls:
		fail: v4l2-test-controls.cpp(946): have_source_change || have_eos
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This should apply cleanly on next-20220617. The other media patches I
have on my branch:

media: mediatek: vcodec: Initialize decoder parameters after getting dec_capability
media: mediatek: vcodec: Fix non subdev architecture open power fail

should not interfere, though the second is required for proper operation
of the decoder on MT8183.

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 62f29b6fa104..a5fbc0a1c6bc 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -234,6 +234,11 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
 				     const struct v4l2_event_subscription *sub)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(fh);
+
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return v4l2_ctrl_subscribe_event(fh, sub);
+
 	switch (sub->type) {
 	case V4L2_EVENT_EOS:
 		return v4l2_event_subscribe(fh, sub, 2, NULL);
-- 
2.36.1.476.g0c4daa206d-goog


