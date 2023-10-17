Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7067CDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUzjZA489/+UwrvFBWnO5FhMcqK8gCrGIVm2rKTGExc=; b=YpCu/zwJ77KgVU7V9HMYnEhklR
	JlJ23F34Ehd5nh/dDS9wQ5m87lBzndFszNj7GlgJimzRW4t6bXodDQ+Fzw3W8DQAbJFcEbM1IyfEw
	optpN0kZkzdRQ2GwX69voRQH0PiCa3GjldVE8WdBUUq+kTjT24CXKGGmjNhGBQfABs6MQTlntM/sW
	Lesr3iWVQZ644piILZw/+xBZ34etgjwWPERIvknxGv3ZijLIEXb7SONllVKtmHp/p6Pj6vtz7lC5l
	fMDDmj3BccQaU8tnQ826U8e/2/+01hXJX66T8dpBOmTExMJd/N4G6y4T9WAD288xA6ceYJV6FCDzL
	Y02y+LPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslOn-00CazI-0F;
	Tue, 17 Oct 2023 14:50:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMn-00CYzU-1x;
	Tue, 17 Oct 2023 14:48:23 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 54E126607375;
	Tue, 17 Oct 2023 15:48:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554095;
	bh=XncDOWWMuPZSxD68Y9kDXDjEfVt/yc45C6+oTQD6xKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eugusbxbRhpH6t3IJEtRO10Utlf0w1h9mdOPq3QxSjGG4IQpCzzJ7//dscMwfNzA+
	 hqC73V8yfPK+JiOrY3cCPS9xG/d69omFGiN0r3ZjPF+Mp2i3+7qhGYzzoUf0CPZL9I
	 toBF4q5txeaIziTdACljNvBHmTFM6dknaxipMlOoEKG1EL4Ix3wnBotEMmmTFRDMj3
	 0+/JNrEisC0ml2sF62HT89yQVvC23PIEkYsLfQeoCn7CfiIhXtOzfK2pZblujEBMu0
	 djACjsvHNL/BTCpWmJGhUA3O2GAMgF2isfyysq9YATncOnO69BmawkJvlCkMEnaQwy
	 SiHpLPD9ahdOQ==
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
Subject: [PATCH v12 23/56] media: pci: cx18: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:23 +0200
Message-Id: <20231017144756.34719-24-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074817_815462_334A525C 
X-CRM114-Status: GOOD (  12.71  )
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
futur.

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


