Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9263BE784B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHOt7PQRA0EqPTIJ3sJv4yUzGbHmzKa5gMgXsSJImO0=; b=y+6YB1HXxtJY500OIk+f9p4oSU
	YjNpnphjFUHjgTCNEBJkgK5dFQz1lUNsegeJWn4FxyGQ8C4n4RW66WQsBnasLXpyuK5bPnbpyz0gF
	EM6h4Zf8tFCm7XGIpLtllYI8jO2tZFUb5fqt++tAse97Z/0tlMM1xG9B0hhAJO/AuInRXGv89fYgm
	y3SBqd3Rjgj4C/unKAqgFzcgNAH7OPZ636wkp2cF4ZeD+W/gXutNe5wfTZglhfvZ3gtG56DgAXP06
	g7JGlo8mygsIPGvcjKBu547vMVIhxQqSsvIwMLm+Gc1MZOgSYKbAq5EE7NlxqvPKRLaApxVpj8kyR
	KVs5QleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkL-00CfHX-0V;
	Mon, 02 Oct 2023 12:09:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhX-00Cbg3-1E;
	Mon, 02 Oct 2023 12:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FHOt7PQRA0EqPTIJ3sJv4yUzGbHmzKa5gMgXsSJImO0=; b=e9eJCS+76wZTE3wnE8wRlEmTWu
	1ACBU40vJNWPO0mv21UOl8+3fTa7Tse2QC+SRp26FLRARDUHDZ5YZSOyAZwu2F0dkktu1SuS/uvtN
	OL6QPsjFQ5Z7uBVvBacNysDwrqC+bNH+W5PdCJm4+69WRr+HUSP1wj4Jh8fen6Xg/YPiMfbQNnf9k
	WXtM6NncLGDlKCgtbnkMWQ/Z4k32mBq71gzkZnjuHL/kVqBEBagT1cuY3Jl7SprkI/jvyXK1XssKt
	0aAvOBHbw17JK4Kz8MLcqfOS+3AqJ/pFgrRJxz1pTCGkFwFJv87R6n74mKWKWxmNDYG5W8qJIAm/x
	aOzSt/Sg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhK-0090RC-1G;
	Mon, 02 Oct 2023 12:06:59 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BF436607363;
	Mon,  2 Oct 2023 13:06:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248409;
	bh=uwQYrGuMm2ejNz+6p1iPg1BLomW4NJekCoZt42bzvk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MDYUG4DDIvMnA81tBRyQL+62Dtzm7dhbo+VkEpsEkonVOHRy4lBK1QTWM7q0AeAlk
	 srMl8Xek7F8frKaTkr0D/igAmvkmJOnOtdH+6oAhRinguykOu2Nh0eL9m4nNUjgXSc
	 f8d3Wx3R6T4ujvWucUzCMbNT7keNhVsxzffQM+mkkWTpYCtMANOs5gCSwUfbZS0Mog
	 0OKEpgC8jnffmvaBPYZ/Y0uyq0KGt1pbmDfehxdFxK+c0I95C2PvzuqS+bF08W/zxY
	 IVTdYg2/YjiTTdzQjIVC0bj1qc/LxBLAjBVJ0GRD3FD0y5Gq01UgWFwG+TVWKZJYB0
	 fZSHtvO6lYKow==
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
Subject: [PATCH v9 45/53] touchscreen: sur40: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:06:09 +0200
Message-Id: <20231002120617.119602-46-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130652_754945_152A1DF4 
X-CRM114-Status: GOOD (  10.89  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/input/touchscreen/sur40.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 8ddb3f7d307a..e7d2a52169a0 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct sur40_state *sur40 = vb2_get_drv_priv(q);
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 
-	if (q->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - q->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;
-- 
2.39.2


