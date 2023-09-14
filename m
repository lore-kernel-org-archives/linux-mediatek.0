Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D6DEEAA47
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etuGB0ig+YfwOMH5DMoCx2e3o/bVGJDuPKqvOV4n+KA=; b=KnMj/l8Z9DA9fqQdBPu64vQZ45
	uU5etI8MQmlMUvzeYrmIppYe/2qG+rXsXIHBDAVqOyiJfZpphuzBPodzqt+FjlJqYB7fImvJaI2NO
	Okid4K3TzlCbmnDtrJx7lfqTVu+DX1WnXqNttxGCTRA+P1IZXaO+/h/K94+GXvqeOrHhbsE4AdnD9
	X+eSb1pbc7kZQAHB/MEoRJUucCaj7NqlFgAAlgNp2F0XEt76T4NJKFZ/zgPZpjQK5faxBTdotJiSR
	OZu3z2lIfQaTE9GgQiZ+xlwjbqUfjOB7XHqFV4FRtqEKEcouMuLTY7GtxKqP2RjCMuM1F41X49iC3
	zBYGOgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmU7-008T0m-2Q;
	Thu, 14 Sep 2023 13:34:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTY-008SIh-32;
	Thu, 14 Sep 2023 13:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=etuGB0ig+YfwOMH5DMoCx2e3o/bVGJDuPKqvOV4n+KA=; b=EQHitIrmHd89alXiIMYSRQemPX
	hm5s9IHPDg1XqaTSVueNO97hBiB3t8JMpL+xF2Pk6sNpnbjIPhWwVwBBgJotEBmORoMoicheAQsMM
	noFkiSQeAmqX2kNqH/riHjmFGwvHbpCR5cvjyxnlMkEwU0n2hZOSaWYiXRuUeDm161hxY1bt9SBZH
	l6PMKNaHIr5EnBdEDpfdMPjR7zGUonW//CCBrP6DTPjQgALw+Hw54IsS7FkGSGxcO9ixXKFArM0/n
	0tQj2gkRjK55G7DBk4Ad+X2oO7Ux0CNrTxR3bXY8cBXiqJRlwtbuSv4vNu0byG5gyL6N5o/72d18E
	gOQZ/kSQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTT-007ueT-1b;
	Thu, 14 Sep 2023 13:33:43 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D70C6660735D;
	Thu, 14 Sep 2023 14:33:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698416;
	bh=X/zFB6sk39TwCWXEBFU3kr1spD6NOhpHJy3eiUrcvDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhAr/pB+7jbK98HaC+CDXBPJxwbrA0EolyLkR2rr5/dJT27A0JoXzfwYFPiOShKHt
	 8HCev71j27Y1iYDhKVPj+CQloPTiEuUjz1v4iwwqXUwdngyRpcuZMBOk/nLqQLOb9N
	 fVLnOf+Yx+D2DhJWroHcWEz8HDJbiMyjaIf0/sLaQB8liN4SPnoIdRF65dP/8Gupfv
	 oXsJyZgLktFfPZZ/eNruXdL8vOSjLdS1XhnShSbcLfqv1Boli2/LvJ4MQTbqGDD0XS
	 ebcWjbkSBmXSy/HXcwWu8If/ImAn9g1XyyhIkfwyUTFv6dPP896hNr+fKpjoVFsFeo
	 r04qqUCp/56Mw==
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
Subject: [PATCH v7 09/49] media: atomisp: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu, 14 Sep 2023 15:32:43 +0200
Message-Id: <20230914133323.198857-10-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143341_304092_74FC1775 
X-CRM114-Status: GOOD (  11.81  )
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
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d2174156573a..4b65c69fa60d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1061,7 +1061,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	if (ret)
 		return ret;
 
-	vb = pipe->vb_queue.bufs[buf->index];
+	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
 	frame = vb_to_frame(vb);
 
 	buf->reserved = asd->frame_status[buf->index];
-- 
2.39.2


