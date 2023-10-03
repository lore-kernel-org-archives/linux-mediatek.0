Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BDE75433
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmW7Z5NzQBNoTpp+u7NKXF/tYEVc6UqlJQkmg8Bhq70=; b=D98Rbn8KvJhhnx2SRxr80oZT8O
	cTcqPPx/bxwDsfqavo4gsJSRZL0gpa5R+/2oqOC6R/i/4QUsNVbyEggpynThx9SGeaRBFqpazOrtl
	qRWMt5RCaUUVLWyNKe/Zjtfa7DOUg3yUfulvU34VKa1QWM3sZBoZ8QUQPZOtBR8SA7ZBnCQenww+k
	q3+muphE//aJU4GJRmBjLoYa4eM1XupwAk++9zTlFysZN36a0wD2R33PuM1+2Y+PwuAfPfb90GGCC
	p0dlxBl+dZISvD8g+V4m7N8zzWYSaaiwqAjk3EMrFcpYgs3O5vhK0sXOq2x+BGNmOCYOKOhWw4eV+
	6S4AXT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSe-00E4ov-1T;
	Tue, 03 Oct 2023 08:08:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRJ-00E3Lh-0j;
	Tue, 03 Oct 2023 08:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PmW7Z5NzQBNoTpp+u7NKXF/tYEVc6UqlJQkmg8Bhq70=; b=GxMCh9btQD1eBnxJd8xK4NLioG
	Vh/hdt1cZcb8+GzyQ7dxmxpIYj3I3KWc7hIunjnj3OHHkwlWiJEAbqH4CV91LjL6OZen81e3+oi+b
	pghSd6dYCzIc976LV0zQgkQP9dXB5pQH0TprsZ5RMGUqbM2pfISUBX4FWYf6uDgdsS0npgiDxbeQ6
	w1Q05ZGAkuG4ph+cGYErw9Cf/icktmaKuDXtfGnGMtZJKS05zxp2v/Cmvpoq6liRNJmfhg9rdkgda
	n3doexKh32wjwrVPU4XlR1rhNgZ3Ld0oOn8IGHEt3EI++Y0MGEPcSPROaovhhPayzNWgAq58fEA+r
	1W260lqw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRB-009jqu-2W;
	Tue, 03 Oct 2023 08:07:31 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2E356607355;
	Tue,  3 Oct 2023 09:07:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320446;
	bh=rFkYvrsLIxo1F3JyDJJ7M8J5xfn6Sk0yrCHC7ra2U7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c4FiWMZ2kFjTILE1eg1120K+BXPvF5F/v+HIpp33sF+j1YS60kO5mDxH3FlaLKGf9
	 rvzXHc0UDuQx4/vH5a4AkBQViE3sS5Qrpbv+4CnVvr98HtxyhHZMrhMaZxq0jdAmWh
	 /JCKL9+vS0E4NJYHBlZz2gF4kKLSS4Bpl1ww6NMEcEC9cIixykT0hLuUtYy21yLD/W
	 XyV1SuSLfOyoCuFBNYhTninS0fvTzjKFIA9g9cuynZlEmBMHZIYUStFBFr7f22LW6I
	 HPed5c8iPsyG24jMEoWPbijycjJBVJeWovNq3QmLzeANFLTEZENDKwQgMz+yI8SyTY
	 69vhnyRLrh1uQ==
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
Subject: [PATCH v10 25/54] media: pci: cx18: Set correct value to min_buffers_needed field
Date: Tue,  3 Oct 2023 10:06:34 +0200
Message-Id: <20231003080704.43911-26-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090730_087876_72C55C8E 
X-CRM114-Status: GOOD (  11.27  )
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

Set queue min_buffers_needed field to 3 and remove the useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/cx18/cx18-streams.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..6ed2c9fb882c 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -117,13 +117,6 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 	else
 		szimage = cx->cxhdl.height * 720 * 2;
 
-	/*
-	 * Let's request at least three buffers: two for the
-	 * DMA engine and one for userspace.
-	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
 			return -EINVAL;
@@ -286,7 +279,11 @@ static int cx18_stream_init(struct cx18 *cx, int type)
 		s->vidq.ops = &cx18_vb2_qops;
 		s->vidq.mem_ops = &vb2_vmalloc_memops;
 		s->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		s->vidq.min_buffers_needed = 2;
+		/*
+		 * Let's request at least three buffers: two for the
+		 * DMA engine and one for userspace.
+		 */
+		s->vidq.min_buffers_needed = 3;
 		s->vidq.gfp_flags = GFP_DMA32;
 		s->vidq.dev = &cx->pci_dev->dev;
 		s->vidq.lock = &cx->serialize_lock;
-- 
2.39.2


