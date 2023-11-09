Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468F2C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS9+eso5eatmsSQyFaoEUuc46h6DvsfGkSyoBWRUTzw=; b=0EopRRbwa43htEqGI3z5mkX0BT
	VitiA3QEl90YclDW6EuKAJAQyNpTdVxXxO9HfBXgSVa4/5XZnREVvhjspO29ETqny16FvyfgCZ0x0
	A8Owj7Lw5+KO1LAoyd9N33F2s2bDLhuezs70ojFOpNu2rPDFFdwpitv+wZsPT7QoFIw8aH/bMx3YF
	OzB0vBmu1JSBDd1c26RcFrdzrzv5qdIm/0IVO0/hd9rglvxSdpXNHMpUNOl2YGrrBQKSI/A9E28PC
	CpXYwG0Kgbig/E6kQRxrdAuZNZEn+evau++o5r4EG3G7tw9W+EMRh3Le0V4VNLZFZdoKo+iRgRtr3
	oyzAJvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r184J-006nEs-2o;
	Thu, 09 Nov 2023 16:39:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r182t-006lgO-2Y;
	Thu, 09 Nov 2023 16:38:21 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 72BC966076B6;
	Thu,  9 Nov 2023 16:38:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547898;
	bh=icIEMzQ+RwB59Jl10kDC7CgLWypuqx+VfcABRr9QKPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U40cbzs9hNmHZkWxyQlsq/09wxgfgR/YTwDNOt+AgX02GYgF2NMwzxzYDQ15RZFfi
	 YL5LqnoVzitubdhD8xWZVo6H3p1waYq2GTusxC+4b2kMX+4LmqNSJYuIjbPbfYuias
	 hjLofx75zEoyYl00J2afyFnUUikv6wwSylZ+G/zCccmsda297EkgBL/5Fl/Wee4737
	 Ln/XlJY1YlNvy+fLvqtP005Qpvxegvfs6PGe4JPbRya2XL8VxtheUZNb8swA3XtoQv
	 KAPgDbdshNYo8hFwOD8BnRQNIPx3hx6pT7w1rfMPCGj+1Ern9zeJ6p9OIR5TD69CDc
	 0rEqslto7iViA==
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>
Subject: [PATCH v15 36/56] media: nuvoton: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:34:52 +0100
Message-Id: <20231109163512.179524-37-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083819_979342_C2E93110 
X-CRM114-Status: GOOD (  11.53  )
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
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Joseph Liu <kwliu@nuvoton.com>
CC: Marvin Lin <kflin@nuvoton.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index b9e6782f59b4..f9b4e36a5175 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -393,7 +393,7 @@ static void npcm_video_free_diff_table(struct npcm_video *video)
 	struct rect_list *tmp;
 	unsigned int i;
 
-	for (i = 0; i < video->queue.num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(&video->queue); i++) {
 		head = &video->list[i];
 		list_for_each_safe(pos, nx, head) {
 			tmp = list_entry(pos, struct rect_list, list);
-- 
2.39.2


