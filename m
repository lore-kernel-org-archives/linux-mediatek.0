Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F255C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX8pHIlKHe1F2OdFH05ompLDX/oiKD9mNL51cZRX8e4=; b=z8DnNQk1RgKDy6P6j/dOTDMyck
	8iy5zO3p6grwYPlY8rBm7DmaPOiyEEqtM76cZRRgvoJBTjgV4V4Kid5QpvuX9VXBHlMsmK8lBIUGW
	mLvTXWdXCkzBlsCQhodX+Dg5+WZErAkiApME4q47FX0Nslukwq7SXwHW1eDAmQ3dISCvb2G96835r
	yTz90xkBysa13/aCzuSt70gqgLA6N0Zb3/XjcSf6eY99/JGitNfgCPTMq4sZP8xBErOvAv5mX9bWj
	X4Po8/eae6fNDk1VoA30UMyPDTxn8WK+plLSaRKUyk16IA9zYyKM4/wuC8TxgYXfbmgSgojgEQHMi
	uGj8ngZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZGB-00C2Zh-2O;
	Tue, 21 Mar 2023 10:30:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZEx-00C1io-2P;
	Tue, 21 Mar 2023 10:29:19 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f5ef:1040:e3c1:3d00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6677C66030EF;
	Tue, 21 Mar 2023 10:29:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679394554;
	bh=EMn3OF0L8RhNUweBGxWkw/5f1Od9J8MG3aaxVQp6684=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y23hqQqzs6tAFn+DqMz0GJdU6CSxe/Z5SBa8YO2eSNNxMgKaPaMmwgMSVVIIiql7b
	 GobkZUXf+IOl5N4j3txo1Y+rZpn4VLxMkjcZFtkmR/rF9FwwQsKDEB2JEwrmgvbMa6
	 Fcirk42ecIAPTgteU0KqPiZV5ToMdt8SDZZoYlylmKy8uYr0bAY7rvnXtaC3n1PEgQ
	 J2GIbdOULKGO7nCJR92KITx3Vk0zgIUaLmxAF7LeOwp+p3twANmF5WGkd3fyUuI76m
	 ljrabHYPxuI13etVsuyvQsIkrxP3S9Fh3EAA2eJ7lv28445AU920JosMo8KMYtS8S6
	 kIoH20etkbfLw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	ming.qian@nxp.com,
	shijie.qin@nxp.com,
	eagle.zhou@nxp.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 8/8] media: verisilicon: Use v4l2-mem2mem helpers for VIDIOC_DELETE_BUF ioctl
Date: Tue, 21 Mar 2023 11:28:55 +0100
Message-Id: <20230321102855.346732-9-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_032916_012302_54FFE3E1 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

Make Hantro decoder support VIDIOC_DELETE_BUF ioctl.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index d238d407f986..8f1414085f47 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -740,6 +740,7 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
 	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
 	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_delete_buf = v4l2_m2m_ioctl_delete_buf,
 	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
 
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
-- 
2.34.1


