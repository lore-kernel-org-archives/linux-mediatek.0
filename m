Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98048C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a1kRYp57H3SphvzPRCJ+4HpSpBRT10VyUNQ+iboP6E=; b=CIVIdYyRFbfqXVnqnkLA4zy3z1
	Otq9eyJcNgJmTtOH7p0WdFp+/PyYbWETV8MagXVuxDTyNLa1O3GmMA8MjA0KsJzF+2aNViYXe3x9n
	PvM5IYzOgpywqvR0fsPSzjMACUHLLW/hHZU5dMBU2uY9ER4jAkW85JYjV6OqNx6NqbXSDDlQWsn+2
	UZJ/nnBhgetpNckR8YFhWM8sCXoOwQTUJ9tbOBmdHnVQXvz8Uq01EHfvSR4vwXK0yoMujLgj3yeYC
	F9YiJzXX11JkbqO77S4hbPQNNkpjbyFKm0iNXjTBGrc2ngPtpD46xld2vJm8Q8eLHml6x9n4cFQ47
	KG3WpGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxriC-005ebk-16;
	Tue, 31 Oct 2023 16:35:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxref-005c93-1w;
	Tue, 31 Oct 2023 16:31:50 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F0EE466073B8;
	Tue, 31 Oct 2023 16:31:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769908;
	bh=uLexcsAscd7+q7L/zlCLSkE5WS81tRYkOSdorkQDUyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4NFFGART040P4XKzp9TVt1UaGYgm5mhgNJAlDm/rEjNF4bWiA3dyIqndsIwb6SlB
	 E2NWfNsHxiGb2qsVdTXRCmN1vcxxUHfwdq5BGBijt4LjgAr+BPTkqD2zRdLUiE5FO9
	 evQAamez9FwoFD5/jhM4n4mjZNFqr3KNDOgoSnSIW0PSYgmTqZ+e7mGOIVJQSF8Tif
	 d8LTuO8VouqozgYXOw3lqQgfDw6pSLeLPNUfH4ZxC/GeHnEt3QJMWS5v75Fb+BYRYQ
	 baBsnRVuM0H4uPkhgZzNplsyQzmvyFuYxfq1F5sT+V2VwjqAR3Nre/kwXCEfDaA3fx
	 uIpH2PgUCeGYA==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>
Subject: [PATCH v14 23/56] media: pci: cx18: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:31 +0100
Message-Id: <20231031163104.112469-24-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093149_764898_1FC6381A 
X-CRM114-Status: GOOD (  12.28  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Sergey Kozlov <serjk@netup.ru>
CC: Abylay Ospan <aospan@netup.ru>
---
 drivers/media/pci/cx18/cx18-streams.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..cfbc4a907802 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -104,6 +104,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 			    unsigned int *nbuffers, unsigned int *nplanes,
 			    unsigned int sizes[], struct device *alloc_devs[])
 {
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	struct cx18_stream *s = vb2_get_drv_priv(vq);
 	struct cx18 *cx = s->cx;
 	unsigned int szimage;
@@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 	 * Let's request at least three buffers: two for the
 	 * DMA engine and one for userspace.
 	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
-- 
2.39.2


