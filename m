Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1F8E784AD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+kMPwU0Ob0ztoTAttuAaSUVI1oC9UCyetrTZTEeb8w=; b=ZQ1MP9ZbEggaOYvmPOUg4aGTUY
	cV0nSlOXaRaSE1Et0xulozSWPob+/2y/GjIAxDXzv8jtro6PbkdaAjUAq3N7qc5AkSJs7d69J5ehu
	b4aJDQ6tlVyO1jai0fUX/5ikQmFP9ZQsn+nbyTWcqhm5ngAnGMrCMpT9UnfO7sj4u3O9j3Yw+s55W
	ap4iy+IEOAehEcKgRptKzNLRmlED/0Sh7gpdyvcR3UB+QwdaEyfCaWWOzP1yr9sp/Ie+kW0vFVvqE
	/iX3XXSGLsaD2He3VLr/MQmOlVyhv9dJCd+8ZfYrHugqfrUY9mEr8GJlurhJYEqMTLqlxTiugrekw
	yWyDUy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnIld-00ClnF-2u;
	Mon, 02 Oct 2023 13:15:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHh0-00Cb1K-2r;
	Mon, 02 Oct 2023 12:06:35 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CE336607314;
	Mon,  2 Oct 2023 13:06:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248388;
	bh=MAfzqnBElYsriZOe56F+JFfMksB0FEVAHWT7iRLKeFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQft/qs4HXHcaOnvsTV1VjfLtIR4x6frTn77MseWecOwzxMKmTVmft0lsnmGNa6On
	 2HHrXuVCR5s7Hz+C3s0duze8XZOStWWbxDTPaalTbQBpJs6j3dWDHIaGnD73gebmd7
	 3+rOKk6ULRfiOU5QMtOcVjjcQIPIXj3ll3GL095Dde5Ew0IhGFTXB9GBdZHsOJeOco
	 gV2pEqHk+/NWMDQclk3UM4QZu5U3iLMFDe6pBXtUXnKpd8ORJYhnh1iq8qPDBBzwrH
	 x/z6MLJINJYdc+eyeOfpDmgGIOMnc3kIv8torqzwf1Z6xa3WxZj7RAfye/0nZackJ4
	 /8O4PridKzwYw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 06/53] media: mediatek: vdec: Remove useless loop
Date: Mon,  2 Oct 2023 14:05:30 +0200
Message-Id: <20231002120617.119602-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050631_052756_5B9E4307 
X-CRM114-Status: GOOD (  10.02  )
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

Simplify code by removing useless loop by using video buffer index.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index e393e3e668f8..69d37b93bd35 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1695,13 +1695,8 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 		return -EINVAL;
 
 	/* update internal buffer's width/height */
-	for (i = 0; i < vq->num_buffers; i++) {
-		if (vb == vq->bufs[i]) {
-			instance->dpb[i].width = w;
-			instance->dpb[i].height = h;
-			break;
-		}
-	}
+	instance->dpb[vb->index].width = w;
+	instance->dpb[vb->index].height = h;
 
 	/*
 	 * get buffer's width/height from instance
-- 
2.39.2


