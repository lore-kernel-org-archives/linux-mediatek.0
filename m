Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4790BC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grZYcCs+CRpavlSkrwpnVBkkB2WV5CvizTfGvJ8bQo=; b=SfoOiO7+O4k/lST+N21gSAWhY3
	Uh8U9ehI6YZlyFLKO66HtobhI4iHjNibHsbvd6COljq0d/93HMOye8rWh3j7Y1ibiPGuX3XjBu+pn
	nnfZDessQ6gSVQHzqf61ASvdfmUMA8Dz/tq7ieokE0Gk0kAUEXizSr5384hhr4/mYIipWD1NPf/Em
	Cj/sJEEEgJI2W3uZi4g8iMUU8CMGx6fAG1wPJJ5avxp1puZ1BZift3+PTg5FrnaPhJVgwQWWNpalf
	Oqif0OfyjKqJ9LJ+m6IcqGH0xvMbKcgjCavu2msjZ/jdY03Y4YakSo9eZZnjGc/TObsIKdaPEwW34
	aLMjfMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wIF-002tE1-B0; Sun, 18 Dec 2022 16:13:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wFt-002rr9-ER; Sun, 18 Dec 2022 16:11:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCE6B60DC8;
	Sun, 18 Dec 2022 16:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13194C433EF;
	Sun, 18 Dec 2022 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671379872;
	bh=OPvkiT7QvUdo/gNXFO9oYOmBeAvWlq2GcTA3WpacEwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nXSO/KEWGncG+FZEbPuG99CreR0ou8KUlULcbGf9HQfhIiBar77xVhmD+gMYZrEnY
	 H55/Th9q01pwK8qKcrypjZa7jngLCaGgjDRF3OM4N0diJ3bPXw4FchIiTikcpDN22m
	 BKkvlxVUIyugd0t8Y+pgT/sEolWc/oBofP7fq9b7r30Pk4ObVJv+cpW7yBD/Dmg9Sr
	 ZF0caud39mOfdUnIZTmFupdatvxB3kzahp5pUvDTL62cz6dZms5InNprNYWKeRg+9f
	 LKtbao/zO3xXi4E91fBJVenncaobll3k/fH0Zzm7/RW6k3brPNkVRIjK9nWx9TFZ0W
	 7ZadX3Vr/oCQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 53/73] media: mediatek: vcodec: Can't set dst buffer to done when lat decode error
Date: Sun, 18 Dec 2022 11:07:21 -0500
Message-Id: <20221218160741.927862-53-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_081113_740241_2760E363 
X-CRM114-Status: GOOD (  11.54  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

[ Upstream commit 3568ecd3f3a6d133ab7feffbba34955c8c79bbc4 ]

Core thread will call v4l2_m2m_buf_done to set dst buffer done for
lat architecture. If lat call v4l2_m2m_buf_done_and_job_finish to
free dst buffer when lat decode error, core thread will access kernel
NULL pointer dereference, then crash.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index c45bd2599bb2..f41a3ff17b04 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -250,7 +250,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
-	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME || ret) {
+	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
 		if (src_buf_req)
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-- 
2.35.1


