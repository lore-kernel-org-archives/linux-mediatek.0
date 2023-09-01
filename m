Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC671CA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxTytmhcaGqQ6TxTLxs63nIblD5Z31IleixuR2BXvZs=; b=XFIQaRiFN0VCbiIRpWW4m6lVjX
	ViQAT95hZQTp1cyWTbbVE+Sb3BEG/mMmCL2mxx906AESHWhnGy9KM0r7UhTlX+E37DFg0G8TfiZSf
	23P7RKpBSebPzK0+qLSCgYqTCbDnMS0vQ4P405QuuPSINnPIUKlv2XWjj/ChhBpYEeqvjlXQMrKIN
	7QWf8cvK4xiAnpk2E1uy+azpqnRugX6MCDOETYwNbKSWGNZ3/OqincNwy2LzRSoUltFmaBvfN6OVj
	mTpamr/I2iwilzcOV/L8ktIhmXJ78rfter6vT8s9Zft9tAQLibnMYqXv7zZ9mIw4PRiTPi4uCYzW7
	3pp4WuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3W9-00HUjQ-0Q;
	Fri, 01 Sep 2023 12:44:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Vl-00HUGr-2P;
	Fri, 01 Sep 2023 12:44:31 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B08366072B4;
	Fri,  1 Sep 2023 13:44:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693572268;
	bh=AbX8Bj09PnboIxD2raU5YodRf5hnpL4JGOUWd895O1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKaHB01DDM/qeZqGhpHRx4VVHepDgXnNOHEmlFSLZ4sAE/HolAL5dt7SjPsgWwj9T
	 neBi7yrEqkBoJDSvFkm22sxUAkdutl8nf8Jpa3SUnQ93+FK7Ew5m9JJqwBDpQnalTv
	 mROUIoeKMCp4qoU+Hi2xvRZ9AnlXHYJWZdyNzH9BS4WS4VYOjiUZxoLd222dEUbdxE
	 4rPG9drVUhY4efMoshHh6uJV4f2qYFlok3O2nQeOF+iue0jbFEmjmsrrA0+ewGdHsI
	 WF8bL8a/2xxTpEukOXC+ZzzFfwlIJMdkRbT2CsEoxshKXxu3FbSQO5zJAHA+lS2NNK
	 xO47FU45LgUXQ==
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
Subject: [PATCH v6 06/18] media: mediatek: vdec: Use vb2_get_buffer() instead of directly access to buffers array
Date: Fri,  1 Sep 2023 14:44:02 +0200
Message-Id: <20230901124414.48497-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_054429_907977_F9C6D076 
X-CRM114-Status: GOOD (  13.54  )
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

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index e393e3e668f8..3d2ae0e1b5b6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1696,7 +1696,7 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 
 	/* update internal buffer's width/height */
 	for (i = 0; i < vq->num_buffers; i++) {
-		if (vb == vq->bufs[i]) {
+		if (vb == vb2_get_buffer(vq, i)) {
 			instance->dpb[i].width = w;
 			instance->dpb[i].height = h;
 			break;
-- 
2.39.2


