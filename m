Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0CC606A333
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hfiYlMun;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=U0beiFXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PDC1fhjsa3QM5vrQwmV+yrc+0aimt45h5AKiKFkWU8Q=; b=hfiYlMunb2SAb5EPOGnFvbl4Um
	Hxepq2GZ/krWlWm7n7U8MDYrFBlr4Cw2jmeYuBYqJTMRx+kOgBmFzryhmaZmjzUaBXmY8SBA+oKWZ
	qX7XwA7h2urzO7P60+qj9HThqZp7Tu0NNz5WnPLoNIoLtvq2bCJZsbxoVf3S/H730cqpyLXWOfQL7
	p+PB05CgxxH6hw0xmGToHEggY6gEQgtnlGOWrjraM4yzrUj6dz7xGLU6w2HhGZtGlYJhO7O7fEGJf
	wVb/tPdXQJ8mEDjspOZtVoeLs/xXvqqxMeqMgeJQw/2e8tC5yi31BzqLq7f1sHxmX4yPw0oniHHM0
	WvPO0z4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA3z-00000001K3R-0a2y;
	Sun, 22 Nov 2026 16:05:11 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA3w-00000001K30-15eW;
	Sun, 22 Nov 2026 16:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PD
	C1fhjsa3QM5vrQwmV+yrc+0aimt45h5AKiKFkWU8Q=; b=U0beiFXg5dtSbq4xwO
	FeX0Dr4wshH106OW8dCmMftUxWSNuCARKZGZFjwi5sPo5oeKR4GSiaN1++OepKQk
	mAQb2a+lB3Aw0FVP/PLchxuEfCvZwLUttydXnSeEv2QS8QTBR1FVg7VyDC4ozdG5
	R4NgOs7kB2xehGwIqK3z7EtNk=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3_0KZEgNrPMaTJA--.51615S2;
	Mon, 23 Nov 2026 00:04:41 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: handle request allocation failure
Date: Mon, 23 Nov 2026 00:04:40 +0800
Message-ID: <20261122160440.519843-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_0KZEgNrPMaTJA--.51615S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF13Cw4DCFW8KFWrJF4rAFb_yoW8Gw17pr
	ZrKw4jkrW5t3WqyF18A3WUua45C3yfZFy8G342vw13Zr98XFs2qr1qya4FqFZ3AFWvga45
	XFnIv3sxZw4jvFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jG-eOUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7RpGlmsDEpqdyQAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_080508_748987_E4735BC7 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fops_media_request_alloc() returns &req->req even when allocation fails.
Since req follows struct kref in struct mtk_vcodec_dec_request, this is a
non-NULL offset pointer. media_request_alloc() misses its NULL check and
dereferences it.

Return NULL on allocation failure so the caller reports -ENOMEM.

Found by LLM-assisted static analysis. Build tested with allmodconfig;
no runtime fault-injection test.

Fixes: 1b78aae6313f ("media: mediatek: vcodec: Implement manual request completion")
Cc: stable@vger.kernel.org
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba..626c8368b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -736,6 +736,8 @@ static struct media_request *fops_media_request_alloc(struct media_device *mdev)
 	struct mtk_vcodec_dec_request *req;
 
 	req = kzalloc_obj(*req);
+	if (!req)
+		return NULL;
 
 	return &req->req;
 }

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0


