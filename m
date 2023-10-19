Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BBBCDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Q7ZrRRCLUX7MQga/2Jp1mB9ALimtGx2XcWFCRhpmxI=; b=hLk0XkCliFtriEqof48Um/ovsm
	m/IUCadT3axsHkAwCOI+Mb6BYkKoNw2648VzxrZSeZI22OlQUoLU6i7jUubduDCGTPBh20Vyju8Fj
	hpOXUIWF1uvqa//knqfdym6fMoSf3W9AY+GnNngOZp2kV0hpPng1bcfaXIV79aGonuQmW6HKrw3UQ
	X3R0lOMhwBywN4Opw8zgtoGNNaX5IeiJBVEbE0xN+Yj5NTmIPUyv3Fhzse7B3NAxIrnuS97rdFKvV
	R9+hsMhJbgoFdVW7lBrcVLS4g0rdCd5LlZmRvGsUhlFuPWNLfgr6CtVNWLl5HYQzbXpA/5QoNJYt+
	ZWAOMsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSZW-00HR2o-0B;
	Thu, 19 Oct 2023 12:56:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWM-00HNma-1o;
	Thu, 19 Oct 2023 12:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5Q7ZrRRCLUX7MQga/2Jp1mB9ALimtGx2XcWFCRhpmxI=; b=ilJdLf7L0qUzSxAgyLDWcqoKju
	aXLm5KquLyTbp5TFk53FEeoeMKketYs6E8gu6jIYrWhbHytrPIUZdGZRlqde4WhxOiHJi9EwAXqAb
	5j1Dr+Y3KTNnNhZpdBQ+A5t49UPvA/8KrZA3bzXPr8kjLFEuK+asC/UWFVc29mJoJohpPFvR+DwsU
	uqg5VPN8SUtZ4dK3PVPwbVxijUBqfwccRvVv7ohd0lTGvBQUkWJNq+w89AbtoqoXDsgCRcI2hK2Hp
	YDgiwQky4VI7IDiB9on/PTOb2Rx/lUqkB/BJKqePOpzyfiLrxkTwploOWkvgoD+cTbsGwyzuG93Xy
	lK284XjA==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWF-009rWh-0B;
	Thu, 19 Oct 2023 12:53:00 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 018E66607384;
	Thu, 19 Oct 2023 13:52:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719972;
	bh=nxe8x/V/1l6XolEQlUJAmFRKBPmiBgQL0drOV0CYbaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdK5aBWyfabr1RW/jjBwqQTxhdaELhBbiycWFPsGous3728mTSqIx/Kh+QUSaKSzV
	 IyFmLQgPHSLU5DUGq6znakUf8WkESd4TLCYVayhHMTgSd6eI0zEGsmlo1SehDgHZ1z
	 XFIg/8WQ6cXLjCdowQS+Q/2UcHAkbLUgu65RRGnvDdmOua2wuAv7pLH5c4Jfz+iMcH
	 2ZJfLecKts54kV81qruNRYiH6bGUasmwQXZs5rZt6lFxvlThx6usG5W3gwgCkpxNt8
	 vdbtaUtHiQnVpAk+PUjQs/uAFikNmL0Xx73nofVT7JaNel8Bj5DwQ82Vme1sbXjC/G
	 TldwfP1mlOVVw==
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
	Antti Palosaari <crope@iki.fi>
Subject: [PATCH v13 41/56] media: usb: hackrf: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:07 +0200
Message-Id: <20231019125222.21370-42-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135255_242869_A720428C 
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
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Antti Palosaari <crope@iki.fi>
---
 drivers/media/usb/hackrf/hackrf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 3e535be2c520..9c0ecd5f056c 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -753,12 +753,13 @@ static int hackrf_queue_setup(struct vb2_queue *vq,
 		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct hackrf_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(dev->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
 
-- 
2.39.2


