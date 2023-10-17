Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B2ECDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7NXFHVQwdwGeabgubPJby4luHYSdaHb55HMgbrWPTc=; b=UE205eJCwHJEeNiUuIV4yLgXDg
	PXJ8/MMD+k8BfwkdVu0y83HocfFlc0nx9ZkAMOA6fy9NoG32Tlm5qAvE0IhhQMAW8liW4O3ZYbm8l
	WTBe3lagoWtU7LkEieMWfPBpueWxGpcZl5CxLxhm5GflqYkL4Hu3Yq2qy7bZGtZiznsA46bOhJBMf
	CkpnwjtRFRm5wI2D6rT0Qte3jjrAkwG0aklM7oRvZxE6K3YGZl61eifjJ0ut/baYCuCj4UnA5z1NI
	AT75N2smdKs/udNjVuu+h56Tw6AWDjl656ro2T52GU62SXnvkpIwVA6bDNNBr7/V5nptzVLvSaHHH
	deH9kJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQ8-00CcYx-3C;
	Tue, 17 Oct 2023 14:51:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMx-00CZCG-2X;
	Tue, 17 Oct 2023 14:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v7NXFHVQwdwGeabgubPJby4luHYSdaHb55HMgbrWPTc=; b=cUqtUuK88YJA5bJlxo/j6e4jCF
	eCdl7hvSrTE/iWzWMXTXGPGLhWd39O4FRfZfVFbxUgFwfePrdm7VRgvUCcTesNA/aXJR/IqM7yrtO
	tvwoAyoStwoxP5My9t+e3JwysKGsaAyNdtFAJCHFKcvP4XHlIOgfL2RL5TYnJoIfbJiSXQz5Svrp0
	BHuT7RGuopua9fWvp1rgjTVpi1hiXxS0fEKOvmySJ6cdvSh3RGfQz6hmY8EXEZuQPpEiWZ1e8F/Ro
	15rTcHb5sGodli1uwKB/MP+vkZPzFVmF1SXmVGA0jlRhuZeYoaJnKscAArLzncEsG9QjHc8zBMntB
	Xjtarl2w==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMt-007A0x-2V;
	Tue, 17 Oct 2023 14:48:26 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D1876607398;
	Tue, 17 Oct 2023 15:48:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554102;
	bh=Foqc5QyIJmb0Aaq5nt0waATwOxNkpLDzSOJ9RgmLd6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fgh03lBcV8Gt2rCcKiVc9WC8Y8sU92DksP8O4rnrBSODhibw+0IkwitdhRaTT3N8H
	 zY7p/J6gMbQZMBaCLf+aejbEgg+UGtOuB2a1ZsXtAeRmuxnQiAfHl6GHW8zUugm4Pf
	 fPT/xvgRbWXd23VmgsiLDk1iMh4fO0bhowTFYvOhJDqW1y2uhlcVCcm7ec6YeT8J+1
	 QAAj01P3UupAYnpRYfMcaj42dhscS2k5H9gVXQP0a/ryeQ9pfK28pX76nVfrMwfYkz
	 k+112Dz+x0njBfa2NH3OLB1y0uMqRn72T+2iN9oiURalhvEc1M5dfzvITyymmfpyGu
	 gNoi90AT1Ylhg==
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
	Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>
Subject: [PATCH v12 36/56] media: nuvoton: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:36 +0200
Message-Id: <20231017144756.34719-37-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154824_025646_9E73D62B 
X-CRM114-Status: GOOD (  11.63  )
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


