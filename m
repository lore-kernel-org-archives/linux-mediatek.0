Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5677C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 03:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv6GGfQoCCsEVzrI8zbqyeKtCeys1LEvMb8h1CYFlRo=; b=HRkGYEpUWNOWbHVWawDuV7T9H+
	sr27zwr0fjNSSutjIj810LP/RX0nsDYwDSibNTHx4TtgSpX8pq2gmoWPte3yjB94iFwzH2mnEgpio
	pnkgla472umA78Kn3q19Io/8Vv1QTsnON+tZ2JIBC3bpalUuvKiFcYQQRX5NdUMvIu1vvDS4DCFoN
	REZwUuZKcDRa6fFc3+xX9BqH/jdaxQuVBOOZ+ujKuinDc6cQ3ELHuwM3rPV6kaudHzm/txo5Vsjyd
	xurWcJHtxSi4ZNIAXcVwXysgdFk3ze6P8HFRclX67H6vKlVNEipzRKBuXt2TL6USrhyEbYzQXXc5E
	mcErbkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJoE-00F6nb-2a;
	Mon, 01 May 2023 03:02:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJo2-00F6fC-2p;
	Mon, 01 May 2023 03:02:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CF9160EA5;
	Mon,  1 May 2023 03:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72949C4339B;
	Mon,  1 May 2023 03:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682910145;
	bh=YKojEJiiV1QvwHI5f0ezVGrRBJg+sS7nU5ba/bX9Vb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7lzNj8z3Ur2TBcpTKvLZaWGFplvtk0nM/amsC4EOBooycfCfIf42Kt3GmW7OMPpB
	 xWlN9YPGhBFcWpnDLvSRNBuvetW3kQ/RIm95pfeYTxaxjtrHJ6B/qxuDn63pWNsY52
	 BBjkgwsvOKsZFocxCEsUIqdMpITRx52grEYL01CREyW1RMIusMG37jLQynH85FTtvv
	 MFNsCepp6zHrbXiuEIi3ZTcmDQTzJazzjJYdFm38yNr4DPt9rKZv+M2ePTq+gw2cuW
	 7pdmnzLdLpl/GhrwJm54uPZ9ftd338I0NG/xD4Ql+1KbLUrGOViiSU0uy+fNNkPMcp
	 j1Udy1MI0VkWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wei Chen <harperchen1110@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.2 37/37] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
Date: Sun, 30 Apr 2023 22:59:45 -0400
Message-Id: <20230501025945.3253774-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025945.3253774-1-sashal@kernel.org>
References: <20230501025945.3253774-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_200226_990484_4967BB51 
X-CRM114-Status: GOOD (  13.13  )
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

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit 8fbcf730cb89c3647f3365226fe7014118fa93c7 ]

variable *nplanes is provided by user via system call argument. The
possible value of q_data->fmt->num_planes is 1-3, while the value
of *nplanes can be 1-8. The array access by index i can cause array
out-of-bounds.

Fix this bug by checking *nplanes against the array size.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 641f533c417fd..173407664cf42 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -753,6 +753,13 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	}
 
 	if (*nplanes) {
+		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+			if (*nplanes != q_data->fmt->num_planes)
+				return -EINVAL;
+		} else {
+			if (*nplanes != 1)
+				return -EINVAL;
+		}
 		for (i = 0; i < *nplanes; i++) {
 			if (sizes[i] < q_data->sizeimage[i])
 				return -EINVAL;
-- 
2.39.2


