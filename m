Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8D8E82CA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=k0iM53dcYMTyqbpAx9VcnfYrcH
	ZLdDKUrmGerQnpiv1bCH4UuR03LZG04DouxzdLNQZot7hdRncTIvQcVAU9ac3OrvCj6zNjmb4Yohv
	tlluY/mM2rXal9Kj+WW6XprhgCz5e1NV1aAlq7/5Qn9Kl/lqrVUKEeSomfnPux5br/JN6wUsoPwjG
	iDHY6WZh+yw0OIjOLC/II+8UD1hdVyhYS0Fr/uif3zHewB7I1VpNkxMD3PCpJ9RttE4GuTHQF/n47
	1Md4kzvqXRr0de9pgZOr2v0hgJFPY4qwCMCU6bqscI4kkUVyKFpWtEZsNcrZNxieKrZuhFKq5WQrl
	Lv+Z0POA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWc3-001INO-0L;
	Wed, 27 Sep 2023 15:38:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaO-001GT9-2L;
	Wed, 27 Sep 2023 15:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=qKtaYaoJrCXWT8ITJgSHTz5Cki
	oyrMep83VPA6rX7f0Ix1Ej0whDCzxu8ziyozRBmD238UDV+QxcB8kkheJwlAJYBIBb78PTQV3b9d3
	IjXvuxXHnjyZLsiVAYsW05/c0HurGEVntmuGHrRpF6lv5qtf7XCp5QP1p57Ifr+E11DrM5Auunpk/
	g2k/wsJdxshIvqvFKYYR67Q0rNpwhTbDR2nnKtDfXTxY1nrL8V4qFJo2bXQaCvxk8G0udMFreEgEz
	Gas7uLldJXARX16f3ZOZ/8r0WYFB/TTLaw3dFKVurj23MY2CObNxK4AVnCo7g1y55yxO0ZKh/8cdL
	AuO8oVhw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaK-004025-0F;
	Wed, 27 Sep 2023 15:36:23 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D9BA66607359;
	Wed, 27 Sep 2023 16:36:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828980;
	bh=7OP/lnsbD5MzPZ4L/gceSmxIzda3Ng9eLtu0phjni7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IxIyfSHJ44tLlQoFsxviRbbUq6rarZAqls9wdxqoNbWuAZDPqeXVRCqr+OY7PRns/
	 joe28B6uA0yz7N8orO7KVeScGvNdsbx0zqGumSsZEGBNDY0B63zorgBu+CuFC8BMWy
	 zD8DnZER8lhBV9VriT8t5LsbiklO9NKPwszDTRsiWsWnwxnUHYWs1M4RcYJm2M9zWQ
	 H6XLWZqPWdbiSvGKElVLHmbuXFiJezP46H3R6qwMLn4UJ/YO+byCo4LKcPMbfdLNDG
	 1hdhwZcEk70qKi01OK0ZU2CqmE5oGTUD749BGA5yF9pNP12TFX9DxPVHq59QjY11+t
	 iuS7rZSf1AJiw==
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
Subject: [PATCH v8 26/53] media: pci: dt3155: Remove useless check
Date: Wed, 27 Sep 2023 17:35:31 +0200
Message-Id: <20230927153558.159278-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163621_600393_B2152BD4 
X-CRM114-Status: GOOD (  10.01  )
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

min_buffers_needed is already set to 2 so remove this useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/dt3155/dt3155.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 548156b199cc..d09cde2f6ee4 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -128,8 +128,6 @@ dt3155_queue_setup(struct vb2_queue *vq,
 	struct dt3155_priv *pd = vb2_get_drv_priv(vq);
 	unsigned size = pd->width * pd->height;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*num_planes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*num_planes = 1;
-- 
2.39.2


